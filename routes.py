from flask import Flask, render_template, redirect, url_for, flash
from flask_sqlalchemy import SQLAlchemy

import psycopg2
import psycopg2.extras

from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import Length, EqualTo, Email, DataRequired, ValidationError

from flask_bcrypt import Bcrypt
from flask_login import LoginManager

from flask_login import login_user, logout_user
from flask_login import UserMixin

app = Flask(__name__)


app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:paul@localhost/users'
app.config['SECRET_KEY'] = '4daf784a624cefb276ed3f14e'
db = SQLAlchemy(app)
bcrypt = Bcrypt(app)
login_manager = LoginManager(app)

#Load the user (login)
@login_manager.user_loader
def load_user(user_id):
    return Users.query.get(int(user_id))

#Class to define the use with an id, username, email and a password that is hashed
class Users(db.Model, UserMixin):
    __tablename__ = 'users'
    id = db.Column(db.Integer(), primary_key = True)
    username = db.Column(db.String(length = 20), nullable = False, unique = True)
    email = db.Column(db.String(length = 50), nullable = False, unique = True)
    password_hash = db.Column(db.String(length = 60), nullable = False)

    @property 
    def password(self):
        return self.password
    
    @password.setter
    def password(self, plain_text_password):
        self.password_hash = bcrypt.generate_password_hash(plain_text_password).decode('utf-8')

    def check_password_correction(self, attempted_password):
        return bcrypt.check_password_hash(self.password_hash, attempted_password)
    
#Class to Register The User using forms
class RegisterForm(FlaskForm):

    def validate_username(self, username_to_check):
        user = Users.query.filter_by(username = username_to_check.data).first()
        if user:
            raise ValidationError('Username already exists! Please try a different username')
    
    def validate_email(self, email_to_check):
        email = Users.query.filter_by(email = email_to_check.data).first()
        if email:
            raise ValidationError('Email Address already exists! Please try a different email address')

    username = StringField(label = 'User Name:', validators = [Length(min = 2, max = 30), DataRequired()])
    email = StringField(label = 'Email Address: ', validators = [Email(), DataRequired()])
    password1 = PasswordField(label = 'Password', validators = [Length(min = 6), DataRequired()])
    password2 = PasswordField(label = 'Confirm Password', validators = [EqualTo('password1'), DataRequired()])
    submit = SubmitField(label = 'Create Account')

#Class to Login The User using forms
class LoginForm(FlaskForm):
    username = StringField(label = 'User Name', validators = [DataRequired()])
    password = PasswordField(label = 'Password', validators = [DataRequired()])
    submit = SubmitField(label = 'Sign in')
    
#Database for Dark Souls 3
DB_HOST = "localhost"
DB_NAME = "dark_souls_3"
DB_USER = "postgres"
DB_PASS = "paul"

conn = psycopg2.connect(dbname = DB_NAME, user = DB_USER, password = DB_PASS, host = DB_HOST)

#Route to home page
@app.route('/')
@app.route('/home')
def home_page():
    return render_template('/newhome.html')

#Route to items page
@app.route('/items')
def market_page():
    cur = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    s = "select i.name, l.name, l.id from items i join location l on i.id_location = l.id where id_location = l.id"
    cur.execute(s)
    list_users = cur.fetchall()
    return render_template('market.html', list_users = list_users)

#Route to location page
@app.route('/location')
def location_page():
    cur = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    s = "select name from location"
    cur.execute(s)
    list_location = cur.fetchall()
    return render_template('location.html', list_location = list_location)

#Route to Weapons Page
@app.route('/weapons')
def weapons_page():
    cur = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    s = "select w.name_weapon, l.name, wp.wpn_name from weapons w join bosses b on w.id_weapon=b.item_drop\
                                    join location l on b.id=l.id\
                                    join wpn_type wp on wp.id_wpn=w.wpn_type"
    cur.execute(s)
    list_weapons = cur.fetchall()
    return render_template('weapons.html', list_weapons = list_weapons)

#Route to Register Page
@app.route('/register', methods = ['GET', 'POST'])
def register_page():
    form = RegisterForm()
    if form.validate_on_submit():
        user_to_create = Users(username = form.username.data,
                               email = form.email.data, 
                               password = form.password1.data)
        db.session.add(user_to_create)
        db.session.commit()
        return redirect(url_for('market_page'))
    if form.errors != {}: #If no errors from validations
        for err_msg in form.errors.values():
            flash(f'There was an error with creaing a user: {err_msg}', category = 'danger')
    return render_template('register.html', form = form)

#Route to Login Page
@app.route('/login', methods = ['GET', 'POST'])
def login_page():
    form = LoginForm()
    if form.validate_on_submit():
        attempted_user = Users.query.filter_by(username = form.username.data).first()
        if attempted_user and attempted_user.check_password_correction(
            attempted_password = form.password.data
            ):
                login_user(attempted_user)
                flash(f'You are logged in as: {attempted_user.username}', category = 'success')
                return redirect(url_for('market_page'))
        else:
            flash('Username or password is not correct! Please try again', category = 'danger')
            
    return render_template('login.html', form = form)

#Route to Logout Page (Home Page)
@app.route('/logout')
def logout_page():
    logout_user()
    return redirect(url_for("home_page"))

#Route to a certain weapon page
@app.route('/weapons/<string:id>')   
def slayer_page(id):
    cur = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    s = "select name_weapon, wpn_name, picture, dmg, magic_dmg, fire_dmg,\
                            lightning_dmg, dark_dmg, critical, strength, dexterity, intelligence,\
                            faith from weapons join wpn_type on wpn_type=id_wpn\
                                                   join stats on id_weapon=id_type\
                                                    where name_weapon = '" + id + '\''
    name = id + '.html'
    cur.execute(s)
    list_slayer = cur.fetchall()
    return render_template('/Dragonslayer Greataxe.html', list_slayer = list_slayer)



@app.route('/<string:id>')
def types_page(id):
    cur = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    s = "select w.name_weapon from weapons w join wpn_type wp on w.wpn_type = wp.id_wpn \
            where wp.wpn_name = '" + id + '\''
    cur.execute(s)
    list_type = cur.fetchall()
    return render_template('Types.html', list_type = list_type)



@app.route('/location/<string:id>')   
def irithyl_page(id):
    cur = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    cur2 = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    cur3 = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    d = "select name, description, picture, background from location\
        where name = '" + id + '\''
    s = "select distinct b.name, weapons.name_weapon  from bosses b join location l on b.location = l.id join weapons on b.item_drop = weapons.id_weapon\
        where l.name = "'\'' + id + '\''
    f = "select i.name, usage from items i join location l on i.id_location = l.id join items_usage on i.id_item = items_usage.id_mp_item\
        where l.name =" + '\'' + id + '\''
    cur.execute(s)
    list_exact = cur.fetchall()
    cur2.execute(d)
    list_exact2 = cur2.fetchall()
    cur3.execute(f)
    list_exact3 = cur3.fetchall()
    return render_template("place.html", list_exact = list_exact, list_exact2 = list_exact2, list_exact3 = list_exact3)

@app.route('/npc')
def npc_page():
    cur = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    s = "select name, role from npc"
    cur.execute(s)
    list_npc = cur.fetchall()
    return render_template('npc.html', list_npc = list_npc)

@app.route('/npc/invading')
def invading_page():
    cur = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    s = "select name, role from npc join invading_npc on id = id_name\
        where invading_npc.id = npc.id_name"
    cur.execute(s)
    list_invading = cur.fetchall()
    return render_template('invading.html', list_invading = list_invading)

@app.route('/npc/invading/<string:id>')
def invading_npc_page(id):
    cur = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    s = "select npc.name, npc.role, invading_npc.picture, invading_npc.description, location.name from npc join invading_npc on invading_npc.id = npc.id_name\
                                                                        join location on invading_npc.id_location=location.id\
        where invading_npc.id = npc.id_name and npc.name ='" + id + '\''
    cur.execute(s)
    list_invading_npc = cur.fetchall()
    return render_template('invading_npc.html', list_invading_npc = list_invading_npc)

@app.route('/bosses')
def boss_page():
    cur = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    s = "select b.name, l.name from bosses b join location l on b.location=l.id join items i on b.item_drop=i.id_item"
    cur.execute(s)
    list_bosses = cur.fetchall()
    return render_template('bosses.html', list_bosses = list_bosses)

@app.route('/bosses/<string:id>')
def bosses_page(id):
    cur = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    s = "select b.name, l.name, w.name_weapon, b.picture, b.description from bosses b join location l on l.id=b.location\
                                                                         join weapons w on w.id_weapon=b.item_drop\
        where b.name = '" + id + "\'"
    cur.execute(s)
    list_boss = cur.fetchall()
    return render_template('boss.html', list_boss = list_boss)

@app.route('/bsouls')
def bsouls_page():
    cur = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    s = "select soul_name, name from boss_souls join bosses on id_boss=id"
    cur.execute(s)
    list_bsouls = cur.fetchall()
    return render_template('bsouls.html', list_bsouls = list_bsouls)

@app.route('/bsouls/<string:id>')
def boss_souls_page(id):
    cur = conn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    s = "select soul_name, bosses.name, gained_souls, boss_souls.description, boss_souls.picture from boss_souls join bosses on id_boss=bosses.id\
        where soul_name = '" + id + '\''
    cur.execute(s)
    list_boss_souls = cur.fetchall()
    return render_template('boss_souls.html', list_boss_souls = list_boss_souls)













