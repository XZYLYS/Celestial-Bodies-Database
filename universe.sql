--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    type character varying(100) NOT NULL,
    description text,
    distance_from_earth_m_ly numeric(10,2) NOT NULL,
    discovered_year integer NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter_km integer NOT NULL,
    radius_km integer NOT NULL,
    discovered_year integer NOT NULL,
    planet_id integer
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(100) NOT NULL,
    distance_from_earth_ly numeric(10,2) NOT NULL,
    discovered_year integer NOT NULL,
    description text
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter_km integer NOT NULL,
    orbital_period_days integer NOT NULL,
    has_life boolean NOT NULL,
    star_id integer
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
    name character varying(255) NOT NULL,
    star_type character varying(100) NOT NULL,
    temperature_k integer NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean NOT NULL,
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy, hosting the Solar System', 0.00, 1610);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest spiral galaxy to the Milky Way', 2.54, 1610);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'A small part of the Local Group', 3.00, 1767);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 'A massive galaxy with a suppermasive black hole', 53.00, 1781);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 'Known for its prominent dust lane', 28.00, 1929);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 'Spiral', 'A galaxy with a prominent, large spiral arm', 23.00, 1845);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, 1737, 1610, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 11, 1877, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 6, 1877, 2);
INSERT INTO public.moon VALUES (4, 'Titan', 5150, 2575, 1655, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 3121, 1560, 1610, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, 2634, 1610, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 4821, 2410, 1610, 4);
INSERT INTO public.moon VALUES (8, 'Io', 3643, 1821, 1610, 4);
INSERT INTO public.moon VALUES (9, 'Mimas', 396, 198, 1789, 5);
INSERT INTO public.moon VALUES (10, 'Enceladus', 504, 252, 1789, 5);
INSERT INTO public.moon VALUES (11, 'Tethys', 1060, 530, 1684, 5);
INSERT INTO public.moon VALUES (12, 'Hyperion', 270, 135, 1848, 5);
INSERT INTO public.moon VALUES (13, 'Triton', 2706, 1353, 1846, 6);
INSERT INTO public.moon VALUES (14, 'Charon', 1212, 606, 1978, 7);
INSERT INTO public.moon VALUES (15, 'Rhea', 1528, 764, 1672, 5);
INSERT INTO public.moon VALUES (16, 'Miranda', 471, 235, 1948, 6);
INSERT INTO public.moon VALUES (17, 'Oberon', 1522, 761, 1851, 6);
INSERT INTO public.moon VALUES (18, 'Ariel', 1157, 578, 1851, 6);
INSERT INTO public.moon VALUES (19, 'Umbriel', 1171, 585, 1851, 6);
INSERT INTO public.moon VALUES (20, 'Iapetus', 1469, 735, 1671, 5);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 'Emission Nebula', 1344.00, 1610, 'A stellar nursery located in the Orion constellation.');
INSERT INTO public.nebula VALUES (2, 'Ring Nebula', 'Planetary Nebula', 2300.00, 1779, 'A ring-shaped nebula in the Lyra constellation, remnants of a dying star.');
INSERT INTO public.nebula VALUES (3, 'Helix Nebula', 'Planetary Nebula', 650.00, 1824, 'One of the closest nebulae to Earth, also known as the Eye of God.');
INSERT INTO public.nebula VALUES (4, 'Crab Nebula', 'Supernova Remnant', 6500.00, 1731, 'A remnant of a supernova explosion in the Taurus constellation.');
INSERT INTO public.nebula VALUES (5, 'Eagle Nebula', 'Emission Nebula', 5700.00, 1745, 'Home to the famous Pillars of Creation in the Serpens constellation.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742, 365, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 6779, 687, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 12104, 225, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 139820, 4333, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 116460, 10759, false, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 49628, 60160, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, 30660, false, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', 4879, 88, false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 16900, 290, false, 2);
INSERT INTO public.planet VALUES (10, 'Proxima b', 12300, 11, false, 5);
INSERT INTO public.planet VALUES (11, 'Trappist-1e', 13000, 6, false, 2);
INSERT INTO public.planet VALUES (12, 'Kepler-62f', 14800, 267, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 5778, 4600, true, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'G-type', 5790, 5000, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red Supergiant', 3500, 900, true, 2);
INSERT INTO public.star VALUES (4, 'Sirius', 'A-type', 9940, 200, true, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Red warf', 3050, 4800, true, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'A-Type', 9600, 455, true, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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

