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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 868);
INSERT INTO public.games VALUES (2, 1, 50);
INSERT INTO public.games VALUES (3, 1, 431);
INSERT INTO public.games VALUES (4, 2, 557);
INSERT INTO public.games VALUES (5, 1, 637);
INSERT INTO public.games VALUES (6, 1, 841);
INSERT INTO public.games VALUES (7, 1, 449);
INSERT INTO public.games VALUES (8, 1, 857);
INSERT INTO public.games VALUES (9, 1, 728);
INSERT INTO public.games VALUES (10, 1, 745);
INSERT INTO public.games VALUES (11, 2, 7);
INSERT INTO public.games VALUES (12, 1, 654);
INSERT INTO public.games VALUES (13, 1, 532);
INSERT INTO public.games VALUES (14, 1, 862);
INSERT INTO public.games VALUES (15, 1, 892);
INSERT INTO public.games VALUES (16, 1, 762);
INSERT INTO public.games VALUES (17, 1, 348);
INSERT INTO public.games VALUES (18, 2, 990);
INSERT INTO public.games VALUES (19, 1, 156);
INSERT INTO public.games VALUES (20, 1, 661);
INSERT INTO public.games VALUES (21, 1, 543);
INSERT INTO public.games VALUES (22, 1, 452);
INSERT INTO public.games VALUES (23, 1, 334);
INSERT INTO public.games VALUES (24, 1, 265);
INSERT INTO public.games VALUES (25, 2, 397);
INSERT INTO public.games VALUES (26, 1, 747);
INSERT INTO public.games VALUES (27, 1, 56);
INSERT INTO public.games VALUES (28, 1, 379);
INSERT INTO public.games VALUES (29, 1, 704);
INSERT INTO public.games VALUES (30, 1, 675);
INSERT INTO public.games VALUES (31, 1, 503);
INSERT INTO public.games VALUES (32, 2, 384);
INSERT INTO public.games VALUES (33, 1, 93);
INSERT INTO public.games VALUES (34, 1, 243);
INSERT INTO public.games VALUES (35, 1, 413);
INSERT INTO public.games VALUES (36, 1, 621);
INSERT INTO public.games VALUES (37, 1, 53);
INSERT INTO public.games VALUES (38, 1, 232);
INSERT INTO public.games VALUES (39, 2, 580);
INSERT INTO public.games VALUES (40, 1, 65);
INSERT INTO public.games VALUES (41, 1, 300);
INSERT INTO public.games VALUES (42, 4, 156);
INSERT INTO public.games VALUES (43, 4, 220);
INSERT INTO public.games VALUES (44, 5, 528);
INSERT INTO public.games VALUES (45, 5, 787);
INSERT INTO public.games VALUES (46, 4, 646);
INSERT INTO public.games VALUES (47, 4, 505);
INSERT INTO public.games VALUES (48, 4, 485);
INSERT INTO public.games VALUES (49, 6, 875);
INSERT INTO public.games VALUES (50, 6, 414);
INSERT INTO public.games VALUES (51, 7, 335);
INSERT INTO public.games VALUES (52, 7, 386);
INSERT INTO public.games VALUES (53, 6, 812);
INSERT INTO public.games VALUES (54, 6, 23);
INSERT INTO public.games VALUES (55, 6, 718);
INSERT INTO public.games VALUES (56, 8, 52);
INSERT INTO public.games VALUES (57, 8, 690);
INSERT INTO public.games VALUES (58, 9, 306);
INSERT INTO public.games VALUES (59, 9, 779);
INSERT INTO public.games VALUES (60, 8, 78);
INSERT INTO public.games VALUES (61, 8, 462);
INSERT INTO public.games VALUES (62, 8, 294);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, '100');
INSERT INTO public.users VALUES (2, '1000');
INSERT INTO public.users VALUES (3, 'Hake');
INSERT INTO public.users VALUES (4, 'user_1744577414904');
INSERT INTO public.users VALUES (5, 'user_1744577414903');
INSERT INTO public.users VALUES (6, 'user_1744577465475');
INSERT INTO public.users VALUES (7, 'user_1744577465474');
INSERT INTO public.users VALUES (8, 'user_1744577511446');
INSERT INTO public.users VALUES (9, 'user_1744577511445');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 62, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 9, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

