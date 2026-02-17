--
-- PostgreSQL database dump
--

\restrict MhIeUsE6AdSoAIdDGEbJ6eWYFvkGkBTLWZOiCaEZ7NQl67EX9lVGhDE0ZMlkHQc

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2026-02-17 21:32:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 226 (class 1259 OID 32824)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    user_id integer,
    game_id integer,
    quantity integer DEFAULT 1,
    added_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 32823)
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_id_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 225
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- TOC entry 222 (class 1259 OID 32790)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 32789)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 221
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 224 (class 1259 OID 32802)
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    image_url character varying(255) DEFAULT 'default_game.jpg'::character varying,
    category_id integer,
    developer character varying(100),
    release_date date,
    rating numeric(3,1) DEFAULT 0,
    stock integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.games OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 32801)
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.games_id_seq OWNER TO postgres;

--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 223
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- TOC entry 230 (class 1259 OID 32862)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer,
    game_id integer,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 32861)
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO postgres;

--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 229
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- TOC entry 228 (class 1259 OID 32846)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    total_amount numeric(10,2) NOT NULL,
    status character varying(20) DEFAULT 'pending'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32845)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 227
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 220 (class 1259 OID 32770)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    full_name character varying(100),
    role character varying(20) DEFAULT 'user'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    last_login timestamp without time zone,
    is_active boolean DEFAULT true
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 32769)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4762 (class 2604 OID 32827)
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 32793)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 32805)
-- Name: games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- TOC entry 4768 (class 2604 OID 32865)
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 32849)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 32773)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4947 (class 0 OID 32824)
-- Dependencies: 226
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, user_id, game_id, quantity, added_at) FROM stdin;
14	4	6	1	2025-12-03 21:55:42.553466
18	16	15	1	2026-02-16 15:34:16.078892
\.


--
-- TOC entry 4943 (class 0 OID 32790)
-- Dependencies: 222
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, description, created_at) FROM stdin;
1	Экшен	Динамичные игры с сражениями и приключениями	2025-11-29 23:34:06.322476
2	RPG	Ролевые игры с глубоким сюжетом	2025-11-29 23:34:06.322476
3	Стратегии	Тактические и стратегические игры	2025-11-29 23:34:06.322476
4	Гонки	Авто- и мото-гонки	2025-11-29 23:34:06.322476
5	Инди	Независимые игры	2025-11-29 23:34:06.322476
\.


--
-- TOC entry 4945 (class 0 OID 32802)
-- Dependencies: 224
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, title, description, price, image_url, category_id, developer, release_date, rating, stock, is_active, created_at) FROM stdin;
6	Resident Evil 4 Remake	Игрок управляет американским правительственным агентом Леоном Скоттом Кеннеди, который выполняет миссию по спасению Эшли Грэм, дочери президента Соединённых Штатов, из испанской деревни, где правит культ «Лос Иллюминадос», подчиняющийся древнему паразиту.	3000.00	6932d35c4d125_1764938588.jpg	2	Capcom	2023-03-24	4.8	5	t	2025-11-29 23:52:29.169268
2	The Witcher 3	Эпическая RPG о ведьмаке Геральте	1499.00	witcher.jpg	2	CD Projekt Red	2015-05-19	4.9	100	t	2025-11-29 23:34:15.003068
15	Detroit: Become Human	Действие игры происходит в Детройте в недалёком будущем, где существуют серийно выпускаемые андроиды — роботы-слуги, почти неотличимые от людей. Машины должны беспрекословно подчиняться своим хозяевам, но некоторые из них в результате программного сбоя становятся «девиантами» с собственной волей.	3999.00	6932d7892091e_1764939657.jpg	1	Quantic Dream	2018-05-04	0.0	100	t	2025-12-05 20:00:57.176856
1	Cyberpunk 2077	Приключение в открытом мире будущего	1999.00	cyberpank.jpg	1	CD Projekt Red	2020-12-10	4.5	50	t	2025-11-29 23:34:15.003068
5	Stardew Valley	Фермерская RPG в пиксельном стиле	499.00	stardew.jpg	5	ConcernedApe	2016-02-26	5.0	200	t	2025-11-29 23:34:15.003068
14	60 Seconds!	В начале игры у игрока есть 60 секунд, чтобы собрать припасы, членов семьи и отвлекающие предметы (например, набор шашек) и отнести их в подземное убежище под своим домом, включая члена семьи, которым игрок изначально управляет, прежде чем на район будет сброшена ядерная бомба.	799.00	60sec.jpg	3	Robot Gentleman	2015-05-25	0.0	100	t	2025-11-30 01:23:46.936952
\.


--
-- TOC entry 4951 (class 0 OID 32862)
-- Dependencies: 230
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, order_id, game_id, quantity, price) FROM stdin;
\.


--
-- TOC entry 4949 (class 0 OID 32846)
-- Dependencies: 228
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, total_amount, status, created_at) FROM stdin;
\.


--
-- TOC entry 4941 (class 0 OID 32770)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, full_name, role, created_at, last_login, is_active) FROM stdin;
4	иван	nya@yandex.ru	$2y$10$XHmVvrr3QqBetoqJqj9.aOKCGhAq10JeeCvLQbT/jCrrljN3Q9v62	Иван	user	2025-12-03 00:34:58.598755	2025-12-03 21:31:35.951315	t
12	Полина	zvereva@mail.ru	$2y$10$k22Tt22ZwPOcUa7Lr2u0TO9ykxbMHqO7.rO9u6mO5.5WRpE6V0z5G	Полина	user	2025-12-03 23:07:49.12292	\N	t
15	маргарита	rita111@mail.ru	$2y$10$6hlA9ZlfOG1HdmFCaxF9O.BecerkjRW6ELYoCgUKvr07GcIhHaWue	маргарита	user	2025-12-05 19:06:24.334446	\N	t
1	admin	admin@gamestore.com	$2y$10$YflFPMtBDRSRjgvsczhChe7z0CqVvmN/KviwMJH.tk26U7G0oBJa2	Администратор	admin	2025-11-29 23:34:24.171819	2026-02-16 15:32:45.87652	t
16	софья	sonazvereva04166@gmail.com	$2y$10$o/6d6n6nl4imys9jcvSTc.E3iAbpNAPo/GxSAaw1WZFQXv4M/4FkW	соня	user	2026-02-16 15:33:38.889688	2026-02-16 15:33:47.572944	t
\.


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 225
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 18, true);


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 221
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 223
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 15, true);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 229
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 1, false);


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 227
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 16, true);


--
-- TOC entry 4780 (class 2606 OID 32832)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- TOC entry 4782 (class 2606 OID 32834)
-- Name: cart cart_user_id_game_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_game_id_key UNIQUE (user_id, game_id);


--
-- TOC entry 4776 (class 2606 OID 32800)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4778 (class 2606 OID 32817)
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- TOC entry 4786 (class 2606 OID 32870)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4784 (class 2606 OID 32855)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4770 (class 2606 OID 32788)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4772 (class 2606 OID 32784)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4774 (class 2606 OID 32786)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4788 (class 2606 OID 32840)
-- Name: cart cart_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- TOC entry 4789 (class 2606 OID 32835)
-- Name: cart cart_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4787 (class 2606 OID 32818)
-- Name: games games_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 4791 (class 2606 OID 32876)
-- Name: order_items order_items_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- TOC entry 4792 (class 2606 OID 32871)
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- TOC entry 4790 (class 2606 OID 32856)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2026-02-17 21:32:24

--
-- PostgreSQL database dump complete
--

\unrestrict MhIeUsE6AdSoAIdDGEbJ6eWYFvkGkBTLWZOiCaEZ7NQl67EX9lVGhDE0ZMlkHQc

