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

DROP DATABASE se;
--
-- Name: se; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE se WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE se OWNER TO freecodecamp;

\connect se

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
-- Name: explorers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.explorers (
    explorers_id integer NOT NULL,
    name character varying(30),
    started date NOT NULL
);


ALTER TABLE public.explorers OWNER TO freecodecamp;

--
-- Name: explorers_explorer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.explorers_explorer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.explorers_explorer_id_seq OWNER TO freecodecamp;

--
-- Name: explorers_explorer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.explorers_explorer_id_seq OWNED BY public.explorers.explorers_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_in_lightyear numeric(4,2),
    explorers_id integer,
    nickname character varying(20)
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
    name character varying(20) NOT NULL,
    name_of_satellite text,
    ever_man_on_the_moon boolean NOT NULL,
    explorers_id integer,
    planet_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    moon_qty integer,
    project_to_conquer boolean,
    explorers_id integer,
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
    name character varying(20) NOT NULL,
    planet_qty integer,
    galaxy_id integer,
    explorers_id integer
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
-- Name: explorers explorers_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.explorers ALTER COLUMN explorers_id SET DEFAULT nextval('public.explorers_explorer_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: explorers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.explorers VALUES (1, 'Old Russian Rusty Telescope', '1977-01-18');
INSERT INTO public.explorers VALUES (2, 'Alien Telescope Area 51', '1989-07-10');
INSERT INTO public.explorers VALUES (3, 'Amateur Telescope', '2007-10-10');
INSERT INTO public.explorers VALUES (4, 'Hubble', '2001-12-01');
INSERT INTO public.explorers VALUES (5, 'Santas Telescope', '1991-12-25');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky Way', 0.00, 1, 'Home');
INSERT INTO public.galaxy VALUES (3, 'Confetti', 7.97, 5, NULL);
INSERT INTO public.galaxy VALUES (4, 'Skynet', 17.89, 2, 'Land of Enemy');
INSERT INTO public.galaxy VALUES (5, 'Galaxy of beers', 3.00, 2, 'Drunky');
INSERT INTO public.galaxy VALUES (8, 'PK1928YZ5', 98.92, 4, 'The Big');
INSERT INTO public.galaxy VALUES (9, 'Wooow', 23.81, 3, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Chinese Satlite', true, 1, 4);
INSERT INTO public.moon VALUES (2, 'Creasta1', 'Cestsat', false, 4, 6);
INSERT INTO public.moon VALUES (3, 'Helios', NULL, false, 3, 6);
INSERT INTO public.moon VALUES (4, 'Filyo', NULL, false, 5, 6);
INSERT INTO public.moon VALUES (5, 'Pleya', NULL, false, 1, 6);
INSERT INTO public.moon VALUES (6, 'Tlesca', NULL, false, 4, 6);
INSERT INTO public.moon VALUES (7, 'Milo', 'Milospace', true, 3, 5);
INSERT INTO public.moon VALUES (8, 'Helvet', NULL, false, 1, 5);
INSERT INTO public.moon VALUES (9, 'Quatio', 'JBL200', false, 3, 5);
INSERT INTO public.moon VALUES (10, 'Pope', 'PREC01D', true, 4, 5);
INSERT INTO public.moon VALUES (11, 'Zatt', NULL, false, 4, 5);
INSERT INTO public.moon VALUES (12, 'Pitio01', NULL, false, 4, 13);
INSERT INTO public.moon VALUES (13, 'Brios', NULL, false, 5, 12);
INSERT INTO public.moon VALUES (14, 'Triosta', 'UNIC55 K70', false, 1, 11);
INSERT INTO public.moon VALUES (15, 'Leyya', NULL, false, 2, 10);
INSERT INTO public.moon VALUES (16, 'Ptust', NULL, false, 3, 9);
INSERT INTO public.moon VALUES (17, 'Optam', 'OPT 2022 V01', false, 4, 8);
INSERT INTO public.moon VALUES (18, 'Pampa', 'PP110', false, 3, 7);
INSERT INTO public.moon VALUES (19, 'Vcokta', NULL, false, 1, 8);
INSERT INTO public.moon VALUES (20, 'Eper', NULL, false, 1, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', 0, false, 2, 3);
INSERT INTO public.planet VALUES (3, 'Venus', 2, true, 4, 3);
INSERT INTO public.planet VALUES (4, 'Earth', 1, false, 5, 3);
INSERT INTO public.planet VALUES (5, 'Mars', 3, true, 1, 3);
INSERT INTO public.planet VALUES (6, 'Jupiter', 124, true, 4, 3);
INSERT INTO public.planet VALUES (7, 'Saturn', 7, false, 3, 3);
INSERT INTO public.planet VALUES (8, 'Uranus', 19, false, 1, 3);
INSERT INTO public.planet VALUES (9, 'Neptune', 78, false, 4, 3);
INSERT INTO public.planet VALUES (10, 'Railjet', 2, true, 1, 7);
INSERT INTO public.planet VALUES (11, 'Greyhome', 5, true, 5, 8);
INSERT INTO public.planet VALUES (12, 'Freya', 4, false, 5, 9);
INSERT INTO public.planet VALUES (13, 'Grimland', 19, false, 4, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Sun', 8, 2, 2);
INSERT INTO public.star VALUES (7, 'Irony', 12, 5, 4);
INSERT INTO public.star VALUES (8, 'Alpha Centauri', 17, 2, 4);
INSERT INTO public.star VALUES (9, 'Sirius A', 9, 3, 5);
INSERT INTO public.star VALUES (10, 'Proxima', 4, 8, 2);
INSERT INTO public.star VALUES (11, 'Procyon', 370, 9, 1);


--
-- Name: explorers_explorer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.explorers_explorer_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: explorers explorer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.explorers
    ADD CONSTRAINT explorer_name_key UNIQUE (name);


--
-- Name: explorers explorers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.explorers
    ADD CONSTRAINT explorers_pkey PRIMARY KEY (explorers_id);


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
-- Name: galaxy galaxy_explorer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_explorer_fkey FOREIGN KEY (explorers_id) REFERENCES public.explorers(explorers_id);


--
-- Name: moon moon_explorer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_explorer_fkey FOREIGN KEY (explorers_id) REFERENCES public.explorers(explorers_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_explorer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_explorer_fkey FOREIGN KEY (explorers_id) REFERENCES public.explorers(explorers_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_explorer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_explorer_fkey FOREIGN KEY (explorers_id) REFERENCES public.explorers(explorers_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
