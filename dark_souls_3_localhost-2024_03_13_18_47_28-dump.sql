--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: boss_souls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boss_souls (
    id_boss integer NOT NULL,
    soul_name character varying(50),
    gained_souls integer,
    description character varying(500),
    picture character varying(200),
    CONSTRAINT ck_id_boss CHECK (((id_boss > 0) AND (id_boss < 25)))
);


ALTER TABLE public.boss_souls OWNER TO postgres;

--
-- Name: boss_souls_id_boss_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.boss_souls ALTER COLUMN id_boss ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.boss_souls_id_boss_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bosses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bosses (
    id integer NOT NULL,
    name character varying(50),
    location integer,
    item_drop integer,
    picture character varying(200),
    description character varying(10000),
    CONSTRAINT ck_id_location CHECK (((location > 0) AND (location < 24)))
);


ALTER TABLE public.bosses OWNER TO postgres;

--
-- Name: bosses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.bosses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.bosses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: invading_npc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invading_npc (
    id integer,
    id_location integer,
    picture character varying(200),
    description character varying(10000)
);


ALTER TABLE public.invading_npc OWNER TO postgres;

--
-- Name: item_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_type (
    id_type integer NOT NULL,
    type_name character varying(20)
);


ALTER TABLE public.item_type OWNER TO postgres;

--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    name character varying(50),
    id_item integer NOT NULL,
    id_location integer,
    CONSTRAINT ck_id_item CHECK (((id_item > 0) AND (id_item < 49))),
    CONSTRAINT ck_id_location CHECK (((id_location > 0) AND (id_location < 24)))
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: items_id_item_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.items ALTER COLUMN id_item ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.items_id_item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: items_usage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items_usage (
    id_mp_item integer,
    usage character varying(200),
    item_type_id integer
);


ALTER TABLE public.items_usage OWNER TO postgres;

--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    id integer NOT NULL,
    name character varying(50),
    description character varying(10000),
    picture character varying(200),
    background character varying(200)
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.location ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: npc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.npc (
    name character varying(50),
    role character varying(100),
    id_name integer NOT NULL
);


ALTER TABLE public.npc OWNER TO postgres;

--
-- Name: npc_id_name_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.npc ALTER COLUMN id_name ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.npc_id_name_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stats (
    id_type integer NOT NULL,
    dmg integer,
    magic_dmg integer,
    fire_dmg integer,
    lightning_dmg integer,
    dark_dmg integer,
    critical integer,
    strength integer,
    dexterity integer,
    intelligence integer,
    faith integer,
    CONSTRAINT ck_id_type CHECK (((id_type > 0) AND (id_type < 34)))
);


ALTER TABLE public.stats OWNER TO postgres;

--
-- Name: stats_id_type_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.stats ALTER COLUMN id_type ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.stats_id_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: weapons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapons (
    name_weapon character varying(30),
    wpn_type integer,
    id_weapon integer NOT NULL,
    picture character varying(50),
    CONSTRAINT ck_wpn_type CHECK (((wpn_type > 0) AND (wpn_type < 11)))
);


ALTER TABLE public.weapons OWNER TO postgres;

--
-- Name: weapons_id_weapon_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.weapons ALTER COLUMN id_weapon ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.weapons_id_weapon_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: wpn_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wpn_type (
    wpn_name character varying(30),
    id_wpn integer NOT NULL
);


ALTER TABLE public.wpn_type OWNER TO postgres;

--
-- Name: wpn_type_id_wpn_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.wpn_type ALTER COLUMN id_wpn ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wpn_type_id_wpn_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: boss_souls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boss_souls (id_boss, soul_name, gained_souls, description, picture) FROM stdin;
3	Soul of the Blood of the Wolf	20000	Soul of the Blood of the Wolf. One of the twisted souls, steeped in strength.\n\nUse to acquire numerous souls, or transpose to extract its true strength.\n\nThe blood was spread amongst the Abyss Watchers, and their souls are one with the soul of the wolf blood master.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_the_blood_of_the_wolf.png
19	Soul of Sister Friede	20000	Soul of Sister Friede.\nOne of the twisted souls, steeped in strength.\n\nUse to acquire numerous souls, or transpose to extract its true strength.\n\nFriede was the first Ash to enter the painting, but together with the good Father, they chose rot over fire.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_sister_friede_-_final.png
10	Soul of Dragonslayer Armour	15000	Soul of the Dragonslayer Armour. One of the twisted souls, steeped in strength.\n\nUse to acquire many souls, or transpose to extract its true strength.\n\nThe Dragonslayer Armour, controlled by the Pilgrim Butterfly, lost its master long ago, but still remembers their sporting hunts.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_dragonslayer_armour.png
6	Soul of Pontiff Sulyvahn	12000	Soul of Pontiff Sulyvahn.\nOne of the twisted souls, seeped in strength.\n\nUse to acquire many souls, or transpose to extract its true strength.\n\nPontiff Sulyvahn of Irithyll imprisoned a god of the old royalty in the abandoned cathedral, to be fed to the devourer.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_pontiff_sulyvhan-dks3.png
18	Soul of a Crystal Sage	3000	Soul of a Crystal Sage.\n\nOne of the twisted souls, steeped in strength. \n\nUse to acquire many souls, or transpose to extract its true strength. \n\nThe twin Crystal Sages once served as spiritual guides to the scholars of the Grand Archives, and one went on to ally with the Undead Legion. 	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_a_crystal_sage.png
16	Soul of the Lords	20000	Soul of the Lords.\nOne of the twisted souls, steeped in strength.\n\nUse to acquire numerous souls, or transpose to extract its true strength.\n\nSince Lord Gwyn, the first Lord of Cinder, many exalted lords have linked the First Flame, and it is their very souls that have manifested themselves as defender of the flame.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_the_lords.png
24	Soul of Slave Knight Gael	20000	Soul of Slave Knight Gael.\nOne of the twisted souls, steeped in strength.\n\nUse to acquire many souls, or transpose to extract its true strength.\n\nThe red-hooded, wandering slave knight Gael sought the blood of the dark soul as pigment for the Painted World. But Gael knew he was no Champion, that the dark soul would likely ruin him and that he had little hope of a safe return.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_slave_knight_gael.png
7	Soul Yhrom the Giant	20000	Soul of Yhorm the Giant. One of the twisted souls, steeped in strength.\n\nUse to acquire numerous souls, or transpose to extract its true strength.\n\nYhorm is the descendant of an ancient conqueror, but was asked by the very people once subjugated to lead them, serving as both a weighty blade and a stone-hard shield.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_yhorm_the_giant.png
9	Soul of the Dancer	10000	Soul of the dancer.\nOne of the twisted souls, steeped in strength.\n\nUse to acquire many souls, or transpose to extract its true strength.\n\nThe Pontiff Sulyvahn bestowed a double-slashing sword upon a distant daughter of the formal royal family, ordering her to serve first as a dancer, and then as an outrider knight, the equivalent to exile.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/dancers_soul-icon.png
4	Soul of the Deacons of the Deep	20000	Soul of the Deacons of the Deep. One of the twisted souls, steeped in strength.\n\nUse it to acquire many souls, or transpose to extract its true strength.\n\nAfter Aldrich left for the Boreal valley, Archdeacon Royce remained in the cathedral with the high priests, to keep eternal watch over their master's coffin.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_the_deacons_of_the_deep.png
5	Soul of High Lord Wolnir	10000	Soul of the High Lord Wolnir.\nOne of the twisted souls, steeped in strength.\n\nUse to acquire many souls, or transpose to extract its true strength.\n\nLord Wolnir of Carthus sentenced countless souls to gruesome deaths, keen to outlive them all.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_high_lord_wolnir-dks3.png
15	Soul of the Nameless King	16000	Soul of the Nameless King. One of the twisted souls, steeped in strength.\n\nUse to acquire many souls, or transpose to extract its true strength.\n\nThe Nameless King was once a dragon-slaying god of war, before he sacrificed everything to ally himself with the ancient dragons.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_the_nameless_king.png
21	Soul of the Demon Prince	20000	The demons, birthed from a common Chaos, share almost everything between them, even the pride of their prince, and his nearly-faded flame.\n\nSo that the last demon standing may rekindle it.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_the_demon_prince.png
2	Soul of the Boreal Valley	2000	Soul of Vordt of the Boreal Valley. One of the twisted souls, steeped in strength.\n\nUse to acquire many souls, or transpose to extact its true strength.\n\nVordt served as an outrider knight, never far from the fleeting dancer.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_boreal_valley_vordt.png
13	Soul of the Twin Princes	20000	Soul of the Twin Princes. One of the twisted souls, steeped in strength. \n\nUse to acquire numerous souls, or transpose to extract its true strength.\n\nThe two princes rejected their duty to become Lords of Cinder, and settled down far, far away to watch the fire fade from a distance. A curse makes their souls nearly inseparable.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_the_twin_princes.png
12	Soul of Champion Gundyr	20000	Soul of champion Gundyr. One of the twisted souls, steeped in strength. \n\nUse to acquire many souls, or transpose to extract its true strength. \n\nOnce, a champion came late to the festivities, and was greeted by a shrine without fire, and a bell that would not toll. 	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_champion_gundyr-dks3.png
11	Soul of Consumed Oceiros	12000	Soul of Oceiros, the Consumed King. One of the twisted souls, steeped in strength.\n\nUse to acquire numerous souls, or transpose to extract its true strength.\n\nOceiros went mad trying to harness his royal blood for a greater purpose, leading him to the heretics of the Grand Archives, where he discovered the twisted worship of Seath the paledrake. 	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_consumed_oceiros.png
17	Soul of the Rotted Greatwood	3000	Soul of the Curse-rotted Greatwood.\n\nOne of the twisted souls, steeped in strength.\n\nUse to acquire many souls, or transpose to extract its true strength.\n\nEver since its establishment, all manner of curses have managed to seep into the Undead Settlement. The worst of them were sealed away inside a spirit tree, but eventually the curses took their toll.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_rotted_greatwood.png
23	Soul of Darkeater Midir	20000	Soul of Darkeater Midir.\nOne of the twisted souls, steeped in strength.\n\nUse to acquire many souls, or transpose to extract its true strength.\n\nMidir, descendant of Archdragons, was raised by the gods, and owing to his immortality was given a duty to eternally battle the dark, a duty that he would never forget, even after the gods perished.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/soul_of_darkeater_midir.png
\.


--
-- Data for Name: bosses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bosses (id, name, location, item_drop, picture, description) FROM stdin;
2	Vordt of the Boreal Valley	3	33	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/vordt-enemies-dark-souls-3-wiki-guide.jpg	Vordt of the Boreal Valley is a large quadrupedal creature wearing heavy knights armor and many of the attacks in his moveset features a great hammer that resembles a mace. When players encounter him, he is seen walking out of an orb of fog. After being brought down to a certain health threshold, the blue mist around him and his weapon intensifies, slowly inflicting Frostbite onto the player if they stand close to him. This is the first instance of frostbite the player may encounter in the game.
5	High Lord Wolnir	8	22	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/high-lord-wolnir-enemy-dark-souls-3-wiki-guide.jpg	High Lord Wolnir is a massive skeleton covered in jewelry, of which the bracelets act as the hitbox of the boss. He mainly attacks the player with his torso and limbs but on occasion may wield a sword, making the fight more dangerous. This colossal skeleton is imbued with deadly darkness and commands an army of skeletons to his defense.
24	Slave Knight Gael	18	31	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/slave_knight_gael_boss.jpeg	Slave Knight Gael is an aberration created by consuming the Dark Soul. It is unknown which kingdom Gael fought for or in which wars he was active. At some point during his life he found the Painted World of Ariandel and a young woman who wished to paint a new world. He wears a noticeably bright red cape. When players encounter him, he first moves and fights like a beast on all fours, but then straightens up when brought down to a certain health threshold.
10	Dragonslayer Armour	13	1	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/dragonslayer-armor-enemies-dark-souls-3-wiki-guide.jpg	The Dragonslayer Armor is an autonomous suit of armor guarding the entrance to the Grand Archives, and is assisted by Pilgrim Butterflies, which are actually the ones animating the suit. It attacks players with an electrified greataxe and can both attack and guard against player attacks with its massive shield. After being brought down to a certain health threshold, projectiles will start raining into the battle arena.
22	Halflight, Spear of the Church	18	15	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/halflight1-spear-of-the-church-enemies-dark-souls-3-wiki-guide.jpg	Halflight is a human wielding a sword and shield in battle and will spawn as the boss of this area if the player is in offline mode. When they are in online mode however, this boss fight is fought against another player, similar to a PvP fight. Regardless of which boss is spawned, two NPC Guardians will spawn to aid the boss - one spawns at the beginning of the fight, the other when the boss reaches approximately half health.
20	Champions Gravetender & Gravetender Greatwolf	16	2	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/champion's-gravetender-gravetender-greatwolf-enemies-dark-souls-3-wiki-guide.jpg	When encountered, the Champion's Greavetender is found with three wolves next to a tombstone. They are clad in armor and wield a sword and shield, with a moveset not dissimilar to regular enemies. After being brought down to a certain health threshold, they summon the Gravetender Greatwolf, a wolf significantly larger than the other three.
13	Lothric, Younger Prince	13	26	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/lothric-younger-prince-enemies-dark-souls-3-wiki-guide.jpg	Lothric is a purely magical boss and is a force to be reckoned with while he's accompanied by his brother and partner boss Lorian, Elder Prince. He is a tall hooded figure with the most notable feature being his spindly arms, and is the only of the twin princes to speak during cutscenes. While he isn't fought during the first phase, after depleting Lorian's healthbar once, Lothric teleports to his brother's side and clings to his back for the remainder of the fight.
16	Soul of Cinder	23	6	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/Soul%20of%20Cinder.jpg	The Soul of Cinder is seen as the amalgamation of all the Lords of Cinder, with a variety of Dark Dialectics spells and movesets used during its first phase and the use of Gwyn's moveset for the second phase. It appears to the player as a heavily armored knight and wields the Firelink Greatsword in battle, a greatsword that can change into one of three other forms during the first phase of the fight. After depleting it's health once, the second phase starts, where the boss regains all his health and sticks to one moveset.
19	Sister Friede	16	30	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/sister-friede-enemies-dark-souls-3-wiki-guide.jpg	Sister Friede is dressed in nun's clothing and wields a scythe when fighting the player. She fights alone in the first and third phase of the boss fight and alongside Father Ariandel, a hulking figure that attacks with a large bowl, in the second. Rather than having two separate healthbars, Friede and Ariandel share a healthbar when fighting together.
12	Champion Gundyr	22	25	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/champion-gundyr-enemies-dark-souls-3-wiki-guide.jpg	Champion Gundyr is a different version of Iudex Gundyr, however he utilizes the same moveset as Iudex Gundyr with the addition of new attacks. He is much more aggressive than he was in the Cemetery of Ash. After being brought down to a certain health threshold, rather than undergoing a physical transformation, his eyes glow red and begins attacking the player much more aggressively.
8	Aldrich, Devourer of Gods	12	21	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/aldrich-devourer-of-gods-enemy-dark-souls-3-wiki-guide.jpg	Aldrich appears to the player as a dark mass of bones and flesh with the upper body of and garments similar to those worn by Gwyndolin in Dark Souls. He attacks with Gwyndolin's weapons - a catalyst that is imbued with fire after being brought down to a certain health threshold, and a bow.
11	Oceiros, the Consumed King	14	2	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/Ocelot.png	Oceiros is found in the garden below Lothric Castle, guarding a shrine. It can be assumed that he is blind (like Seath), as his eye sockets are empty, and he makes references to this throughout the fight. He is a very vocal boss, and talks of an invisible or imaginary baby which he cradles in his arm for the first half of the fight. Oceiros initially attacks the player with a staff, but after being brought down to a certain health threshold, gets down on all fours and attacks like a wild beast.
17	Curse-Rotted Greatwood	5	28	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/curse-rotted-greatwood-enemies-dark-souls-3-wiki-guide.jpg	The Curse-Rotted Greatwood is a giant tree with human-like limbs. It is covered in sacs that act as the hitbox of the boss. When the player encounters it, they will find a couple of undead in the arena that will fight alongside it during combat. After being brought down to a certain health threshold, instead of going through a transformation, the battle arena changes. This massive tree is filled with curses, and is the object of worship for the Undead Settlement's inhabitants.
18	Crystal Sage	5	29	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/crystal-sage-enemy-dark-souls-3-wiki-guide.jpg	The Crystal Sage is a large humanoid covered in loose sorcerer's robes and wears a mage's hat big enough to cover their face. They mainly cast spells using a magical orb, but may attack players that get too close to them with their rapier. Players should be alert when approaching their arena as the boss fight starts as soon as they enter. After being brought down to a certain health threshold, the boss will start spawning clones that resemble themself very closely, save for the difference in the color of their magic.
9	Dancer of the Boreal Valley	3	13	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/dancer-of-the-boreal-valley-enemies-dark-souls-3-wiki-guide.jpg	The Dancer is a tall armored knight with a spectral cape and skulks towards the player when encountered. During combat, she wields a flaming sword in her left hand and, after being brought down to a certain health threshold, wields an ash sword in her right - reminiscent of Pontiff Sulyvahn's weapons.
6	Pontiff Sulyvahn	9	23	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/Pontiff_Sulyvahn_Achievement.jpg?v=1531853972230	Pontiff Sulyvahn is a tall humanoid dressed in bejeweled sorcerer's robes. He wields two greatswords in combat - the greatsword in his left hand emanating a purple aura and the greatsword in his right hand enshrouded in flames. After being brought down to a certain health threshold, branch-like wings sprout from his back.
3	Abyss Wathcers	7	32	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/abyss-watcher-enemies-dark-souls-3-wiki-guide.jpg	The Abyss Watchers are tall humanoids clad in leather armor, wielding a greatsword in their right hand and a dagger in their left hand. Players will find the Abyss Watchers seemingly fighting amongst themselves when they encounter them. After being brought down to a certain health threshold, the main boss' greatsword is infused with Fire, boosting their attacks. The Abyss Watchers, their soul, passing from one body to the next, forever warring, is one of the Lords of Cinder, and is the first of 5 the player will encounter.
23	Darkeater Midir	18	11	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/darkeater_midir.jpeg	Midir, descendant of the Archdragons, was raised by the gods, and owing to his immortality was given a duty to eternally battle the dark, a duty that he would never forget, even after the gods perished. He is a massive dragon with crystals lining his entire body and four wings.
1	Iudex Gundyr	1	21	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/iudex-gundyr-enemies-dark-souls-3-wiki-guide1.jpg	Iudex Gundyr is a large humanoid clad in heavy armor and attacks the player using a large halberd. Players will find a sword embedded in his chest when they first encounter him. After being brought down to a certain health threshold, a giant black mass emerges from his neck that gives him access to additional attacks. This boss is not optional and the player will have to face him in order to gain access to Firelink Shrine.
14	Ancient Wyvern	21	5	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/ancient-wyvern-enemies-dark-souls-3-wiki-guide.jpg	The Ancient Wyvern is a large grey wyvern, and it's boss fight is unique in that there is an additional way of killing it besides the regular hit-and-run tactic required for most bosses. Instead of fighting the wyvern head on, players can opt to run up the ruins, fighting regular enemies instead, to get high enough to deliver a plunging attack onto the dragon's head.
4	Deacons of the Deep	6	16	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/deacon-of-the-deep-enemy-dark-souls-3-wiki-guide.jpg	The Deacons of the Deep are a group of clerics that wield candlesticks in combat. Some wield their weapon similar to that of a sword, while others use it as a catalyst for pyromancy. This congregation of clerics defends a roaming soul, that is eventually revealed to be the Archdeacon after being brought down to a certain health threshold.
21	Demon Prince	17	8	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/demon-prince-enemies-dark-souls-3-wiki-guide.jpg	After defeating the Demon in Pain & Demon From Below, fire gathers inside the corpse of the last demon killed, and a few seconds later, there is an explosion with a small AoE revealing the Demon Prince. A pair of large wings sprout from the Demon Prince's back and they have a different set of attacks based on which demon was killed in the first phase.
15	Nameless King	21	27	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/the-nameless-king-enemies-dark-souls-3-wiki-guide.jpg	The Nameless King is an armored humanoid riding atop a blue wyvern and attacks players with his spear. During the first phase of the boss fight, his name is shown as "King of the Storm," until the wyvern he is riding is killed. This begins the second phase where his name changes to "Nameless King."
7	Yhrom the Giant\n	11	24	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/yhorm-the-giant-enemies-dark-souls-3-wiki-guide.jpg	Known as the "reclusive lord of the Profaned Capital", Yhorm is the descendant of an ancient conqueror, but was asked by the very people once subjugated to lead them. In the past, he was a skilled Giant combatant, powerful enough to become a lord of a city and a Lord of Cinder. During combat, attacks players massive machete that glows like embers after being brought down to a certain health threshold.
\.


--
-- Data for Name: invading_npc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invading_npc (id, id_location, picture, description) FROM stdin;
6	8	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/knight-slayer-tsorig-enemy-dark-souls-3-wiki-guide.jpg	Killable.\nInvades you shortly after the first bonfire within the catacombs, near the bridge approaching High Lord Wolnir. Wolnir must still be alive for the invasion to occur. However, if he is still alive, he can still be killed after Wolnir is dead.\nIf you kill him or he kills you, you obtain the gesture: "My thanks!" which is "War Cry" from Dark Souls 2.\n
45	6	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/longfinger%20kirk.jpg	Killable.\nInvades in Cathedral of the Deep, right as you reach the lower area with water and the giants.\nCannot be summoned.\n 
68	7	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/londor%20pale%20shade.jpg	Killable\nBecomes an ally if your relationship with Yuria of Londor is good.\nYuria can only be spawned after using Yoel of Londor's "Draw Out True Strength" mechanic 5 times.\nGives the Duel Bow gesture after being summoned as a white phantom. Example Video of summoning him for the gesture.\nNote: if you use the gesture Darkmoon Loyalty, you will receive Duel Bow right afterwards.\nBecomes an invader if your relationship with Yuria of Londor is disrupted.
67	9	https://darksouls2.wiki.fextralife.com/file/Dark-Souls-2/creightonframe.jpg	 An alledged serial killer whose quest for vengence is central to a sidequest in Dark Souls II, he reappears in Dark Souls III as a part of Sirris of The Sunless Realm's sidequest and later as an invader in Irithyll of The Boreal Valley. 
52	4	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/holy_knight_hodrick.jpg	Hodrick is the leader of the Mound Makers\nHe invades the player as a mad spirit in the Undead Settlement and can be summoned in Road of Sacrifices.\nHe wears the Sunset Set
36	5	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/yellowfingera.jpg	Invades in Crucifixion Woods and Farron Keep swamps.\nCan give you the "Proper Bow" Gesture (see the Location section below).\n"You can be like Yellowfinger and believe that all share a camaradery, but do not force your views on the rest of us."\n-Leonhard in Rosaria's Bedchamber\nGreat Farron Dart -Entrusted to the leader of the Legion's acolytes, and apparently a sorcery of his daughter, Heysel, that was refined by a Crystal Sage.
24	9	https://darksouls3.wdfiles.com/local--files/npc-image:seeker/Seeker.jpg	Can be killed.\nInvades just before the entrance of Irithyll Dungeon, if the player is embered.\nInvades on the streets of The Ringed City, whether you are embered or not.\nList of items that refer to this NPC: Black Witch Set\nCannot be summoned.
70	18	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/moaning_knight.jpg	Can be killed.\nInvades in the spiral tower protected by Darkeater Midir known as the Shared Grave.\nHe sadly doesn't actually moan.\n Use Morne's Great Hammer (RH) and Moaning Shield (LH).\nWeak to Lightning Damage.
72	18	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/alva_set-new.jpg	Before the Ringed Inner Wall bonfire, a White-faced Locust preacher tells of a wayfaring knight's endless forbidden search and how the abyss granted him closure, if not reunion with his beloved.\n\nInside a garden you may encounter Alva as a dark spirit, but without recollection of his name (not unlike Amnesiac Lapp and the Moaning Knight). Yet he still has a sense of purpose, guarding a corpse containing Zullie's Black Witch Set.
71	18	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/ledofex.png	Killable.\nLocated in The Ringed City. Invades the player, regardless of ember state.\nList of items that refer to this NPC: Ledo's Great Hammer.\n 
69	16	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/livid_pyromancer_dunnel.jpg	Killable.\nInvades in the colosseum above the Champion's Gravetender bonfire.\nList of items that refer to this NPC: Pyromancer's Parting Flame
\.


--
-- Data for Name: item_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_type (id_type, type_name) FROM stdin;
1	Key
2	Consumable
3	Soul
4	Multiplayer
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (name, id_item, id_location) FROM stdin;
Divine Blessing	30	9
Cinders of a Lord	16	2
Seed of the Giant Tree	35	22
White Sign Soapstone	20	2
Soul of a Proud Paladin	39	1
Soul of a Great Champion	47	21
Cracked Red Eye Orb	24	2
Soul of an Unknown Traveler	40	5
Xanthous Crown	2	5
Fading Soul	36	9
Soul of an Intrepid Hero	44	4
Sovereignless Soul	43	12
Large Soul of a Proud Paladin	42	1
Large Soul of a Deserted Corpse	38	4
Soul of a Champion	46	12
Homeward Bone	34	2
Fire Keeper Soul	14	2
Rusted Coin	32	2
Dark Sigil	12	2
Dried Finger	22	2
Hidden Blessing	31	22
Blood of The Dark Soul	18	18
Soul of a Deserted Corpse	37	1
Eyes of a Fire Keeper	19	22
Soul of a Venerable Old Hand	48	11
Small Lothric Banner	13	4
Basin of Vows	17	3
Small Doll	15	6
Soul of a Nameless Soldier	45	6
Ember	25	2
Black Separation Crystal	26	1
Vertebra Shackle	1	4
Red Eye Orb	23	3
Way of the White Circlet	27	1
Ashen Estus Flask	29	1
Large Soul of an Unknown Traveler	41	8
Rusted Gold Coin	33	7
Estus Flask	28	1
Wolf Ring	11	7
Knight Slayers Ring	5	8
Red Sign Soapstone	21	6
Blindfold Mask	9	18
\.


--
-- Data for Name: items_usage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items_usage (id_mp_item, usage, item_type_id) FROM stdin;
19	Give to the Fire Keeper to "remove fire from the world"	1
18	Can be given to Painting Woman if you have completed Ashes of Ariandel for extra dialogue	1
16	Place upon the thrones of the Lords of Cinder in Firelink Shrine after defeating them	1
17	Trigger the boss fight with Dancer of the Boreal Valley	1
12	Enables Hollowing	1
15	Used to break the seal which keeps players from passing the bridge which leads to Irithyll of the Boreal Valley.	1
14	Give to the Fire Keeper to enable healing of the Dark Sigil	1
13	Bring to cliff in Vordt Boss room to take player to Undead Settlement	1
34	Returns player to last bonfire or the one in Firelink Shrine	2
24	Consumable item used to invade other players. Using it puts you in a queue to invade a player in your area.	4
44	Used to gain 2000 souls.	3
22	Use to allow the summoning of one additional phantom (for a total of 3 friendly phantoms). However also allows for the summoning of additional invaders and increases the frequency of invasions.	4
27	Restore the link to other worlds.	4
37	Use to obtain 200 souls.	3
26	Use to return home from a host's world or to return a phantom home that you summoned in yours.	4
35	Enemies react to invaders.	2
48	Use to gain 20,000 souls.	3
31	Fully recover FP	2
39	Use to gain 500 souls.	3
43	Use to acquire 2,000 souls.	3
21	Allows you to send a summon sign to other players for them to summon you to their world for competitive play (PvP).	4
36	Consume to gain 50 Souls	3
28	Use to restore some HP.	2
41	Gives 1000 souls	3
47	Use to gain 50,000 souls.	3
23	Reusable item used to invade other players. Using it puts you in a queue to invade a player in your area.	4
38	Consume to gain 400 Souls	3
20	Allows you to send a summon sign to other players for them to summon you to their world for cooperative play.	4
32	Increases Item Discovery by 50 for 60 seconds.	2
40	Consume to gain 800 Souls	3
29	Use to restore some FP.	2
42	Use to gain 1000 Souls.	3
46	Use to gain 25,000 souls.	3
33	Increases Item Discovery by 100 for 60 seconds.	2
30	Use to fully restore HP and cure all ailments.	2
25	Ember increases your HP by 30% until death. Also allows for the summoning of phantoms both friendly and enemies and opens up your world for invasions.	4
45	Used to gain 2000 souls	3
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location (id, name, description, picture, background) FROM stdin;
20	Smouldering Lake	Smouldering Lake is a Location in Dark Souls 3. This optional zone is the center of conflict between many ferocious creatures, with a deep labyrinth built beneath flooded with lava and fire monsters, but exploring it will reveal pyromancies and tomes from ages past.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/6.6_old_demon_king-new.jpg	https://wallpapercave.com/dwp2x/wp3800596.jpg
8	Catacombs of Carthus	Catacombs of Carthus is a Location in Dark Souls 3. Bleed-inducing Skeletons and Grave Wardens of The High Lord stand in the adventurer's path to plunder these tombs, that need to be passed through to reach the fabled city of Irithyll.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/6.1_catacombs_of_carthus-new.jpg	https://i.pinimg.com/originals/b0/df/70/b0df70c29089e33706635a79d603a5e7.jpg
15	Grand Archives	Grand Archives is a Location in Dark Souls 3. Scholars endlessly navigate the towering bookshelves of the archives, seeking for and guarding long lost secrets with darkness that can only be countered by submerging oneself in wax.\n 	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/9.4_grand_archives-new.jpg	https://wallpaperset.com/w/full/c/f/7/209479.jpg
13	Lothric Castle	Lothric Castle is a Location in Dark Souls 3. Once the Ashen One has obtained the sacrificial vessel, the Castle may be entered. Lothric Wyverns, Lothric Knights and Winged Knights closely guard the path to the Twin Princes.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/9.1_lothric_castle-new.jpg	https://images6.alphacoders.com/600/600919.jpg
7	Farron Keep	Farron Keep is a Location in Dark Souls 3. Upon cindering themselves, the former headquarters of Farron's Undead Legion became a vast rotting wood.  The swamp hides treasure in many corners, but threatens adventurers with aggresive beasts, knee-deep poison, and even curse.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/4.5_farron_keep-new.jpg	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/abyss-watchers-dks3.jpg
1	Cemetery of Ash	Cemetery of Ash is a Location in Dark Souls 3. This location serves as a starting area for new players to the game. This is where players will find themselves at the start of the game, revived as an 'Unkindled', and will have to face the mighty Iudex Gundyr as a test to prove their worth before heading into Firelink Shrine and being able to explore the lands of Lothric.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/1.2_cemetery_of_ash-new.jpg	https://wallpapers.com/images/hd/ashen-one-vs-iudex-gundyr-dark-souls-3-l5tab4snae2iftty.jpg
10	Irithyll Dungeon	Irithyll Dungeon is a Location in Dark Souls 3. Torturous Jailers guard the cells of malformed corpses and decaying abominations while rats scurry away underneath, but the Ashen Ones must venture into the deepest heart of these horrors in their search for the Lords of Cinder. Yet perhaps long lost forms of blasphemous hope can be found within this chasm of despair.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/8.1_irithyll_dungeon-new.jpg	https://www.wallpaperflare.com/static/560/21/171/dark-souls-dark-souls-iii-irithyll-night-wallpaper.jpg
5	Road of Sacrifices	Road of Sacrifices is a Location in Dark Souls 3. It is a wooded area, marked by crumbling ruins and a murky swamp inhabited by crustaceans of varying size. Damp and fetid, as rotted as it is alive, this road demands perseverance but offers rewards to those seeking the arcane arts.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/4.1_road_of_sacrifices-new.jpg	https://www.reddit.com/media?url=https%3A%2F%2Fi.redd.it%2F2o5xjnlaav591.jpg
11	Profaned Capital	Profaned Capital is a Location in Dark Souls 3. The crumbling citadel is now home to deformed monstrosities and gargoyles, but the Lord of Cinder Yhorm still awaits at his throne for his long lost friend to come fulfill his promise.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/8.2_profaned_capital-new.jpg	https://images8.alphacoders.com/901/thumb-1920-901505.jpg
17	The Dreg Heap	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/13.1_the_dreg_heap-new.jpg	The Dreg Heap is a Location in Dark Souls 3, added with the second DLC, The Ringed City.	https://i.pinimg.com/originals/68/5e/97/685e97aeed5bab50a126be513548be8f.jpg
9	Irithyll of the Boreal Valley	Irithyll of the Boreal Valley is a Location in Dark Souls 3. A Non-optional area required for the player to progress, invisible enemies and patrols of tall guardians wander its silent snowy streets, attacking with magic, fire, and dark alike.  A great barrier seals off the mythical city to outsiders, but perhaps a solution might be found among the Deep...	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/7.1_irithyll_of_the_boreal_valley-new.jpg	https://wallpapercave.com/dwp2x/wp3273777.jpg
23	Kiln of the First Flame	Kiln of the First Flame is a location in Dark Souls 3. In order to reach this area, the player must first kill all Lords of Cinder and speak to the Fire Keeper in Firelink Shrine. Interacting with the Firelink bonfire will then warp the player to the first bonfire.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/11.2_kiln_of_the_first_flame-new.jpg	https://i.pinimg.com/originals/64/69/26/6469267315e3b67f987c5b47a2a607a7.jpg
21	Archdragon Peak	Archdragon Peak is a Location in Dark Souls 3. The Unkindled is transported to this location when the "Path of the Dragon" Gesture is used adjacent to the Dragonkin statue/corpse found in Irithyll Dungeon.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/10.1_archdragon_peak-new.jpg	https://www.reddit.com/media?url=https%3A%2F%2Fi.redd.it%2Fjb62k0ml1i071.png
16	Painted World of Ariandel	Painted World of Ariandel is a Location in Dark Souls 3. It is the primary location in the first DLC, Ashes of Ariandel. It can be accessed by speaking to the NPC at the altar near the Cleansing Chapel Bonfire in Cathedral of the Deep. The Painted World of Ariandel is a snowy dreamscape that conjures up images of past games in the series and features a Nordic, Viking-like theme to its inhabitants..	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/12.1_snowfield-new.jpg	https://i.pinimg.com/originals/b4/02/a1/b402a118d21e0943ffff32575306e25f.jpg
2	Firelink Shrine	Firelink Shrine is a Location in Dark Souls 3. After defeating the first boss, the unkindled find this safe haven, where they may level up via the Fire Keeper, or interact with other NPCs who have sought the safety of the hub.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/1.1_firelink_shrine-new.jpg	https://pixelz.cc/wp-content/uploads/2017/12/dark-souls-3-firelink-shrine-uhd-4k-wallpaper.jpg
19	Church of Yorshka	Church of Yorshka is a small area with a bonfire and the closest bonfire to the Pontiff Sulyvahn boss fight.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/7.3_church_of_yorshka-new.jpg	https://lokeysouls.files.wordpress.com/2020/11/20220202235039_1.jpg
12	Anor Londo	Anor Londo is a Location in Dark Souls 3. The legendary city of the gods that has since been taken over by Aldrich, Devourer of Gods. Once radiant and warm with sunlight (albeit fake), it is now entirely dark and cold due to the absence of Dark Sun Gwyndolin.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/7.7_anor_londo-new.jpg	https://cutewallpaper.org/28/dark-souls-photoshop-wallpaper-wallpaper/431018540.jpg
4	Undead Settlement	Undead Settlement is a Location in Dark Souls 3. After receiving the Small Lothric Banner from Emma, the player approaches a cliff and is grabbed and transported by flying gargoyles to the base of the High Wall of Lothric. The decaying ruins are crowded with hordes of undead, but there's also treasure to be found...	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/3.2_undead_settlement-new.jpg	https://www.wallpaperflare.com/static/1001/761/89/dark-souls-iii-video-games-undead-settlement-dark-wallpaper.jpg
3	High Wall of Lothric	High Wall of Lothric is a Location in Dark Souls 3. After exiting the Cemetery of Ash and once out of the Firelink Shrine, the player arrives at the higher ramparts of Lothric's walls. Plagued by the hollowed and haunted by a fire-breathing wyvern, the area hides away valuable treasure for the observant	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/2.1_high_wall_of_lothric-new.jpg	https://i.pinimg.com/originals/79/ed/6f/79ed6f153034c2f5b0ebbff42913afc4.jpg
18	The Ringed City	The Ringed City is a Location in Dark Souls 3. It is the name of the main location of the second DLC, The Ringed City. A traditional city for the Pygmies, called the Ringed City. Half covered in foliage, the city looks desolated with ancient ruins. A portion of the bridge is curved, creating a wall on the inner side. Countless tombstones line the top of the wall made of rock.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/14.1_mausoleum_lookout-new.jpg	https://images2.alphacoders.com/901/901504.jpg
14	Consumed Kings Garden	Consumed King's Garden is a location in Dark Souls 3. This optional path takes the Ashen One towards Oceiros, who despairs in madness in the far halls. For those wanting to reach Archdragon's Peak, this is a necessary path.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/2.5_oceiros,_the_consumed_king-new.jpg	https://cdn.cheatcc.com/guide_screens/dark_souls_3/ds3_15.05.jpg
22	Untended Graves	Untended Graves is a Location in Dark Souls 3. It is reached through the Consumed King's Garden and is an optional area. Shrouded in darkness, but will upon further inspection reveal a familiar place.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/1.4_untended_graves-new.jpg	https://i.pinimg.com/originals/95/24/a6/9524a6d0da5e3ee6eb3a16fdcafa253d.png
6	Cathedral of the Deep	Cathedral of the Deep is a Location in Dark Souls 3. The area consists of a huge cathedral as well as a graveyard and the surrounding grounds. The area features a very vertical level design, with several shortcuts leading back to a central bonfire (Cleansing Chapel Bonfire). The path to Cathedral of the Deep lies in the Crystal Sage's ruins.	https://darksouls3.wiki.fextralife.com/file/Dark-Souls-3/5.1_cathedral_of_the_deep-new.jpg	https://lokeysouls.files.wordpress.com/2020/12/20220127223622_1.jpg
\.


--
-- Data for Name: npc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.npc (name, role, id_name) FROM stdin;
Cage Madman	Provides some minor dialogue.	8
Black Hand Gotthard	Co-op Summon.	9
Company Captain Yorshka	Leader of the Blades of the Darkmoon.	11
Cornyx of the Great Swamp	Pyromancy Trainer. Takes Pyromancy Tomes.	22
Archdeacon McDonnell	Leader of the Aldrich Faithful.	23
Anri of Astora	Wandering knight in search of Aldrich, Devourer of Gods.	27
Drang Knight	Drops Drang Twinspears.\n	28
Black Hand Kamui	Drops Onikiri and Ubadachi.	30
Court Sorcerer	Drops Logan's Scroll.	33
Yellowfinger Heysel	Invading Red Phantom and Co-op Summon.\n	36
Ringed City Hollow	Greets the player after they reach the Ringed City and provides some dialogue.\n	37
Seeker of the Spurned	Invading Red Phantom. Bears resemblance to the wayfarer Alva.\n	38
Havel the Rock	Drops Dragon Tooth and Havel's Greatshield.\n	39
High Priestess Emma	Grants the Small Lothric Banner and Way of Blue.\n	40
Rosaria, Mother of Rebirth	Leader of the Rosaria's Fingers. Mother of Rebirth.\n	41
Shrine Handmaid	Sells wares to the player. Takes Umbral Ash.\n	42
Old Woman of Londor	Assassin of the Lord of Hollows Questline.\n	43
Nestling	This crow provides rare items in exchange for specific items.\n	44
Longfinger Kirk	Invading Red Phantom.\n	45
Shira, Knight of Filianore	A knight in service to Filianore. Co-op Summon and enemy.\n	46
Livid Pyromancer Dunnel	Invading Purple Phantom Mound-maker.\n	47
Silver Knight Ledo	Invading Red Phantom.\n	48
Sister Friede	Grants the Chillbite Ring.\n	49
Karla	A child of the Abyss, and Spell Trainer.\n	50
Great Swamp Cuculus	Co-op Summon	51
Holy Knight Hodrick	Invading and Summoned Purple Phantom. Mound-maker.\n	52
Unbreakable Patches	Once again, Patches appears as a trickster Merchant.\n	53
Unkindled Brigand	Drops Spider Shield.\n	54
Blacksmith Andre	Reinforces and Infuses Equipment and Estus.\n	55
Slave Knight Gael Ariandel	Grants access to The Painted World of Ariandel. Co-op Summon.\n	56
Irina of Carim	Miracle Trainer. Takes Divine Tomes.\n	57
Locust Preacher	Strange bug-like creatures that rose from an abyssal swamp.\n	58
Moaning Knight	Invading Red Phantom. Bears resemblance to Eygon of Carim.\n	59
Ringfinger Leonhard	A Finger of Rosaria. Encourages Invasion.\n	60
Unkindled Ricard	Drops Ricard's Rapier.\n	61
Stone-humped Hag	An old woman who sells items and provides some dialogue.\n	62
Undead Settlement Giant	Shoots arrows at the White Birches.\n	63
Pygmy King	A king of the Ringed City.\n	64
Slave Knight Gael Ringed City	Points the way down throughout The Dreg Heap. Co-op Summon.\n	65
Amnesiac Lapp 	A hollowing knight in quest of his lost memories. Co-op Summon.	66
Hawkwood the Deserter	Crestfallen warrior on the Path of the Dragon.	5
Sirris of the Sunless Realms	Blade of the Darkmoon, opposed to Rosaria's Fingers.	3
Sword Master	Enemy and Co-op Summon.	13
Fire Keeper	Allows the player to Level and can cure hollowing.	26
The Painter	A white-haired woman hidden away in an attic.	15
Fallen Knight	Guards the Paladin's Ashes	18
Siegward of Catarina	A joyful knight of Catarina.	16
Orbeck of Vinheim	Sorcery Trainer. Takes Scrolls.	7
Forlorn Corvian Settler	Grants a Titanite Slab after killing Sister Friede.	20
Ludleth of Courland	A dutiful Lord of Cinder. Transposes Equipment.	2
Creighton the Wanderer	Invading Red Phantom in Sirris of the Sunless Realms' questline.	32
Unkindled Butcher	Drops Butcher Knife.	34
Lion Knight Albert	Co-op Summon. Grand Archives enemy.	1
Sir Vilhelm	A hollow knight who serves Sister Friede.	4
Londor Pale Shade	Co-op Summon and Invading Red Phantom.	17
Yoel of Londor	Sorcery Trainer, and begins the Lord of Hollows questline.	10
Greirat of the Undead Settlement	Merchant. Pillages for more wares.	25
Drowsy Forlorn	Greets the player after they enter the Painted World of Ariandel.	29
Alva, Seeker of the Spurned	Invading Red Phantom.	24
Knight Slayer Tsorig	Invading Red Phantom and Smouldering Lake enemy.	6
Horace the Hushed	The companion of Anri of Astora.	14
Eygon of Carim	Protector of Irina of Carim, somewhat begrudgingly.	21
Unkindled Watchdog	Drops Exile Greatsword and Great Club.	12
Drakeblood Knight	Drops Drakeblood Greatsword.	19
Yuria of Londor	Associate of Yoel of Londor.	35
Daughter of Crystal Kriemhild	Invading Red Phantom and Grand Archives enemy.	31
Londor Pale Shade	Is a hostile invading NPC in Dark Souls 3, that can also be friendly.	68
Seeker of the Spurned	Invades on the streets of The Ringed City	72
Silver Knight Ledo	Located in The Ringed City. Invades the player	71
Moaning Knight	Invades in the spiral tower protected by Darkeater Midir known as the Shared Grave.	70
Creighton the Wanderer\t\n	An alledged serial killer whose quest for vengence is central to a sidequest in Dark Souls II, he re	67
Livid Pyromancer Dunnel	Invades in the colosseum above the Champion's Gravetender bonfire.	69
\.


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stats (id_type, dmg, magic_dmg, fire_dmg, lightning_dmg, dark_dmg, critical, strength, dexterity, intelligence, faith) FROM stdin;
1	200	0	0	74	0	100	40	0	0	0
2	69	130	0	0	0	100	16	11	26	0
3	78	78	0	0	0	100	10	16	0	0
4	131	0	0	0	0	100	12	17	0	0
5	120	0	11	0	0	100	17	15	0	0
6	128	0	89	0	0	100	20	10	10	10
7	205	0	0	0	0	100	45	0	0	0
8	0	0	99	0	0	110	0	16	17	17
9	70	0	0	0	0	125	10	18	0	0
10	157	0	88	0	0	100	28	0	12	12
11	101	0	0	0	41	100	11	40	0	0
12	104	0	0	0	0	100	13	25	0	0
13	79	62	62	0	0	100	12	20	9	9
14	216	0	0	0	0	100	36	18	0	0
15	115	0	0	0	0	100	11	16	0	0
16	70	77	0	0	0	100	8	12	0	12
17	200	0	0	0	0	100	50	0	0	30
18	64	0	0	0	0	100	10	8	0	0
19	139	0	0	0	0	100	24	18	0	0
20	68	0	0	0	0	115	7	0	0	16
21	180	0	69	0	0	100	30	0	10	10
22	151	0	0	0	0	13	13	0	0	13
23	110	86	0	0	0	100	17	15	12	0
24	185	0	0	0	0	100	38	10	0	0
25	145	0	0	0	0	100	30	15	0	0
26	107	0	0	0	0	100	10	18	0	14
27	110	0	0	0	0	100	14	20	0	0
28	145	0	0	0	0	100	14	18	0	0
29	55	82	0	0	0	100	13	18	0	0
30	110	77	0	0	0	100	12	16	12	11
31	147	0	0	0	0	100	19	13	0	0
32	141	0	0	0	0	100	18	20	0	0
33	176	0	0	0	0	100	30	0	0	0
\.


--
-- Data for Name: weapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weapons (name_weapon, wpn_type, id_weapon, picture) FROM stdin;
Morion Blade	4	4	morion_blade.png
Scholars Candlestick	5	20	scholars_candlestick-icon.png
Hollowslayer Greatsword	7	28	hollowslayer_greatsword.png
Ringed Knight Straig	4	5	ringed_knight_straight_sword.png
Greatsword of Judgement	7	23	greatsword_of_judgement.png
Smoughs Great Hammer	6	7	Smough_Hammer.png
Uchigatana	3	15	uchigatana.png
Lothrics Holy Sword	4	26	lothrics_holy_sword.png
Black Knight Greataxe	1	14	black_knight_greataxe.png
Brigand Twindaggers	5	9	brigand_twindaggers.png
Rotten Ghru Dagger	5	18	rotten_ghru_dagger.png
Yhorms Great Machete	1	24	yhorms_great_machete.png
Gaels Greatsword	7	31	gael's_greatsword.png
Dancers Enchanted Sword	2	13	dancers_enchanted_swords.png
Wolf Knights Greatsword	7	19	wolf_knights_greatsword.png
Moonlight Greatsword	7	2	moonlight_greatsword.png
Farron Greatsword	7	32	farron_greatsword.png
Gundyrs Halberd	8	25	gundyrs_halberd.png
Vordts Great Hammer	6	33	vordts_great_hammer.png
Clerics Candlestick	4	16	cleric's_candlestick.png
Old Kings Great Hammer	6	21	old_kings_great_hammer.png
Firelink Greatsword	7	6	firelink_greatsword.png
Mornes Great Hammer	6	17	mornes_great_hammer.png
Friedes Great Scythe	9	30	friede's_great_scythe_-_final.png
Frayed Blade	3	11	frayed_blade.png
Demons Scar	2	8	demon's_scar.png
Storm Curved Sword	2	27	storm_curved_sword.png
Crystal Sages Rapier	10	29	crystal_sages_rapier.png
Dragonslayer Greataxe	1	1	dragonslayer_axe.png
Onikiri and Ubadachi	3	12	onikiri_and_ubadachi.png
Wolnirs Holy Sword	7	22	wolnirs_holy_sword.png
Crescent Moon Sword	2	3	crescent_moon_sword.png
Demons Greataxe	1	10	demons_greataxe-icon.png
\.


--
-- Data for Name: wpn_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wpn_type (wpn_name, id_wpn) FROM stdin;
Greataxe	1
Katana	3
Straight Sword	4
Dagger	5
Great Hammer	6
Greatsword	7
Halberd	8
Reaper	9
Thrusting Sword	10
Curved Sword	2
\.


--
-- Name: boss_souls_id_boss_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boss_souls_id_boss_seq', 24, true);


--
-- Name: bosses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bosses_id_seq', 24, true);


--
-- Name: items_id_item_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_item_seq', 69, true);


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_id_seq', 23, true);


--
-- Name: npc_id_name_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.npc_id_name_seq', 72, true);


--
-- Name: stats_id_type_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stats_id_type_seq', 33, true);


--
-- Name: weapons_id_weapon_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weapons_id_weapon_seq', 40, true);


--
-- Name: wpn_type_id_wpn_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wpn_type_id_wpn_seq', 10, true);


--
-- Name: bosses bosses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bosses
    ADD CONSTRAINT bosses_pkey PRIMARY KEY (id);


--
-- Name: invading_npc invading_npc_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invading_npc
    ADD CONSTRAINT invading_npc_id_key UNIQUE (id);


--
-- Name: item_type item_type_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_type
    ADD CONSTRAINT item_type_pk PRIMARY KEY (id_type);


--
-- Name: items items_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_name_key UNIQUE (name);


--
-- Name: location location_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_name_key UNIQUE (name);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: items_usage multiplayer_items_id_mp_item_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items_usage
    ADD CONSTRAINT multiplayer_items_id_mp_item_key UNIQUE (id_mp_item);


--
-- Name: items_usage multiplayer_items_usage_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items_usage
    ADD CONSTRAINT multiplayer_items_usage_key UNIQUE (usage);


--
-- Name: items pk_id_item; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT pk_id_item PRIMARY KEY (id_item);


--
-- Name: npc pk_id_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.npc
    ADD CONSTRAINT pk_id_name PRIMARY KEY (id_name);


--
-- Name: weapons pk_id_weapon; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons
    ADD CONSTRAINT pk_id_weapon PRIMARY KEY (id_weapon);


--
-- Name: wpn_type pk_id_wpn; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wpn_type
    ADD CONSTRAINT pk_id_wpn PRIMARY KEY (id_wpn);


--
-- Name: bosses uc_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bosses
    ADD CONSTRAINT uc_name UNIQUE (name);


--
-- Name: weapons weapons_name_weapon_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons
    ADD CONSTRAINT weapons_name_weapon_key UNIQUE (name_weapon);


--
-- Name: wpn_type wpn_type_wpn_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wpn_type
    ADD CONSTRAINT wpn_type_wpn_name_key UNIQUE (wpn_name);


--
-- Name: bosses bosses_weapons_id_weapon_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bosses
    ADD CONSTRAINT bosses_weapons_id_weapon_fk FOREIGN KEY (item_drop) REFERENCES public.weapons(id_weapon);


--
-- Name: invading_npc fk_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invading_npc
    ADD CONSTRAINT fk_id FOREIGN KEY (id) REFERENCES public.npc(id_name);


--
-- Name: boss_souls fk_id_boss; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boss_souls
    ADD CONSTRAINT fk_id_boss FOREIGN KEY (id_boss) REFERENCES public.bosses(id);


--
-- Name: invading_npc fk_id_location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invading_npc
    ADD CONSTRAINT fk_id_location FOREIGN KEY (id_location) REFERENCES public.location(id);


--
-- Name: items fk_id_location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_id_location FOREIGN KEY (id_location) REFERENCES public.location(id);


--
-- Name: stats fk_id_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT fk_id_type FOREIGN KEY (id_type) REFERENCES public.weapons(id_weapon);


--
-- Name: bosses fk_location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bosses
    ADD CONSTRAINT fk_location FOREIGN KEY (location) REFERENCES public.location(id);


--
-- Name: weapons fk_wpn_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons
    ADD CONSTRAINT fk_wpn_type FOREIGN KEY (wpn_type) REFERENCES public.wpn_type(id_wpn);


--
-- Name: items_usage multiplayer_items_item_type_id_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items_usage
    ADD CONSTRAINT multiplayer_items_item_type_id_type_fk FOREIGN KEY (item_type_id) REFERENCES public.item_type(id_type);


--
-- Name: items_usage multiplayer_items_items_id_item_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items_usage
    ADD CONSTRAINT multiplayer_items_items_id_item_fk FOREIGN KEY (id_mp_item) REFERENCES public.items(id_item);


--
-- PostgreSQL database dump complete
--

