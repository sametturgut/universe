--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    constellation text NOT NULL,
    distance_from_earth_in_lightyear bigint,
    discovery_year integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_more_info (
    galaxy_more_info_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    how_many_stars bigint,
    how_many_planets bigint,
    name character varying(50) NOT NULL
);


ALTER TABLE public.galaxy_more_info OWNER TO freecodecamp;

--
-- Name: galaxy_more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_more_info_more_info_id_seq OWNED BY public.galaxy_more_info.galaxy_more_info_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    discovery_year integer,
    discovered_by text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_moon boolean NOT NULL,
    how_far_from_earth_in_km bigint NOT NULL,
    greek_god_name text,
    how_many_moons integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age numeric,
    is_in_milkyway boolean NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_more_info galaxy_more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_info ALTER COLUMN galaxy_more_info_id SET DEFAULT nextval('public.galaxy_more_info_more_info_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxies', 'Corvus', 45000000, 1785);
INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda', 2500000, 1612);
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'Centaurus', 111000000, 2001);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'Coma Berenices', 17000000, 1779);
INSERT INTO public.galaxy VALUES (5, 'Bode''s Galaxy', 'Ursa Major', 11600000, 1774);
INSERT INTO public.galaxy VALUES (6, 'Butterfly Galaxies', 'Virgo', 60000000, 1784);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel Galaxy', 'Sculptor', 500000000, 1941);
INSERT INTO public.galaxy VALUES (8, 'Cigar Galaxy', 'Ursa Major', 12000000, 1774);
INSERT INTO public.galaxy VALUES (9, 'Circinus Galaxy', 'Circinus', 13000000, 1977);
INSERT INTO public.galaxy VALUES (10, 'Coma Pinwheel Galaxy', 'Coma Benerices', 55000000, 1781);
INSERT INTO public.galaxy VALUES (11, 'Comet Galaxy', 'Sculptor', 3200000000, 2007);
INSERT INTO public.galaxy VALUES (12, 'Condor Galaxy', 'Pavo', 212000000, 1835);
INSERT INTO public.galaxy VALUES (13, 'Cosmos Redshift 7', 'Sextans', 12900000000, 2015);
INSERT INTO public.galaxy VALUES (14, 'Eye of Sauron', 'Canes Venatici', 52000000, 1787);
INSERT INTO public.galaxy VALUES (15, 'Fireworks Galaxy', 'Cygnus and Cepheus', 25200000, 1798);
INSERT INTO public.galaxy VALUES (16, 'Hockey Stick Galaxies', 'Canes Venatici', 30000000, 2005);
INSERT INTO public.galaxy VALUES (17, 'Hoag''s Object', 'Serpens Caput', 600000000, 1950);
INSERT INTO public.galaxy VALUES (18, 'Large Magellanic Cloud', 'Dorado/Mensa', 200000, 1519);
INSERT INTO public.galaxy VALUES (19, 'Lindsay-Shapley Ring', 'Volans', 300000000, 2003);
INSERT INTO public.galaxy VALUES (20, 'Little Sombrero Galaxy', 'Pegasus', 40000000, 1784);
INSERT INTO public.galaxy VALUES (21, 'Malin 1', 'Coma Berenices', 1190000000, 1986);
INSERT INTO public.galaxy VALUES (22, 'Medusa Merger', 'Ursa Major', 110000000, 1791);
INSERT INTO public.galaxy VALUES (23, 'Sculptor Dwarf Galaxy', 'Sculptor', 300000, 1937);
INSERT INTO public.galaxy VALUES (24, 'Mice Galaxies', 'Coma Berenices', 290000000, 1785);
INSERT INTO public.galaxy VALUES (25, 'Small Magellanic Cloud', 'Tucana', 200000, 1519);
INSERT INTO public.galaxy VALUES (26, 'Mayall''s Object', 'Ursa Major', 500000000, 1940);
INSERT INTO public.galaxy VALUES (27, 'Milky Way', 'Sagittarius', 0, 1920);
INSERT INTO public.galaxy VALUES (28, 'Needle Galaxy', 'Coma Berenices', 40000000, 1785);
INSERT INTO public.galaxy VALUES (29, 'Wolf-Lundmark-Melotte', 'Cetus', 3000000, 1909);
INSERT INTO public.galaxy VALUES (30, 'Pinwheel Galaxy', 'Ursa Major', 21000000, 1781);
INSERT INTO public.galaxy VALUES (31, 'Sculptor Galaxy', 'Sculptor', 13000000, 1783);
INSERT INTO public.galaxy VALUES (32, 'Sombrero Galaxy', 'Virgo', 29000000, 1781);
INSERT INTO public.galaxy VALUES (33, 'Southern Pinwheel Galaxy', 'Hydra', 15000000, 1752);
INSERT INTO public.galaxy VALUES (34, 'Sunflower Galaxy', 'Canes Venatici', 27000000, 1779);
INSERT INTO public.galaxy VALUES (35, 'Tadpole Galaxy', 'Draco', 420000000, 1982);
INSERT INTO public.galaxy VALUES (36, 'Triangulum Galaxy', 'Triangulum', 2730000, 1654);
INSERT INTO public.galaxy VALUES (37, 'Whirpool Galaxy', 'Canes Venatici', 31000000, 1773);


--
-- Data for Name: galaxy_more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_more_info VALUES (1, 27, 100000000000, 100000000000, 'Milky Way');
INSERT INTO public.galaxy_more_info VALUES (2, 2, 1000000000000, 1000000000000, 'Andromeda Galaxy');
INSERT INTO public.galaxy_more_info VALUES (3, 18, 30000000000, 30000000000, 'Large Magellanic Cloud');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, 1877, 'Asaph Hall');
INSERT INTO public.moon VALUES (3, 'Phobos', 4, 1877, 'Asaph Hall');
INSERT INTO public.moon VALUES (11, 'Callisto', 5, 1610, 'Galileo Galilei');
INSERT INTO public.moon VALUES (12, 'Europa', 5, 1610, 'Galileo Galilei');
INSERT INTO public.moon VALUES (13, 'Ganymede', 5, 1610, 'Galileo Galilei');
INSERT INTO public.moon VALUES (14, 'Io', 5, 1610, 'Galileo Galilei');
INSERT INTO public.moon VALUES (15, 'Dione', 6, 1684, 'G.D. Cassini');
INSERT INTO public.moon VALUES (16, 'Enceladus', 6, 1789, 'William Herschel');
INSERT INTO public.moon VALUES (17, 'Hyperion', 6, 1848, 'W. & G. Bond, W. Lassell');
INSERT INTO public.moon VALUES (18, 'Iapetus', 6, 1671, 'G.D. Cassini');
INSERT INTO public.moon VALUES (19, 'Janus', 6, 1966, 'Audouin Dollfus');
INSERT INTO public.moon VALUES (20, 'Mimas', 6, 1789, 'William Herschel');
INSERT INTO public.moon VALUES (21, 'Phoebe', 6, 1898, 'W. Pickering');
INSERT INTO public.moon VALUES (22, 'Rhea', 6, 1672, 'G.D. Cassini');
INSERT INTO public.moon VALUES (23, 'Tethys', 6, 1684, 'G.D. Cassini');
INSERT INTO public.moon VALUES (24, 'Titan', 6, 1655, 'Christiaan Huygens');
INSERT INTO public.moon VALUES (25, 'Ariel', 7, 1851, 'William Lassell');
INSERT INTO public.moon VALUES (26, 'Oberon', 7, 1787, 'William Herschel');
INSERT INTO public.moon VALUES (27, 'Titania', 7, 1787, 'William Herschel');
INSERT INTO public.moon VALUES (28, 'Umbriel', 7, 1851, 'William Lassell');
INSERT INTO public.moon VALUES (29, 'Nereid', 8, 1949, 'G. Kuiper');
INSERT INTO public.moon VALUES (30, 'Triton', 8, 1846, 'William Lassell');
INSERT INTO public.moon VALUES (31, 'Charon', 9, 1978, 'James Christie');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 77000000, 'Hermes', 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 61000000, 'Aphrodite', 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 0, 'Gaea', 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, 54600000, 'Ares', 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 588000000, 'Dias', 79, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', true, 1427000000, 'Cronus', 82, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 2600000000, 'Ouranos', 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 4300000000, 'Poseidon', 14, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', true, 7500000000, 'Hades', 5, 1);
INSERT INTO public.planet VALUES (10, 'Eris', true, 14410000000, 'Eris', 1, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', true, 6452000000, NULL, 2, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', true, 6847000000, NULL, 1, 1);
INSERT INTO public.planet VALUES (13, 'Ceres', false, 497000000, NULL, 0, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4500000000, true, 27);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 5300000000, true, 27);
INSERT INTO public.star VALUES (3, 'Sirius', 242000000, true, 27);
INSERT INTO public.star VALUES (4, 'Polaris', 70000000, true, 27);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 10000000, true, 27);
INSERT INTO public.star VALUES (6, 'Rigel', 8000000, true, 27);
INSERT INTO public.star VALUES (7, 'Vega', 455300000, true, 27);
INSERT INTO public.star VALUES (8, 'Altair', 1200000000, true, 27);
INSERT INTO public.star VALUES (9, 'Arcturus', 7100000000, true, 27);
INSERT INTO public.star VALUES (10, 'Pleiades', 115000000, true, 27);
INSERT INTO public.star VALUES (11, 'Aldebaran', 6400000000, true, 27);
INSERT INTO public.star VALUES (12, 'Antares', 15000000, true, 27);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 37, true);


--
-- Name: galaxy_more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_more_info_more_info_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 31, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy_more_info galaxy_more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_info
    ADD CONSTRAINT galaxy_more_info_name_key UNIQUE (name);


--
-- Name: galaxy_more_info galaxy_more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_more_info
    ADD CONSTRAINT galaxy_more_info_pkey PRIMARY KEY (galaxy_more_info_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

