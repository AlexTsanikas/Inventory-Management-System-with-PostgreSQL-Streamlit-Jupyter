--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-07-29 13:15:27

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
-- TOC entry 218 (class 1259 OID 17619)
-- Name: kunden; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kunden (
    customer_id integer NOT NULL,
    vorname character varying(50),
    nachname character varying(50) NOT NULL,
    email character varying(50),
    telefon character varying(30) NOT NULL,
    mobil character varying(30),
    erstellt timestamp without time zone,
    anrede character varying(20),
    plz character varying(10),
    ort character varying(30),
    strasse character varying(30),
    hausnummer integer
);


ALTER TABLE public.kunden OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17618)
-- Name: kunden_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kunden_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kunden_customer_id_seq OWNER TO postgres;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 217
-- Name: kunden_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kunden_customer_id_seq OWNED BY public.kunden.customer_id;


--
-- TOC entry 224 (class 1259 OID 17661)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    bestellartikel_id integer NOT NULL,
    bestell_id integer NOT NULL,
    produkt_id integer NOT NULL,
    bestellte_menge integer NOT NULL,
    einzellpreis numeric(10,2) NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17660)
-- Name: order_items_bestellartikel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_bestellartikel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_bestellartikel_id_seq OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 223
-- Name: order_items_bestellartikel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_bestellartikel_id_seq OWNED BY public.order_items.bestellartikel_id;


--
-- TOC entry 222 (class 1259 OID 17654)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    bestell_id integer NOT NULL,
    customer_id integer NOT NULL,
    bestelldatum timestamp without time zone NOT NULL,
    status character varying(20) NOT NULL,
    gesamtbetrag_der_bestellung numeric(10,2) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17653)
-- Name: orders_bestell_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_bestell_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_bestell_id_seq OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_bestell_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_bestell_id_seq OWNED BY public.orders.bestell_id;


--
-- TOC entry 226 (class 1259 OID 17678)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    zahlungs_id integer NOT NULL,
    bestell_id integer NOT NULL,
    zahlungsdatum timestamp without time zone NOT NULL,
    betrag numeric(10,2) NOT NULL,
    zahlungsmethode character varying(30) NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17677)
-- Name: payments_zahlungs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_zahlungs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_zahlungs_id_seq OWNER TO postgres;

--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 225
-- Name: payments_zahlungs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_zahlungs_id_seq OWNED BY public.payments.zahlungs_id;


--
-- TOC entry 220 (class 1259 OID 17626)
-- Name: produkte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produkte (
    produkt_id integer NOT NULL,
    name character varying(100),
    produktbeschreibung character varying(100),
    preis numeric(10,2),
    lagerbestand integer,
    kategorie_id integer
);


ALTER TABLE public.produkte OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17625)
-- Name: produkte_produkt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produkte_produkt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produkte_produkt_id_seq OWNER TO postgres;

--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 219
-- Name: produkte_produkt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produkte_produkt_id_seq OWNED BY public.produkte.produkt_id;


--
-- TOC entry 4762 (class 2604 OID 17622)
-- Name: kunden customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kunden ALTER COLUMN customer_id SET DEFAULT nextval('public.kunden_customer_id_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 17664)
-- Name: order_items bestellartikel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN bestellartikel_id SET DEFAULT nextval('public.order_items_bestellartikel_id_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 17657)
-- Name: orders bestell_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN bestell_id SET DEFAULT nextval('public.orders_bestell_id_seq'::regclass);


--
-- TOC entry 4766 (class 2604 OID 17681)
-- Name: payments zahlungs_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN zahlungs_id SET DEFAULT nextval('public.payments_zahlungs_id_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 17629)
-- Name: produkte produkt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produkte ALTER COLUMN produkt_id SET DEFAULT nextval('public.produkte_produkt_id_seq'::regclass);


--
-- TOC entry 4925 (class 0 OID 17619)
-- Dependencies: 218
-- Data for Name: kunden; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kunden (customer_id, vorname, nachname, email, telefon, mobil, erstellt, anrede, plz, ort, strasse, hausnummer) FROM stdin;
4	Vitus	Schmidt	personal@no-addr.com	02682/3840283	01578/66621957	2025-07-05 00:18:15	Herr	57539	Fürthen	Waldstr.	26
5	Oswin	Spitznogle	info@company.info	09465/1360388	NaN	2025-06-08 01:11:46	Herr	92445	Neukirchen-Balbini	Haselhof	4
6	Mamu	Esser	marketting@blue-white.biz	NaN	NaN	2025-05-15 12:49:50	NaN	57518	Betzdorf	Hähnerweg	28
7	Theodrada	Geier	theodrada@t-pomline.de	06033/1931866	0162/65419702	2025-05-29 07:16:26	Frau	35510	Butzbach	Stautzertstr.	42
8	Wyneken	Schneider	info@zo-texit.de	04205/5026956	01516/20202355	2025-06-03 04:02:47	NaN	28870	Ottersberg	Achtern Hoff	45
9	Sancia	Kappel	NaN	02274/3418421	01516/33824616	2025-06-23 03:50:06	NaN	50189	Elsdorf	Haus Etzweiler	16
10	Hildegrim	Wendell	logistik@x-piros.de	09335/9643561	01570/60922421	2025-05-07 18:34:44	Herr	97255	Sonderhofen	Am Hundsberg	1
11	Neadelia	Baumgärtner	personal@blue-white.info	03681/1386137	0176/43052909	2025-07-21 20:30:00	NaN	98528	Suhl	Brunnenstr.	1
12	Marzella	Rothbauer	m.rothbauer@zrp-communications.de	033609/1494659	01523/38308524	2025-06-20 12:57:19	Frau	15295	Groß Lindow	Birkenweg	38
13	Dietlana	Schulte	info@qt-power.info	039601/668188	0176/82676662	2025-06-07 01:58:28	Frau	17039	Wulkenzin	Quittenweg	36
14	Simon	Beltz	simon@x-piros.net	06241/1308400	NaN	2025-05-14 19:07:44	Herr	67547	Worms	Am Alten Schlachthof	41
15	Lutwin	Brantley	lutwin@blue-white.de	02865/5753955	01573/68985139	2025-05-17 05:47:41	Herr	46348	Raesfeld	Kettelerstr.	11
16	Florian	Kuhn	florian@x-piros.de	05931/837151	NaN	2025-06-30 01:55:51	Herr	49716	Meppen	Püntkers Patt	40
17	Peer	Leitzke	peer.leitzke@company.net	08341/7779990	NaN	2025-05-26 19:16:47	Herr	87600	Kaufbeuren	Herbststr.	28
18	Doerk	Scheer	scheer@qt-power.net	09198/9126652	0176/20414602	2025-07-19 03:15:29	NaN	91332	Heiligenstadt i.OFr.	Brunn	8
19	Dejna	Bauer	d.bauer@t-pomline.de	08368/2917956	0174/75463917	2025-07-13 20:43:21	NaN	87642	Halblech	Allgäuer Str.	19
20	Baldo	Hölzer	NaN	06425/1762264	01520/40430813	2025-07-11 09:59:24	Herr	35282	Rauschenberg	Heimbacher Weg	19
21	Nastya	Moser	moser@technikzq.de	05421/2998013	0173/53747835	2025-05-18 04:22:04	NaN	49201	Dissen am Teutoburger Wald	Akazienweg	31
22	Crishan	Bauer	c.bauer@web-t.de	02682/9353955	01520/30659313	2025-05-13 19:19:19	Herr	57539	Fürthen	Im Sieggarten	14
23	Tillman	Schulte	schulte@extend.de	06251/5496753	01573/94965374	2025-05-27 21:31:44	NaN	64653	Lorsch	Friedhofstr.	16
24	Finnity	Kranz	NaN	09144/7766936	01525/80183786	2025-05-21 01:22:41	Frau	91785	Pleinfeld	Sandstr.	6
25	Traudhilde	Groß	info@extend.de	05731/6577217	01523/58403241	2025-05-07 06:54:50	Frau	32549	Bad Oeynhausen	Grünlandweg	21
26	Lanielle	Horn	einkauf@zo-texit.de	NaN	01578/80389115	2025-05-19 11:08:17	Frau	21244	Buchholz in der Nordheide	Tulpenweg	25
27	Triciana	Keller	triciana@qt-power.net	0511/1466541	01590/32227168	2025-05-27 13:14:29	Frau	30159	Hannover	Köbelingerstr.	2
28	Leanca	Werner	leanca.werner@comm-prefix.de	08637/8151053	0177/75062816	2025-05-26 05:28:45	Frau	84494	Neumarkt-Sankt Veit	Johann-Strauß-Str.	25
29	Clara	Groß	clara@zo-texit.de	038462/9497236	01520/40007817	2025-05-14 01:03:30	NaN	18246	Jabelitz	Dorfstr.	42
30	Natalie	Hölzer	personal@comm-prefix.de	02961/4365842	0172/52784276	2025-05-07 10:45:53	Frau	59929	Brilon	Am Poppenberg	11
31	Thomke	Köhl	khl@technikzq.info	07153/9194939	01590/61990569	2025-07-03 02:34:11	Frau	73207	Plochingen	Gablenberg	2
32	Bo	Rothenberg	personal@company.com	02452/1110231	01590/58526444	2025-07-11 10:51:49	Frau	52525	Heinsberg	Auf dem Pfädchen	5
33	Fabian	Werner	f.werner@extend.net	04242/440640	01590/76192739	2025-06-07 05:19:28	NaN	28857	Syke	Zum Kolk	31
34	Götz	Geier	logistik@zo-texit.de	04480/4967767	0177/91114625	2025-07-02 10:29:31	Herr	26939	Ovelgönne	Winterbahn	17
35	Reingard	Leverenz	r.leverenz@zrp-communications.de	NaN	01577/93510913	2025-07-20 11:53:36	Frau	46446	Emmerich am Rhein	Ginsterweg	19
36	Oryana	Kaufer	oryana.kaufer@t-pomline.de	02382/2498377	0178/55525200	2025-05-29 08:25:25	Frau	59227	Ahlen	Warendorfer Str.	37
37	Hilka	Biermann	personal@x-piros.de	07351/1269946	01578/52087025	2025-05-21 08:37:40	Frau	88437	Maselheim	Veilchenweg	13
38	Sabrina	Kaiser	sabrina.kaiser@company.de	05174/8801324	0179/57267171	2025-05-06 22:06:28	Frau	31246	Ilsede	An der Bundesstr.	11
39	Fawini	Koch	fawini@t-pomline.com	02056/5839771	01577/72082895	2025-05-25 11:07:48	NaN	42579	Heiligenhaus	Ahrweg	37
40	Reinhild	Wolf	r.wolf@web-t.de	06063/8279897	NaN	2025-05-01 22:58:22	Frau	64732	Bad König	Am Gänsbrunnen	39
41	Melanie	Schwarz	info@t-pomline.de	0201/5785595	01525/82737510	2025-05-09 14:54:47	NaN	45131	Essen	Brassertstr.	34
42	Daniel	Protz	daniel@comm-prefix.net	09704/9095618	01590/60435138	2025-06-01 10:44:28	Herr	97725	Elfershausen	Am Klingengraben	42
43	Anabell	Gehring	einkauf@web-t.net	038229/5359940	01570/97894585	2025-05-20 03:51:50	Frau	18334	Bad Sülze	Am Sportplatz	28
44	Petja	Schuchard	p.schuchard@blue-white.de	033456/7277234	0176/14076176	2025-07-01 15:16:07	NaN	16269	Bliesdorf	Waldweg	45
45	Napoleon	Saller	info@t-pomline.com	030/1027060	0179/47566672	2025-06-11 19:52:25	NaN	16341	Panketal	Bremer Str.	25
46	Melanie	Jager	einkauf@qt-power.de	07566/5017363	01577/64607755	2025-06-12 12:11:40	NaN	88260	Argenbühl	Alpgaustr.	9
47	Wiebe	Beutel	w.beutel@t-pomline.de	06198/6472410	01570/98571458	2025-07-23 06:46:00	Herr	65817	Eppstein	Ickstadtstr.	5
48	Beate	Tanzer	beate.tanzer@qt-power.de	04332/2641383	0172/78631892	2025-05-14 16:41:57	Frau	24797	Breiholz	Thorhof	41
49	Peter	Biermann	p.biermann@zo-texit.de	05201/5569402	0179/75516410	2025-06-18 20:13:53	Herr	33790	Halle (Westf.)	Buschweg	13
50	Richenza	Heinrichs	richenza@qt-power.de	07961/3158985	0178/56403814	2025-07-02 18:02:58	Frau	73479	Ellwangen (Jagst)	Wilhelm-Maybach-Str.	29
51	Gunde	Siebert	NaN	06436/7030104	0176/53400510	2025-05-08 08:31:43	Frau	65599	Dornburg	Irmgardishof	34
52	Bilhilde	Krause	bilhilde@blue-white.de	038780/866630	0179/77708188	2025-05-24 10:24:39	Frau	19357	Karstädt	Am Dorfplatz	14
53	Efe	Fischer	efe.fischer@company.com	06142/7245618	0176/87132643	2025-07-07 21:08:02	NaN	65479	Raunheim	Rabenweg	29
54	Vitus	Schmidt	personal@no-addr.com	02682/3840283	01578/66621957	2025-07-05 00:18:16	Herr	57539	Fürthen	Waldstr.	26
55	Oswin	Spitznogle	info@company.info	09465/1360388	NaN	2025-06-08 01:11:47	Herr	92445	Neukirchen-Balbini	Haselhof	4
56	Mamu	Esser	marketting@blue-white.biz	NaN	NaN	2025-05-15 12:49:51	NaN	57518	Betzdorf	Hähnerweg	28
57	Theodrada	Geier	theodrada@t-pomline.de	06033/1931866	0162/65419702	2025-05-29 07:16:27	Frau	35510	Butzbach	Stautzertstr.	42
58	Wyneken	Schneider	info@zo-texit.de	04205/5026956	01516/20202355	2025-06-03 04:02:48	NaN	28870	Ottersberg	Achtern Hoff	45
59	Sancia	Kappel	NaN	02274/3418421	01516/33824616	2025-06-23 03:50:07	NaN	50189	Elsdorf	Haus Etzweiler	16
60	Hildegrim	Wendell	logistik@x-piros.de	09335/9643561	01570/60922421	2025-05-07 18:34:45	Herr	97255	Sonderhofen	Am Hundsberg	1
61	Neadelia	Baumgärtner	personal@blue-white.info	03681/1386137	0176/43052909	2025-07-21 20:30:01	NaN	98528	Suhl	Brunnenstr.	1
62	Marzella	Rothbauer	m.rothbauer@zrp-communications.de	033609/1494659	01523/38308524	2025-06-20 12:57:20	Frau	15295	Groß Lindow	Birkenweg	38
63	Dietlana	Schulte	info@qt-power.info	039601/668188	0176/82676662	2025-06-07 01:58:29	Frau	17039	Wulkenzin	Quittenweg	36
64	Simon	Beltz	simon@x-piros.net	06241/1308400	NaN	2025-05-14 19:07:45	Herr	67547	Worms	Am Alten Schlachthof	41
65	Lutwin	Brantley	lutwin@blue-white.de	02865/5753955	01573/68985139	2025-05-17 05:47:42	Herr	46348	Raesfeld	Kettelerstr.	11
66	Florian	Kuhn	florian@x-piros.de	05931/837151	NaN	2025-06-30 01:55:52	Herr	49716	Meppen	Püntkers Patt	40
67	Peer	Leitzke	peer.leitzke@company.net	08341/7779990	NaN	2025-05-26 19:16:48	Herr	87600	Kaufbeuren	Herbststr.	28
68	Doerk	Scheer	scheer@qt-power.net	09198/9126652	0176/20414602	2025-07-19 03:15:30	NaN	91332	Heiligenstadt i.OFr.	Brunn	8
69	Dejna	Bauer	d.bauer@t-pomline.de	08368/2917956	0174/75463917	2025-07-13 20:43:22	NaN	87642	Halblech	Allgäuer Str.	19
70	Baldo	Hölzer	NaN	06425/1762264	01520/40430813	2025-07-11 09:59:25	Herr	35282	Rauschenberg	Heimbacher Weg	19
71	Nastya	Moser	moser@technikzq.de	05421/2998013	0173/53747835	2025-05-18 04:22:05	NaN	49201	Dissen am Teutoburger Wald	Akazienweg	31
72	Crishan	Bauer	c.bauer@web-t.de	02682/9353955	01520/30659313	2025-05-13 19:19:20	Herr	57539	Fürthen	Im Sieggarten	14
73	Tillman	Schulte	schulte@extend.de	06251/5496753	01573/94965374	2025-05-27 21:31:45	NaN	64653	Lorsch	Friedhofstr.	16
74	Finnity	Kranz	NaN	09144/7766936	01525/80183786	2025-05-21 01:22:42	Frau	91785	Pleinfeld	Sandstr.	6
75	Traudhilde	Groß	info@extend.de	05731/6577217	01523/58403241	2025-05-07 06:54:51	Frau	32549	Bad Oeynhausen	Grünlandweg	21
76	Lanielle	Horn	einkauf@zo-texit.de	NaN	01578/80389115	2025-05-19 11:08:18	Frau	21244	Buchholz in der Nordheide	Tulpenweg	25
77	Triciana	Keller	triciana@qt-power.net	0511/1466541	01590/32227168	2025-05-27 13:14:30	Frau	30159	Hannover	Köbelingerstr.	2
78	Leanca	Werner	leanca.werner@comm-prefix.de	08637/8151053	0177/75062816	2025-05-26 05:28:46	Frau	84494	Neumarkt-Sankt Veit	Johann-Strauß-Str.	25
79	Clara	Groß	clara@zo-texit.de	038462/9497236	01520/40007817	2025-05-14 01:03:31	NaN	18246	Jabelitz	Dorfstr.	42
80	Natalie	Hölzer	personal@comm-prefix.de	02961/4365842	0172/52784276	2025-05-07 10:45:54	Frau	59929	Brilon	Am Poppenberg	11
81	Thomke	Köhl	khl@technikzq.info	07153/9194939	01590/61990569	2025-07-03 02:34:12	Frau	73207	Plochingen	Gablenberg	2
82	Bo	Rothenberg	personal@company.com	02452/1110231	01590/58526444	2025-07-11 10:51:50	Frau	52525	Heinsberg	Auf dem Pfädchen	5
83	Fabian	Werner	f.werner@extend.net	04242/440640	01590/76192739	2025-06-07 05:19:29	NaN	28857	Syke	Zum Kolk	31
84	Götz	Geier	logistik@zo-texit.de	04480/4967767	0177/91114625	2025-07-02 10:29:32	Herr	26939	Ovelgönne	Winterbahn	17
85	Reingard	Leverenz	r.leverenz@zrp-communications.de	NaN	01577/93510913	2025-07-20 11:53:36	Frau	46446	Emmerich am Rhein	Ginsterweg	19
86	Oryana	Kaufer	oryana.kaufer@t-pomline.de	02382/2498377	0178/55525200	2025-05-29 08:25:25	Frau	59227	Ahlen	Warendorfer Str.	37
87	Hilka	Biermann	personal@x-piros.de	07351/1269946	01578/52087025	2025-05-21 08:37:40	Frau	88437	Maselheim	Veilchenweg	13
88	Sabrina	Kaiser	sabrina.kaiser@company.de	05174/8801324	0179/57267171	2025-05-06 22:06:28	Frau	31246	Ilsede	An der Bundesstr.	11
89	Fawini	Koch	fawini@t-pomline.com	02056/5839771	01577/72082895	2025-05-25 11:07:48	NaN	42579	Heiligenhaus	Ahrweg	37
90	Reinhild	Wolf	r.wolf@web-t.de	06063/8279897	NaN	2025-05-01 22:58:22	Frau	64732	Bad König	Am Gänsbrunnen	39
91	Melanie	Schwarz	info@t-pomline.de	0201/5785595	01525/82737510	2025-05-09 14:54:47	NaN	45131	Essen	Brassertstr.	34
92	Daniel	Protz	daniel@comm-prefix.net	09704/9095618	01590/60435138	2025-06-01 10:44:28	Herr	97725	Elfershausen	Am Klingengraben	42
93	Anabell	Gehring	einkauf@web-t.net	038229/5359940	01570/97894585	2025-05-20 03:51:50	Frau	18334	Bad Sülze	Am Sportplatz	28
94	Petja	Schuchard	p.schuchard@blue-white.de	033456/7277234	0176/14076176	2025-07-01 15:16:07	NaN	16269	Bliesdorf	Waldweg	45
95	Napoleon	Saller	info@t-pomline.com	030/1027060	0179/47566672	2025-06-11 19:52:25	NaN	16341	Panketal	Bremer Str.	25
96	Melanie	Jager	einkauf@qt-power.de	07566/5017363	01577/64607755	2025-06-12 12:11:40	NaN	88260	Argenbühl	Alpgaustr.	9
97	Wiebe	Beutel	w.beutel@t-pomline.de	06198/6472410	01570/98571458	2025-07-23 06:46:00	Herr	65817	Eppstein	Ickstadtstr.	5
98	Beate	Tanzer	beate.tanzer@qt-power.de	04332/2641383	0172/78631892	2025-05-14 16:41:57	Frau	24797	Breiholz	Thorhof	41
99	Peter	Biermann	p.biermann@zo-texit.de	05201/5569402	0179/75516410	2025-06-18 20:13:53	Herr	33790	Halle (Westf.)	Buschweg	13
100	Richenza	Heinrichs	richenza@qt-power.de	07961/3158985	0178/56403814	2025-07-02 18:02:58	Frau	73479	Ellwangen (Jagst)	Wilhelm-Maybach-Str.	29
101	Gunde	Siebert	NaN	06436/7030104	0176/53400510	2025-05-08 08:31:43	Frau	65599	Dornburg	Irmgardishof	34
102	Bilhilde	Krause	bilhilde@blue-white.de	038780/866630	0179/77708188	2025-05-24 10:24:39	Frau	19357	Karstädt	Am Dorfplatz	14
103	Efe	Fischer	efe.fischer@company.com	06142/7245618	0176/87132643	2025-07-07 21:08:02	NaN	65479	Raunheim	Rabenweg	29
104	Vitus	Schmidt	personal@no-addr.com	02682/3840283	01578/66621957	2025-07-05 00:18:16	Herr	57539	Fürthen	Waldstr.	26
105	Oswin	Spitznogle	info@company.info	09465/1360388	NaN	2025-06-08 01:11:47	Herr	92445	Neukirchen-Balbini	Haselhof	4
106	Mamu	Esser	marketting@blue-white.biz	NaN	NaN	2025-05-15 12:49:51	NaN	57518	Betzdorf	Hähnerweg	28
107	Theodrada	Geier	theodrada@t-pomline.de	06033/1931866	0162/65419702	2025-05-29 07:16:27	Frau	35510	Butzbach	Stautzertstr.	42
108	Wyneken	Schneider	info@zo-texit.de	04205/5026956	01516/20202355	2025-06-03 04:02:48	NaN	28870	Ottersberg	Achtern Hoff	45
109	Sancia	Kappel	NaN	02274/3418421	01516/33824616	2025-06-23 03:50:07	NaN	50189	Elsdorf	Haus Etzweiler	16
110	Hildegrim	Wendell	logistik@x-piros.de	09335/9643561	01570/60922421	2025-05-07 18:34:45	Herr	97255	Sonderhofen	Am Hundsberg	1
111	Neadelia	Baumgärtner	personal@blue-white.info	03681/1386137	0176/43052909	2025-07-21 20:30:01	NaN	98528	Suhl	Brunnenstr.	1
112	Marzella	Rothbauer	m.rothbauer@zrp-communications.de	033609/1494659	01523/38308524	2025-06-20 12:57:20	Frau	15295	Groß Lindow	Birkenweg	38
113	Dietlana	Schulte	info@qt-power.info	039601/668188	0176/82676662	2025-06-07 01:58:29	Frau	17039	Wulkenzin	Quittenweg	36
114	Simon	Beltz	simon@x-piros.net	06241/1308400	NaN	2025-05-14 19:07:46	Herr	67547	Worms	Am Alten Schlachthof	41
115	Lutwin	Brantley	lutwin@blue-white.de	02865/5753955	01573/68985139	2025-05-17 05:47:43	Herr	46348	Raesfeld	Kettelerstr.	11
116	Florian	Kuhn	florian@x-piros.de	05931/837151	NaN	2025-06-30 01:55:53	Herr	49716	Meppen	Püntkers Patt	40
117	Peer	Leitzke	peer.leitzke@company.net	08341/7779990	NaN	2025-05-26 19:16:49	Herr	87600	Kaufbeuren	Herbststr.	28
118	Doerk	Scheer	scheer@qt-power.net	09198/9126652	0176/20414602	2025-07-19 03:15:31	NaN	91332	Heiligenstadt i.OFr.	Brunn	8
119	Dejna	Bauer	d.bauer@t-pomline.de	08368/2917956	0174/75463917	2025-07-13 20:43:23	NaN	87642	Halblech	Allgäuer Str.	19
120	Baldo	Hölzer	NaN	06425/1762264	01520/40430813	2025-07-11 09:59:26	Herr	35282	Rauschenberg	Heimbacher Weg	19
121	Nastya	Moser	moser@technikzq.de	05421/2998013	0173/53747835	2025-05-18 04:22:06	NaN	49201	Dissen am Teutoburger Wald	Akazienweg	31
122	Crishan	Bauer	c.bauer@web-t.de	02682/9353955	01520/30659313	2025-05-13 19:19:21	Herr	57539	Fürthen	Im Sieggarten	14
123	Tillman	Schulte	schulte@extend.de	06251/5496753	01573/94965374	2025-05-27 21:31:46	NaN	64653	Lorsch	Friedhofstr.	16
124	Finnity	Kranz	NaN	09144/7766936	01525/80183786	2025-05-21 01:22:43	Frau	91785	Pleinfeld	Sandstr.	6
125	Traudhilde	Groß	info@extend.de	05731/6577217	01523/58403241	2025-05-07 06:54:52	Frau	32549	Bad Oeynhausen	Grünlandweg	21
126	Lanielle	Horn	einkauf@zo-texit.de	NaN	01578/80389115	2025-05-19 11:08:19	Frau	21244	Buchholz in der Nordheide	Tulpenweg	25
127	Triciana	Keller	triciana@qt-power.net	0511/1466541	01590/32227168	2025-05-27 13:14:31	Frau	30159	Hannover	Köbelingerstr.	2
128	Leanca	Werner	leanca.werner@comm-prefix.de	08637/8151053	0177/75062816	2025-05-26 05:28:47	Frau	84494	Neumarkt-Sankt Veit	Johann-Strauß-Str.	25
129	Clara	Groß	clara@zo-texit.de	038462/9497236	01520/40007817	2025-05-14 01:03:32	NaN	18246	Jabelitz	Dorfstr.	42
130	Natalie	Hölzer	personal@comm-prefix.de	02961/4365842	0172/52784276	2025-05-07 10:45:55	Frau	59929	Brilon	Am Poppenberg	11
131	Thomke	Köhl	khl@technikzq.info	07153/9194939	01590/61990569	2025-07-03 02:34:13	Frau	73207	Plochingen	Gablenberg	2
132	Bo	Rothenberg	personal@company.com	02452/1110231	01590/58526444	2025-07-11 10:51:51	Frau	52525	Heinsberg	Auf dem Pfädchen	5
133	Fabian	Werner	f.werner@extend.net	04242/440640	01590/76192739	2025-06-07 05:19:30	NaN	28857	Syke	Zum Kolk	31
134	Götz	Geier	logistik@zo-texit.de	04480/4967767	0177/91114625	2025-07-02 10:29:33	Herr	26939	Ovelgönne	Winterbahn	17
135	Reingard	Leverenz	r.leverenz@zrp-communications.de	NaN	01577/93510913	2025-07-20 11:53:37	Frau	46446	Emmerich am Rhein	Ginsterweg	19
136	Oryana	Kaufer	oryana.kaufer@t-pomline.de	02382/2498377	0178/55525200	2025-05-29 08:25:26	Frau	59227	Ahlen	Warendorfer Str.	37
137	Hilka	Biermann	personal@x-piros.de	07351/1269946	01578/52087025	2025-05-21 08:37:41	Frau	88437	Maselheim	Veilchenweg	13
138	Sabrina	Kaiser	sabrina.kaiser@company.de	05174/8801324	0179/57267171	2025-05-06 22:06:29	Frau	31246	Ilsede	An der Bundesstr.	11
139	Fawini	Koch	fawini@t-pomline.com	02056/5839771	01577/72082895	2025-05-25 11:07:49	NaN	42579	Heiligenhaus	Ahrweg	37
140	Reinhild	Wolf	r.wolf@web-t.de	06063/8279897	NaN	2025-05-01 22:58:23	Frau	64732	Bad König	Am Gänsbrunnen	39
141	Melanie	Schwarz	info@t-pomline.de	0201/5785595	01525/82737510	2025-05-09 14:54:48	NaN	45131	Essen	Brassertstr.	34
142	Daniel	Protz	daniel@comm-prefix.net	09704/9095618	01590/60435138	2025-06-01 10:44:29	Herr	97725	Elfershausen	Am Klingengraben	42
143	Anabell	Gehring	einkauf@web-t.net	038229/5359940	01570/97894585	2025-05-20 03:51:51	Frau	18334	Bad Sülze	Am Sportplatz	28
144	Petja	Schuchard	p.schuchard@blue-white.de	033456/7277234	0176/14076176	2025-07-01 15:16:08	NaN	16269	Bliesdorf	Waldweg	45
145	Napoleon	Saller	info@t-pomline.com	030/1027060	0179/47566672	2025-06-11 19:52:26	NaN	16341	Panketal	Bremer Str.	25
146	Melanie	Jager	einkauf@qt-power.de	07566/5017363	01577/64607755	2025-06-12 12:11:41	NaN	88260	Argenbühl	Alpgaustr.	9
147	Wiebe	Beutel	w.beutel@t-pomline.de	06198/6472410	01570/98571458	2025-07-23 06:46:01	Herr	65817	Eppstein	Ickstadtstr.	5
148	Beate	Tanzer	beate.tanzer@qt-power.de	04332/2641383	0172/78631892	2025-05-14 16:41:58	Frau	24797	Breiholz	Thorhof	41
149	Peter	Biermann	p.biermann@zo-texit.de	05201/5569402	0179/75516410	2025-06-18 20:13:54	Herr	33790	Halle (Westf.)	Buschweg	13
150	Richenza	Heinrichs	richenza@qt-power.de	07961/3158985	0178/56403814	2025-07-02 18:02:59	Frau	73479	Ellwangen (Jagst)	Wilhelm-Maybach-Str.	29
151	Gunde	Siebert	NaN	06436/7030104	0176/53400510	2025-05-08 08:31:44	Frau	65599	Dornburg	Irmgardishof	34
152	Bilhilde	Krause	bilhilde@blue-white.de	038780/866630	0179/77708188	2025-05-24 10:24:40	Frau	19357	Karstädt	Am Dorfplatz	14
153	Efe	Fischer	efe.fischer@company.com	06142/7245618	0176/87132643	2025-07-07 21:08:03	NaN	65479	Raunheim	Rabenweg	29
154	Vitus	Schmidt	personal@no-addr.com	02682/3840283	01578/66621957	2025-07-05 00:18:17	Herr	57539	Fürthen	Waldstr.	26
155	Oswin	Spitznogle	info@company.info	09465/1360388	NaN	2025-06-08 01:11:48	Herr	92445	Neukirchen-Balbini	Haselhof	4
156	Mamu	Esser	marketting@blue-white.biz	NaN	NaN	2025-05-15 12:49:52	NaN	57518	Betzdorf	Hähnerweg	28
157	Theodrada	Geier	theodrada@t-pomline.de	06033/1931866	0162/65419702	2025-05-29 07:16:28	Frau	35510	Butzbach	Stautzertstr.	42
158	Wyneken	Schneider	info@zo-texit.de	04205/5026956	01516/20202355	2025-06-03 04:02:49	NaN	28870	Ottersberg	Achtern Hoff	45
159	Sancia	Kappel	NaN	02274/3418421	01516/33824616	2025-06-23 03:50:08	NaN	50189	Elsdorf	Haus Etzweiler	16
160	Hildegrim	Wendell	logistik@x-piros.de	09335/9643561	01570/60922421	2025-05-07 18:34:46	Herr	97255	Sonderhofen	Am Hundsberg	1
161	Neadelia	Baumgärtner	personal@blue-white.info	03681/1386137	0176/43052909	2025-07-21 20:30:02	NaN	98528	Suhl	Brunnenstr.	1
162	Marzella	Rothbauer	m.rothbauer@zrp-communications.de	033609/1494659	01523/38308524	2025-06-20 12:57:21	Frau	15295	Groß Lindow	Birkenweg	38
163	Dietlana	Schulte	info@qt-power.info	039601/668188	0176/82676662	2025-06-07 01:58:30	Frau	17039	Wulkenzin	Quittenweg	36
164	Simon	Beltz	simon@x-piros.net	06241/1308400	NaN	2025-05-14 19:07:46	Herr	67547	Worms	Am Alten Schlachthof	41
165	Lutwin	Brantley	lutwin@blue-white.de	02865/5753955	01573/68985139	2025-05-17 05:47:43	Herr	46348	Raesfeld	Kettelerstr.	11
166	Florian	Kuhn	florian@x-piros.de	05931/837151	NaN	2025-06-30 01:55:53	Herr	49716	Meppen	Püntkers Patt	40
167	Peer	Leitzke	peer.leitzke@company.net	08341/7779990	NaN	2025-05-26 19:16:49	Herr	87600	Kaufbeuren	Herbststr.	28
168	Doerk	Scheer	scheer@qt-power.net	09198/9126652	0176/20414602	2025-07-19 03:15:31	NaN	91332	Heiligenstadt i.OFr.	Brunn	8
169	Dejna	Bauer	d.bauer@t-pomline.de	08368/2917956	0174/75463917	2025-07-13 20:43:23	NaN	87642	Halblech	Allgäuer Str.	19
170	Baldo	Hölzer	NaN	06425/1762264	01520/40430813	2025-07-11 09:59:26	Herr	35282	Rauschenberg	Heimbacher Weg	19
171	Nastya	Moser	moser@technikzq.de	05421/2998013	0173/53747835	2025-05-18 04:22:06	NaN	49201	Dissen am Teutoburger Wald	Akazienweg	31
172	Crishan	Bauer	c.bauer@web-t.de	02682/9353955	01520/30659313	2025-05-13 19:19:21	Herr	57539	Fürthen	Im Sieggarten	14
173	Tillman	Schulte	schulte@extend.de	06251/5496753	01573/94965374	2025-05-27 21:31:46	NaN	64653	Lorsch	Friedhofstr.	16
174	Finnity	Kranz	NaN	09144/7766936	01525/80183786	2025-05-21 01:22:43	Frau	91785	Pleinfeld	Sandstr.	6
175	Traudhilde	Groß	info@extend.de	05731/6577217	01523/58403241	2025-05-07 06:54:52	Frau	32549	Bad Oeynhausen	Grünlandweg	21
176	Lanielle	Horn	einkauf@zo-texit.de	NaN	01578/80389115	2025-05-19 11:08:19	Frau	21244	Buchholz in der Nordheide	Tulpenweg	25
177	Triciana	Keller	triciana@qt-power.net	0511/1466541	01590/32227168	2025-05-27 13:14:31	Frau	30159	Hannover	Köbelingerstr.	2
178	Leanca	Werner	leanca.werner@comm-prefix.de	08637/8151053	0177/75062816	2025-05-26 05:28:47	Frau	84494	Neumarkt-Sankt Veit	Johann-Strauß-Str.	25
179	Clara	Groß	clara@zo-texit.de	038462/9497236	01520/40007817	2025-05-14 01:03:32	NaN	18246	Jabelitz	Dorfstr.	42
180	Natalie	Hölzer	personal@comm-prefix.de	02961/4365842	0172/52784276	2025-05-07 10:45:55	Frau	59929	Brilon	Am Poppenberg	11
181	Thomke	Köhl	khl@technikzq.info	07153/9194939	01590/61990569	2025-07-03 02:34:13	Frau	73207	Plochingen	Gablenberg	2
182	Bo	Rothenberg	personal@company.com	02452/1110231	01590/58526444	2025-07-11 10:51:51	Frau	52525	Heinsberg	Auf dem Pfädchen	5
183	Fabian	Werner	f.werner@extend.net	04242/440640	01590/76192739	2025-06-07 05:19:30	NaN	28857	Syke	Zum Kolk	31
184	Götz	Geier	logistik@zo-texit.de	04480/4967767	0177/91114625	2025-07-02 10:29:33	Herr	26939	Ovelgönne	Winterbahn	17
185	Reingard	Leverenz	r.leverenz@zrp-communications.de	NaN	01577/93510913	2025-07-20 11:53:37	Frau	46446	Emmerich am Rhein	Ginsterweg	19
186	Oryana	Kaufer	oryana.kaufer@t-pomline.de	02382/2498377	0178/55525200	2025-05-29 08:25:26	Frau	59227	Ahlen	Warendorfer Str.	37
187	Hilka	Biermann	personal@x-piros.de	07351/1269946	01578/52087025	2025-05-21 08:37:41	Frau	88437	Maselheim	Veilchenweg	13
188	Sabrina	Kaiser	sabrina.kaiser@company.de	05174/8801324	0179/57267171	2025-05-06 22:06:29	Frau	31246	Ilsede	An der Bundesstr.	11
189	Fawini	Koch	fawini@t-pomline.com	02056/5839771	01577/72082895	2025-05-25 11:07:49	NaN	42579	Heiligenhaus	Ahrweg	37
190	Reinhild	Wolf	r.wolf@web-t.de	06063/8279897	NaN	2025-05-01 22:58:23	Frau	64732	Bad König	Am Gänsbrunnen	39
191	Melanie	Schwarz	info@t-pomline.de	0201/5785595	01525/82737510	2025-05-09 14:54:48	NaN	45131	Essen	Brassertstr.	34
192	Daniel	Protz	daniel@comm-prefix.net	09704/9095618	01590/60435138	2025-06-01 10:44:29	Herr	97725	Elfershausen	Am Klingengraben	42
193	Anabell	Gehring	einkauf@web-t.net	038229/5359940	01570/97894585	2025-05-20 03:51:51	Frau	18334	Bad Sülze	Am Sportplatz	28
194	Petja	Schuchard	p.schuchard@blue-white.de	033456/7277234	0176/14076176	2025-07-01 15:16:08	NaN	16269	Bliesdorf	Waldweg	45
195	Napoleon	Saller	info@t-pomline.com	030/1027060	0179/47566672	2025-06-11 19:52:26	NaN	16341	Panketal	Bremer Str.	25
196	Melanie	Jager	einkauf@qt-power.de	07566/5017363	01577/64607755	2025-06-12 12:11:41	NaN	88260	Argenbühl	Alpgaustr.	9
197	Wiebe	Beutel	w.beutel@t-pomline.de	06198/6472410	01570/98571458	2025-07-23 06:46:01	Herr	65817	Eppstein	Ickstadtstr.	5
198	Beate	Tanzer	beate.tanzer@qt-power.de	04332/2641383	0172/78631892	2025-05-14 16:41:58	Frau	24797	Breiholz	Thorhof	41
199	Peter	Biermann	p.biermann@zo-texit.de	05201/5569402	0179/75516410	2025-06-18 20:13:54	Herr	33790	Halle (Westf.)	Buschweg	13
200	Richenza	Heinrichs	richenza@qt-power.de	07961/3158985	0178/56403814	2025-07-02 18:03:00	Frau	73479	Ellwangen (Jagst)	Wilhelm-Maybach-Str.	29
201	Gunde	Siebert	NaN	06436/7030104	0176/53400510	2025-05-08 08:31:45	Frau	65599	Dornburg	Irmgardishof	34
202	Bilhilde	Krause	bilhilde@blue-white.de	038780/866630	0179/77708188	2025-05-24 10:24:41	Frau	19357	Karstädt	Am Dorfplatz	14
203	Efe	Fischer	efe.fischer@company.com	06142/7245618	0176/87132643	2025-07-07 21:08:04	NaN	65479	Raunheim	Rabenweg	29
204	Vitus	Schmidt	personal@no-addr.com	02682/3840283	01578/66621957	2025-07-05 00:18:18	Herr	57539	Fürthen	Waldstr.	26
205	Oswin	Spitznogle	info@company.info	09465/1360388	NaN	2025-06-08 01:11:49	Herr	92445	Neukirchen-Balbini	Haselhof	4
206	Mamu	Esser	marketting@blue-white.biz	NaN	NaN	2025-05-15 12:49:53	NaN	57518	Betzdorf	Hähnerweg	28
207	Theodrada	Geier	theodrada@t-pomline.de	06033/1931866	0162/65419702	2025-05-29 07:16:29	Frau	35510	Butzbach	Stautzertstr.	42
208	Wyneken	Schneider	info@zo-texit.de	04205/5026956	01516/20202355	2025-06-03 04:02:50	NaN	28870	Ottersberg	Achtern Hoff	45
209	Sancia	Kappel	NaN	02274/3418421	01516/33824616	2025-06-23 03:50:09	NaN	50189	Elsdorf	Haus Etzweiler	16
210	Hildegrim	Wendell	logistik@x-piros.de	09335/9643561	01570/60922421	2025-05-07 18:34:47	Herr	97255	Sonderhofen	Am Hundsberg	1
211	Neadelia	Baumgärtner	personal@blue-white.info	03681/1386137	0176/43052909	2025-07-21 20:30:03	NaN	98528	Suhl	Brunnenstr.	1
212	Marzella	Rothbauer	m.rothbauer@zrp-communications.de	033609/1494659	01523/38308524	2025-06-20 12:57:22	Frau	15295	Groß Lindow	Birkenweg	38
213	Dietlana	Schulte	info@qt-power.info	039601/668188	0176/82676662	2025-06-07 01:58:31	Frau	17039	Wulkenzin	Quittenweg	36
214	Simon	Beltz	simon@x-piros.net	06241/1308400	NaN	2025-05-14 19:07:47	Herr	67547	Worms	Am Alten Schlachthof	41
215	Lutwin	Brantley	lutwin@blue-white.de	02865/5753955	01573/68985139	2025-05-17 05:47:44	Herr	46348	Raesfeld	Kettelerstr.	11
216	Florian	Kuhn	florian@x-piros.de	05931/837151	NaN	2025-06-30 01:55:54	Herr	49716	Meppen	Püntkers Patt	40
217	Peer	Leitzke	peer.leitzke@company.net	08341/7779990	NaN	2025-05-26 19:16:50	Herr	87600	Kaufbeuren	Herbststr.	28
218	Doerk	Scheer	scheer@qt-power.net	09198/9126652	0176/20414602	2025-07-19 03:15:32	NaN	91332	Heiligenstadt i.OFr.	Brunn	8
219	Dejna	Bauer	d.bauer@t-pomline.de	08368/2917956	0174/75463917	2025-07-13 20:43:24	NaN	87642	Halblech	Allgäuer Str.	19
220	Baldo	Hölzer	NaN	06425/1762264	01520/40430813	2025-07-11 09:59:27	Herr	35282	Rauschenberg	Heimbacher Weg	19
221	Nastya	Moser	moser@technikzq.de	05421/2998013	0173/53747835	2025-05-18 04:22:07	NaN	49201	Dissen am Teutoburger Wald	Akazienweg	31
222	Crishan	Bauer	c.bauer@web-t.de	02682/9353955	01520/30659313	2025-05-13 19:19:22	Herr	57539	Fürthen	Im Sieggarten	14
223	Tillman	Schulte	schulte@extend.de	06251/5496753	01573/94965374	2025-05-27 21:31:47	NaN	64653	Lorsch	Friedhofstr.	16
224	Finnity	Kranz	NaN	09144/7766936	01525/80183786	2025-05-21 01:22:44	Frau	91785	Pleinfeld	Sandstr.	6
225	Traudhilde	Groß	info@extend.de	05731/6577217	01523/58403241	2025-05-07 06:54:53	Frau	32549	Bad Oeynhausen	Grünlandweg	21
226	Lanielle	Horn	einkauf@zo-texit.de	NaN	01578/80389115	2025-05-19 11:08:20	Frau	21244	Buchholz in der Nordheide	Tulpenweg	25
227	Triciana	Keller	triciana@qt-power.net	0511/1466541	01590/32227168	2025-05-27 13:14:32	Frau	30159	Hannover	Köbelingerstr.	2
228	Leanca	Werner	leanca.werner@comm-prefix.de	08637/8151053	0177/75062816	2025-05-26 05:28:48	Frau	84494	Neumarkt-Sankt Veit	Johann-Strauß-Str.	25
229	Clara	Groß	clara@zo-texit.de	038462/9497236	01520/40007817	2025-05-14 01:03:33	NaN	18246	Jabelitz	Dorfstr.	42
230	Natalie	Hölzer	personal@comm-prefix.de	02961/4365842	0172/52784276	2025-05-07 10:45:56	Frau	59929	Brilon	Am Poppenberg	11
231	Thomke	Köhl	khl@technikzq.info	07153/9194939	01590/61990569	2025-07-03 02:34:14	Frau	73207	Plochingen	Gablenberg	2
232	Bo	Rothenberg	personal@company.com	02452/1110231	01590/58526444	2025-07-11 10:51:52	Frau	52525	Heinsberg	Auf dem Pfädchen	5
233	Fabian	Werner	f.werner@extend.net	04242/440640	01590/76192739	2025-06-07 05:19:31	NaN	28857	Syke	Zum Kolk	31
234	Götz	Geier	logistik@zo-texit.de	04480/4967767	0177/91114625	2025-07-02 10:29:34	Herr	26939	Ovelgönne	Winterbahn	17
235	Reingard	Leverenz	r.leverenz@zrp-communications.de	NaN	01577/93510913	2025-07-20 11:53:38	Frau	46446	Emmerich am Rhein	Ginsterweg	19
236	Oryana	Kaufer	oryana.kaufer@t-pomline.de	02382/2498377	0178/55525200	2025-05-29 08:25:27	Frau	59227	Ahlen	Warendorfer Str.	37
237	Hilka	Biermann	personal@x-piros.de	07351/1269946	01578/52087025	2025-05-21 08:37:42	Frau	88437	Maselheim	Veilchenweg	13
238	Sabrina	Kaiser	sabrina.kaiser@company.de	05174/8801324	0179/57267171	2025-05-06 22:06:30	Frau	31246	Ilsede	An der Bundesstr.	11
239	Fawini	Koch	fawini@t-pomline.com	02056/5839771	01577/72082895	2025-05-25 11:07:50	NaN	42579	Heiligenhaus	Ahrweg	37
240	Reinhild	Wolf	r.wolf@web-t.de	06063/8279897	NaN	2025-05-01 22:58:24	Frau	64732	Bad König	Am Gänsbrunnen	39
241	Melanie	Schwarz	info@t-pomline.de	0201/5785595	01525/82737510	2025-05-09 14:54:49	NaN	45131	Essen	Brassertstr.	34
242	Daniel	Protz	daniel@comm-prefix.net	09704/9095618	01590/60435138	2025-06-01 10:44:30	Herr	97725	Elfershausen	Am Klingengraben	42
243	Anabell	Gehring	einkauf@web-t.net	038229/5359940	01570/97894585	2025-05-20 03:51:52	Frau	18334	Bad Sülze	Am Sportplatz	28
244	Petja	Schuchard	p.schuchard@blue-white.de	033456/7277234	0176/14076176	2025-07-01 15:16:09	NaN	16269	Bliesdorf	Waldweg	45
245	Napoleon	Saller	info@t-pomline.com	030/1027060	0179/47566672	2025-06-11 19:52:27	NaN	16341	Panketal	Bremer Str.	25
246	Melanie	Jager	einkauf@qt-power.de	07566/5017363	01577/64607755	2025-06-12 12:11:42	NaN	88260	Argenbühl	Alpgaustr.	9
247	Wiebe	Beutel	w.beutel@t-pomline.de	06198/6472410	01570/98571458	2025-07-23 06:46:02	Herr	65817	Eppstein	Ickstadtstr.	5
248	Beate	Tanzer	beate.tanzer@qt-power.de	04332/2641383	0172/78631892	2025-05-14 16:41:59	Frau	24797	Breiholz	Thorhof	41
249	Peter	Biermann	p.biermann@zo-texit.de	05201/5569402	0179/75516410	2025-06-18 20:13:55	Herr	33790	Halle (Westf.)	Buschweg	13
250	Richenza	Heinrichs	richenza@qt-power.de	07961/3158985	0178/56403814	2025-07-02 18:03:00	Frau	73479	Ellwangen (Jagst)	Wilhelm-Maybach-Str.	29
251	Gunde	Siebert	NaN	06436/7030104	0176/53400510	2025-05-08 08:31:45	Frau	65599	Dornburg	Irmgardishof	34
252	Bilhilde	Krause	bilhilde@blue-white.de	038780/866630	0179/77708188	2025-05-24 10:24:41	Frau	19357	Karstädt	Am Dorfplatz	14
253	Efe	Fischer	efe.fischer@company.com	06142/7245618	0176/87132643	2025-07-07 21:08:04	NaN	65479	Raunheim	Rabenweg	29
254	Vitus	Schmidt	personal@no-addr.com	02682/3840283	01578/66621957	2025-07-05 00:18:00	Herr	57539	Fürthen	Waldstr.	26
255	Oswin	Spitznogle	info@company.info	09465/1360388	NaN	2025-06-08 01:11:00	Herr	92445	Neukirchen-Balbini	Haselhof	4
256	Mamu	Esser	marketting@blue-white.biz	NaN	NaN	2025-05-15 12:49:00	NaN	57518	Betzdorf	Hähnerweg	28
257	Theodrada	Geier	theodrada@t-pomline.de	06033/1931866	0162/65419702	2025-05-29 07:16:00	Frau	35510	Butzbach	Stautzertstr.	42
258	Wyneken	Schneider	info@zo-texit.de	04205/5026956	01516/20202355	2025-06-03 04:02:00	NaN	28870	Ottersberg	Achtern Hoff	45
259	Sancia	Kappel	NaN	02274/3418421	01516/33824616	2025-06-23 03:50:00	NaN	50189	Elsdorf	Haus Etzweiler	16
260	Hildegrim	Wendell	logistik@x-piros.de	09335/9643561	01570/60922421	2025-05-07 18:34:00	Herr	97255	Sonderhofen	Am Hundsberg	1
261	Neadelia	Baumgärtner	personal@blue-white.info	03681/1386137	0176/43052909	2025-07-21 20:30:00	NaN	98528	Suhl	Brunnenstr.	1
262	Marzella	Rothbauer	m.rothbauer@zrp-communications.de	033609/1494659	01523/38308524	2025-06-20 12:57:00	Frau	15295	Groß Lindow	Birkenweg	38
263	Dietlana	Schulte	info@qt-power.info	039601/668188	0176/82676662	2025-06-07 01:58:00	Frau	17039	Wulkenzin	Quittenweg	36
264	Simon	Beltz	simon@x-piros.net	06241/1308400	NaN	2025-05-14 19:07:00	Herr	67547	Worms	Am Alten Schlachthof	41
265	Lutwin	Brantley	lutwin@blue-white.de	02865/5753955	01573/68985139	2025-05-17 05:47:00	Herr	46348	Raesfeld	Kettelerstr.	11
266	Florian	Kuhn	florian@x-piros.de	05931/837151	NaN	2025-06-30 01:55:00	Herr	49716	Meppen	Püntkers Patt	40
267	Peer	Leitzke	peer.leitzke@company.net	08341/7779990	NaN	2025-05-26 19:16:00	Herr	87600	Kaufbeuren	Herbststr.	28
268	Doerk	Scheer	scheer@qt-power.net	09198/9126652	0176/20414602	2025-07-19 03:15:00	NaN	91332	Heiligenstadt i.OFr.	Brunn	8
269	Dejna	Bauer	d.bauer@t-pomline.de	08368/2917956	0174/75463917	2025-07-13 20:43:00	NaN	87642	Halblech	Allgäuer Str.	19
270	Baldo	Hölzer	NaN	06425/1762264	01520/40430813	2025-07-11 09:59:00	Herr	35282	Rauschenberg	Heimbacher Weg	19
271	Nastya	Moser	moser@technikzq.de	05421/2998013	0173/53747835	2025-05-18 04:22:00	NaN	49201	Dissen am Teutoburger Wald	Akazienweg	31
272	Crishan	Bauer	c.bauer@web-t.de	02682/9353955	01520/30659313	2025-05-13 19:19:00	Herr	57539	Fürthen	Im Sieggarten	14
273	Tillman	Schulte	schulte@extend.de	06251/5496753	01573/94965374	2025-05-27 21:31:00	NaN	64653	Lorsch	Friedhofstr.	16
274	Finnity	Kranz	NaN	09144/7766936	01525/80183786	2025-05-21 01:22:00	Frau	91785	Pleinfeld	Sandstr.	6
275	Traudhilde	Groß	info@extend.de	05731/6577217	01523/58403241	2025-05-07 06:54:00	Frau	32549	Bad Oeynhausen	Grünlandweg	21
276	Lanielle	Horn	einkauf@zo-texit.de	NaN	01578/80389115	2025-05-19 11:08:00	Frau	21244	Buchholz in der Nordheide	Tulpenweg	25
277	Triciana	Keller	triciana@qt-power.net	0511/1466541	01590/32227168	2025-05-27 13:14:00	Frau	30159	Hannover	Köbelingerstr.	2
278	Leanca	Werner	leanca.werner@comm-prefix.de	08637/8151053	0177/75062816	2025-05-26 05:28:00	Frau	84494	Neumarkt-Sankt Veit	Johann-Strauß-Str.	25
279	Clara	Groß	clara@zo-texit.de	038462/9497236	01520/40007817	2025-05-14 01:03:00	NaN	18246	Jabelitz	Dorfstr.	42
280	Natalie	Hölzer	personal@comm-prefix.de	02961/4365842	0172/52784276	2025-05-07 10:45:00	Frau	59929	Brilon	Am Poppenberg	11
281	Thomke	Köhl	khl@technikzq.info	07153/9194939	01590/61990569	2025-07-03 02:34:00	Frau	73207	Plochingen	Gablenberg	2
282	Bo	Rothenberg	personal@company.com	02452/1110231	01590/58526444	2025-07-11 10:51:00	Frau	52525	Heinsberg	Auf dem Pfädchen	5
283	Fabian	Werner	f.werner@extend.net	04242/440640	01590/76192739	2025-06-07 05:19:00	NaN	28857	Syke	Zum Kolk	31
284	Götz	Geier	logistik@zo-texit.de	04480/4967767	0177/91114625	2025-07-02 10:29:00	Herr	26939	Ovelgönne	Winterbahn	17
285	Reingard	Leverenz	r.leverenz@zrp-communications.de	NaN	01577/93510913	2025-07-20 11:53:00	Frau	46446	Emmerich am Rhein	Ginsterweg	19
286	Oryana	Kaufer	oryana.kaufer@t-pomline.de	02382/2498377	0178/55525200	2025-05-29 08:25:00	Frau	59227	Ahlen	Warendorfer Str.	37
287	Hilka	Biermann	personal@x-piros.de	07351/1269946	01578/52087025	2025-05-21 08:37:00	Frau	88437	Maselheim	Veilchenweg	13
288	Sabrina	Kaiser	sabrina.kaiser@company.de	05174/8801324	0179/57267171	2025-05-06 22:06:00	Frau	31246	Ilsede	An der Bundesstr.	11
289	Fawini	Koch	fawini@t-pomline.com	02056/5839771	01577/72082895	2025-05-25 11:07:00	NaN	42579	Heiligenhaus	Ahrweg	37
290	Reinhild	Wolf	r.wolf@web-t.de	06063/8279897	NaN	2025-05-01 22:58:00	Frau	64732	Bad König	Am Gänsbrunnen	39
291	Melanie	Schwarz	info@t-pomline.de	0201/5785595	01525/82737510	2025-05-09 14:54:00	NaN	45131	Essen	Brassertstr.	34
292	Daniel	Protz	daniel@comm-prefix.net	09704/9095618	01590/60435138	2025-06-01 10:44:00	Herr	97725	Elfershausen	Am Klingengraben	42
293	Anabell	Gehring	einkauf@web-t.net	038229/5359940	01570/97894585	2025-05-20 03:51:00	Frau	18334	Bad Sülze	Am Sportplatz	28
294	Petja	Schuchard	p.schuchard@blue-white.de	033456/7277234	0176/14076176	2025-07-01 15:16:00	NaN	16269	Bliesdorf	Waldweg	45
295	Napoleon	Saller	info@t-pomline.com	030/1027060	0179/47566672	2025-06-11 19:52:00	NaN	16341	Panketal	Bremer Str.	25
296	Melanie	Jager	einkauf@qt-power.de	07566/5017363	01577/64607755	2025-06-12 12:11:00	NaN	88260	Argenbühl	Alpgaustr.	9
297	Wiebe	Beutel	w.beutel@t-pomline.de	06198/6472410	01570/98571458	2025-07-23 06:46:00	Herr	65817	Eppstein	Ickstadtstr.	5
298	Beate	Tanzer	beate.tanzer@qt-power.de	04332/2641383	0172/78631892	2025-05-14 16:41:00	Frau	24797	Breiholz	Thorhof	41
299	Peter	Biermann	p.biermann@zo-texit.de	05201/5569402	0179/75516410	2025-06-18 20:13:00	Herr	33790	Halle (Westf.)	Buschweg	13
300	Richenza	Heinrichs	richenza@qt-power.de	07961/3158985	0178/56403814	2025-07-02 18:02:00	Frau	73479	Ellwangen (Jagst)	Wilhelm-Maybach-Str.	29
301	Gunde	Siebert	NaN	06436/7030104	0176/53400510	2025-05-08 08:31:00	Frau	65599	Dornburg	Irmgardishof	34
302	Bilhilde	Krause	bilhilde@blue-white.de	038780/866630	0179/77708188	2025-05-24 10:24:00	Frau	19357	Karstädt	Am Dorfplatz	14
303	Efe	Fischer	efe.fischer@company.com	06142/7245618	0176/87132643	2025-07-07 21:08:00	NaN	65479	Raunheim	Rabenweg	29
304	Vitus	Schmidt	personal@no-addr.com	02682/3840283	01578/66621957	2025-07-05 00:18:00	Herr	57539	Fürthen	Waldstr.	26
305	Oswin	Spitznogle	info@company.info	09465/1360388	NaN	2025-06-08 01:11:00	Herr	92445	Neukirchen-Balbini	Haselhof	4
306	Mamu	Esser	marketting@blue-white.biz	NaN	NaN	2025-05-15 12:49:00	NaN	57518	Betzdorf	Hähnerweg	28
307	Theodrada	Geier	theodrada@t-pomline.de	06033/1931866	0162/65419702	2025-05-29 07:16:00	Frau	35510	Butzbach	Stautzertstr.	42
308	Wyneken	Schneider	info@zo-texit.de	04205/5026956	01516/20202355	2025-06-03 04:02:00	NaN	28870	Ottersberg	Achtern Hoff	45
309	Sancia	Kappel	NaN	02274/3418421	01516/33824616	2025-06-23 03:50:00	NaN	50189	Elsdorf	Haus Etzweiler	16
310	Hildegrim	Wendell	logistik@x-piros.de	09335/9643561	01570/60922421	2025-05-07 18:34:00	Herr	97255	Sonderhofen	Am Hundsberg	1
311	Neadelia	Baumgärtner	personal@blue-white.info	03681/1386137	0176/43052909	2025-07-21 20:30:00	NaN	98528	Suhl	Brunnenstr.	1
312	Marzella	Rothbauer	m.rothbauer@zrp-communications.de	033609/1494659	01523/38308524	2025-06-20 12:57:00	Frau	15295	Groß Lindow	Birkenweg	38
313	Dietlana	Schulte	info@qt-power.info	039601/668188	0176/82676662	2025-06-07 01:58:00	Frau	17039	Wulkenzin	Quittenweg	36
314	Simon	Beltz	simon@x-piros.net	06241/1308400	NaN	2025-05-14 19:07:00	Herr	67547	Worms	Am Alten Schlachthof	41
315	Lutwin	Brantley	lutwin@blue-white.de	02865/5753955	01573/68985139	2025-05-17 05:47:00	Herr	46348	Raesfeld	Kettelerstr.	11
316	Florian	Kuhn	florian@x-piros.de	05931/837151	NaN	2025-06-30 01:55:00	Herr	49716	Meppen	Püntkers Patt	40
317	Peer	Leitzke	peer.leitzke@company.net	08341/7779990	NaN	2025-05-26 19:16:00	Herr	87600	Kaufbeuren	Herbststr.	28
318	Doerk	Scheer	scheer@qt-power.net	09198/9126652	0176/20414602	2025-07-19 03:15:00	NaN	91332	Heiligenstadt i.OFr.	Brunn	8
319	Dejna	Bauer	d.bauer@t-pomline.de	08368/2917956	0174/75463917	2025-07-13 20:43:00	NaN	87642	Halblech	Allgäuer Str.	19
320	Baldo	Hölzer	NaN	06425/1762264	01520/40430813	2025-07-11 09:59:00	Herr	35282	Rauschenberg	Heimbacher Weg	19
321	Nastya	Moser	moser@technikzq.de	05421/2998013	0173/53747835	2025-05-18 04:22:00	NaN	49201	Dissen am Teutoburger Wald	Akazienweg	31
322	Crishan	Bauer	c.bauer@web-t.de	02682/9353955	01520/30659313	2025-05-13 19:19:00	Herr	57539	Fürthen	Im Sieggarten	14
323	Tillman	Schulte	schulte@extend.de	06251/5496753	01573/94965374	2025-05-27 21:31:00	NaN	64653	Lorsch	Friedhofstr.	16
324	Finnity	Kranz	NaN	09144/7766936	01525/80183786	2025-05-21 01:22:00	Frau	91785	Pleinfeld	Sandstr.	6
325	Traudhilde	Groß	info@extend.de	05731/6577217	01523/58403241	2025-05-07 06:54:00	Frau	32549	Bad Oeynhausen	Grünlandweg	21
326	Lanielle	Horn	einkauf@zo-texit.de	NaN	01578/80389115	2025-05-19 11:08:00	Frau	21244	Buchholz in der Nordheide	Tulpenweg	25
327	Triciana	Keller	triciana@qt-power.net	0511/1466541	01590/32227168	2025-05-27 13:14:00	Frau	30159	Hannover	Köbelingerstr.	2
328	Leanca	Werner	leanca.werner@comm-prefix.de	08637/8151053	0177/75062816	2025-05-26 05:28:00	Frau	84494	Neumarkt-Sankt Veit	Johann-Strauß-Str.	25
329	Clara	Groß	clara@zo-texit.de	038462/9497236	01520/40007817	2025-05-14 01:03:00	NaN	18246	Jabelitz	Dorfstr.	42
330	Natalie	Hölzer	personal@comm-prefix.de	02961/4365842	0172/52784276	2025-05-07 10:45:00	Frau	59929	Brilon	Am Poppenberg	11
331	Thomke	Köhl	khl@technikzq.info	07153/9194939	01590/61990569	2025-07-03 02:34:00	Frau	73207	Plochingen	Gablenberg	2
332	Bo	Rothenberg	personal@company.com	02452/1110231	01590/58526444	2025-07-11 10:51:00	Frau	52525	Heinsberg	Auf dem Pfädchen	5
333	Fabian	Werner	f.werner@extend.net	04242/440640	01590/76192739	2025-06-07 05:19:00	NaN	28857	Syke	Zum Kolk	31
334	Götz	Geier	logistik@zo-texit.de	04480/4967767	0177/91114625	2025-07-02 10:29:00	Herr	26939	Ovelgönne	Winterbahn	17
335	Reingard	Leverenz	r.leverenz@zrp-communications.de	NaN	01577/93510913	2025-07-20 11:53:00	Frau	46446	Emmerich am Rhein	Ginsterweg	19
336	Oryana	Kaufer	oryana.kaufer@t-pomline.de	02382/2498377	0178/55525200	2025-05-29 08:25:00	Frau	59227	Ahlen	Warendorfer Str.	37
337	Hilka	Biermann	personal@x-piros.de	07351/1269946	01578/52087025	2025-05-21 08:37:00	Frau	88437	Maselheim	Veilchenweg	13
338	Sabrina	Kaiser	sabrina.kaiser@company.de	05174/8801324	0179/57267171	2025-05-06 22:06:00	Frau	31246	Ilsede	An der Bundesstr.	11
339	Fawini	Koch	fawini@t-pomline.com	02056/5839771	01577/72082895	2025-05-25 11:07:00	NaN	42579	Heiligenhaus	Ahrweg	37
340	Reinhild	Wolf	r.wolf@web-t.de	06063/8279897	NaN	2025-05-01 22:58:00	Frau	64732	Bad König	Am Gänsbrunnen	39
341	Melanie	Schwarz	info@t-pomline.de	0201/5785595	01525/82737510	2025-05-09 14:54:00	NaN	45131	Essen	Brassertstr.	34
342	Daniel	Protz	daniel@comm-prefix.net	09704/9095618	01590/60435138	2025-06-01 10:44:00	Herr	97725	Elfershausen	Am Klingengraben	42
343	Anabell	Gehring	einkauf@web-t.net	038229/5359940	01570/97894585	2025-05-20 03:51:00	Frau	18334	Bad Sülze	Am Sportplatz	28
344	Petja	Schuchard	p.schuchard@blue-white.de	033456/7277234	0176/14076176	2025-07-01 15:16:00	NaN	16269	Bliesdorf	Waldweg	45
345	Napoleon	Saller	info@t-pomline.com	030/1027060	0179/47566672	2025-06-11 19:52:00	NaN	16341	Panketal	Bremer Str.	25
346	Melanie	Jager	einkauf@qt-power.de	07566/5017363	01577/64607755	2025-06-12 12:11:00	NaN	88260	Argenbühl	Alpgaustr.	9
347	Wiebe	Beutel	w.beutel@t-pomline.de	06198/6472410	01570/98571458	2025-07-23 06:46:00	Herr	65817	Eppstein	Ickstadtstr.	5
348	Beate	Tanzer	beate.tanzer@qt-power.de	04332/2641383	0172/78631892	2025-05-14 16:41:00	Frau	24797	Breiholz	Thorhof	41
349	Peter	Biermann	p.biermann@zo-texit.de	05201/5569402	0179/75516410	2025-06-18 20:13:00	Herr	33790	Halle (Westf.)	Buschweg	13
350	Richenza	Heinrichs	richenza@qt-power.de	07961/3158985	0178/56403814	2025-07-02 18:02:00	Frau	73479	Ellwangen (Jagst)	Wilhelm-Maybach-Str.	29
351	Gunde	Siebert	NaN	06436/7030104	0176/53400510	2025-05-08 08:31:00	Frau	65599	Dornburg	Irmgardishof	34
352	Bilhilde	Krause	bilhilde@blue-white.de	038780/866630	0179/77708188	2025-05-24 10:24:00	Frau	19357	Karstädt	Am Dorfplatz	14
353	Efe	Fischer	efe.fischer@company.com	06142/7245618	0176/87132643	2025-07-07 21:08:00	NaN	65479	Raunheim	Rabenweg	29
354	Vitus	Schmidt	personal@no-addr.com	02682/3840283	01578/66621957	2025-07-05 00:18:00	Herr	57539	Fürthen	Waldstr.	26
355	Oswin	Spitznogle	info@company.info	09465/1360388	NaN	2025-06-08 01:11:00	Herr	92445	Neukirchen-Balbini	Haselhof	4
356	Mamu	Esser	marketting@blue-white.biz	NaN	NaN	2025-05-15 12:49:00	NaN	57518	Betzdorf	Hähnerweg	28
357	Theodrada	Geier	theodrada@t-pomline.de	06033/1931866	0162/65419702	2025-05-29 07:16:00	Frau	35510	Butzbach	Stautzertstr.	42
358	Wyneken	Schneider	info@zo-texit.de	04205/5026956	01516/20202355	2025-06-03 04:02:00	NaN	28870	Ottersberg	Achtern Hoff	45
359	Sancia	Kappel	NaN	02274/3418421	01516/33824616	2025-06-23 03:50:00	NaN	50189	Elsdorf	Haus Etzweiler	16
360	Hildegrim	Wendell	logistik@x-piros.de	09335/9643561	01570/60922421	2025-05-07 18:34:00	Herr	97255	Sonderhofen	Am Hundsberg	1
361	Neadelia	Baumgärtner	personal@blue-white.info	03681/1386137	0176/43052909	2025-07-21 20:30:00	NaN	98528	Suhl	Brunnenstr.	1
362	Marzella	Rothbauer	m.rothbauer@zrp-communications.de	033609/1494659	01523/38308524	2025-06-20 12:57:00	Frau	15295	Groß Lindow	Birkenweg	38
363	Dietlana	Schulte	info@qt-power.info	039601/668188	0176/82676662	2025-06-07 01:58:00	Frau	17039	Wulkenzin	Quittenweg	36
364	Simon	Beltz	simon@x-piros.net	06241/1308400	NaN	2025-05-14 19:07:00	Herr	67547	Worms	Am Alten Schlachthof	41
365	Lutwin	Brantley	lutwin@blue-white.de	02865/5753955	01573/68985139	2025-05-17 05:47:00	Herr	46348	Raesfeld	Kettelerstr.	11
366	Florian	Kuhn	florian@x-piros.de	05931/837151	NaN	2025-06-30 01:55:00	Herr	49716	Meppen	Püntkers Patt	40
367	Peer	Leitzke	peer.leitzke@company.net	08341/7779990	NaN	2025-05-26 19:16:00	Herr	87600	Kaufbeuren	Herbststr.	28
368	Doerk	Scheer	scheer@qt-power.net	09198/9126652	0176/20414602	2025-07-19 03:15:00	NaN	91332	Heiligenstadt i.OFr.	Brunn	8
369	Dejna	Bauer	d.bauer@t-pomline.de	08368/2917956	0174/75463917	2025-07-13 20:43:00	NaN	87642	Halblech	Allgäuer Str.	19
370	Baldo	Hölzer	NaN	06425/1762264	01520/40430813	2025-07-11 09:59:00	Herr	35282	Rauschenberg	Heimbacher Weg	19
371	Nastya	Moser	moser@technikzq.de	05421/2998013	0173/53747835	2025-05-18 04:22:00	NaN	49201	Dissen am Teutoburger Wald	Akazienweg	31
372	Crishan	Bauer	c.bauer@web-t.de	02682/9353955	01520/30659313	2025-05-13 19:19:00	Herr	57539	Fürthen	Im Sieggarten	14
373	Tillman	Schulte	schulte@extend.de	06251/5496753	01573/94965374	2025-05-27 21:31:00	NaN	64653	Lorsch	Friedhofstr.	16
374	Finnity	Kranz	NaN	09144/7766936	01525/80183786	2025-05-21 01:22:00	Frau	91785	Pleinfeld	Sandstr.	6
375	Traudhilde	Groß	info@extend.de	05731/6577217	01523/58403241	2025-05-07 06:54:00	Frau	32549	Bad Oeynhausen	Grünlandweg	21
376	Lanielle	Horn	einkauf@zo-texit.de	NaN	01578/80389115	2025-05-19 11:08:00	Frau	21244	Buchholz in der Nordheide	Tulpenweg	25
377	Triciana	Keller	triciana@qt-power.net	0511/1466541	01590/32227168	2025-05-27 13:14:00	Frau	30159	Hannover	Köbelingerstr.	2
378	Leanca	Werner	leanca.werner@comm-prefix.de	08637/8151053	0177/75062816	2025-05-26 05:28:00	Frau	84494	Neumarkt-Sankt Veit	Johann-Strauß-Str.	25
379	Clara	Groß	clara@zo-texit.de	038462/9497236	01520/40007817	2025-05-14 01:03:00	NaN	18246	Jabelitz	Dorfstr.	42
380	Natalie	Hölzer	personal@comm-prefix.de	02961/4365842	0172/52784276	2025-05-07 10:45:00	Frau	59929	Brilon	Am Poppenberg	11
381	Thomke	Köhl	khl@technikzq.info	07153/9194939	01590/61990569	2025-07-03 02:34:00	Frau	73207	Plochingen	Gablenberg	2
382	Bo	Rothenberg	personal@company.com	02452/1110231	01590/58526444	2025-07-11 10:51:00	Frau	52525	Heinsberg	Auf dem Pfädchen	5
383	Fabian	Werner	f.werner@extend.net	04242/440640	01590/76192739	2025-06-07 05:19:00	NaN	28857	Syke	Zum Kolk	31
384	Götz	Geier	logistik@zo-texit.de	04480/4967767	0177/91114625	2025-07-02 10:29:00	Herr	26939	Ovelgönne	Winterbahn	17
385	Reingard	Leverenz	r.leverenz@zrp-communications.de	NaN	01577/93510913	2025-07-20 11:53:00	Frau	46446	Emmerich am Rhein	Ginsterweg	19
386	Oryana	Kaufer	oryana.kaufer@t-pomline.de	02382/2498377	0178/55525200	2025-05-29 08:25:00	Frau	59227	Ahlen	Warendorfer Str.	37
387	Hilka	Biermann	personal@x-piros.de	07351/1269946	01578/52087025	2025-05-21 08:37:00	Frau	88437	Maselheim	Veilchenweg	13
388	Sabrina	Kaiser	sabrina.kaiser@company.de	05174/8801324	0179/57267171	2025-05-06 22:06:00	Frau	31246	Ilsede	An der Bundesstr.	11
389	Fawini	Koch	fawini@t-pomline.com	02056/5839771	01577/72082895	2025-05-25 11:07:00	NaN	42579	Heiligenhaus	Ahrweg	37
390	Reinhild	Wolf	r.wolf@web-t.de	06063/8279897	NaN	2025-05-01 22:58:00	Frau	64732	Bad König	Am Gänsbrunnen	39
391	Melanie	Schwarz	info@t-pomline.de	0201/5785595	01525/82737510	2025-05-09 14:54:00	NaN	45131	Essen	Brassertstr.	34
392	Daniel	Protz	daniel@comm-prefix.net	09704/9095618	01590/60435138	2025-06-01 10:44:00	Herr	97725	Elfershausen	Am Klingengraben	42
393	Anabell	Gehring	einkauf@web-t.net	038229/5359940	01570/97894585	2025-05-20 03:51:00	Frau	18334	Bad Sülze	Am Sportplatz	28
394	Petja	Schuchard	p.schuchard@blue-white.de	033456/7277234	0176/14076176	2025-07-01 15:16:00	NaN	16269	Bliesdorf	Waldweg	45
395	Napoleon	Saller	info@t-pomline.com	030/1027060	0179/47566672	2025-06-11 19:52:00	NaN	16341	Panketal	Bremer Str.	25
396	Melanie	Jager	einkauf@qt-power.de	07566/5017363	01577/64607755	2025-06-12 12:11:00	NaN	88260	Argenbühl	Alpgaustr.	9
397	Wiebe	Beutel	w.beutel@t-pomline.de	06198/6472410	01570/98571458	2025-07-23 06:46:00	Herr	65817	Eppstein	Ickstadtstr.	5
398	Beate	Tanzer	beate.tanzer@qt-power.de	04332/2641383	0172/78631892	2025-05-14 16:41:00	Frau	24797	Breiholz	Thorhof	41
399	Peter	Biermann	p.biermann@zo-texit.de	05201/5569402	0179/75516410	2025-06-18 20:13:00	Herr	33790	Halle (Westf.)	Buschweg	13
400	Richenza	Heinrichs	richenza@qt-power.de	07961/3158985	0178/56403814	2025-07-02 18:02:00	Frau	73479	Ellwangen (Jagst)	Wilhelm-Maybach-Str.	29
401	Gunde	Siebert	NaN	06436/7030104	0176/53400510	2025-05-08 08:31:00	Frau	65599	Dornburg	Irmgardishof	34
402	Bilhilde	Krause	bilhilde@blue-white.de	038780/866630	0179/77708188	2025-05-24 10:24:00	Frau	19357	Karstädt	Am Dorfplatz	14
403	Efe	Fischer	efe.fischer@company.com	06142/7245618	0176/87132643	2025-07-07 21:08:00	NaN	65479	Raunheim	Rabenweg	29
404	Vitus	Schmidt	personal@no-addr.com	02682/3840283	01578/66621957	2025-07-05 00:18:00	Herr	57539	Fürthen	Waldstr.	26
405	Oswin	Spitznogle	info@company.info	09465/1360388	NaN	2025-06-08 01:11:00	Herr	92445	Neukirchen-Balbini	Haselhof	4
406	Mamu	Esser	marketting@blue-white.biz	NaN	NaN	2025-05-15 12:49:00	NaN	57518	Betzdorf	Hähnerweg	28
407	Theodrada	Geier	theodrada@t-pomline.de	06033/1931866	0162/65419702	2025-05-29 07:16:00	Frau	35510	Butzbach	Stautzertstr.	42
408	Wyneken	Schneider	info@zo-texit.de	04205/5026956	01516/20202355	2025-06-03 04:02:00	NaN	28870	Ottersberg	Achtern Hoff	45
409	Sancia	Kappel	NaN	02274/3418421	01516/33824616	2025-06-23 03:50:00	NaN	50189	Elsdorf	Haus Etzweiler	16
410	Hildegrim	Wendell	logistik@x-piros.de	09335/9643561	01570/60922421	2025-05-07 18:34:00	Herr	97255	Sonderhofen	Am Hundsberg	1
411	Neadelia	Baumgärtner	personal@blue-white.info	03681/1386137	0176/43052909	2025-07-21 20:30:00	NaN	98528	Suhl	Brunnenstr.	1
412	Marzella	Rothbauer	m.rothbauer@zrp-communications.de	033609/1494659	01523/38308524	2025-06-20 12:57:00	Frau	15295	Groß Lindow	Birkenweg	38
413	Dietlana	Schulte	info@qt-power.info	039601/668188	0176/82676662	2025-06-07 01:58:00	Frau	17039	Wulkenzin	Quittenweg	36
414	Simon	Beltz	simon@x-piros.net	06241/1308400	NaN	2025-05-14 19:07:00	Herr	67547	Worms	Am Alten Schlachthof	41
415	Lutwin	Brantley	lutwin@blue-white.de	02865/5753955	01573/68985139	2025-05-17 05:47:00	Herr	46348	Raesfeld	Kettelerstr.	11
416	Florian	Kuhn	florian@x-piros.de	05931/837151	NaN	2025-06-30 01:55:00	Herr	49716	Meppen	Püntkers Patt	40
417	Peer	Leitzke	peer.leitzke@company.net	08341/7779990	NaN	2025-05-26 19:16:00	Herr	87600	Kaufbeuren	Herbststr.	28
418	Doerk	Scheer	scheer@qt-power.net	09198/9126652	0176/20414602	2025-07-19 03:15:00	NaN	91332	Heiligenstadt i.OFr.	Brunn	8
419	Dejna	Bauer	d.bauer@t-pomline.de	08368/2917956	0174/75463917	2025-07-13 20:43:00	NaN	87642	Halblech	Allgäuer Str.	19
420	Baldo	Hölzer	NaN	06425/1762264	01520/40430813	2025-07-11 09:59:00	Herr	35282	Rauschenberg	Heimbacher Weg	19
421	Nastya	Moser	moser@technikzq.de	05421/2998013	0173/53747835	2025-05-18 04:22:00	NaN	49201	Dissen am Teutoburger Wald	Akazienweg	31
422	Crishan	Bauer	c.bauer@web-t.de	02682/9353955	01520/30659313	2025-05-13 19:19:00	Herr	57539	Fürthen	Im Sieggarten	14
423	Tillman	Schulte	schulte@extend.de	06251/5496753	01573/94965374	2025-05-27 21:31:00	NaN	64653	Lorsch	Friedhofstr.	16
424	Finnity	Kranz	NaN	09144/7766936	01525/80183786	2025-05-21 01:22:00	Frau	91785	Pleinfeld	Sandstr.	6
425	Traudhilde	Groß	info@extend.de	05731/6577217	01523/58403241	2025-05-07 06:54:00	Frau	32549	Bad Oeynhausen	Grünlandweg	21
426	Lanielle	Horn	einkauf@zo-texit.de	NaN	01578/80389115	2025-05-19 11:08:00	Frau	21244	Buchholz in der Nordheide	Tulpenweg	25
427	Triciana	Keller	triciana@qt-power.net	0511/1466541	01590/32227168	2025-05-27 13:14:00	Frau	30159	Hannover	Köbelingerstr.	2
428	Leanca	Werner	leanca.werner@comm-prefix.de	08637/8151053	0177/75062816	2025-05-26 05:28:00	Frau	84494	Neumarkt-Sankt Veit	Johann-Strauß-Str.	25
429	Clara	Groß	clara@zo-texit.de	038462/9497236	01520/40007817	2025-05-14 01:03:00	NaN	18246	Jabelitz	Dorfstr.	42
430	Natalie	Hölzer	personal@comm-prefix.de	02961/4365842	0172/52784276	2025-05-07 10:45:00	Frau	59929	Brilon	Am Poppenberg	11
431	Thomke	Köhl	khl@technikzq.info	07153/9194939	01590/61990569	2025-07-03 02:34:00	Frau	73207	Plochingen	Gablenberg	2
432	Bo	Rothenberg	personal@company.com	02452/1110231	01590/58526444	2025-07-11 10:51:00	Frau	52525	Heinsberg	Auf dem Pfädchen	5
433	Fabian	Werner	f.werner@extend.net	04242/440640	01590/76192739	2025-06-07 05:19:00	NaN	28857	Syke	Zum Kolk	31
434	Götz	Geier	logistik@zo-texit.de	04480/4967767	0177/91114625	2025-07-02 10:29:00	Herr	26939	Ovelgönne	Winterbahn	17
435	Reingard	Leverenz	r.leverenz@zrp-communications.de	NaN	01577/93510913	2025-07-20 11:53:00	Frau	46446	Emmerich am Rhein	Ginsterweg	19
436	Oryana	Kaufer	oryana.kaufer@t-pomline.de	02382/2498377	0178/55525200	2025-05-29 08:25:00	Frau	59227	Ahlen	Warendorfer Str.	37
437	Hilka	Biermann	personal@x-piros.de	07351/1269946	01578/52087025	2025-05-21 08:37:00	Frau	88437	Maselheim	Veilchenweg	13
438	Sabrina	Kaiser	sabrina.kaiser@company.de	05174/8801324	0179/57267171	2025-05-06 22:06:00	Frau	31246	Ilsede	An der Bundesstr.	11
439	Fawini	Koch	fawini@t-pomline.com	02056/5839771	01577/72082895	2025-05-25 11:07:00	NaN	42579	Heiligenhaus	Ahrweg	37
440	Reinhild	Wolf	r.wolf@web-t.de	06063/8279897	NaN	2025-05-01 22:58:00	Frau	64732	Bad König	Am Gänsbrunnen	39
441	Melanie	Schwarz	info@t-pomline.de	0201/5785595	01525/82737510	2025-05-09 14:54:00	NaN	45131	Essen	Brassertstr.	34
442	Daniel	Protz	daniel@comm-prefix.net	09704/9095618	01590/60435138	2025-06-01 10:44:00	Herr	97725	Elfershausen	Am Klingengraben	42
443	Anabell	Gehring	einkauf@web-t.net	038229/5359940	01570/97894585	2025-05-20 03:51:00	Frau	18334	Bad Sülze	Am Sportplatz	28
444	Petja	Schuchard	p.schuchard@blue-white.de	033456/7277234	0176/14076176	2025-07-01 15:16:00	NaN	16269	Bliesdorf	Waldweg	45
445	Napoleon	Saller	info@t-pomline.com	030/1027060	0179/47566672	2025-06-11 19:52:00	NaN	16341	Panketal	Bremer Str.	25
446	Melanie	Jager	einkauf@qt-power.de	07566/5017363	01577/64607755	2025-06-12 12:11:00	NaN	88260	Argenbühl	Alpgaustr.	9
447	Wiebe	Beutel	w.beutel@t-pomline.de	06198/6472410	01570/98571458	2025-07-23 06:46:00	Herr	65817	Eppstein	Ickstadtstr.	5
448	Beate	Tanzer	beate.tanzer@qt-power.de	04332/2641383	0172/78631892	2025-05-14 16:41:00	Frau	24797	Breiholz	Thorhof	41
449	Peter	Biermann	p.biermann@zo-texit.de	05201/5569402	0179/75516410	2025-06-18 20:13:00	Herr	33790	Halle (Westf.)	Buschweg	13
450	Richenza	Heinrichs	richenza@qt-power.de	07961/3158985	0178/56403814	2025-07-02 18:03:00	Frau	73479	Ellwangen (Jagst)	Wilhelm-Maybach-Str.	29
451	Gunde	Siebert	NaN	06436/7030104	0176/53400510	2025-05-08 08:31:00	Frau	65599	Dornburg	Irmgardishof	34
452	Bilhilde	Krause	bilhilde@blue-white.de	038780/866630	0179/77708188	2025-05-24 10:24:00	Frau	19357	Karstädt	Am Dorfplatz	14
453	Efe	Fischer	efe.fischer@company.com	06142/7245618	0176/87132643	2025-07-07 21:08:00	NaN	65479	Raunheim	Rabenweg	29
454	Vitus	Schmidt	personal@no-addr.com	02682/3840283	01578/66621957	2025-07-05 00:18:00	Herr	57539	Fürthen	Waldstr.	26
455	Oswin	Spitznogle	info@company.info	09465/1360388	NaN	2025-06-08 01:11:00	Herr	92445	Neukirchen-Balbini	Haselhof	4
456	Mamu	Esser	marketting@blue-white.biz	NaN	NaN	2025-05-15 12:49:00	NaN	57518	Betzdorf	Hähnerweg	28
457	Theodrada	Geier	theodrada@t-pomline.de	06033/1931866	0162/65419702	2025-05-29 07:16:00	Frau	35510	Butzbach	Stautzertstr.	42
458	Wyneken	Schneider	info@zo-texit.de	04205/5026956	01516/20202355	2025-06-03 04:02:00	NaN	28870	Ottersberg	Achtern Hoff	45
459	Sancia	Kappel	NaN	02274/3418421	01516/33824616	2025-06-23 03:50:00	NaN	50189	Elsdorf	Haus Etzweiler	16
460	Hildegrim	Wendell	logistik@x-piros.de	09335/9643561	01570/60922421	2025-05-07 18:34:00	Herr	97255	Sonderhofen	Am Hundsberg	1
461	Neadelia	Baumgärtner	personal@blue-white.info	03681/1386137	0176/43052909	2025-07-21 20:30:00	NaN	98528	Suhl	Brunnenstr.	1
462	Marzella	Rothbauer	m.rothbauer@zrp-communications.de	033609/1494659	01523/38308524	2025-06-20 12:57:00	Frau	15295	Groß Lindow	Birkenweg	38
463	Dietlana	Schulte	info@qt-power.info	039601/668188	0176/82676662	2025-06-07 01:58:00	Frau	17039	Wulkenzin	Quittenweg	36
464	Simon	Beltz	simon@x-piros.net	06241/1308400	NaN	2025-05-14 19:07:00	Herr	67547	Worms	Am Alten Schlachthof	41
465	Lutwin	Brantley	lutwin@blue-white.de	02865/5753955	01573/68985139	2025-05-17 05:47:00	Herr	46348	Raesfeld	Kettelerstr.	11
466	Florian	Kuhn	florian@x-piros.de	05931/837151	NaN	2025-06-30 01:55:00	Herr	49716	Meppen	Püntkers Patt	40
467	Peer	Leitzke	peer.leitzke@company.net	08341/7779990	NaN	2025-05-26 19:16:00	Herr	87600	Kaufbeuren	Herbststr.	28
468	Doerk	Scheer	scheer@qt-power.net	09198/9126652	0176/20414602	2025-07-19 03:15:00	NaN	91332	Heiligenstadt i.OFr.	Brunn	8
469	Dejna	Bauer	d.bauer@t-pomline.de	08368/2917956	0174/75463917	2025-07-13 20:43:00	NaN	87642	Halblech	Allgäuer Str.	19
470	Baldo	Hölzer	NaN	06425/1762264	01520/40430813	2025-07-11 09:59:00	Herr	35282	Rauschenberg	Heimbacher Weg	19
471	Nastya	Moser	moser@technikzq.de	05421/2998013	0173/53747835	2025-05-18 04:22:00	NaN	49201	Dissen am Teutoburger Wald	Akazienweg	31
472	Crishan	Bauer	c.bauer@web-t.de	02682/9353955	01520/30659313	2025-05-13 19:19:00	Herr	57539	Fürthen	Im Sieggarten	14
473	Tillman	Schulte	schulte@extend.de	06251/5496753	01573/94965374	2025-05-27 21:31:00	NaN	64653	Lorsch	Friedhofstr.	16
474	Finnity	Kranz	NaN	09144/7766936	01525/80183786	2025-05-21 01:22:00	Frau	91785	Pleinfeld	Sandstr.	6
475	Traudhilde	Groß	info@extend.de	05731/6577217	01523/58403241	2025-05-07 06:54:00	Frau	32549	Bad Oeynhausen	Grünlandweg	21
476	Lanielle	Horn	einkauf@zo-texit.de	NaN	01578/80389115	2025-05-19 11:08:00	Frau	21244	Buchholz in der Nordheide	Tulpenweg	25
477	Triciana	Keller	triciana@qt-power.net	0511/1466541	01590/32227168	2025-05-27 13:14:00	Frau	30159	Hannover	Köbelingerstr.	2
478	Leanca	Werner	leanca.werner@comm-prefix.de	08637/8151053	0177/75062816	2025-05-26 05:28:00	Frau	84494	Neumarkt-Sankt Veit	Johann-Strauß-Str.	25
479	Clara	Groß	clara@zo-texit.de	038462/9497236	01520/40007817	2025-05-14 01:03:00	NaN	18246	Jabelitz	Dorfstr.	42
480	Natalie	Hölzer	personal@comm-prefix.de	02961/4365842	0172/52784276	2025-05-07 10:45:00	Frau	59929	Brilon	Am Poppenberg	11
481	Thomke	Köhl	khl@technikzq.info	07153/9194939	01590/61990569	2025-07-03 02:34:00	Frau	73207	Plochingen	Gablenberg	2
482	Bo	Rothenberg	personal@company.com	02452/1110231	01590/58526444	2025-07-11 10:51:00	Frau	52525	Heinsberg	Auf dem Pfädchen	5
483	Fabian	Werner	f.werner@extend.net	04242/440640	01590/76192739	2025-06-07 05:19:00	NaN	28857	Syke	Zum Kolk	31
484	Götz	Geier	logistik@zo-texit.de	04480/4967767	0177/91114625	2025-07-02 10:29:00	Herr	26939	Ovelgönne	Winterbahn	17
485	Reingard	Leverenz	r.leverenz@zrp-communications.de	NaN	01577/93510913	2025-07-20 11:53:00	Frau	46446	Emmerich am Rhein	Ginsterweg	19
486	Oryana	Kaufer	oryana.kaufer@t-pomline.de	02382/2498377	0178/55525200	2025-05-29 08:25:00	Frau	59227	Ahlen	Warendorfer Str.	37
487	Hilka	Biermann	personal@x-piros.de	07351/1269946	01578/52087025	2025-05-21 08:37:00	Frau	88437	Maselheim	Veilchenweg	13
488	Sabrina	Kaiser	sabrina.kaiser@company.de	05174/8801324	0179/57267171	2025-05-06 22:06:00	Frau	31246	Ilsede	An der Bundesstr.	11
489	Fawini	Koch	fawini@t-pomline.com	02056/5839771	01577/72082895	2025-05-25 11:07:00	NaN	42579	Heiligenhaus	Ahrweg	37
490	Reinhild	Wolf	r.wolf@web-t.de	06063/8279897	NaN	2025-05-01 22:58:00	Frau	64732	Bad König	Am Gänsbrunnen	39
491	Melanie	Schwarz	info@t-pomline.de	0201/5785595	01525/82737510	2025-05-09 14:54:00	NaN	45131	Essen	Brassertstr.	34
492	Daniel	Protz	daniel@comm-prefix.net	09704/9095618	01590/60435138	2025-06-01 10:44:00	Herr	97725	Elfershausen	Am Klingengraben	42
493	Anabell	Gehring	einkauf@web-t.net	038229/5359940	01570/97894585	2025-05-20 03:51:00	Frau	18334	Bad Sülze	Am Sportplatz	28
494	Petja	Schuchard	p.schuchard@blue-white.de	033456/7277234	0176/14076176	2025-07-01 15:16:00	NaN	16269	Bliesdorf	Waldweg	45
495	Napoleon	Saller	info@t-pomline.com	030/1027060	0179/47566672	2025-06-11 19:52:00	NaN	16341	Panketal	Bremer Str.	25
496	Melanie	Jager	einkauf@qt-power.de	07566/5017363	01577/64607755	2025-06-12 12:11:00	NaN	88260	Argenbühl	Alpgaustr.	9
497	Wiebe	Beutel	w.beutel@t-pomline.de	06198/6472410	01570/98571458	2025-07-23 06:46:00	Herr	65817	Eppstein	Ickstadtstr.	5
498	Beate	Tanzer	beate.tanzer@qt-power.de	04332/2641383	0172/78631892	2025-05-14 16:41:00	Frau	24797	Breiholz	Thorhof	41
499	Peter	Biermann	p.biermann@zo-texit.de	05201/5569402	0179/75516410	2025-06-18 20:13:00	Herr	33790	Halle (Westf.)	Buschweg	13
500	Richenza	Heinrichs	richenza@qt-power.de	07961/3158985	0178/56403814	2025-07-02 18:03:00	Frau	73479	Ellwangen (Jagst)	Wilhelm-Maybach-Str.	29
501	Gunde	Siebert	NaN	06436/7030104	0176/53400510	2025-05-08 08:31:00	Frau	65599	Dornburg	Irmgardishof	34
502	Bilhilde	Krause	bilhilde@blue-white.de	038780/866630	0179/77708188	2025-05-24 10:24:00	Frau	19357	Karstädt	Am Dorfplatz	14
503	Efe	Fischer	efe.fischer@company.com	06142/7245618	0176/87132643	2025-07-07 21:08:00	NaN	65479	Raunheim	Rabenweg	29
\.


--
-- TOC entry 4931 (class 0 OID 17661)
-- Dependencies: 224
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (bestellartikel_id, bestell_id, produkt_id, bestellte_menge, einzellpreis) FROM stdin;
\.


--
-- TOC entry 4929 (class 0 OID 17654)
-- Dependencies: 222
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (bestell_id, customer_id, bestelldatum, status, gesamtbetrag_der_bestellung) FROM stdin;
\.


--
-- TOC entry 4933 (class 0 OID 17678)
-- Dependencies: 226
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (zahlungs_id, bestell_id, zahlungsdatum, betrag, zahlungsmethode) FROM stdin;
\.


--
-- TOC entry 4927 (class 0 OID 17626)
-- Dependencies: 220
-- Data for Name: produkte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produkte (produkt_id, name, produktbeschreibung, preis, lagerbestand, kategorie_id) FROM stdin;
\.


--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 217
-- Name: kunden_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kunden_customer_id_seq', 503, true);


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 223
-- Name: order_items_bestellartikel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_bestellartikel_id_seq', 1, false);


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_bestell_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_bestell_id_seq', 1, false);


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 225
-- Name: payments_zahlungs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_zahlungs_id_seq', 1, false);


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 219
-- Name: produkte_produkt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produkte_produkt_id_seq', 1, false);


--
-- TOC entry 4768 (class 2606 OID 17624)
-- Name: kunden kunden_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kunden
    ADD CONSTRAINT kunden_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4774 (class 2606 OID 17666)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (bestellartikel_id);


--
-- TOC entry 4772 (class 2606 OID 17659)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (bestell_id);


--
-- TOC entry 4776 (class 2606 OID 17683)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (zahlungs_id);


--
-- TOC entry 4770 (class 2606 OID 17631)
-- Name: produkte produkte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produkte
    ADD CONSTRAINT produkte_pkey PRIMARY KEY (produkt_id);


--
-- TOC entry 4777 (class 2606 OID 17667)
-- Name: order_items order_items_bestell_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_bestell_id_fkey FOREIGN KEY (bestell_id) REFERENCES public.orders(bestell_id) ON DELETE CASCADE;


--
-- TOC entry 4778 (class 2606 OID 17672)
-- Name: order_items order_items_produkt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_produkt_id_fkey FOREIGN KEY (produkt_id) REFERENCES public.produkte(produkt_id) ON DELETE RESTRICT;


-- Completed on 2025-07-29 13:15:28

--
-- PostgreSQL database dump complete
--
