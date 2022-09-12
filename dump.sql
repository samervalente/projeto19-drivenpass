--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-1.pgdg22.04+1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-1.pgdg22.04+1)

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
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "printName" text NOT NULL,
    "expirationDate" text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "isVirtual" boolean NOT NULL,
    title text NOT NULL,
    type text NOT NULL,
    number integer NOT NULL,
    "securityCode" text NOT NULL
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cards_id_seq OWNER TO postgres;

--
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cards_id_seq OWNED BY public.cards.id;


--
-- Name: credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credentials (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    title text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    url text NOT NULL
);


ALTER TABLE public.credentials OWNER TO postgres;

--
-- Name: credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.credentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credentials_id_seq OWNER TO postgres;

--
-- Name: credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.credentials_id_seq OWNED BY public.credentials.id;


--
-- Name: secure_notes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.secure_notes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    title character varying(50) NOT NULL,
    note character varying(1000) NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.secure_notes OWNER TO postgres;

--
-- Name: secure_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.secure_notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secure_notes_id_seq OWNER TO postgres;

--
-- Name: secure_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.secure_notes_id_seq OWNED BY public.secure_notes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wifi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wifi (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "networkName" text NOT NULL,
    "networkPassword" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    title text NOT NULL
);


ALTER TABLE public.wifi OWNER TO postgres;

--
-- Name: wifi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wifi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wifi_id_seq OWNER TO postgres;

--
-- Name: wifi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wifi_id_seq OWNED BY public.wifi.id;


--
-- Name: cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards ALTER COLUMN id SET DEFAULT nextval('public.cards_id_seq'::regclass);


--
-- Name: credentials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credentials ALTER COLUMN id SET DEFAULT nextval('public.credentials_id_seq'::regclass);


--
-- Name: secure_notes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secure_notes ALTER COLUMN id SET DEFAULT nextval('public.secure_notes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wifi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wifi ALTER COLUMN id SET DEFAULT nextval('public.wifi_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
851a0169-b703-466e-9574-a48e580d7b36	d6bf6f78fd44ff30492edfb4857f73a112421627e6d56ad8c2676ebf45bb6414	2022-09-08 08:14:15.151239-03	20220906114001_init	\N	\N	2022-09-08 08:14:14.827018-03	1
9649cde8-c4d9-441b-a120-6095976135e9	03ffde3f60aa3a3407ccb1523c56319df2307dbdd93cea59cdf7b5789d1643c6	2022-09-10 10:53:25.575481-03	20220910135325_alter_column_number_to_string_type_instead_int	\N	\N	2022-09-10 10:53:25.426786-03	1
85caf5bf-ab10-43ac-bdcb-6188470bd07b	ffb15e0c4a433b861b5847de6741ca6a0bd3c3db6ee18a3241eed2270a1d508c	2022-09-08 08:14:15.301569-03	20220906194525_	\N	\N	2022-09-08 08:14:15.159702-03	1
95fafd73-75c4-4bb0-8fcf-cb9464169454	b3bec91b118496a6b2489bd542516b3bfe23cccfb1c24fb6d9c60eac5cc195a8	2022-09-08 08:14:15.451865-03	20220907125227_add_timestamptz_constraint_in_created_at_column_at_users_model	\N	\N	2022-09-08 08:14:15.310095-03	1
1efb915c-b548-46e9-bf9b-5469c7bf8db2	30ea78c789c84abdc7e19066504a084dde7e8123d17398f3a4abcc0b3d36140f	2022-09-08 08:14:15.577042-03	20220907125921_create_credentials_model	\N	\N	2022-09-08 08:14:15.460374-03	1
50ee6c5e-fe88-4cca-85a7-20f6db709c46	405ea0caaf695240a5fcc95d936e35dd6b17da9c7df779d8f19e6eec885d91ea	2022-09-10 11:00:02.37465-03	20220910140002_alter_type_of_number_and_secutiry_code_columns_in_cards_model	\N	\N	2022-09-10 11:00:02.344037-03	1
27a888b3-f477-4eb1-9ed3-6f22ae74e635	84f2ae93fec123c03dd3ef124b7f5fd3adf6edde4a27774fc28ae429a9d7c427	2022-09-08 08:14:15.927638-03	20220907131843_create_secute_note_and_cards_models	\N	\N	2022-09-08 08:14:15.585531-03	1
d6a7d82c-ae81-4b76-9408-4ebd84b37b14	f044fefda4934bd5b88b4db0e98c8b7b50db1d147c0f444c67627dcf622f2340	2022-09-08 08:14:16.079231-03	20220907132311_create_wifi_model	\N	\N	2022-09-08 08:14:15.936357-03	1
439a516e-e6b1-4512-9d98-b1d01cb0e71e	bb6ab906da812a23ad01353b6a2033d3c4b3d1b2da098ef882607f7e6630d398	2022-09-08 08:14:30.422319-03	20220908111430_add_url_column_in_credentials_model	\N	\N	2022-09-08 08:14:30.390996-03	1
30567fd2-01df-478b-a77a-e8899653beac	02dcfe7683964f1674c71d4d7576b2364e7a1142bf2bafa60f9f943567a7503b	2022-09-10 11:01:52.938893-03	20220910140152_alter_secutyr_code_type_to_string	\N	\N	2022-09-10 11:01:52.787963-03	1
96a9e43d-a5f4-44fc-9a29-a5bc0de28fcf	1dfb22bc2063c69cd47e2e4c1cef3a477d1cf4b87b0d02419325e506d1bc6277	2022-09-08 08:58:14.525959-03	20220908115814_remove_user_records_model	\N	\N	2022-09-08 08:58:14.495585-03	1
08cc18dc-3f70-46c3-be5d-3f912ce21dc7	8034c063936336cf5de455af2f3025b82ad09e23938540d8509d8d0192a93158	2022-09-09 11:55:26.330226-03	20220909145526_add_is_virutal_column_in_cards_model	\N	\N	2022-09-09 11:55:26.291083-03	1
3a697d24-3604-4c3c-a53f-72a200236424	02dcfe7683964f1674c71d4d7576b2364e7a1142bf2bafa60f9f943567a7503b	2022-09-10 09:00:52.490926-03	20220910120052_alter_column_security_code_type_to_string_instead_int_in_cards_model	\N	\N	2022-09-10 09:00:52.136656-03	1
90f3b734-8ce6-4284-a6f3-3484228f3e52	06ba02d3d94613910db6067d61bb18b232b3fb3b25cc23024f13671f6ab91269	2022-09-12 08:58:09.659133-03	20220912115809_alter_the_column_note_data_type_to_varchar_1000	\N	\N	2022-09-12 08:58:09.414752-03	1
a18806c3-bc54-4fb9-b776-ce559db2ced8	0ec2a7f4997842a6ffb09d2a99ecbec1148922b271b8d2488c0fbd3aedc593b9	2022-09-10 09:43:47.308738-03	20220910124347_inser_title_column_in_wifi_model	\N	\N	2022-09-10 09:43:47.22392-03	1
be48266e-8f39-4c2f-8875-df01671c9cf0	8bc4491c24cd06ec971e1472d20090228c8387610dc24c47b263700c7a3ba39d	2022-09-10 10:15:24.741139-03	20220910131524_add_type_column_in_cards_model	\N	\N	2022-09-10 10:15:24.707815-03	1
\.


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (id, "userId", "printName", "expirationDate", password, "createdAt", "isVirtual", title, type, number, "securityCode") FROM stdin;
10	2	Samer V D	24/05	481906a43b41c77c40dfadbf9a3c4c0192f3c612ce9d278f6c4a30331266ba3a864851fb9d28c7fa4e589db234b7c51176b80f9b9668430906f0be18afdf9c6aa95d585fc2ed7ad5afb8ba73b4bc3d973efb7b59fbf498a6366fd91e32cd14d1e3afcc	2022-09-10 11:02:13.481-03	t	Cartão Yamada 4	crédito	232	9e50e435321a6ba5eb63127f4cc03c9227486ca8d3a5317f9fc3583b818c35a2c1c0a86e4b3b822e90c08f07f8ecdb847b4d0032cff2fcacdb83ce0b9bd76783e67d708c8fac5a1fbb38752cac8e174bf377eba2fd4ceff70866e648e1432c3d05a108
14	2	Samer V D	24/05	048da8771b537c74accd18e111dac8424b9558d294632bc85502eaf1b0f9ac41e7dd6d807cacbad0ecaf5eec0faf2fd316355a84ef7d9f3322c9c7ae82c7373636d5ab079ca5fc70116279699d03d4c1656fbcd15363e440b1efb1aac8747675101601	2022-09-12 09:00:28.829-03	t	Cartão Yamada 5	crédito/débito	232	6080ee573705b18870854ab127436878fdf8186e3f9263c7ec3c961d21194170042e3298001b8777bff995f59d55dcaa290431f41a3bef12b87edbf7662297f9e6346e28ce1f49cc79017f6ee4baa6cfc64a57fc967c005e6651864f32c1fa8d343f0a
15	2	Samer V D	24/05	5e181d3caee22fe48b78f304d293715f1e92f5c942103fe438b44a58339999ce35ce13842e7d75541e27fab3a3870854514d354a165e734342062de5328a211fc0ba50e91bd96506ae0ee07d1792a695aa74d1d6951e02bf8e4d8c132e305bce871807	2022-09-12 09:00:32.546-03	t	Cartão Yamada	crédito/débito	232	1e568f6554d640adb6d8ac0b8b70d4f5d787e9c9c35e635cb7f5eaef1b2b2d13d6a9d4b935bbcf767273a16fea37d140a33df8128a8e071f2c4121b794b92c77e9a9fba82ca9afdf2dc0a104c7ff91781bde47aba28a8faf8406ec1fb7b24716b96799
\.


--
-- Data for Name: credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credentials (id, "userId", title, username, password, "createdAt", url) FROM stdin;
33	2	Site 5	mindbloom	fb47c4f25a6e48376fe3e6fc0fb148346e1a25e29ea52618bf1671ecf95a82774f1b7ade07316b6815c0cc6886b5a9e379d09ad5caca2f5ae5a0bc2661e95ce26973c48e423839c0a7b5baaaff9d51057ccd9d3cfe4f5bc9e7372af8aaeeb5e0ebb101	2022-09-09 13:15:46.278-03	https://www.prisma.io/docs/concepts/components/prisma-client/crud
45	3	Site 5	mindbloom	46e07123b4ae52e9cd2e3c71c2f0a4ab249d8632b38a05277492e7f11a7249b5eae4b652de123cc320fcdefdc8aa00bf8df5905d0311af333d0cb11060fa359a7e595cf64e5bcd41443181b144986a9489aa5802030e350a4eabb6992212068e38fe59	2022-09-10 10:07:18.142-03	https://www.prisma.io/docs/concepts/components/prisma-client/crud
\.


--
-- Data for Name: secure_notes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.secure_notes (id, "userId", title, note, "createdAt") FROM stdin;
2	2	Minha primeira anotação	testando	2022-09-10 09:15:45.01-03
3	2	Minha primeira anotação 2	testando	2022-09-10 09:15:47.639-03
6	2	Minha primeira anotação 3	testando	2022-09-10 09:23:01.944-03
11	4	Minha primeira anotação 3	testando	2022-09-12 08:51:13.196-03
12	4	Minha primeira  3	testando	2022-09-12 08:51:34.846-03
14	4	Minha primeira nota segura 2	A senha do meu cofre é a quantidade de letras do nome do meu cachorro x2/0.5	2022-09-12 08:56:32.792-03
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, "createdAt") FROM stdin;
1	same23er@gmail.com	$2b$10$2u5o1XYUBGz4nSdJtJlrbeSSyOxNlaU9zlMbl0O218bJi/eBIX0va	2022-09-09 09:37:17.105-03
2	samervalente@gmail.com	$2b$10$MIlSC5BFusZkvF3m8Cdn.OSLBxpevogxZZpt7iedVxWGZOcxQY.Lu	2022-09-09 09:43:41.208-03
3	samervalente2@gmail.com	$2b$10$XQRQOdaHWPjHbzHoSKtr5uWxfWLpXSL7k8kpWyUxLoiENWxgezgE2	2022-09-10 09:58:20.997-03
4	lipivalente@gmail.com	$2b$10$/2ak8VA.OROla.ddVC5NUOmYIvTF1MUem6Y3ahs00Nc5AtLS.okaK	2022-09-12 08:46:22.566-03
\.


--
-- Data for Name: wifi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wifi (id, "userId", "networkName", "networkPassword", "createdAt", title) FROM stdin;
1	2	wifiDoLeo	03cbf8563459ed0735da846ec856e65a8472c471b884063eafb06417d9159ccf02e2a238b4e104655511d1aa6de646d9daa2cdb6411771c0c4bc5ee4551a89590913dd8b609ab36be4a37f6848f7085abedd1fb3555f0dcb6042e32a1d90cacbcdad21	2022-09-12 09:05:21.057-03	Wifi do Vizinho
2	2	wifiDoLeo	45317e22945c104b666b72ff1daea6098f4c65b0a11d478f800e4da2d1f6f095b1945f5ed42ebcce8d095de058ef4ae8f2b93a7e3a0fb5168ae3f6071692cfa4357d07ea8e41457d7e672b8e62635cb4210560921349f800d0f7edbcfc03f4ed752259	2022-09-12 09:05:59.962-03	Wifi do Vizinho
\.


--
-- Name: cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_id_seq', 15, true);


--
-- Name: credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.credentials_id_seq', 55, true);


--
-- Name: secure_notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.secure_notes_id_seq', 14, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: wifi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wifi_id_seq', 3, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- Name: credentials credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (id);


--
-- Name: secure_notes secure_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secure_notes
    ADD CONSTRAINT secure_notes_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wifi wifi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wifi
    ADD CONSTRAINT wifi_pkey PRIMARY KEY (id);


--
-- Name: cards_userId_title_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "cards_userId_title_key" ON public.cards USING btree ("userId", title);


--
-- Name: credentials_userId_title_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "credentials_userId_title_key" ON public.credentials USING btree ("userId", title);


--
-- Name: secure_notes_userId_title_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "secure_notes_userId_title_key" ON public.secure_notes USING btree ("userId", title);


--
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- Name: cards cards_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT "cards_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: credentials credentials_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT "credentials_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: secure_notes secure_notes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secure_notes
    ADD CONSTRAINT "secure_notes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: wifi wifi_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wifi
    ADD CONSTRAINT "wifi_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

