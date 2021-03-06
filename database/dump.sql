--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

ALTER TABLE ONLY public."musicalTags" DROP CONSTRAINT "musicalTags_tagId_fkey";
ALTER TABLE ONLY public."musicalTags" DROP CONSTRAINT "musicalTags_musicalId_fkey";
ALTER TABLE ONLY public."musicalStyleSeeds" DROP CONSTRAINT "musicalStyleSeeds_userId_fkey";
ALTER TABLE ONLY public."musicalStyleSeeds" DROP CONSTRAINT "musicalStyleSeeds_musicalStyleId_fkey";
ALTER TABLE ONLY public."musicalStyleCategories" DROP CONSTRAINT "musicalStyleCategories_musicalStyleId_fkey";
ALTER TABLE ONLY public."musicalStyleCategories" DROP CONSTRAINT "musicalStyleCategories_musicalId_fkey";
ALTER TABLE ONLY public."musicalGenres" DROP CONSTRAINT "musicalGenres_musicalId_fkey";
ALTER TABLE ONLY public."musicalGenres" DROP CONSTRAINT "musicalGenres_genreId_fkey";
ALTER TABLE ONLY public."likedMusicals" DROP CONSTRAINT "likedMusicals_userId_fkey";
ALTER TABLE ONLY public."likedMusicals" DROP CONSTRAINT "likedMusicals_musicalId_fkey";
ALTER TABLE ONLY public."genreSeeds" DROP CONSTRAINT "genreSeeds_userId_fkey";
ALTER TABLE ONLY public."genreSeeds" DROP CONSTRAINT "genreSeeds_genreId_fkey";
ALTER TABLE ONLY public.collections DROP CONSTRAINT "collections_userId_fkey";
ALTER TABLE ONLY public."collectionItems" DROP CONSTRAINT "collectionItems_musicalId_fkey";
ALTER TABLE ONLY public."collectionItems" DROP CONSTRAINT "collectionItems_collectionId_fkey";
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
ALTER TABLE ONLY public.suggestions DROP CONSTRAINT suggestions_pkey;
ALTER TABLE ONLY public.musicals DROP CONSTRAINT musicals_pkey;
ALTER TABLE ONLY public."musicalStyles" DROP CONSTRAINT "musicalStyles_pkey";
ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
ALTER TABLE ONLY public.collections DROP CONSTRAINT collections_pkey;
ALTER TABLE public.users ALTER COLUMN "userId" DROP DEFAULT;
ALTER TABLE public.tags ALTER COLUMN "tagId" DROP DEFAULT;
ALTER TABLE public.suggestions ALTER COLUMN "suggestionId" DROP DEFAULT;
ALTER TABLE public.musicals ALTER COLUMN "musicalId" DROP DEFAULT;
ALTER TABLE public."musicalStyles" ALTER COLUMN "musicalStyleId" DROP DEFAULT;
ALTER TABLE public.genres ALTER COLUMN "genreId" DROP DEFAULT;
ALTER TABLE public.collections ALTER COLUMN "collectionId" DROP DEFAULT;
DROP SEQUENCE public."users_userId_seq";
DROP TABLE public.users;
DROP SEQUENCE public."tags_tagId_seq";
DROP TABLE public.tags;
DROP SEQUENCE public."suggestions_suggestionId_seq";
DROP TABLE public.suggestions;
DROP SEQUENCE public."musicals_musicalId_seq";
DROP TABLE public.musicals;
DROP TABLE public."musicalTags";
DROP SEQUENCE public."musicalStyles_musicalStyleId_seq";
DROP TABLE public."musicalStyles";
DROP TABLE public."musicalStyleSeeds";
DROP TABLE public."musicalStyleCategories";
DROP TABLE public."musicalGenres";
DROP TABLE public."likedMusicals";
DROP SEQUENCE public."genres_genreId_seq";
DROP TABLE public.genres;
DROP TABLE public."genreSeeds";
DROP SEQUENCE public."collections_collectionId_seq";
DROP TABLE public.collections;
DROP TABLE public."collectionItems";
DROP EXTENSION unaccent;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: collectionItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."collectionItems" (
    "collectionId" integer,
    "musicalId" integer
);


--
-- Name: collections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collections (
    "collectionId" integer NOT NULL,
    "userId" integer,
    name text NOT NULL,
    "imageUrl" text NOT NULL
);


--
-- Name: collections_collectionId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."collections_collectionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: collections_collectionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."collections_collectionId_seq" OWNED BY public.collections."collectionId";


--
-- Name: genreSeeds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."genreSeeds" (
    "userId" integer,
    "genreId" integer
);


--
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    "genreId" integer NOT NULL,
    name text NOT NULL
);


--
-- Name: genres_genreId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."genres_genreId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genres_genreId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."genres_genreId_seq" OWNED BY public.genres."genreId";


--
-- Name: likedMusicals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."likedMusicals" (
    "userId" integer,
    "musicalId" integer,
    "like" boolean NOT NULL
);


--
-- Name: musicalGenres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."musicalGenres" (
    "musicalId" integer,
    "genreId" integer
);


--
-- Name: musicalStyleCategories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."musicalStyleCategories" (
    "musicalId" integer,
    "musicalStyleId" integer
);


--
-- Name: musicalStyleSeeds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."musicalStyleSeeds" (
    "userId" integer,
    "musicalStyleId" integer
);


--
-- Name: musicalStyles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."musicalStyles" (
    "musicalStyleId" integer NOT NULL,
    name text NOT NULL
);


--
-- Name: musicalStyles_musicalStyleId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."musicalStyles_musicalStyleId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: musicalStyles_musicalStyleId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."musicalStyles_musicalStyleId_seq" OWNED BY public."musicalStyles"."musicalStyleId";


--
-- Name: musicalTags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."musicalTags" (
    "musicalId" integer,
    "tagId" integer
);


--
-- Name: musicals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.musicals (
    "musicalId" integer NOT NULL,
    title text NOT NULL,
    "musicBy" text NOT NULL,
    "lyricsBy" text NOT NULL,
    plot text NOT NULL,
    "musicUrl" text NOT NULL,
    "imageUrl" text NOT NULL
);


--
-- Name: musicals_musicalId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."musicals_musicalId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: musicals_musicalId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."musicals_musicalId_seq" OWNED BY public.musicals."musicalId";


--
-- Name: suggestions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.suggestions (
    "suggestionId" integer NOT NULL,
    title text NOT NULL,
    composer text NOT NULL,
    notes text NOT NULL
);


--
-- Name: suggestions_suggestionId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."suggestions_suggestionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: suggestions_suggestionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."suggestions_suggestionId_seq" OWNED BY public.suggestions."suggestionId";


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    "tagId" integer NOT NULL,
    name text NOT NULL
);


--
-- Name: tags_tagId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."tags_tagId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_tagId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."tags_tagId_seq" OWNED BY public.tags."tagId";


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    "userId" integer NOT NULL,
    username text NOT NULL
);


--
-- Name: users_userId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."users_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."users_userId_seq" OWNED BY public.users."userId";


--
-- Name: collections collectionId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collections ALTER COLUMN "collectionId" SET DEFAULT nextval('public."collections_collectionId_seq"'::regclass);


--
-- Name: genres genreId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN "genreId" SET DEFAULT nextval('public."genres_genreId_seq"'::regclass);


--
-- Name: musicalStyles musicalStyleId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."musicalStyles" ALTER COLUMN "musicalStyleId" SET DEFAULT nextval('public."musicalStyles_musicalStyleId_seq"'::regclass);


--
-- Name: musicals musicalId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.musicals ALTER COLUMN "musicalId" SET DEFAULT nextval('public."musicals_musicalId_seq"'::regclass);


--
-- Name: suggestions suggestionId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suggestions ALTER COLUMN "suggestionId" SET DEFAULT nextval('public."suggestions_suggestionId_seq"'::regclass);


--
-- Name: tags tagId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN "tagId" SET DEFAULT nextval('public."tags_tagId_seq"'::regclass);


--
-- Name: users userId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN "userId" SET DEFAULT nextval('public."users_userId_seq"'::regclass);


--
-- Data for Name: collectionItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."collectionItems" ("collectionId", "musicalId") FROM stdin;
11	81
18	360
7	161
25	280
26	192
26	397
26	222
26	80
\.


--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.collections ("collectionId", "userId", name, "imageUrl") FROM stdin;
7	5	Audition Song Ideas	https://is4-ssl.mzstatic.com/image/thumb/Features/77/7b/7d/dj.xdqznyyn.jpg/1000x1000bb.jpg
25	1	What Kind of Musical is This?	https://is2-ssl.mzstatic.com/image/thumb/Features/27/a3/a1/dj.duzjrtyj.jpg/1000x1000bb.jpeg
26	1	My Voice Likes This	https://is1-ssl.mzstatic.com/image/thumb/Music/9a/87/5d/mzi.oxyysdcn.jpg/1000x1000bb.jpeg
11	5	Angsty Musicals	https://is4-ssl.mzstatic.com/image/thumb/Music128/v4/26/22/46/262246c5-92a3-6c2d-c481-c0e516725dac/791558966039.jpg/1000x1000bb.jpg
10	5	Considerations for 2021	/images/empty-collection.png
18	1	Folk Musicals	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/27/b7/84/27b784a9-0611-dba8-ddc6-d1beca4d1046/00888072041752.rgb.jpg/1000x1000bb.jpeg
\.


--
-- Data for Name: genreSeeds; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."genreSeeds" ("userId", "genreId") FROM stdin;
5	3
5	4
5	15
1	1
1	10
1	12
1	20
1	23
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.genres ("genreId", name) FROM stdin;
1	Adaptations (Literature)
2	Adaptations (Shakespeare)
3	Adaptations (Stage & Screen)
4	Adventure
5	Biography
6	Christmas/Holiday
7	Comedy
8	Dark Comedy
9	Docudrama/Historic
10	Drama
11	Dramatic Comedy
12	Experimental
13	Fables/Folktales
14	Family
15	Fantasy
16	Farce
17	Melodrama
18	Mystery/Thriller
19	Parody / Spoof
20	Period/Historical
21	Religious
22	Revue
23	Romance
24	Romantic Comedy
25	Satire
26	Science Fiction
27	Theatre for Young Audiences
\.


--
-- Data for Name: likedMusicals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."likedMusicals" ("userId", "musicalId", "like") FROM stdin;
5	114	t
5	303	t
5	315	t
5	139	t
5	135	t
5	387	t
5	293	t
5	253	t
5	246	t
5	52	t
1	89	t
5	55	t
1	98	t
1	159	t
1	192	t
1	219	t
1	222	t
1	253	t
1	397	t
1	426	t
1	194	t
1	384	t
1	63	t
1	139	t
1	85	t
1	153	t
1	81	t
1	52	t
1	20	t
1	246	t
1	435	t
\.


--
-- Data for Name: musicalGenres; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."musicalGenres" ("musicalId", "genreId") FROM stdin;
1	10
1	3
1	20
2	7
2	14
3	7
3	10
3	20
4	11
4	20
5	22
6	7
7	7
7	24
7	3
8	7
9	7
9	20
9	23
9	3
10	7
11	10
11	20
11	3
12	14
12	6
12	20
13	10
13	5
14	7
14	16
15	7
15	20
16	7
16	18
16	20
16	1
17	7
17	24
18	7
18	20
18	23
19	14
19	20
19	1
20	7
20	10
20	20
20	3
21	10
21	1
21	20
22	10
23	7
24	11
25	7
25	14
25	15
26	10
26	15
26	3
26	20
26	12
27	7
27	19
28	10
28	20
28	23
29	7
29	20
30	11
30	20
31	7
31	19
32	8
32	18
32	3
33	7
33	3
33	24
34	11
34	3
34	20
34	24
35	11
35	4
35	3
35	20
35	24
36	11
36	1
36	27
36	5
36	20
36	24
37	7
37	1
38	7
38	14
38	6
38	20
39	7
39	20
39	24
40	7
41	22
42	7
42	20
42	24
43	7
43	15
44	10
44	1
44	20
45	10
45	20
46	7
47	7
47	24
48	15
48	6
49	7
50	11
50	5
50	20
51	23
52	1
52	26
53	10
53	20
54	14
54	15
54	20
54	13
55	7
55	15
55	3
56	7
56	24
57	10
59	7
59	1
60	7
60	10
60	3
61	7
61	10
61	20
62	24
63	10
63	20
63	23
64	7
64	14
64	20
65	10
65	1
66	7
66	3
67	7
67	14
67	20
68	7
68	20
68	3
69	7
69	1
70	7
70	14
70	20
70	23
71	7
71	20
71	19
72	10
72	1
72	20
73	7
73	24
74	7
74	1
74	24
75	10
75	15
75	23
75	1
75	13
76	7
76	20
76	23
77	7
77	4
77	19
77	20
78	10
78	1
78	20
79	10
79	20
80	10
80	1
80	20
81	10
81	3
81	18
82	7
82	20
82	3
83	7
83	15
83	1
83	27
84	7
84	14
84	15
84	1
84	3
85	10
85	1
85	20
86	7
86	20
87	7
87	1
87	27
87	6
87	21
88	7
88	15
88	3
88	1
89	7
89	15
89	1
89	6
89	13
89	20
90	11
90	19
91	23
91	22
92	10
93	7
93	10
93	23
94	7
95	7
95	24
96	7
96	23
96	3
97	7
97	20
97	23
98	14
98	20
98	23
98	1
99	7
99	20
100	7
100	20
100	23
101	7
101	15
101	4
101	3
101	20
102	10
102	20
102	1
103	10
103	1
103	3
103	20
104	7
104	23
104	3
105	7
105	20
106	7
106	20
106	23
107	7
107	1
108	7
108	14
108	15
108	20
108	1
108	3
109	10
109	20
109	23
109	3
110	7
110	12
111	15
111	18
111	20
111	1
112	10
112	20
113	10
114	7
114	14
114	15
114	6
114	3
115	7
115	20
115	23
116	11
117	10
117	5
117	20
118	7
118	19
118	24
119	10
120	10
121	10
121	14
121	20
121	3
122	10
122	20
122	3
123	10
123	20
124	7
124	10
124	14
124	20
124	21
125	7
125	24
126	7
126	10
126	20
127	7
127	24
128	11
128	20
129	7
129	20
129	3
130	11
130	1
131	7
131	1
132	10
132	20
133	8
133	13
133	20
133	24
134	10
134	23
135	11
135	3
136	7
136	20
137	7
137	14
137	3
138	7
138	14
139	10
139	1
139	5
140	11
140	5
140	20
141	7
141	20
141	19
141	24
142	7
142	1
142	3
142	20
142	24
143	7
143	5
143	20
144	7
144	1
144	3
144	20
144	24
145	7
145	24
146	14
146	21
147	7
148	7
149	7
149	14
150	10
151	10
151	18
151	20
151	1
152	7
152	20
153	10
154	7
154	15
155	10
156	7
157	7
157	20
157	23
158	11
158	5
159	10
159	15
159	1
159	13
160	11
160	20
161	7
161	20
161	23
161	3
162	11
162	12
162	20
163	11
163	3
164	7
164	3
164	20
165	7
165	20
165	23
166	7
166	1
166	3
167	8
167	3
168	7
168	16
168	1
168	20
168	24
169	7
169	16
169	24
169	1
170	11
170	3
170	20
170	24
171	7
171	6
171	20
171	3
172	7
172	23
172	3
173	7
173	14
174	7
174	20
175	7
176	7
176	20
176	23
177	11
177	1
177	20
178	7
178	10
178	23
179	7
180	24
181	7
181	1
181	3
181	6
182	10
183	10
184	7
184	24
185	7
185	23
186	7
186	10
186	15
186	13
187	7
187	3
187	24
188	10
188	20
189	7
189	23
190	7
191	7
191	4
191	3
191	19
192	10
192	20
192	23
192	1
193	8
193	15
194	18
194	20
194	1
195	22
196	10
196	1
196	20
196	21
197	10
197	20
198	7
198	1
198	21
199	8
199	6
200	7
200	14
201	14
201	15
202	23
202	15
203	7
203	3
204	15
204	23
205	7
205	2
205	20
205	24
206	10
206	1
207	7
208	7
208	10
208	14
208	23
208	1
209	7
209	24
209	3
210	10
211	7
211	20
211	24
212	7
212	21
212	23
212	3
213	7
213	23
213	3
214	10
214	20
214	1
215	7
215	20
216	7
216	1
216	19
217	7
217	24
218	7
218	18
218	20
218	3
218	26
219	14
219	20
219	23
219	1
220	7
220	20
221	7
221	20
221	19
222	1
222	20
222	10
222	23
223	7
223	23
223	2
224	20
224	23
225	7
225	20
225	23
226	7
226	23
226	1
227	7
227	1
227	3
227	19
227	24
228	10
229	7
229	1
230	10
230	20
231	7
231	10
231	23
231	22
232	7
232	3
232	6
232	20
233	7
233	23
234	11
234	1
234	20
235	10
236	10
236	1
236	20
237	7
237	10
237	23
237	22
238	7
238	14
238	15
238	20
238	1
238	3
239	7
239	15
240	7
240	24
241	7
241	24
242	7
242	3
243	7
243	1
243	20
244	11
244	3
244	6
244	20
245	7
245	10
246	10
246	20
246	23
247	10
247	18
247	23
248	7
248	1
248	20
248	24
249	7
249	20
249	3
250	10
250	1
250	20
251	24
252	1
253	10
253	1
253	20
253	12
254	11
254	4
255	7
255	10
255	20
255	23
256	7
256	14
256	20
256	3
257	10
258	7
258	24
259	11
259	4
259	3
259	18
259	24
260	7
260	16
260	20
260	24
261	7
262	10
262	20
263	7
264	7
265	25
265	24
265	20
266	7
266	3
266	20
267	7
267	20
267	24
268	7
269	7
269	1
269	20
269	24
270	10
270	14
270	20
270	1
271	7
271	19
272	7
272	20
272	12
272	24
273	7
273	20
273	24
274	7
274	3
275	7
275	16
275	24
276	10
276	23
276	3
277	14
277	15
277	23
278	7
278	15
278	1
279	11
279	24
280	7
280	16
280	1
280	13
281	10
282	10
282	20
283	7
283	20
283	23
284	11
284	1
284	20
284	24
285	7
285	24
286	10
286	20
287	10
288	14
288	15
289	20
289	21
290	7
290	1
290	20
291	15
291	20
292	7
293	7
293	23
293	3
294	7
294	16
295	11
295	3
295	6
295	24
296	11
297	7
297	20
298	7
298	10
298	22
299	10
299	20
300	10
300	20
300	1
301	10
301	3
302	7
302	18
302	20
303	25
303	20
303	19
303	3
304	10
305	4
305	26
305	3
305	2
306	10
306	20
307	10
307	23
308	7
308	3
308	19
309	7
309	10
309	23
309	3
310	11
310	24
311	10
311	20
312	7
312	14
312	20
312	23
313	7
313	20
314	11
314	20
314	19
315	7
315	3
316	11
316	1
316	6
316	20
317	11
318	7
318	14
318	15
319	7
319	14
319	20
319	23
319	3
320	7
320	6
320	20
320	23
321	20
322	10
322	1
322	20
323	7
323	14
323	15
324	7
324	10
324	23
324	22
325	10
325	5
326	7
326	20
326	19
326	24
326	3
327	7
327	14
327	20
327	23
327	3
328	7
328	14
328	21
328	3
329	7
330	7
330	20
330	21
331	7
331	24
332	7
332	1
332	27
333	7
333	20
334	7
334	18
334	19
335	7
335	10
335	23
335	22
336	10
337	10
337	5
337	20
338	7
338	10
338	23
339	10
339	1
339	20
340	7
340	15
340	3
341	10
341	20
342	7
342	15
342	27
342	24
343	23
343	22
344	7
344	20
344	24
345	20
346	11
346	12
347	7
347	20
348	10
348	20
349	10
349	3
349	18
349	20
350	18
350	20
351	7
351	3
351	24
352	11
352	3
352	20
352	24
353	14
353	15
353	20
353	23
354	11
354	24
355	7
355	20
355	21
356	10
356	1
356	20
357	7
358	7
358	20
358	23
359	23
359	3
360	10
360	3
361	10
361	23
361	3
362	10
362	20
363	7
364	10
364	5
364	20
365	7
365	16
365	1
365	2
366	23
366	3
367	10
367	20
368	11
368	4
369	7
369	20
369	23
370	11
370	24
371	14
371	20
371	23
372	7
372	20
373	7
374	11
374	1
374	13
375	7
376	7
376	1
377	11
377	1
378	10
378	20
378	1
379	7
379	20
380	10
380	1
380	20
381	10
381	23
382	7
382	16
383	10
384	10
384	1
385	10
385	27
385	5
385	20
386	14
386	15
386	23
387	11
388	7
389	20
390	20
390	23
391	7
391	14
391	20
391	23
392	7
392	1
392	18
392	20
393	10
393	4
394	7
394	14
394	20
394	1
395	7
395	2
396	7
396	18
397	10
397	1
397	18
397	20
397	23
398	7
398	24
398	20
399	7
399	15
399	4
399	1
399	27
400	7
400	3
401	10
401	20
402	7
402	24
403	10
404	11
404	13
404	12
405	8
405	26
406	10
406	4
406	1
406	20
407	10
407	20
408	10
408	1
408	27
408	20
409	7
409	3
410	11
410	1
410	20
410	24
411	10
411	3
412	7
412	10
413	17
413	20
414	10
414	3
415	11
415	1
416	7
416	10
417	7
417	14
417	15
418	7
418	3
418	26
419	7
419	14
419	20
420	10
420	20
421	10
421	20
422	10
422	20
423	10
423	18
423	20
424	7
424	5
424	24
425	7
425	15
425	1
426	10
426	1
426	18
426	20
427	7
427	10
427	22
428	7
428	24
429	7
430	7
430	14
430	20
430	23
430	3
431	7
432	15
433	10
434	10
434	20
434	22
435	10
435	5
435	20
436	7
436	3
437	7
437	20
437	19
438	7
438	20
438	23
439	7
439	1
440	7
440	2
441	7
441	2
441	24
442	11
443	7
443	20
443	25
444	11
445	7
445	16
445	24
445	3
446	10
446	20
446	21
446	\N
447	7
447	10
447	23
447	3
448	10
448	1
448	5
448	20
450	25
451	10
451	14
451	20
451	23
451	2
452	7
453	11
453	1
453	20
454	7
454	14
454	20
454	23
455	10
455	1
455	3
455	18
455	20
455	21
456	7
456	3
456	6
457	7
457	3
458	7
458	3
459	7
459	3
459	20
459	24
460	7
460	15
460	20
461	7
461	27
462	7
462	20
463	7
463	2
463	20
463	24
464	7
464	15
464	26
464	24
465	7
\.


--
-- Data for Name: musicalStyleCategories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."musicalStyleCategories" ("musicalId", "musicalStyleId") FROM stdin;
1	6
2	8
2	17
2	9
3	6
4	8
5	6
5	17
5	11
5	10
6	17
7	6
8	6
9	8
9	11
9	9
10	8
11	6
11	7
12	6
13	8
14	6
15	6
16	6
17	6
18	6
18	7
19	8
20	6
21	7
22	6
23	17
23	1
24	17
24	1
25	6
26	7
27	6
27	15
28	8
28	17
28	4
28	9
28	5
29	15
30	6
30	7
30	13
31	8
31	17
31	9
31	5
32	8
32	17
32	10
32	5
33	8
33	9
34	6
35	6
35	8
36	6
36	17
36	12
37	6
38	6
39	6
39	11
39	13
40	6
41	6
41	8
42	6
43	15
44	7
44	8
45	6
46	6
46	8
47	6
47	15
48	7
49	17
50	6
51	8
51	17
52	8
52	10
52	17
53	15
53	17
53	2
54	6
55	8
55	9
56	6
56	13
57	6
57	7
59	6
59	11
59	8
60	8
60	17
60	4
60	9
61	17
61	10
62	6
62	17
62	19
63	8
63	11
64	6
65	8
65	10
65	5
66	8
66	17
66	9
67	6
67	15
68	6
69	6
69	15
69	13
70	6
71	6
71	1
71	13
72	6
73	6
74	17
74	8
74	9
74	5
75	6
75	13
76	7
77	6
77	11
78	6
78	7
78	13
79	8
79	1
80	6
80	7
80	13
81	17
81	8
81	4
81	9
82	6
83	17
83	8
84	8
85	6
85	4
86	6
86	15
87	6
87	17
88	6
89	6
89	13
90	6
90	15
91	8
92	8
93	6
94	6
94	7
95	6
96	8
96	17
96	1
97	6
98	8
98	7
99	6
100	6
100	13
101	6
101	15
101	7
102	6
102	11
102	14
103	6
103	13
104	8
105	17
105	3
106	6
107	6
108	6
109	8
109	17
109	9
110	8
111	8
112	17
112	1
113	17
113	15
114	8
115	6
115	13
116	17
117	8
117	16
118	6
119	6
120	8
121	8
121	17
121	4
122	6
122	7
122	13
123	6
123	15
123	8
124	6
125	6
125	13
126	6
126	13
127	6
127	8
127	9
127	17
128	6
128	7
128	8
129	15
130	6
131	6
131	13
132	6
132	11
132	8
133	6
133	17
134	6
135	8
135	17
135	4
135	9
136	15
136	17
136	1
137	8
137	9
138	8
139	6
139	17
139	8
140	6
141	6
141	7
142	6
142	13
143	6
144	6
145	6
146	6
146	14
146	17
146	2
147	6
147	15
148	6
148	13
149	8
150	6
151	6
152	17
152	1
153	17
153	10
154	8
155	6
155	15
156	6
156	17
156	8
157	6
157	13
158	6
158	13
159	17
159	15
159	12
159	8
159	10
160	17
160	2
161	8
161	17
161	1
162	6
163	17
163	11
163	9
164	17
165	6
165	13
166	6
166	13
167	17
167	4
167	9
168	6
169	6
169	13
170	6
171	6
171	15
171	7
172	8
172	7
173	6
174	14
174	15
174	7
175	6
176	6
177	6
178	6
179	17
179	2
180	8
181	6
182	17
183	8
183	9
184	8
184	9
184	18
184	17
185	8
185	17
186	6
187	6
187	13
188	15
188	11
188	12
189	8
189	7
190	15
190	8
191	6
192	6
192	7
193	17
193	10
194	8
194	9
194	5
195	17
196	17
196	8
196	2
197	8
198	6
198	17
198	7
199	6
200	6
201	6
202	7
203	8
203	17
203	4
203	9
204	6
204	7
204	13
205	6
205	13
206	6
207	19
207	6
208	8
209	6
210	15
211	6
212	8
212	14
213	8
213	9
214	6
215	6
216	6
216	13
217	7
217	13
218	6
218	17
218	1
219	8
220	6
221	6
221	15
221	13
222	8
222	7
223	8
223	17
224	8
225	6
225	15
226	6
227	17
227	8
227	9
228	6
229	6
229	8
230	6
231	8
232	6
233	8
233	17
233	3
234	6
234	16
235	6
236	7
237	6
238	6
239	8
240	6
240	13
241	6
242	8
242	9
243	6
243	8
244	6
245	6
246	8
247	17
247	10
248	6
248	13
249	6
250	7
251	6
252	8
253	17
253	12
253	7
253	9
253	8
254	7
255	6
256	6
256	8
257	8
257	10
258	6
259	6
259	15
260	6
261	6
261	7
262	6
263	8
264	6
265	6
265	15
266	6
267	6
268	6
268	11
268	17
269	6
269	11
269	13
270	6
270	13
271	6
272	6
273	6
273	15
273	13
274	6
275	6
275	15
276	17
276	10
276	12
277	6
278	6
278	13
279	8
280	6
280	13
281	7
282	6
283	6
283	11
283	13
284	6
284	15
284	13
285	6
286	8
287	6
287	8
288	6
288	13
289	8
290	6
290	13
291	6
291	17
291	3
292	6
292	13
293	8
293	10
293	5
294	6
295	6
295	17
295	1
296	17
296	11
297	6
297	15
298	6
299	6
299	11
299	8
299	7
300	6
301	6
302	6
302	13
303	8
303	9
303	5
304	17
304	10
304	5
305	17
305	1
306	6
307	7
307	6
308	17
308	4
309	8
309	9
310	6
310	17
310	7
311	6
312	6
312	13
313	6
313	13
314	6
314	13
315	17
315	8
315	9
316	6
317	17
317	12
317	8
317	10
318	6
319	6
319	11
320	6
321	17
321	1
322	6
322	7
323	8
324	6
325	8
326	6
326	13
327	6
328	8
328	14
328	17
328	3
329	6
330	11
331	15
331	8
331	1
332	6
333	6
334	6
335	6
336	8
337	7
338	8
339	6
339	13
340	6
340	17
340	8
340	9
341	17
341	10
342	17
342	8
343	8
344	6
345	17
345	4
346	6
347	6
348	6
349	8
350	6
351	6
352	6
353	8
353	17
353	4
353	9
353	5
354	8
355	6
355	13
356	12
356	7
357	8
358	6
359	6
360	12
360	8
361	8
362	17
362	8
362	7
363	6
363	11
364	6
365	6
365	15
366	8
366	7
366	11
367	8
367	11
367	14
368	7
369	6
370	8
371	6
371	13
372	6
373	8
373	17
373	9
373	5
374	7
375	6
376	6
376	7
377	17
377	12
378	6
379	6
380	6
380	7
380	13
381	8
382	17
383	2
383	17
384	6
384	7
384	8
385	6
386	6
387	8
388	7
389	7
390	6
390	7
390	13
391	6
391	13
392	6
393	7
394	6
394	13
395	6
395	17
396	6
396	17
396	15
396	11
396	12
397	7
398	7
399	6
400	6
401	6
402	7
403	6
403	15
404	6
405	17
405	2
406	17
406	8
407	8
407	14
407	15
408	6
409	6
410	6
410	13
411	12
411	11
412	8
413	7
414	8
415	6
415	15
415	8
416	8
417	8
418	17
418	4
418	10
419	6
419	11
419	13
420	17
420	8
421	17
421	2
422	15
422	11
422	8
423	8
424	6
425	17
425	15
425	3
426	6
426	8
427	6
428	6
428	3
429	8
429	10
430	6
431	8
431	17
432	6
433	8
433	10
433	5
434	6
435	6
435	7
436	8
437	6
437	13
438	6
439	17
439	12
439	8
440	8
441	17
441	2
442	17
442	8
443	8
444	17
444	9
445	6
445	15
446	8
446	11
446	14
447	8
447	11
447	9
448	6
448	7
449	8
449	9
450	8
450	5
451	6
451	13
452	6
453	6
454	6
454	13
455	17
455	11
455	8
456	6
456	7
457	6
458	8
458	9
458	16
459	6
459	15
459	13
460	17
460	3
461	6
462	6
463	17
463	2
464	6
464	17
464	1
465	6
465	19
\.


--
-- Data for Name: musicalStyleSeeds; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."musicalStyleSeeds" ("userId", "musicalStyleId") FROM stdin;
5	8
1	7
1	8
1	12
\.


--
-- Data for Name: musicalStyles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."musicalStyles" ("musicalStyleId", name) FROM stdin;
1	1950s/60s Rock/Motown
2	1960s/70s Folk Rock
3	1970s Disco Pop
4	1980s Pop/Rock
5	1990s Pop/Alternative Rock/R&B
6	Classic Broadway
7	Classical/Operetta
8	Contemporary Broadway
9	Contemporary Pop/Lite Rock
10	Contemporary Punk/Emo Rock
11	Country/Western
12	Folk
13	Golden Age
14	Gospel
15	Jazz/Blues
16	Latin/Hispanic
17	Pop/Rock
18	Rap
19	World Music
\.


--
-- Data for Name: musicalTags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."musicalTags" ("musicalId", "tagId") FROM stdin;
1	26
2	1
2	23
3	6
3	40
4	7
4	13
4	21
4	32
4	18
4	1
5	7
5	14
5	21
5	26
5	29
5	25
5	1
7	39
8	26
8	2
9	26
9	42
9	21
10	21
10	26
10	29
10	39
11	27
11	29
11	31
12	12
13	39
14	21
14	26
14	39
15	40
16	40
17	21
17	26
17	27
17	29
17	31
18	40
18	26
18	7
19	5
20	38
21	7
21	26
21	27
21	33
22	22
22	26
22	25
23	26
23	32
24	21
24	26
24	27
24	31
24	42
25	37
25	5
26	2
26	9
26	14
26	26
26	29
27	7
27	26
28	15
28	40
28	35
29	40
30	14
30	27
30	31
31	11
31	33
31	23
32	7
32	9
32	14
33	26
33	31
34	26
34	41
34	39
35	26
35	29
35	31
36	2
36	10
36	11
36	20
36	21
36	26
36	27
36	31
36	17
36	42
36	1
37	10
37	21
37	26
37	31
37	1
38	30
38	40
38	10
38	12
39	26
39	39
39	6
41	26
41	39
42	26
44	26
44	31
45	6
45	38
46	40
46	38
47	21
47	26
47	39
47	1
48	1
49	1
50	26
50	27
50	39
50	6
51	26
51	39
52	21
52	26
52	1
53	26
53	39
54	15
54	35
54	26
54	19
55	1
55	43
55	14
56	26
57	26
59	21
59	8
59	1
60	40
61	6
61	38
63	6
63	38
63	26
63	14
65	27
65	32
65	17
66	1
66	21
68	39
69	21
69	26
69	32
69	42
70	26
70	39
71	26
71	31
71	39
71	1
72	13
72	27
72	32
72	41
72	34
72	23
72	25
72	16
73	32
74	1
75	26
76	26
77	7
77	14
77	21
77	22
77	26
77	33
78	41
78	8
79	38
80	2
80	7
80	14
80	26
80	27
80	31
80	42
80	1
81	7
81	11
81	14
81	21
81	26
81	31
81	33
81	42
81	1
82	6
82	35
83	2
83	14
83	19
83	21
83	22
83	29
83	1
83	35
84	10
84	5
85	10
85	14
85	21
85	22
85	26
85	31
85	1
85	35
86	7
86	14
86	20
86	21
86	26
86	27
86	29
87	10
87	13
87	14
87	19
87	21
87	26
87	31
87	33
87	36
88	35
88	5
89	19
89	26
89	31
90	39
91	2
91	27
91	26
92	6
93	30
93	40
94	21
94	26
94	39
95	26
96	38
97	26
97	7
98	26
99	26
99	39
99	42
100	40
100	36
101	14
101	19
101	26
102	21
102	8
103	26
105	39
107	26
108	35
108	5
109	38
110	2
110	14
110	26
110	27
110	31
111	43
111	14
112	21
112	26
112	39
112	8
114	30
114	12
114	35
115	26
116	16
116	25
117	32
117	24
117	6
118	39
119	10
119	14
119	21
119	22
119	26
119	27
119	31
119	33
119	23
119	25
119	1
120	10
120	14
120	21
120	22
120	26
120	27
120	31
120	23
120	25
120	1
121	30
122	26
123	26
123	27
123	32
123	8
123	42
124	40
124	33
124	23
125	26
126	6
126	30
126	40
127	26
127	27
128	32
129	26
130	26
130	32
131	26
131	27
131	31
131	4
132	32
132	6
133	2
133	14
133	21
133	26
133	29
133	31
133	1
134	40
134	35
135	21
135	26
135	31
135	33
135	1
136	39
136	14
137	15
138	37
138	5
139	2
139	10
139	14
139	20
139	26
139	27
139	29
139	31
139	25
139	42
139	1
140	26
140	27
140	39
140	23
140	6
141	21
141	26
142	26
142	39
143	39
143	6
144	26
144	1
145	26
146	33
148	39
149	37
150	7
150	32
151	35
152	21
152	26
152	18
152	1
153	38
154	26
156	39
157	30
157	40
158	31
158	39
158	6
159	26
159	27
160	41
160	30
160	1
160	13
160	26
161	40
161	35
162	26
162	39
162	8
163	2
163	11
163	13
163	21
163	22
163	26
163	27
163	31
163	33
163	41
164	7
164	26
164	31
164	1
166	22
167	7
167	14
167	21
167	18
167	1
168	26
168	27
168	35
170	26
170	27
171	21
171	26
171	27
171	39
172	26
173	19
173	5
175	17
176	40
176	26
176	9
177	9
177	26
177	23
178	27
178	26
179	27
179	34
180	26
180	27
181	29
181	31
182	39
182	26
183	26
183	30
184	2
184	21
184	26
184	31
184	24
185	30
185	26
186	40
187	26
188	8
188	26
188	29
189	23
189	25
189	27
189	26
190	39
192	26
193	7
193	14
193	21
193	26
193	31
193	1
194	35
194	26
195	14
195	21
195	26
195	39
196	7
196	11
196	14
196	21
196	26
196	32
196	33
196	35
197	31
197	1
198	11
198	21
198	31
198	33
198	23
198	1
199	7
199	14
199	21
199	25
199	29
199	32
199	39
199	16
200	37
200	5
201	5
202	26
203	40
203	35
204	40
205	26
205	27
205	39
206	26
206	32
206	25
209	7
209	26
209	27
209	31
209	39
209	34
209	25
209	16
210	26
210	8
210	42
211	26
211	39
212	33
213	26
213	20
213	21
213	42
214	40
214	35
216	26
218	26
219	5
220	26
220	27
220	17
221	32
222	14
222	26
222	27
222	29
222	31
222	39
223	38
223	26
223	1
224	6
227	26
227	34
227	1
228	6
230	41
232	31
233	35
234	26
234	40
235	14
235	22
235	26
235	27
235	31
235	23
235	25
236	26
236	27
236	31
236	8
237	26
238	15
238	35
238	5
239	40
239	35
239	18
239	10
239	1
239	5
240	26
240	39
241	26
242	21
242	42
243	32
244	31
244	1
245	30
246	35
246	41
246	26
246	4
246	14
247	30
247	38
248	21
248	26
248	42
248	40
250	26
250	34
250	25
250	42
251	26
252	11
252	19
252	33
253	2
253	7
253	21
253	22
253	26
253	27
253	31
253	41
253	1
254	26
255	30
256	15
256	30
256	40
257	40
257	38
257	1
257	31
257	44
258	26
260	26
260	27
261	21
261	26
261	27
263	21
264	21
264	33
264	3
265	26
265	27
265	32
267	26
269	26
269	27
270	40
271	19
272	26
272	29
273	26
274	7
274	9
274	26
275	26
276	40
277	26
277	8
277	14
278	2
278	19
278	21
278	26
278	27
278	31
278	42
278	1
279	2
279	14
279	21
279	26
279	27
279	29
280	26
282	35
283	45
284	26
285	26
285	39
286	6
286	40
286	38
287	26
288	35
288	5
290	26
292	17
293	26
293	34
296	7
296	26
296	27
296	17
297	33
297	26
299	2
299	42
300	40
300	35
301	31
301	8
302	40
303	13
303	14
303	22
303	26
303	32
303	1
304	30
304	40
304	38
304	25
304	26
307	26
308	26
308	32
308	34
308	1
309	36
309	26
310	2
310	21
310	26
310	27
313	30
315	21
315	26
315	31
315	18
315	1
316	14
316	21
316	26
316	29
316	31
318	35
318	5
319	45
319	26
320	12
323	35
325	21
325	26
325	27
325	39
325	6
326	32
327	35
328	33
329	11
329	33
329	39
329	3
330	11
330	31
330	33
331	21
331	26
331	39
332	1
333	39
334	7
334	21
336	26
337	26
339	14
339	21
339	26
339	27
339	31
339	41
340	21
341	40
341	38
342	19
342	21
342	26
342	35
344	21
344	26
344	17
345	26
345	27
345	32
346	2
346	26
346	27
346	31
348	6
349	2
349	21
349	26
349	29
349	35
350	40
351	26
352	31
353	15
353	35
353	5
354	26
354	42
354	3
356	1
356	2
356	7
356	10
356	11
356	14
356	20
356	21
356	22
356	26
356	27
356	31
356	32
356	33
356	42
356	17
357	40
358	33
360	26
360	31
360	42
361	40
362	21
362	33
362	41
362	1
363	21
363	26
363	36
364	39
364	42
365	21
365	26
365	27
366	40
367	6
367	41
368	41
369	40
370	26
370	27
370	25
371	26
371	1
373	34
373	27
374	26
376	41
378	15
379	26
379	42
380	2
380	14
380	21
380	26
380	27
380	31
380	32
380	33
380	18
380	42
380	1
380	6
381	30
382	13
382	27
382	31
382	32
382	33
384	26
384	27
384	31
385	11
385	26
385	27
385	31
385	33
386	15
386	35
387	1
387	26
387	21
388	26
388	27
389	7
389	26
389	27
391	40
392	21
394	40
395	13
395	14
395	21
395	26
395	27
395	31
395	32
395	33
395	1
396	9
396	21
396	26
396	27
396	32
396	16
397	7
397	14
397	19
397	21
397	26
397	27
397	39
397	35
398	26
398	27
398	32
399	1
399	21
399	26
399	31
400	30
400	40
400	35
400	39
403	9
403	31
405	7
405	14
405	26
405	27
405	16
406	26
407	6
407	38
408	10
408	21
408	22
408	26
408	29
408	31
408	1
409	26
409	27
409	17
410	11
410	21
410	26
410	27
410	31
410	33
410	41
410	42
410	1
410	6
411	21
411	26
411	17
414	9
414	26
415	10
415	31
415	39
415	8
415	1
417	37
418	38
419	6
420	14
420	20
420	21
420	26
420	29
420	31
420	32
420	28
420	39
420	24
420	25
420	42
420	16
421	35
422	21
422	26
422	32
422	34
422	8
422	25
423	30
423	38
424	26
424	27
424	32
424	39
425	19
425	21
425	31
426	14
426	26
428	9
428	26
429	21
429	26
430	30
430	40
430	35
433	30
433	38
435	14
435	21
435	26
435	6
437	39
439	2
439	10
439	21
439	31
439	1
440	21
440	26
440	27
440	31
440	32
440	42
441	26
441	27
442	14
442	31
442	32
442	33
442	39
442	3
443	40
444	2
444	20
444	21
444	26
444	29
444	1
444	3
445	39
445	25
445	16
446	38
446	33
447	26
447	27
447	31
448	20
448	28
448	17
448	42
448	6
451	30
451	24
451	26
451	7
451	14
452	30
453	9
453	39
453	23
455	26
455	33
455	1
456	21
456	26
456	39
457	9
457	26
457	27
458	38
459	31
459	42
461	21
461	1
462	35
463	26
464	7
464	13
464	14
464	21
464	26
464	1
465	14
465	26
\.


--
-- Data for Name: musicals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.musicals ("musicalId", title, "musicBy", "lyricsBy", plot, "musicUrl", "imageUrl") FROM stdin;
1	110 In The Shade	Harvey Schmidt	Tom Jones	N. Richard Nash, Harvey Schmidt and Tom Jones explore depression-era love and hope in this musical adaptation of Nash's stage play, The Rainmaker. In the tiny town of Three Point, in the hot and drought-stricken American southwest, traveling con man Bill Starbuck promises the local farmers he can conjure some much-needed rain. Spinster Lizzie Curry, whose advances are rebuffed by Sheriff File, blossoms as she pursues a romantic relationship with the charismatic stranger.	https://music.apple.com/us/album/110-in-the-shade-original-studio-cast/194342797	https://is5-ssl.mzstatic.com/image/thumb/Music/15/43/d6/mzi.zdzosxcp.tif/1000x1000bb.jpeg
2	13	Jason Robert Brown	Jason Robert Brown	Geek. Poser. Jock. Beauty Queen. Wannabe. These are the labels that can last a lifetime. With an unforgettable rock score from Tony Award-winning composer, Jason Robert Brown, (Parade, The Last Five Years, Bridges of Madison County) 13 is a musical about fitting in – and standing out! Evan Goldman is plucked from his fast-paced, preteen New York City life and plopped into a sleepy Indiana town following his parents divorce. Surrounded by an array of simpleminded middle school students, he needs to establish his place in the popularity pecking order. Can he situate himself on a comfortable link of the food chain... or will he dangle at the end with the outcasts?!? Composed of a precocious cast, no character in 13 is older than the show's title, making it wonderful for theatre companies that feature young artists. In the Broadway production, even the band was made up of teens, which is a fantastic way to involve a diverse group of artists. The cast is comprised entirely of teenagers, but the stories that come to life here are ageless, the emotions they explore timeless, the laughter and the memories they provide priceless.	https://music.apple.com/us/album/13-original-broadway-cast-recording/1308278249	https://is3-ssl.mzstatic.com/image/thumb/Music118/v4/6d/8e/60/6d8e6047-1597-c6df-b996-3cbd5c08ab2b/791558441338.jpg/1000x1000bb.jpeg
3	1776	Sherman Edwards	Sherman Edwards	The seminal event in American history blazes to vivid life in this most unconventional of Broadway hits. 1776 puts a human face on the pages of history as we see the men behind the national icons: proud, frightened, uncertain, irritable, charming, often petty and ultimately noble figures, determined to do the right thing for a fledgling nation. It's the summer of 1776, and the nation is ready to declare independence... if only our founding fathers can agree to do it! 1776 follows John Adams of Massachusetts, Benjamin Franklin of Pennsylvania and Thomas Jefferson of Virginia as they attempt to convince the members of the Second Continental Congress to vote for independence from the shackles of the British monarchy by signing the Declaration of Independence. 1776 is a funny, insightful and compelling drama with a striking score and legendary book. It is an extremely flexible show that can be performed with characters as written or as a concert version	https://music.apple.com/us/album/1776-original-broadway-cast-recording/358218885	https://is1-ssl.mzstatic.com/image/thumb/Music/21/d3/18/mzi.xwrhkwix.jpg/1000x1000bb.jpeg
4	21 Chump Street	Lin-Manuel Miranda	Lin-Manuel Miranda	Lin-Manuel Miranda's 21 Chump Street is a 14-minute musical based on a true story as reported in the series This American Life. 21 Chump Street is a cautionary tale of Justin, a high school honors student who falls for a cute transfer girl. Justin goes to great lengths to oblige Naomi's request for marijuana in the hopes of winning her affection - only to find out that his crush is actually an undercover cop planted in the school to find drug dealers. 21 Chump Street discusses the ramifications of peer pressure, conformity and drug use in our schools with a message that will stay with teenagers long after they leave the theater. Perfect for donor evenings, galas, special events and student/community outreach programs.	https://music.apple.com/us/album/21-chump-street-the-musical-ep/892408890	https://is4-ssl.mzstatic.com/image/thumb/Music6/v4/f9/01/98/f9019892-6f03-ebe6-f8fb-9c80f035ba8b/859712827982_cover.tif/1000x1000bb.jpeg
5	35mm: A Musical Exhibition	Ryan Scott Oliver	Ryan Scott Oliver	A picture is worth 1,000 words — what about a song? Can a picture inspire a song or fifteen? In 35mm, each photo creates an unique song, moments frozen in time; a glimmer of a life unfolding, a glimpse of something happening. A stunning new multimedia musical which explores a groundbreaking new concept in musical theatre... This intricately woven collection of stories told through song re-imagines what the modern American musical can be.	https://music.apple.com/us/album/35mm-a-musical-exhibition-original-cast-recording/1306252674	https://is3-ssl.mzstatic.com/image/thumb/Music118/v4/c1/17/79/c1177964-98eb-ad6d-716d-348b2f326282/791558946239.jpg/1000x1000bb.jpeg
6	4 Guys Named José... and una Mujer Named María	Various, Oscar Hernandez	Various	4 Guys Named José and una Mujer Named María was an Off-Broadway smash hit produced by Latin singing sensation, Enrique Iglesias. Paying tribute to the infectious rhythms of Latin music throughout the ages, this spicy show serves up non-stop laughs, intoxicating melodies and a journey through love, loss, nostalgia for one's homeland and the sheer joy of song. Four young Latino men have a chance meeting at Burrito World in Omaha and discover that they share the same name! Even though their ancestral roots differ (Puerto Rico, Cuba, Mexico and the Dominican Republic), they share a common dream: to stage a show of Latin standards that puts forth a positive image to counteract Latino stereotypes. Enter María, a beautiful woman whose vivaciousness entrances the gentlemen, causing them to vie for her attention. And the evening's only just begun! A wild ride that features some of the most evocative Latin music, 4 Guys Named José... and una Mujer Named María is a fantastic show for any type of audience, regardless of ethnicity or age. Standards like "La Bamba," "Guantanamera," "I Like It Like That" and "Bang Bang / Oye Como Va" are featured in this hip-swishing score. 4 Guys Named José... will fit fantastically on any-sized stage because of its small technical demands and cast size.	https://music.apple.com/us/album/four-guys-named-jose-una-mujer-named-maria-original/299662517	https://is1-ssl.mzstatic.com/image/thumb/Music/7d/6c/d0/mzi.ipvdigzm.jpg/1000x1000bb.jpeg
15	A Funny Thing Happened on the Way to the Forum	Stephen Sondheim	Stephen Sondheim	Broadway's greatest farce is light, fast-paced, witty, irreverent and one of the funniest musicals ever written. A Funny Thing Happened on the Way to the Forum takes comedy back to its roots, combining situations from time-tested, 2000-year-old comedies of Roman playwright, Plautus, with the infectious energy of classic vaudeville. A Funny Thing Happened on the Way to the Forum is a nonstop laughfest in which Pseudolus, a crafty slave, struggles to win the hand of a beautiful, but slow-witted, courtesan named Philia for his young master, Hero, in exchange for freedom. The plot twists and turns with cases of mistaken identity, slamming doors and a showgirl or two. This unforgettable, hysterical musical allows a terrific ensemble of comedic actors to shine – "something for everyone, a comedy tonight!"	https://music.apple.com/us/album/funny-thing-happened-on-way-to-forum-original-broadway/463188376	https://is2-ssl.mzstatic.com/image/thumb/Music/5a/33/9c/mzi.mutxeuwt.jpg/1000x1000bb.jpeg
7	42nd Street	Harry Warren	Al Dubin	Come along and listen to the lullaby of Broadway! 42nd Street celebrates Broadway, Times Square and the magic of show biz with wit, humor and pizzazz. At the height of the Great Depression, aspiring chorus girl Peggy Sawyer comes to the big city from Allentown PA, and soon lands her first big job in the ensemble of a glitzy new Broadway show. But just before opening night, the leading lady breaks her ankle. Will Peggy be able to step in and become a star? The score is chock-full of Broadway standards, including "You're Getting To Be A Habit With Me," "Dames," "We're In the Money," "Lullaby of Broadway," "Shuffle Off to Buffalo" and "Forty-Second Street."42nd Street opened on Broadway at the Winter Garden Theatre on August 25, 1980, starring Wanda Richert, Jerry Orbach, and Tammy Grimes. The production eventually moved to the Majestic and St. James Theatres, ultimately running for 3,486 performances. In 2001, the first Broadway revival of 42nd Street ran for 1,524 performances at the Ford Center for the Performing Arts, starring Kate Levering, Michael Cumpsty, and Christine Ebersole.	https://music.apple.com/us/album/42nd-street-original-broadway-cast-recording/261143507	https://is3-ssl.mzstatic.com/image/thumb/Music/88/e7/2f/mzi.crstxivh.jpg/1000x1000bb.jpeg
8	70, Girls, 70	John Kander	Fred Ebb	Based on the 1958 play Breath of Spring by Peter Coke, 70, Girls, 70features a host of great musical comedy roles for older actors. When their Upper West Side retirement hotel, the New Sussex Arms, is slated to be sold to developers, a group of larcenous old folks begins stealing and reselling furs from various New York City stores in order to buy the building for themselves. The show's tuneful score includes "Coffee in A Cardboard Cup," "Go Visit Your Grandmother" and "Yes."	https://music.apple.com/us/album/70-girls-70-original-broadway-cast-recording/213741586	https://is2-ssl.mzstatic.com/image/thumb/Features/05/32/49/dj.lazjsnwz.jpg/1000x1000bb.jpeg
9	9 to 5 The Musical	Dolly Parton	Dolly Parton	9 to 5 The Musical, with music and lyrics by Dolly Parton and book by Patricia Resnick, is based on the seminal 1980 hit movie. Set in the late 1970s. this hilarious story of friendship and revenge in the Rolodex era is outrageous, thought-provoking and even a little romantic. Pushed to the boiling point, three female coworkers concoct a plan to get even with the sexist, egotistical, lying, hypocritical bigot they call their boss. In a hilarious turn of events, Violet, Judy and Doralee live out their wildest fantasy – giving their boss the boot! While Hart remains "otherwise engaged," the women give their workplace a dream makeover, taking control of the company that had always kept them down. Hey, a girl can scheme, can't she? This high-energy show is ideal for a large, mostly female cast, but also has opportunities for talented male dancers. With its jubilant score and easily relatable characters, 9 to 5 is the perfect show for community theatres.	https://music.apple.com/us/album/9-to-5-the-musical-original-broadway-cast-recording/322097154	https://is4-ssl.mzstatic.com/image/thumb/Music/d9/83/1c/mzi.zgvnkoke.jpg/1000x1000bb.jpeg
10	[title of show]	Jeff Bowen	Jeff Bowen	Jeff and Hunter, two struggling writers, hear about a new musical theatre festival. However, the deadline for submissions is a mere three weeks away.	https://music.apple.com/us/album/title-of-show-soundtrack-from-the-musical/1306111495	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/86/e9/f6/86e9f6a4-4b43-85e9-81f7-44941c6f6d83/791558441437.jpg/1000x1000bb.jpeg
11	A Catered Affair	John Bucchino	John Bucchino	A Catered Affair tells the story of a Bronx mother's efforts to give her only daughter the elaborate wedding she never had – and the bride never asked for. In this funny, poignant and oh, so human show of love and disaffection, Harvey Fierstein's book and John Bucchino's score explore both our need for love and true meaning of family.	https://music.apple.com/us/album/a-catered-affair-original-broadway-cast-recording/674774307	https://is4-ssl.mzstatic.com/image/thumb/Music/v4/b7/e5/9d/b7e59da0-dbd1-2065-c9d6-779e826543c0/803607086428_cover.tif/1000x1000bb.jpeg
12	A Christmas Carol (Broadway Version)	Alan Menken	Lynn Ahrens	Broadway heavy hitters, Alan Menken (Disney's Beauty and the Beast,  Disney's The Little Mermaid, Little Shop of Horrors) and Lynn Ahrens (Ragtime, Seussical, Once on This Island), breathe fantastic new life into the classic tale of A Christmas Carol. Ebenezer Scrooge is a prosperous curmudgeon who believes that personal wealth is far more valuable than the happiness and comfort of others. With an infuriated "Bah! Humbug!" Scrooge summates his feelings of Christmas tidings and charitable giving, but he's forced to face his selfish ways when three ghosts on Christmas Eve lead him through his Past, Present and Future. Thanks to their guidance, Scrooge recognizes his faults and greets Christmas morning with a cheerful "Happy Christmas" before spending the day reconnecting and sharing love with those that mean the most to him. A Christmas Carol is a spectacular adaptation of Charles Dickens' most well-known story. Proving its staying power with a decade-long run at the Theatre at Madison Square Garden, A Christmas Carol, is an ideal choice for any theatre hoping to create a holiday tradition.	https://music.apple.com/us/album/christmas-carol-original-soundtrack-from-hallmark-tv/189831554	https://is3-ssl.mzstatic.com/image/thumb/Music/0c/ff/34/mzi.lglugjjo.tif/1000x1000bb.jpg
13	A Class Act	Edward Kleban	Edward Kleban	Ed got his start in the BMI Musical Theater Workshop where he largely amasses the charismatic songbook that has been arranged in A Class Act to dramatize Ed's often hilarious, ultimately heartbreaking journey. An ensemble of 7 inhabit the colorful gallery of friends and loved ones in Ed's life including the legendarily acerbic Lehman Engle, the relentlessly peppy Marvin Hamlisch, and über-creative Michael Bennett. Fourteen years after his death, one of the theater's unsung champions finally got the recognition he always deserved in this vibrant musical about musicals.	https://music.apple.com/us/album/class-act-musical-about-musicals-original-cast-recording/254796446	https://is2-ssl.mzstatic.com/image/thumb/Music/11/b3/e9/mzi.hsannoqk.jpg/1000x1000bb.jpeg
14	A Day in Hollywood, A Night in the Ukraine	Frank Lazarus	Dick Vosburgh	Two one-act plays provide a double feature more hilarious than any presented in Hollywood's heyday: the first, a salute to the Golden Age of film musicals; the second, a rambunctious Marx Bros. farce. Winner of two Tony Awards in the hit Broadway production directed and choreographed by Tommy Tune. *NOTE: A Night in the Ukraine may be produced as a one-act musical. Additional music is available to make it a full evening's entertainment. The libretto remains the same as Act II of Hollywood/Ukraine.A Day in Hollywood may not be produced by itself.	https://music.apple.com/us/album/a-day-in-hollywood-a-night-in-the-ukraine/41825681	https://is5-ssl.mzstatic.com/image/thumb/Music/y2005/m01/d21/h19/s05.ucpczokg.jpg/1000x1000bb.jpeg
301	Raisin	Judd Woldin	Robert Brittan	Raisin ran for three years on Broadway and enjoyed a record-breaking national tour. Lorraine Hansberry's classic is transformed into a soulful, inspiring musical as a proud Black family's quest for a better life explodes in song, dance, and incisive human drama.Raisin was first presented on Broadway by Robert Nemiroff at the 46th Street Theatre on October 18, 1973.	https://music.apple.com/us/album/raisin-original-broadway-cast-recording/260832914	https://is1-ssl.mzstatic.com/image/thumb/Features/d2/84/42/dj.ipkhasyv.jpg/1000x1000bb.jpeg
16	A Gentleman's Guide to Love and Murder	Steven Lutvak	Robert L. Freedman, Steven Lutvak	A Gentleman's Guide to Love and Murder is the knock-'em-dead, uproarious hit and the most-nominated show of the 2014 season. With ten Tony nominations and four wins, including Best Musical, Book, Direction and Costumes, it also earned seven Drama Desk Awards (including Best Musical), four Outer Critics Circle Awards (including Best Musical) and one Drama League Award (Best Musical). When the low-born Monty Navarro finds out that he's eighth in line for an earldom in the lofty D'Ysquith family, he figures his chances of outliving his predecessors are slight and sets off down a far more ghoulish path. Can he knock off his unsuspecting relatives without being caught and become the ninth Earl of Highhurst? And what of love? Because murder isn't the only thing on Monty's mind.... A Gentleman's Guide to Love and Murder is a murderous romp filled with unforgettable music, non-stop laughs and a scene-stealing role for one actor playing all eight of the doomed heirs who meet their ends in the most creative and side-splitting ways. This is a must-produce for any theatre looking for a truly original and fresh new comedy that will delight audiences and leave them begging for more.	https://music.apple.com/us/album/gentlemans-guide-to-love-murder-original-broadway-cast/1303959096	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/06/33/10/06331073-296a-ba28-909c-484f1a1a1060/791558948233.jpg/1000x1000bb.jpeg
17	A Grand Night for Singing	Richard Rodgers	Oscar Hammerstein II	Taste and imagination, the two key ingredients for a first-rate revue, abound in this fresh take on the Rodgers & Hammerstein canon conceived by Tony Award winner Walter Bobbie. Over three decades after the duo's final collaboration, The Sound of Music, took the Great White Way by storm, this new R&H musical opened the 1994 Broadway season with flair and distinction, garnering wildly enthusiastic notices as well as earning two Tony nominations, including Best Musical.	https://music.apple.com/us/album/a-grand-night-for-singing/1443720539	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/68/4d/2a/684d2a2f-de8a-4895-59fd-3a4f1d2e2e02/00030206551693.rgb.jpg/1000x1000bb.jpeg
18	A Little Night Music	Stephen Sondheim	Stephen Sondheim	Sondheim creates a stunning tour de force when he takes Ingmar Bergman's comedy of manners, Smiles of a Summer Night, and turns it into a musical of masterful execution and elegance. Winner of four Tony Awards, this is a musical work that has forever entranced the world of theatre. Set in 1900 Sweden, A Little Night Music explores the tangled web of affairs centered around actress, Desirée Armfeldt, and the men who love her: a lawyer by the name of Fredrik Egerman and the Count Carl-Magnus Malcom. When the traveling actress performs in Fredrik's town, the estranged lovers' passion rekindles. This strikes a flurry of jealousy and suspicion between Desirée; Fredrik; Fredrick's wife, Anne; Desirée's current lover, the Count; and the Count's wife, Charlotte. Both men – as well as their jealous wives – agree to join Desirée and her family for a weekend in the country at Desirée's mother's estate. With everyone in one place, infinite possibilities of new romances and second chances bring endless surprises. A Little Night Music is full of hilariously witty and heartbreakingly moving moments of adoration, regret and desire. This dramatic musical celebration of love is perfect to showcase your highly trained singers with its harmonically advanced score and masterful orchestrations, and contains Sondheim's popular song, the haunting "Send in the Clowns."	https://music.apple.com/us/album/a-little-night-music-original-all-star-cast-recording/1459887119	https://is3-ssl.mzstatic.com/image/thumb/Music113/v4/df/20/4f/df204f93-b7cd-33d0-82e6-2cdcd863d2ac/A_Little_Night_Music_DigiMIX_cover_scan.jpg/1000x1000bb.jpeg
19	A Little Princess	Andrew Lippa	Brian Crawley	Written by Tony-nominated composer/lyricist, Andrew Lippa (The Wild Party), and Brian Crawley (Violet), A Little Princess is based on the novel by Frances Hodgson Burnett, which was honored by School Library Journal as one of the "Top 100 Chapter Books" of all time. This re-imagined version of the classic tale expands beyond the confines of Victorian England to Africa, giving the writers ample opportunity to include lively African music and dance, exotic locales like Mali and Timbuktu and creating an unforgettable journey around the world. Separated from her father and the openhearted Africans who have helped him raise her, young Sara Crewe is sent to boarding school in London. When things go badly for her there, her imaginative powers come to the rescue – helping to transform a drab institution into a place of magic and mystery. As the girl wins the affection of the other boarders, she draws the ire of Miss Minchin, the dour headmistress, who forces Sara to work as a maid when her father is reported dead, and his fortune is seized. Sara counters all of Miss Minchin's best efforts to degrade her, all the while maintaining the grace and virtue of a little princess. A Little Princess is a big show that calls for many younger female actresses, making it perfect for educational institutions. Because of its strong curriculum tie-ins, A Little Princess provides a wonderful opportunity for theatre companies to team up with schools in their area for workshops, talkbacks and more.	https://music.apple.com/us/album/little-princess-musical-original-broadway-cast-recording/1308538145	https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/2e/95/75/2e9575d4-3acd-8824-10a1-3796535ca489/791558945133.jpg/1000x1000bb.jpeg
20	A Man of No Importance	Stephen Flaherty	Lynn Ahrens	Winner of the 2003 Outer Critics Circle Award for Best Musical, A Man of No Importance is the second successful collaboration by the team of Terrence McNally, Lynn Ahrens and Stephen Flaherty, all of whom won Tony Awards for Ragtime. Alfie Byrne is a bus driver in 1964 Dublin whose heart holds secrets that he can't share with anyone but his imagined confidante, Oscar Wilde. When he attempts to put on an amateur production of Wilde's Salome in the local church hall, he confronts the forces of bigotry and shame over a love "that dare not speak its name." But the redemptive power of theatre changes his life and brings his friends back to his side. A Man of No Importance is a rare gem in the canon of musical theatre, one that combines the depth and drama of a play with the lyricism and comedy of a musical. A tender and beautifully woven tale of love, friendship and coming to terms with who we are that is sure to move and inspire your audiences.	https://music.apple.com/us/album/man-no-importance-new-musical-original-cast-recording/183535980	https://is3-ssl.mzstatic.com/image/thumb/Music/f1/38/89/mzi.sbywxcha.tif/1000x1000bb.jpeg
21	A Minister's Wife	Joshua Schmidt	Jan Levy Tranen	A Minister's Wife, a new musical based on George Bernard Shaw's Candida, is set in London in the swirl of a love triangle among energetic, admired Socialist clergyman, Reverend James Morell, his strong-willed and beautiful wife, Candida, and an idealistic young poet, Eugene Marchbanks, who, infatuated with Candida, aims to win her love.	https://music.apple.com/us/album/a-ministers-wife/467425266	https://is3-ssl.mzstatic.com/image/thumb/Music/58/c8/54/mzi.kdowqbsg.jpg/1000x1000bb.jpeg
22	A New Brain	William Finn	William Finn	By the Tony Award-winning authors of Falsettos, here is an energetic, sardonic, often comical musical about a composer during a medical emergency. Gordon collapses into his lunch and awakes in the hospital, surrounded by his maritime-enthusiast lover, his mother, a co-worker, the doctor, and the nurses. Reluctantly, he had been composing a song for a children’s television show that features a frog – Mr. Bungee – and the specter of this large green character and the unfinished work haunts him throughout his medical ordeal. What was thought to be a tumor turns out to be something more operable, and Gordon recovers, grateful for a chance to compose the songs he yearns to produce.A New Brain preemiered at the Lincoln Center Theater in May of 1998 under the direction of Graciela Daniele.	https://music.apple.com/us/album/a-new-brain-2015-new-york-cast-recording/1079097480	https://is1-ssl.mzstatic.com/image/thumb/Music69/v4/43/5b/14/435b1462-4f38-8c33-465d-b302dd046c49/803607163327_cover.jpg/1000x1000bb.jpeg
23	A Slice of Saturday Night	The Heather Brothers	The Heather Brothers	The Heather Brothers' homage to swinging sixties music was a smash hit at the King's Head Theatre and it enjoyed a long run after transferring to London's Arts Theatre.	https://music.apple.com/us/album/a-slice-of-saturday-night-original-london-cast-recording/539813752	https://is5-ssl.mzstatic.com/image/thumb/Music/v4/31/2c/f7/312cf73c-9ad9-3164-847f-7c6eb5a387d9/Cover.jpg/1000x1000bb.jpeg
24	A Taste of Things to Come	Debra Barsha, Hollye Levin	Debra Barsha, Hollye Levin	Smack-dab in the middle of America in Winnetka, Illinois, four women enter a Betty Crocker cooking contest in hopes of changing their lives. What they get is much more than they bargained for. Little did they know that it would take a zoologist from Indiana University, Alfred C. Kinsey, to really get them “cooking”! In an age when people believed the way to a man’s heart was through his stomach, the four women discover that the way to a woman’s heart is through her best friends.	https://music.apple.com/us/album/a-taste-of-things-to-come/1168584373	https://is4-ssl.mzstatic.com/image/thumb/Music71/v4/a5/b0/85/a5b085c2-c245-fd6e-debd-588b31116e6e/4050538252101.jpg/1000x1000bb.jpeg
25	A Year with Frog and Toad	Robert Reale	Willie Reale	A hit on Broadway, A Year with Frog and Toad was nominated for three Tony Awards – including Best Musical. Based on Arnold Lobel's well-loved books, and featuring a hummable score by Robert and Willie Reale, this whimsical show follows two great friends – the cheerful, popular Frog and the rather grumpy Toad – through four fun-filled seasons. Waking from hibernation in the Spring, Frog and Toad plant gardens, swim, rake leaves, go sledding and learn life lessons along the way. The two best friends celebrate and rejoice in the differences that make them unique and special. Part vaudeville, part make believe... all charm, A Year with Frog and Toad tells the story of a friendship that endures throughout the seasons. The jazzy, upbeat score of A Year with Frog and Toad bubbles with melody and wit, making it an inventive, exuberant and enchanting musical for the whole family. It is a perfect show to be performed by an ensemble group of actors and can be produced with either simple or extravagant staging and sets.	https://music.apple.com/us/album/a-year-with-frog-and-toad-original-cast-recording/571088394	https://is1-ssl.mzstatic.com/image/thumb/Music/v4/17/b8/35/17b83565-da46-e3d9-d93d-4d0e053fb651/803607041625_cover.tif/1000x1000bb.jpeg
26	Adding Machine: A Musical	Elmer Rice, Joshua Schmidt, Jason Loewith	Elmer Rice, Joshua Schmidt, Jason Loewith	Darkly comic and heartbreakingly beautiful, Adding Machine, a musical adaptation of Elmer Rice's incendiary 1923 play, tells the story of Mr. Zero, who after 25 years of service to his company is replaced by a mechanical adding machine. In a vengeful rage, he murders his boss.	https://music.apple.com/us/album/adding-machine-a-musical-world-premiere-recording/677342398	https://is5-ssl.mzstatic.com/image/thumb/Music/v4/54/29/d8/5429d8d2-fef3-d9d4-57b7-72576fb45450/803607086527_cover.tif/1000x1000bb.jpeg
27	Adrift in Macao	Peter Melnick	Christopher Durang	Set in 1952 in Macao, China, Adrift in Macao is a loving parody of film noir movies. Everyone that comes to Macao is waiting for something, and though none of them know exactly what that is, they hang around to find out.\r\nThe characters include your film noir standards, like Laureena, the curvaceous blonde, who luckily bumps into Rick Shaw, the cynical surf and turf casino owner her first night in town. She ends up getting a job singing in his night club – perhaps for no reason other than the fact that she looks great in a slinky dress. And don't forget about Mitch, the American who has just been framed for murder by the mysterious villain McGuffin.\r\nWith songs and quips, puns and farcical shenanigans, this musical parody is bound to please audiences of all ages.	https://music.apple.com/us/album/adrift-in-macao-the-new-musical/1144266585	https://is1-ssl.mzstatic.com/image/thumb/Music62/v4/37/65/f0/3765f044-0aca-37d2-67e7-e247070f49a7/191018069568.jpg/1000x1000bb.jpeg
28	Aida	Elton John	Tim Rice	Winner of four 2000 Tony Awards, Elton John and Tim Rice's Aida is an epic tale of love, loyalty and betrayal, chronicling the love triangle between Aida, a Nubian princess stolen from her country, Amneris, an Egyptian princess, and Radames, the soldier they both love. An enslaved Nubian princess, Aida, finds her heart entangled with Radames, an Egyptian soldier who is betrothed to the Pharaoh's daughter, Amneris. As their forbidden love blossoms, Aida is forced to weigh her heart against the responsibility that she faces as the leader of her people. Aida and Radames' love for one another becomes a shining example of true devotion that ultimately transcends the vast cultural differences between their warring nations, heralding a time of unprecedented peace and prosperity. With an unforgettable score, featuring soaring ballads and rousing choral numbers, Aida is a modern crowd-pleaser that embraces multicultural casting and exuberant dancing, staging and singing for large cast sizes.	https://music.apple.com/us/album/aida-original-broadway-cast-recording/1440760777	https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/17/bf/1a/17bf1af2-8e2a-a22a-fdb5-7d81185717df/00050086067176.rgb.jpg/1000x1000bb.jpg
29	Ain't Misbehavin'	Thomas "Fats" Waller	Various	Assembled under the expert eye of director/lyricist, Richard Maltby, Jr., Ain't Misbehavin' is one of the most popular, well-crafted revues of all time and winner of the 1978 Tony Award for Best Musical. The inimitable Thomas "Fats" Waller rose to international fame during the Golden Age of the Cotton Club and that jumpin' new beat, swing music. Although not quite a biography, Ain't Misbehavin' evokes the delightful humor and infectious energy of this American original as a versatile cast struts, strums and sings the songs that he made famous in a career that ranged from uptown clubs to downtown Tin Pan Alley to Hollywood and concert stages in the U.S., Canada and Europe. Featuring five triple-threat actors and a unit set, Ain't Misbehavin' provides the perfect opportunity to deliver a smash hit while minimizing resources. The intoxicating music of Fats Waller will delight and energize audiences as well as provide great insight into a vibrant time in American history and music.	https://music.apple.com/us/album/aint-misbehavin-original-broadway-cast-recording/259887033	https://is4-ssl.mzstatic.com/image/thumb/Music/55/97/ce/mzi.zvugmpjk.jpg/1000x1000bb.jpeg
30	Allegro	Richard Rodgers	Oscar Hammerstein II	This ensemble musical chronicles nearly four decades in the life of an Everyman, Joseph Taylor, Jr., from cradle through a mid-life discovery of who he is and what his life is truly about. The first musical to be staged by a director who was also the choreographer (the legendary Agnes de Mille), the unique structural format allows the saga to whisk us from Joe's birth through his childhood, from college dorm to marriage altar, and on to his career; from the tranquility of his small Midwestern hometown to the hectic din of big city life, in a series of vignettes and musical sequences dazzling in their simplicity and stunning in their impact. Ahead of its time theatrically, Allegro remains timeless in its appeal.Allegro opened on Broadway at the Majestic Theatre on Ocotber 10, 1947, featuring John Battles as Joseph Taylor, Jr., Annamary Dickey asMajorie Taylor, William Ching as Dr. Joseph Taylor, Roberta Jonay as JennieBrinker, Lisa Kirk as Emily, and John Conte as Charlie Townsend.	https://music.apple.com/us/album/allegro-original-cast-recording/272741532	https://is1-ssl.mzstatic.com/image/thumb/Features/2d/c1/3d/dj.kljeztki.jpg/1000x1000bb.jpeg
31	Altar Boyz	Gary Adler and Michael Patrick Walker	Gary Adler and Michael Patrick Walker	With their tight harmonies and spectacular choreography, the Altar Boyz will delight your audiences. As they perform their signature hits such as 'Rhythm In Me,' 'The Calling,' and 'I Believe,' the Boyz question their loyalty to each other and ask whether or not faith is really holding them together. They finally deliver a message of unity, that 'there is no star as bright as its constellation, no harmony in a single voice.'	https://music.apple.com/us/album/the-altar-boyz-original-cast-recording/1306101452	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/ed/bd/99/edbd99b4-6b4d-f028-ddba-627cfc82d40d/791558605037.jpg/1000x1000bb.jpeg
32	American Psycho	Roberto Aguirre-Sacasa, Duncan Sheik	Roberto Aguirre-Sacasa, Duncan Sheik	Based on the electrifying novel by Bret Easton Ellis, the musical tells the story of Patrick Bateman, a young and handsome Wall Street banker with impeccable taste and unquenchable desires. Patrick and his elite group of friends spend their days in chic restaurants, exclusive clubs, and designer labels. But at night, Patrick takes part in a darker indulgence, and his mask of sanity is starting to slip.	https://music.apple.com/us/album/american-psycho-original-london-cast-recording/1440952377	https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/3c/18/22/3c18228a-f1e1-962e-94bf-cb9d178e7bb0/00888072395114.rgb.jpg/1000x1000bb.jpeg
33	Amélie	Craig Lucas, Nathan Tysen, Daniel Messé, Jean Pierre Jeunet, Guillaume Laurant	Craig Lucas, Nathan Tysen, Daniel Messé, Jean Pierre Jeunet, Guillaume Laurant	Amélie is an extraordinary young woman who lives quietly in the world but loudly in her mind. She covertly improvises small but surprising acts of kindness that bring joy and mayhem. But when a chance at love comes her way, Amélie realizes that to find happiness she’ll have to risk everything and say what’s in her heart. Be inspired by this imaginative dreamer who finds her voice, discovers the power of connection, and sees possibility around every corner.	https://music.apple.com/us/album/am%C3%A9lie-a-new-musical-original-broadway-cast-recording/1218955852	https://is3-ssl.mzstatic.com/image/thumb/Music111/v4/e6/f5/32/e6f53232-8463-1415-12f3-ee50c7f8e5ab/190295831134.jpg/1000x1000bb.jpeg
34	An American in Paris	George Gershwin and Ira Gershwin	George Gershwin and Ira Gershwin	Set in the French capital in the wake of World War II, An American in Paris tells the romantic story of a young American soldier, a beautiful French girl, and an indomitable European city – each yearning for a new beginning in the aftermath of international conflict.	https://music.apple.com/us/album/an-american-in-paris-original-broadway-cast-recording/988541990	https://is3-ssl.mzstatic.com/image/thumb/Music7/v4/ab/9a/39/ab9a3919-c2d6-be17-19d6-b951cf72c25a/886445149463.jpg/1000x1000bb.jpeg
35	Anastasia: The Musical	Stephen Flaherty	Lynn Ahrens	The spectacular new musical about discovering who you are and defining who you’re meant to be.From Tony winners Terrence McNally, Stephen Flaherty and Lynn Ahrens, creators of such Broadway classics as Ragtime and Once On This Island, this dazzling show transports its audience from the twilight of the Russian Empire to the euphoria of Paris in the 1920s, as a brave young woman sets out to discover the mystery of her past. Pursued by a ruthless Soviet officer determined to silence her, Anya enlists the aid of a dashing con man and a lovable ex-aristocrat. Together, they embark on an epic adventure to help her find home, love and family.	https://music.apple.com/us/album/anastasia-original-broadway-cast-recording/1239977872	https://is2-ssl.mzstatic.com/image/thumb/Music113/v4/d9/19/87/d919874c-044e-cbc6-b079-903cf0dd46b7/859721178099_cover.jpg/1000x1000bb.jpeg
36	Anne & Gilbert, The Musical	Bob Johnston and Nancy White	Nancy White, Bob Johnston and Jeff Hochhauser	Set in the village of Avonlea and at Redmond College in Halifax, Anne and Gilbert follows Anne's journey to young adulthood and her romance with high school academic rival, Gilbert Blythe. Gilbert is in love with Anne, but she seems to be immune to his declarations of love. In the end, Anne realizes what everyone else already knows: that Gilbert is the love of her life.	https://music.apple.com/us/album/anne-gilbert/217539909	https://is4-ssl.mzstatic.com/image/thumb/Features/41/08/a9/dj.rmvznkln.jpg/1000x1000bb.jpeg
37	Anne of Green Gables - The Musical	Norman Campbell, Donald Harron, L.M. Montgomery	Norman Campbell, Donald Harron, L.M. Montgomery	Based on L.M Montgomery's timeless classic, Anne of Green Gables - The MusicalTM follows the rise of Anne Shirley, a feisty, red-haired orphan who arrives unexpectedly in the small community of Avonlea to the Cuthburts, who were expecting a boy to help on their farm, Green Gables.\r\n The story follows the precocious and imaginative Anne as she captures the hearts and minds of the small farming community - and her new-found family - simply by the virtue of her own pluck and personality. This original, glorious adaptation - now firmly embedded in Canadian national culture and musical theatre canon - continues to enrapture audiences across the world with its rich score and a rare, affecting story for all ages.	https://music.apple.com/us/album/anne-of-green-gables-original-cast-theatreworks-usa/1506628841	https://is4-ssl.mzstatic.com/image/thumb/Music123/v4/40/1d/bc/401dbc59-191c-e5d2-d9e6-957e95b0b6ed/605288208423.jpg/1000x1000bb.jpeg
52	Be More Chill	Joe Iconis	Joe Iconis	Jeremy Heere is just an average teenager. That is, until he finds out about "The Squip," a tiny supercomputer that promises to bring him everything he desires most: a date with Christine, an invite to the raddest party of the year and a chance to survive life in his suburban New Jersey high school. But is being the most popular guy in school worth the risk? Be More Chill is based on the novel by Ned Vizzini.	https://music.apple.com/us/album/be-more-chill-original-cast-recording/1270817056	https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/fd/17/dc/fd17dcc1-6870-3b6f-fff5-0a61992826a5/791558949438.jpg/1000x1000bb.jpeg
38	Annie	Charles Strouse	Martin Charnin	Based on the popular comic strip by Harold Gray, Annie has become a worldwide phenomenon and was the winner of seven Tony Awards, including Best Musical. The beloved book and score by Tony Award winners, Thomas Meehan, Charles Strouse and Martin Charnin, features some of the greatest musical theatre hits ever written, including "Tomorrow." With equal measures of pluck and positivity, little orphan Annie charms everyone's hearts despite a next-to-nothing start in 1930s New York City. She is determined to find the parents who abandoned her years ago on the doorstep of a New York City Orphanage that is run by the cruel, embittered Miss Hannigan. With the help of the other girls in the Orphanage, Annie escapes to the wondrous world of NYC. In adventure after fun-filled adventure, Annie foils Miss Hannigan's evil machinations... and even befriends President Franklin Delano Roosevelt! She finds a new home and family in billionaire, Oliver Warbucks, his personal secretary, Grace Farrell, and a lovable mutt named Sandy. Annie is the perfect family-friendly musical and an ideal show for a largely female cast.	https://music.apple.com/us/album/annie-original-broadway-cast-recording/939941788s	https://is5-ssl.mzstatic.com/image/thumb/Music3/v4/17/02/b4/1702b439-8c76-bd7d-6a8a-c31dda89e81e/886444963183.jpg/1000x1000bb.jpeg
39	Annie Get Your Gun	Irving Berlin	Irving Berlin	Annie Oakley is the best shot around, and she manages to support her little brother and sisters by selling the game she hunts. When she's discovered by Col. Buffalo Bill, he persuades this novel sharpshooter to join his Wild West Show. It only takes one glance for her to fall head over heels for dashing shooting ace Frank Butler, who headlines the show. She soon eclipses Butler as the main attraction which, while good for business, is bad for romance. Butler hightails it off to join a rival show, his bruised male ego leading the way, but is ultimately pitted against Annie in a final shoot-out. The rousing, sure-fire finale hits the mark every time in a testament to the power of female ingenuity.	https://music.apple.com/us/album/annie-get-your-gun-music-theater-lincoln-center-cast/261151705	https://is5-ssl.mzstatic.com/image/thumb/Features/67/fd/75/dj.scdzmoqt.jpg/1000x1000bb.jpeg
40	Anyone Can Whistle	Stephen Sondheim	Stephen Sondheim	Anyone Can Whistle, an absurdist social satire about insanity and conformity (among a dozen other things) is probably the bravest show that Stephen Sondheim wrote, at least until Assassins. A legendary cult show, this wacky, intelligent, highly unconventional musical points ahead to Stephen Sondheim's groundbreaking work in the 1970s, even as it keeps a foot firmly rooted in musical theatre's "golden age." Anyone Can Whistle tells the story of a corrupt mayoress who fakes a miracle to revitalize her bankrupt town (through the resulting pilgrim trade) and the ill-fated romance between the rational nurse, out to expose the fraud, and the easygoing doctor who is determined to enjoy the chaos that it brings. In the end, the show delivers a poignant message about the importance of the individual in a conformist society – but not before aiming its still-relevant barbs at government, religion, science and anything else that stands in its way! With its circus-like atmosphere, Anyone Can Whistle features plenty of memorable, lovably cartoonish roles of all sizes. The dazzling, melodic Broadway-style score overflows with the youthful energy of experimentation, consisting of one showstopper after another, including two extensive ballets that provide opportunities for some inspired choreography.	https://music.apple.com/us/album/anyone-can-whistle-broadway-cast-recording-bonus-track/204122957	https://is5-ssl.mzstatic.com/image/thumb/Music/0f/dd/f5/mzi.tsykpcyo.jpg/1000x1000bb.jpeg
41	Anything Can Happen in the Theater: The Musical World of Maury Yeston	Maury Yeston	Maury Yeston	Anything Can Happen In The Theater: The Musical World Of Maury Yeston is an unforgettable evening in the theater featuring a collection of songs from the two-time Tony Award-winning composer and lyricist. The genius of Yeston's songs – comedic yet emotional, cerebral yet romantic, clever yet unendingly melodic – makes for a memorable evening showcasing the myriad sides of the writer's repertoire. Showstoppers from Nine, Grand Hotel, Titanic, Phantom and Death Takes a Holiday intertwine with premieres of new songs from the Yeston songbook to show off his immense breadth of style – from the hilarious to the deeply moving.Anything Can Happen In The Theater: The Musical World Of Maury Yeston was first performed at The Triad in New York City in October 2017. The show premiered Off-Broadway at the York Theatre on November 26, 2019, under the direction of Gerard Alessandrini. The cast featured Benjamin Eakeley, Jovan E'Sean, Alex Getlin, Justin Keyes and Mamie Parris.	https://music.apple.com/us/album/anything-can-happen-in-theater-musical-world-maury/1503345744	https://is4-ssl.mzstatic.com/image/thumb/Music123/v4/b7/c3/b2/b7c3b252-1ae7-7504-7387-0d4c25c49d20/803607204020_cover.jpg/1000x1000bb.jpeg
42	Anything Goes	Cole Porter	Cole Porter	Music, dance, laughs, and the age-old tale of Boy Meets Girl... Anything Goes is Delightful, Delicious, and De-Lovely.	https://music.apple.com/us/album/anything-goes-new-broadway-cast-recording/1306105925	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/fe/08/60/fe0860b2-8784-2a30-9f50-8ab25623217c/791558945232.jpg/1000x1000bb.jpeg
43	Archy & Mehitabel	George Kleinsinger	Joe Darion	Featuring a book by Joe Darion and comic legend, Mel Brooks, and a "cool" jazz score that remains one of the only examples of this genre in the commercial theatre, Archy & Mehitabel is one of the most daring musicals of its time. This off-beat musical has appeared in almost every form, including a record, a concert, a Broadway musical, a television special and, eventually, a film. In a deserted office, a cockroach dives headfirst onto the keys of a typewriter, pouring out the ruminations of his soul. It's "archy" (he's too small to hold down the shift key), poet, philosopher, moralist and futile worshipper of "mehitabel," the alley cat. This bizarre, highly original musical takes us into the streets of the big city as archy tries hopelessly to bring the "toujours gai" mehitabel off the back fence and into a respectable home as a housecat. Versatile actors play the various urbane, non-human city dwellers that we encounter along the way, suggesting their animal characteristics without explicit costumes. Designers will have a field day with the unit set of oversized props and set pieces. A true gem of the golden age, Archy & Mehitabel is a show not to be overlooked.	https://music.apple.com/us/album/archy-mehitabel-back-alley-opera-studio-cast-recording/451804179	https://is1-ssl.mzstatic.com/image/thumb/Music/ba/70/e5/mzi.tbrcmads.jpg/1000x1000bb.jpeg
44	Aspects of Love	Andrew Lloyd Webber	Don Black and Charles Hart	Aspects of Love is a Tony-nominated musical in two acts, which follows the changing relationships between three generations of a family and their artistic companions, set against a background of post-war France and Italy.	https://music.apple.com/us/album/aspects-love-original-london-cast-recording-remastered/1440715442	https://is1-ssl.mzstatic.com/image/thumb/Music118/v4/1e/01/44/1e014433-e30a-51aa-983f-3a6b9084afa3/00602527619217.rgb.jpg/1000x1000bb.jpeg
45	Assassins	Stephen Sondheim	Stephen Sondheim	A multiple Tony Award-winning theatrical tour-de-force, Assassins combines Sondheim's signature blend of intelligently stunning lyrics and beautiful music with a panoramic story of our nation's culture of celebrity and the violent means some will use to obtain it, embodied by America's four successful and five would-be presidential assassins. Bold, original, disturbing and alarmingly funny, Assassins is perhaps the most controversial musical ever written. Assassins lays bare the lives of nine individuals who assassinated or tried to assassinate the President of the United States, in a one-act historical "revusical" that explores the dark side of the American experience. From John Wilkes Booth to Lee Harvey Oswald, writers, Stephen Sondheim and John Weidman, bend the rules of time and space, taking us on a nightmarish roller coaster ride in which assassins and would-be assassins from different historical periods meet, interact and inspire each other to harrowing acts in the name of the American Dream.	https://music.apple.com/us/album/assassins-the-2004-broadway-revival-cast-recording/881212225	https://is4-ssl.mzstatic.com/image/thumb/Music4/v4/7c/c1/6b/7cc16b11-f369-a355-56f8-e6bdf98608d7/803607042127_cover.tif/1000x1000bb.jpeg
46	Avenue Q	Robert Lopez, Jeff Marx	Robert Lopez, Jeff Marx	Winner of the Tony "Triple Crown" for Best Musical, Best Score and Best Book, Avenue Q is part flesh, part felt and packed with heart. The laugh-out-loud musical tells the timeless story of a recent college grad named Princeton, who moves into a shabby New York apartment all the way out on Avenue Q. He soon discovers that, although the residents seem nice, it's clear that this is not your ordinary neighborhood. Together, Princeton and his new-found friends struggle to find jobs, dates and their ever-elusive purpose in life. Filled with gut-busting humor and a delightfully catchy score, not to mention puppets, Avenue Q is a truly unique show that has quickly become a favorite for audiences everywhere. Although the show addresses humorous adult issues, it is similar to a beloved children's show; a place where puppets are friends, Monsters are good and life lessons are learned.	https://music.apple.com/us/album/avenue-q-original-broadway-cast-recording/255954505	https://is4-ssl.mzstatic.com/image/thumb/Features/6f/57/13/dj.fkhworcs.jpg/1000x1000bb.jpeg
47	Babes in Arms (Guare Version)	Richard Rodgers	Lorenz Hart	In this John Guare adaptation of the classic Rodgers and Hart musical, Valentine and his teenage friends find themselves unsupervised while their folks hit the vaudeville summer circuit. The local sheriff, regarding the kids as indolent loafers, threatens to send them to a work farm. But the determined kids talk the sheriff into a two-week reprieve — just enough time to produce their own show and prove their mettle. The old-fashioned virtues of this early musical comedy are peppered with socio-political issues and a sophisticated jocularity, maintaining the show's delights more than eight decades after its creation.The 1959 adaptation by George Oppenheimer is also available.	https://music.apple.com/us/album/babes-in-arms-studio-cast-recording-1951/475882086	https://is5-ssl.mzstatic.com/image/thumb/Music/06/e8/c4/mzi.emrsjgmz.jpg/1000x1000bb.jpeg
48	Babes in Toyland	Victor Herbert	Glen MacDonough	Babes In Toyland weaves together characters and themes from the Mother Goose nursery rhymes, creating a spectacular, Christmas-themed musical extravaganza.	https://music.apple.com/us/album/babes-in-toyland-original-musical-recording/687652861	https://is2-ssl.mzstatic.com/image/thumb/Music6/v4/2e/19/d8/2e19d838-7066-d881-5bd6-b360e645f7fa/888003033672.jpg/1000x1000bb.jpeg
49	Band Geeks	Mark Allen, Gaby Alter, Tommy Newman	Gaby Alter, Tommy Newman	In the tradition of "Glee" and The 25th Annual Putnam County Spelling Bee, comes Band Geeks, a celebration of the tribulations of the millions who have spent football halftimes pounding out Sousa-like renditions of "Maria." Whether you were in the band, on the team or in the stands, you'll recognize the woes and revel in the fun of Band Geeks. With just nine members and dwindling funds, the Cuyahoga High Marching Beavers are close to extinction. When a troubled athlete is relegated to their ranks, Elliott, the tuba-playing band captain and Laura, his best friend, must find a way to unite the band, embrace their inner geek and save the Marching Beavers. Band Geeks' uncanny ability to bring smiles to audiences' faces is undeniable. A performer and director's dream, every new character that takes the stage is more dynamic than the last. Expertly structured, the piece can provide an incredibly unique opportunity to feature performers who are also skilled musicians. Perfect for nearly any stage — from your high school or college to your community theatre — Band Geeks is a rousing and triumphant musical for all ages!	https://music.apple.com/us/album/band-geeks-a-new-musical-studio-cast-recording/1446911765	https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/0a/23/3e/0a233e10-06db-097b-c42f-a1d07c4ec29b/859729625380_cover.jpg/1000x1000bb.jpeg
50	Barnum	Cy Coleman	Michael Stewart	P.T. Barnum, the Greatest Showman on Earth, combines razzle-dazzle with charm and brass to sell “humbug” to cheering crowds. A joyful and moving musical portrait of the nineteenth century’s greatest show-biz legend, Barnum is a colorful, dynamic spectacle with heart. Cy Coleman and Michael Stewart’s rousing score includes “There’s a Sucker Born Every Minute,” “Join the Circus,” “The Colors of My Life,” and “Come Follow The Band.” Barnum opened at the St. James Theatre on Broadway on April 30, 1980, starring Jim Dale and Glenn Close. The production, which briefly featured Tony Orlando in the title role, played for 854 performances.	https://music.apple.com/us/album/barnum-original-broadway-cast-recording/193193683	https://is5-ssl.mzstatic.com/image/thumb/Music/10/6b/80/mzi.hgkqhupj.jpg/1000x1000bb.jpeg
51	Barry Manilow's Copacabana	Barry Manilow	Bruce Sussman	"Her name was Lola. She was a showgirl...." So begins this tale of romance and stardom that has captivated audiences across the globe. With sensational originality, Barry Manilow's Copacabana is a show that will leave you breathless. Stephen, a present-day, aspiring songwriter, is in the midst of writing a tune that tells the story of Lola: fresh off the plane from Tulsa, she arrives in New York with showbiz aspirations. Tony is a bartender/composer who falls in love with her and helps her become a Copa girl. Lola, of course, attracts the amorous attentions of Rico. When Rico goes a bit too far by abducting Lola and taking her to his rival nightclub in Havana, Tony and the whole Copacabana crew set off to rescue Lola! Audiences will delight in Copacabana's splashy production numbers and the slew of brand new Barry Manilow songs. A return to traditional American musical theatre flair, the large cast size boasts numerous chances for performers to shine, while the title alone will incite the interest of subscribers and entire newcomers to the theatre.	https://music.apple.com/us/album/copacabana-original-london-cast-recording/1278444134	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/15/65/d6/1565d6c0-6381-fa56-87c5-c08578320ec9/884977573022.jpg/1000x1000bb.jpeg
53	Beautiful: The Carole King Musical	Carole King, Cynthia Weil, Gerry Goffin, Barry Mann	Carole King, Cynthia Weil, Gerry Goffin, Barry Mann	Before she was hit-maker Carole King — she was Carole Klein, a spunky, young songwriter from Brooklyn with a unique voice. From the chart-topping hits she wrote for the biggest acts in music to her own life-changing, trailblazing success with Tapestry, Beautiful takes you back to where it all began — and takes you on the ride of a lifetime. Featuring such unforgettable classics as "You've Got a Friend", "One Fine Day", "So Far Away", "Take Good Care of My Baby", "Up on the Roof", "You've Lost That Lovin' Feeling", "Will You Love Me Tomorrow", and "Natural Woman", this Tony® and Grammy® Award-winning musical phenomenon is filled with the songs you remember — and a story you'll never forget.	https://music.apple.com/us/album/beautiful-carole-king-musical-original-broadway-cast/1269596470	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/a1/70/ea/a170ea2d-1ec2-231e-51f2-3024b21c8b17/791558948332.jpg/1000x1000bb.jpeg
54	Beauty and the Beast	Alan Menken	Howard Ashman	Step into the enchanted world of Broadway's modern classic, Disney's Beauty and the Beast, an international sensation that played a remarkable 13-year run on Broadway and has been produced in 37 countries worldwide. Based on the Academy Award-winning animated feature, the stage version includes all of the wonderful songs written by Alan Menken and the late Howard Ashman, along with new songs by Mr. Menken and Tim Rice. The original Broadway production ran for over thirteen years and was nominated for nine Tony Awards, including Best Musical. The classic story tells of Belle, a young woman in a provincial town, and the Beast, who is really a young prince trapped under the spell of an enchantress. If the Beast can learn to love and be loved, the curse will end and he will be transformed into his former self. But time is running out. If the Beast does not learn his lesson soon, he and his household will be doomed for all eternity. This "tale as old as time" is filled with spectacular costume and set opportunities or, even more simply staged, Disney's Beauty and the Beast offers a great opportunity to bring your entire community together for family theatre at its best.	https://music.apple.com/us/album/beauty-beast-broadway-musical-original-broadway-cast/1440778057	https://is1-ssl.mzstatic.com/image/thumb/Music118/v4/d2/83/a7/d283a7ff-a8fb-9d58-6461-c88893da8e28/00050086086177.rgb.jpg/1000x1000bb.jpeg
55	Beetlejuice	Eddie Perfect	Eddie Perfect	The ghost-with-the-most comes to the stage in this edgy and irreverent musical comedy based on Tim Burton’s dearly beloved film. Beetlejuice tells the story of Lydia Deetz, a strange and unusual teenager obsessed with the whole “being dead thing.” Lucky for Lydia, her new house is haunted by a recently deceased couple and Beetlejuice, a delightful demon with a real zest for life. When Lydia calls on Beetlejuice to scare away anyone with a pulse, this double-crossing specter shows his true stripes, unleashing a (Nether)world of pandemonium, and the biggest sandworm Broadway has ever seen.	https://music.apple.com/us/album/beetlejuice-original-broadway-cast-recording/1466050440	https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/3e/f7/ec/3ef7ec17-aa73-7e2a-6382-9959226d7038/791558459739.jpg/1000x1000bb.jpeg
56	Bells Are Ringing	Jule Styne	Betty Comden and Adolph Green	This charming romantic comedy follows the exploits of Ella, a telephone answering service operator with a fascination for her client's private lives. At Susanswerphone, Ella uses a variety of voices and personae to keep herself entertained. As she follows the lives of her customers, Ella becomes inextricably involved with a handsome playwright, a fledgling record company, and a dangerous crime ring.	https://music.apple.com/us/album/bells-are-ringing-original-broadway-cast/192711376	https://is5-ssl.mzstatic.com/image/thumb/Features/9c/4d/f7/dj.nmwjbjgb.jpg/1000x1000bb.jpg
57	Ben Franklin in Paris	Mark Sandrich, Jr.	Sidney Michaels	Robert Preston starred on Broadway as the nation's first elder statesman as he travels to France to win support for new colonial America, encountering a former flame in the person of Lady Diane who helps him win his cause.	https://music.apple.com/us/album/ben-franklin-in-paris/716418548	https://is4-ssl.mzstatic.com/image/thumb/Music/v4/5b/0c/b5/5b0cb50d-d98d-3fbe-70de-a854bdfab8e8/00724356513457.jpg/1000x1000bb.jpeg
59	Big River	Roger Miller	Roger Miller	Be swept away by the river with Huckleberry Finn as he helps his friend Jim escape to freedom.	https://music.apple.com/us/album/big-river-adventures-huckleberry-finn-1985-original/1440767533	https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/9f/fd/f2/9ffdf26f-c415-9991-3739-834404ca5f43/00076732614723.rgb.jpg/1000x1000bb.jpeg
60	Billy Elliot The Musical	Elton John	Lee Hall	Millions of fans... thousands of standing ovations... ten Tony Awards, including Best Musical.... This is  Billy Elliot The Musical, the spectacular show with the heart, humor and passion to be named TIME Magazine's "Best Musical of the Decade!" Based on the international smash-hit film, and featuring a score by music legend Elton John, Billy Elliot is an astonishing theatrical experience that will stay with you forever. Set in a northern English mining town against the background of the 1984 miners' strike, Billy Elliot is the inspirational story of a young boy's struggle against the odds to make his dream come true. Follow Billy's journey as he stumbles out of the boxing ring and into a ballet class, where he discovers a passion for dance that inspires his family and community... and changes his life forever. With a powerful storyline, rousing songs and opportunities for sensational choreography Billy Elliot is the perfect opportunity to blow audiences away. A large cast of children provides the perfect opportunity to feature dance programs in your area and let your young talent SHINE! Download the logo and full marketing guidelines here.	https://music.apple.com/us/album/billy-elliot-the-musical-original-cast-recording/1440745350	https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/d8/3f/94/d83f9409-4c62-263e-ae9b-bae09b7b91ea/00602498752166.rgb.jpg/1000x1000bb.jpeg
80	Carousel	Richard Rodgers	Oscar Hammerstein II	Billy Bigelow, a swaggering, carefree carnival barker, falls in love with and marries the sweet but naive Julie Jordan. A stunning tale of hope, redemption, and the power of love.	https://music.apple.com/us/album/rodgers-hammersteins-carousel-2018-broadway-cast-recording/1391405459	https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/1c/a1/eb/1ca1eb77-7a18-0ce8-46d0-13d002403e07/00888072066267.rgb.jpg/1000x1000bb.jpeg
61	Bloody Bloody Andrew Jackson	Michael Friedman	Michael Friedman	A.J. kicked British butt, shafted the Indians and smacked down the Spaniards, all in the name of these United States — who cares if he didn't have permission? Bloody Bloody Andrew Jackson creators, Michael Friedman (Love's Labour's Lost, The Fortress of Solitude) and Alex Timbers (Love's Labour's Lost, Peter and the Starcatcher), cook up an alternate universe (and draw parallels to today's political/populist landscape) with their musical about the seventh U.S. president. Bloody Bloody Andrew Jackson follows America's seventh president from his early days as a child on the wild frontier to his controversial reign in the White House. With the country divided into rich and poor (and with continued skirmishes with the Native Americans upsetting pieces of the new world), Jackson begins his steady climb from military strategist to populist rabble-rouser to President of the United States. Along the way, he meets his wife, Rachel, takes on the Founding Fathers — and rocks like no political figure has ever rocked before, with the help of an onstage trio and an entourage of singing, joking cohorts. It also asks the question: is wanting to have a beer with someone reason enough to elect him? What if he's really, really hot? With a raucous blend of outrageous comedy, anarchic theatricality and an infectious rock score, this wildly entertaining 90-minute show is perfect for comedic actors and singers, with minimal dancing required. Bloody Bloody Andrew Jackson is an actor-driven, rather than design-dependent, musical; it encourages breaking the fourth wall, audience participation and rocking out!	https://music.apple.com/us/album/bloody-bloody-andrew-jackson-original-cast-recording/1303837291	https://is1-ssl.mzstatic.com/image/thumb/Music118/v4/ce/e8/e1/cee8e12d-e174-b2e2-6b9a-b91de5f303bd/791558444339.jpg/1000x1000bb.jpeg
62	Bombay Dreams	A.R. Rahman	Don Black	Bombay Dreams tells the story of Akaash, a young slum dweller, who dreams of becoming a huge movie star, and of his fateful encounter with beautiful Priya, the daughter of one of Bollywood’s greatest film directors. Can he achieve his dream of stardom or will this come at a price? Will Akaash and Priya’s love survive? And will they find, like in all the best Bollywood movies, their happy ending?	https://music.apple.com/us/album/bombay-dreams-original-london-cast-recording/1444008769	https://is4-ssl.mzstatic.com/image/thumb/Music118/v4/6d/c3/b8/6dc3b826-9acd-bf38-d43a-5dec81c9a8db/00602557593266.rgb.jpg/1000x1000bb.jpeg
63	Bonnie & Clyde	Frank Wildhorn	Don Black	At the height of the Great Depression, Bonnie Parker and Clyde Barrow went from two small-town nobodies in West Texas to America's most renowned folk heroes and Texas law enforcement's worst nightmares. Fearless, shameless and alluring, the Tony-nominated Bonnie & Clyde, from the legendary Frank Wildhorn (Jekyll & Hyde, Civil War, Dracula) is the electrifying story of love, adventure and crime that captured the attention of an entire country. When Bonnie and Clyde meet, their mutual cravings for excitement and fame immediately set them on a mission to chase their dreams. Their bold and reckless behavior turns the young lovers' thrilling adventure into a downward spiral, putting themselves and their loved ones in trouble with the law. Forced to stay on the run, the lovers resort to robbery and murder to survive. As the infamous duo's fame grows bigger, their inevitable end draws nearer. Bonnie & Clyde is a thrilling and sexy musical with a non-traditional score, combining blues, gospel and rockabilly music. It is a wonderful option for featuring large ensemble casts and an opportunity to showcase your strong contemporary singers and actors.	https://music.apple.com/us/album/bonnie-clyde-original-broadway-cast-recording/521204332	https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/fc/95/e2/fc95e2f2-47ce-d728-a540-30a3698b25b9/884501694346_cover.jpg/1000x1000bb.jpeg
64	Brigadoon	Frederick Loewe	Alan Jay Lerner	Lerner and Loewe’s Brigadoon is the enchanting and beloved Broadway and West End musical that inspired the classic MGM film, and numerous productions all over the world. Featuring such standards as "Almost Like Being in Love," "Come to Me, Bend To Me," and "Heather on the Hill," Brigadoon is a timeless, romantic classic which vividly brings the mystery and magic of the Scottish highlands to life. New Yorker Tommy Albright unexpectedly arrives at the mysterious Scottish Highland village of Brigadoon, which only appears for one day every 100 years. When Tommy meets and falls in love with Fiona, a beautiful villager in this magical hamlet, he must decide whether to return to his old life, or stay in Brigadoon — forever.	https://music.apple.com/us/album/lerner-loewes-brigadoon-new-york-city-center-2017-cast/1445463245	https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/77/22/5e/77225e32-3712-9a28-26f4-05e5037cb63f/791558455137.jpg/1000x1000bb.jpeg
65	Bright Lights, Big City	Paul Scott Goodman	Paul Scott Goodman	Based on the novel of the same name, this show follows Jamie, an aspiring writer stuck in fact-checking, as he hides from pain and loss by partying in the drug-infested clubs of Manhattan during the 1980s. The rock-n-roll score provides a robust sound that echoes Jamie's inner torment as he wanders aimlessly through the city's seedy party scene. After losing his wife and job, Jamie spirals out of control. Fortunately for him, the bonds of family and the promise of love are strong enough to intervene and provide a way out. Bright Lights, Big City carries the message of hope for the future, no matter what is at present.	https://music.apple.com/us/album/bright-lights-big-city-original-cast-recording/1307193493	https://is3-ssl.mzstatic.com/image/thumb/Music118/v4/c6/aa/f7/c6aaf776-a6df-9965-d953-81f4cf81b6c7/791558198430.jpg/1000x1000bb.jpeg
66	Bring It On The Musical	Tom Kitt	Amanda Green	Bitingly relevant, sprinkled with sass, and inspired by the hit film, Bring It On The Musical takes audiences on a high-flying journey that is filled with the complexities of friendship, jealousy, betrayal and forgiveness. Uniting some of the freshest and funniest creative minds on Broadway, Bring It On features an original story by Tony Award winner, Jeff Whitty (Avenue Q), music and lyrics by Tony Award-winning composer, Lin-Manuel Miranda (In the Heights, Hamilton), music by Pulitzer- and Tony Award-winning composer, Tom Kitt (Next to Normal), lyrics by Broadway lyricist, Amanda Green (High Fidelity), and was nominated for the Tony Award for Best Musical. Campbell is cheer-royalty at Truman High School and her senior year should prove the most cheertastic — she's been named captain of the squad! But, an unexpected redistricting has forced her to spend her final year of high school at the neighboring hard-knock Jackson High School. Despite having the deck stacked against her, Campbell befriends the dance crew girls and, along with their headstrong and hardworking leader, Danielle, manages to form a powerhouse squad for the ultimate competition — the National Championships. Bring It On is ideal for any company with talented, young performers, whether they're singers, dancers, actors or cheerleaders. The show's name alone will fill the seats, and audiences' word of mouth will pack the house. With a colorful assortment of characters, an exciting fresh sound and explosive choreography with aerial stunts, this hilarious, universal story is sure to be everything that you hoped for and nothing like you expected.	https://music.apple.com/us/album/bring-it-on-the-musical-original-broadway-cast-recording/563598497	https://is2-ssl.mzstatic.com/image/thumb/Music/v4/ae/db/3b/aedb3bba-d56b-32cf-3170-d32703bed748/BringItOn_Itune_ka_pl_1R1.jpg/1000x1000bb.jpeg
67	Bugsy Malone	Paul Williams	Paul Williams	Based on the hit 1976 film starring a preteen Scott Baio and Jodi Foster, and featuring a catchy, swinging score by the composer of The Muppet Movie, Bugsy Malone is good, clean, comedic fun! Two gangs comprised completely of children, square off in a 1920s rivalry of Capone-ian standards. Dandy Dan's gang has gotten the upper hand since obtaining the "splurge" gun (a weapon that shoots whipped cream). Now, Fat Sam and his bumbling buffoons are in real trouble! Bugsy Malone, a one-time boxer, is thrust not-so-willingly into the gangster limelight when he becomes the last chance that Fat Sam's gang has of surviving. All Bugsy really wants to do is spend time with his new love, Blousey, but that just isn't in the cards for our hero. Bugsy Malone is a master class in musical comedy. The libretto tosses the reader into uproarious laughter without even being staged. Imagine how delightful it is when it's brought to life! Not to mention, Bugsy Malone is a fantastic choice for school groups and programs with a large talent pool of young performers.	https://music.apple.com/us/album/bugsy-malone-original-london-cast/201992433	https://is2-ssl.mzstatic.com/image/thumb/Music/b1/00/1a/mzi.qrxoizqg.tif/1000x1000bb.jpeg
68	Bullets over Broadway The Musical	Various	Various	Loaded with big laughs, colorful characters and the songs that made the '20s roar, Bullets over Broadway The Musical is bringing musical comedy back with a bang. Based on the screenplay of the acclaimed 1994 film by Woody Allen and Douglas McGrath, this six-time Tony-nominated musical features existing hits from the 1920s, including "Let's Misbehave," "'T'ain't Nobody's Biz-ness If I Do" and "There's a New Day Comin'!" David Shayne is a straight-arrow playwright who plans to stand firm against compromising his work but quickly abandons that stance when his producer finds a backer to mount his show on Broadway. There's just one catch, however: the backer is a mobster who sees Shayne's play as a vehicle for his ditzy, talent-free girlfriend. Throw in an aging diva, a savant hit-man and a bevy of beautiful chorus girls, and this is one Broadway show that is sure to knock 'em dead. Bullets over Broadway is a love letter to the Golden Age of Broadway, filled with unforgettable songs that audiences remember and love. With a handful of over-the-top character roles and a high-stepping ensemble, this is a perfect choice for theatres looking for a big, splashy and wildly entertaining production.	https://music.apple.com/us/album/bullets-over-broadway-original-broadway-cast-recording/876039898	https://is4-ssl.mzstatic.com/image/thumb/Music/v4/ab/8c/05/ab8c052a-b766-39e4-eff1-d8175c7ee67e/886444634779.jpg/1000x1000bb.jpeg
69	By Jupiter	Richard Rodgers	Lorenz Hart	An army of Greek warriors set off for the land of the Amazons on a mission to capture the Sacred Girdle of Diana, currently flattering the figure of the Queen of the Amazons. Upon their arrival they are dumbfounded to discover that, in this land, the women rule and do battle while the men mind the children and buy new hats. The Greeks are seized and hauled before the female council, who are initially nonplussed by the notion of equality for men. However, over the course of two hilarious acts, a dozen captivating Rodgers & Hart songs, and a meeting of the minds, there's the inevitable meeting of the hearts.	https://music.apple.com/us/album/by-jupiter-1967-off-broadway-revival-cast-recording/463785135	https://is4-ssl.mzstatic.com/image/thumb/Music/c0/9e/44/mzi.cxkdyrec.jpg/1000x1000bb.jpeg
70	By the Beautiful Sea	Arthur Schwartz	Dorothy Fields	Holding court among some of the highest regarded works, By the Beautiful Sea is an absolute jewel of musical theatre's Golden Age. Featuring a winning book and score by Herbert and Dorothy Fields and Arthur Schwartz, this breezy and delightful charmer is set by the seashore in the "good old summertime" of yore. Lottie Gibson, renowned vaudeville performer, has returned to her family-owned boarding house in Coney Island to spend the summer. To the delight of the community, dashing Shakespearean actor, Dennis Emery, is bringing works of The Bard to the seashore town. Rumor has it that Mr. Emery's sets are being withheld elsewhere. Eager to please her new beau, Lottie writes Emery a check to get his show up and running. The apple of her eye has a few immaculately kept secrets of his own that are far more than financial. Heartwarming hilarity ensues as all set about to uphold their reputations by any means necessary. A riotous romp into a time of sheer ecstasy, By the Beautiful Sea is a wonderful opportunity for a company to flex its technical muscles and feature the talents of a variety of performers.	https://music.apple.com/us/album/by-the-beautiful-sea-music-from-the-original-broadway-cast/716190520	https://is2-ssl.mzstatic.com/image/thumb/Music4/v4/ad/7e/7c/ad7e7c78-c78b-0763-9360-970176f081f4/00724382672050.jpg/1000x1000bb.jpeg
71	Bye Bye Birdie	Charles Strouse	Lee Adams	A loving send-up of the 1950s, small-town America, teenagers, and rock & roll, Bye Bye Birdie remains as fresh and vibrant as ever. Teen heartthrob Conrad Birdie has been drafted, so he chooses All-American girl Kim MacAfee for a very public farewell kiss. Featuring a tuneful high-energy score, plenty of great parts for teens, and a hilarious script, Birdie continues to thrill audiences around the world.Bye Bye Birdie opened on Broadway, April 14, 1960 and played for 607 performances at the Martin Beck Theatre (later at the 54th Street and the Shubert Theatres) starring Chita Rivera as Rose and Dick Van Dyke as Albert. The show played for 268 performances in London at Her Majesty's Theatre. In 2009, it was revived on Broadway at Henry Miller’s Theatre.	https://music.apple.com/us/album/bye-bye-birdie-original-broadway-cast-recording/1452190716	https://is5-ssl.mzstatic.com/image/thumb/Music114/v4/3e/28/59/3e2859b0-8b4d-e02b-3c63-29538154cdb1/00731458643227.rgb.jpg/1000x1000bb.jpeg
72	Cabaret	John Kander	Fred Ebb	Cabaret opened on Broadway on November 20, 1966, and played for1,165 performances at the Broadhurst, Imperial, and Broadway Theatres.The London production ran for 336 performances at the Palace Theatre.The show was revised for Broadway, first in 1987, when it played for 261performances at the Imperial and Minskoff Theatres, and again in 1998at Studio 54, where it played for 2,377 performances. In 2014, Cabaret returned to Broadway at Studio 54, playing an additional 388 performances.	https://music.apple.com/us/album/cabaret-new-broadway-cast-recording/400092764	https://is3-ssl.mzstatic.com/image/thumb/Music/c9/79/ef/mzi.pwbcuvyu.jpg/1000x1000bb.jpg
73	Call Me Madam	Irving Berlin	Irving Berlin	Once President Harry S. Truman appointed Washington hostess Perle Mesta as Ambassador to Luxembourg, the foundation was laid for a musical comedy that would kid politics-foreign and domestic alike. Ambassador Sally Adams, with slim credentials, is sent off to administer in the tiny duchy of Lichtenburg. It's not long before her down-to-earth, typically undiplomatic manner has surprised and charmed the local gentry, especially the handsome Prime Minister. A second romance is blossoming between her young Ivy League aid and Lichtenburg's enchanting young Princess. The course of love is threatened by the stuffy opposition, who eventually succeed in wrangling Sally's recall, but not before all has resolved happily for both pairs of lovers.	https://music.apple.com/us/album/call-me-madam-broadway-cast-recording/546013123	https://is3-ssl.mzstatic.com/image/thumb/Music/v4/33/b3/9f/33b39fe3-f816-e0de-8cae-8e7e41337180/886443486010.jpg/1000x1000bb.jpeg
74	Calvin Berger	Barry Wyner	Barry Wyner	At a contemporary high school, Calvin Berger is smitten by the beautiful Rosanna, but he feels insecure because of the size of his nose. Rosanna, in turn, is attracted to the good-looking newcomer, Matt, who is painfully shy and inarticulate around her, although the attraction is mutual. Hoping to get closer to Rosanna through his eloquent love notes, Calvin offers to be Matt’s “speech writer,” all the while ignoring the signals of attraction from another girl, his best friend, Bret. When the deception unravels, everybody’s friendship is seriously jeopardized, but Calvin eventually realizes that his preoccupation with his appearance had led him astray, and his eyes are opened to Bret, who'd been there all along.	https://music.apple.com/us/album/calvin-berger-original-cast-recording/1306108579	https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/8c/b2/e3/8cb2e303-e696-5ac0-ed77-a122cc992598/791558946130.jpg/1000x1000bb.jpeg
75	Camelot	Frederick Loewe	Alan Jay Lerner	Borrowing from the Arthurian legends, Lerner and Loewe’s Camelot is the duo’s fantastical masterpiece which triumphed on Broadway in a legendary original production that lead to a film version, and numerous revivals in New York, London and across the globe. Its Original Broadway Cast Album topped the charts  for 60 weeks, with a rich score boasting such gems  as "If Ever I Would Leave You," “I Loved You Once in Silence,” "The Lusty Month of May," and of course, "Camelot." An idealistic young King Arthur hopes to create a kingdom built on honor and dignity, embodied by his Knights of The Round Table.  His Ideals, however are tested when his lovely queen, Guenevere, falls in love with the young Knight, Lancelot and the fate of the kingdom hangs in the balance.	https://music.apple.com/us/album/camelot-original-1960-broadway-cast-recording/158476378	https://is3-ssl.mzstatic.com/image/thumb/Features/b5/34/43/dj.fwnabeui.jpg/1000x1000bb.jpeg
76	Candide (1999 Version)	Leonard Bernstein	John Latouche, Richard Wilbur	A score by legendary Leonard Bernstein is but the tip of the iceberg when it comes to Candide and its theatrical offerings. With a book from Hugh Wheeler and lyrical contributions from the incomparable Stephen Sondheim, Candide is a masterpiece for the ages. Candide – the bastard cousin of Baron Thunder-Ten-Tonck – is expelled from home, dragged into the Bulgarian army, brought before the Spanish Inquisition, swindled out of a fortune, shipwrecked on a desert isle and separated time and again from his true love, Cunegonde. She, too, bears a barrage of misfortunes, including – but not limited to – sale into prostitution, forced marriage to an exorbitantly wealthy man and slavery. Through it all, however, they try remember the lessons of their dear master, Dr. Pangloss: "Everything is for the best in this best of all possible worlds." Elements of the original 1953 version – along with songs that had been dropped, rewritten or re-conceived – have been added or altered in this version in an effort to create a slightly reimagined version of the classic Candide. This version requires a large ensemble with a strong female lead. It is the perfect opportunity to showcase your trained singers of varying ages.	https://music.apple.com/us/album/candide-original-broadway-cast-recording/158824188	https://is1-ssl.mzstatic.com/image/thumb/Music/81/22/25/mzi.jpszpgfd.jpg/1000x1000bb.jpeg
77	Cannibal! The Musical	Trey Parker	Trey Parker	Cannibal! The Musical is the true story of the only person convicted of cannibalism in America - Alfred Packer. The sole survivor of an ill-fated trip to the Colorado Territory, he tells his side of the harrowing tale to news reporter Polly Pry as he awaits his execution. And his story goes like this: While searching for gold and love in the Colorado Territory, he and his companions lost their way and resorted to unthinkable horrors, including toe-tapping songs!	https://music.apple.com/us/album/cannibal-the-musical-original-motion-picture-soundtrack/872683716	https://is4-ssl.mzstatic.com/image/thumb/Music6/v4/d0/25/8f/d0258fba-29da-8124-4d54-9f0dd45acbb5/888831001188.jpg/1000x1000bb.jpeg
79	Caroline, or Change	Jeanine Tesori	Tony Kushner	Set in one of the most pivotal times in America's history, the Tony-nominated Caroline, or Change is riveting, moving and awe-inspiring. Featuring a virtuosic score by Jeanine Tesori (Shrek The Musical, Thoroughly Modern Millie), it blends blues, gospel and traditional Jewish melodies, creating a breathtaking medium for Kushner's provocative and personal story. In 1963, the Gellman family and their African-American maid, Caroline, live in sleepy Lake Charles, Louisiana. Caroline is drifting through life as a single mother of four working in a service job to a white family. A fragile, yet beautiful friendship develops between the young Gellman son, Noah, and Caroline. Noah's stepmother, Rose, unable to give Caroline a raise, tells Caroline that she may keep the money that Noah leaves in his pockets. Caroline balks and refuses to take money from a child but her own children desperately need food, clothing and shoes. Outside of the laundry room, some of the greatest social advancements that the country has seen are being set in motion, and change is knocking on the door. Caroline, or Change, produces a valuable theatrical experience that continues to thrill audiences the world over. It is a story that must be shared and will touch hearts. It is a story that will open minds. It is a story that will change theatergoers for the better. Featuring one of the most powerful female roles in musical theatre, Caroline, or Change is a true tour de force that will leave audiences breathless. "...'Of anything I've ever done, I'm proudest of Caroline, or Change,' said Mr. Kushner..." – The New York Times	https://music.apple.com/us/album/caroline-or-change-original-broadway-cast-recording/1452788115	https://is4-ssl.mzstatic.com/image/thumb/Music124/v4/4a/d3/6d/4ad36d9c-47c6-6c82-0c53-ae0163c3621f/00720616243621.rgb.jpg/1000x1000bb.jpeg
81	Carrie: The Musical	Michael Gore	Dean Pitchford	Carrie White is a teenage outcast who longs to fit in. At school, she’s bullied by the popular crowd, and virtually invisible to everyone else. At home, she's dominated by her loving but cruelly controlling mother. What none of them know is that Carrie’s just discovered she’s got a special power, and if pushed too far, she’s not afraid to use it.	https://music.apple.com/us/album/carrie-the-musical-premiere-cast-recording/1308285522	https://is4-ssl.mzstatic.com/image/thumb/Music128/v4/26/22/46/262246c5-92a3-6c2d-c481-c0e516725dac/791558966039.jpg/1000x1000bb.jpg
82	Catch Me If You Can	Marc Shaiman	Marc Shaiman	Based on the hit film and the incredible true story, Catch Me If You Can is the high-flying musical comedy about chasing your dreams and not getting caught. Nominated for four Tony awards, including Best Musical, this delightfully entertaining show was created by a Tony Award-winning "dream team," with a book by Terrence McNally (The Full Monty, Ragtime) and a swinging score by Marc Shaiman and Scott Wittman (Hairspray). Seeking fame and fortune, precocious teenager, Frank Abignale, Jr., runs away from home to begin an unforgettable adventure. With nothing more than his boyish charm, a big imagination and millions of dollars in forged checks, Frank successfully poses as a pilot, a doctor and a lawyer – living the high life and winning the girl of his dreams. When Frank's lies catch the attention of FBI agent, Carl Hanratty, though, Carl pursues Frank across the country to make him pay for his crimes. Catch Me If You Can is a big and bright spectacle with high-energy dance numbers and a riveting story, making it an ideal choice for Community and Professional theatres. High School performers will enjoy portraying characters of a similar age and will relish the opportunity to sing Shaiman's and Wittman's sparkling new songs.	https://music.apple.com/us/album/catch-me-if-you-can-original-broadway-cast-recording/1309242341	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/0d/c1/3d/0dc13d1d-35f8-aa2b-4ee0-3271d2d4ef81/791558944938.jpg/1000x1000bb.jpeg
83	Cats	Andrew Lloyd Webber, T.S. Eliot, Trevor Nunn, Richard Stilgoe	Andrew Lloyd Webber, T.S. Eliot, Trevor Nunn, Richard Stilgoe	One of the world’s best-known and meow-velous musicals!	https://music.apple.com/us/album/cats-original-broadway-cast-recording/1440869612	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/96/67/95/96679593-10b3-0470-1e06-f2bdc0773e48/00602557802054.rgb.jpg/1000x1000bb.jpeg
84	Charlie And The Chocolate Factory	Marc Shaiman	Scott Wittman	Based on the famous novel by Roald Dahl,  Charlie and the Chocolate Factory features an original score composed by Marc Shaiman with lyrics by Shaiman and Scott Wittman (Hairspray) and a book by David Greig. The score also pays homage to the Leslie Bricusse/Anthony Newley score from the 1971 film with songs from the motion picture including "Candy Man," "I've Got a Golden Ticket," "Oompa Loompa Song," and "Pure Imagination." The world-famous Willy Wonka is opening the gates to his mysterious factory…but only to a lucky few. Young Charlie Bucket and four other golden ticket winners will embark on a life-changing journey through Wonka’s world of pure imagination including chocolate waterfalls, nutty squirrels and the great glass elevator, all to be revealed by Wonka's army of curious Oompa-Loompas. Charlie and the Chocolate Factory is your golden ticket to producing a crowd-pleasing, outrageous ensemble musical with plenty of delicious roles.	https://music.apple.com/us/album/charlie-chocolate-factory-original-broadway-cast-recording/1233829327	https://is4-ssl.mzstatic.com/image/thumb/Music127/v4/00/17/13/0017137b-f9de-3105-31c2-8ddab2246f58/886446469874.jpg/1000x1000bb.jpeg
85	Chess	Bjorn Ulvaeus and Benny Andersson	Tim Rice	 In this musical, the ancient game becomes a metaphor for romantic rivalries, competitive gamesmanship, super-power politics, and international intrigues. The pawns in this drama form a love triangle: the loutish American chess star, the earnest Russian champion, and a Hungarian American female assistant who arrives at the international chess match in Bangkok with the American, but falls for the Russian. From Bangkok to Budapest the players, lovers, politicians, and spies manipulate and are manipulated to the pulse of a monumental rock score that includes “One Night in Bangkok” and “Heaven Help My Heart.”	https://music.apple.com/us/album/chess-the-original-recording-remastered-deluxe-edition/1440851421	https://is4-ssl.mzstatic.com/image/thumb/Music118/v4/5f/a3/be/5fa3bee7-82e1-5ab6-0317-7377f7ed2f81/00602547084149.rgb.jpg/1000x1000bb.jpeg
86	Chicago	John Kander	Fred Ebb	Chicago first opened on Broadway at the 46th Street Theatre in New York City on June 3, 1975. The production, directed and choreographed by Bob Fosse, ran for 936 performances. On Nov 14, 1996, a revival of the show opened on Broadway at the Richard Rodgers Theatre. It latered transferred to Shubert Theatre, and then to the Ambassador Theatre, where, more than two decades later, it continues to run, logging nearly 10,000 performances.	https://music.apple.com/us/album/chicago-the-musical-new-broadway-cast-recording-1997/258631223	https://is2-ssl.mzstatic.com/image/thumb/Features/56/fa/6a/dj.loadxccl.jpg/1000x1000bb.jpeg
87	Children's Letters to God	David Evans	Douglas J. Cohen	Inspired by the international bestseller of the same name, Children's Letters To God is a musical that follows the lives of five young friends as they voice beliefs, desires, questions and doubts common to all people but most disarmingly expressed by children. Sixteen tuneful songs and assorted scenes (some based on actual letters) explore timeless issues such as sibling rivalry, divorce, holidays, loss of a beloved pet, the trials of being unathletic and first love. This entertaining show carries a universal message which crosses the boundaries of age, geography, and religion.	https://music.apple.com/us/album/childrens-letters-to-god-original-off-broadway-cast/201206336	https://is5-ssl.mzstatic.com/image/thumb/Music/9b/72/0b/mzi.yvsfpjdq.tif/1000x1000bb.jpeg
88	Chitty Chitty Bang Bang	Richard M. Sherman	Richard M. Sherman	Take a fantastic musical adventure with an out-of-this-world car that flies through the air and sails the seas. Based on the beloved 1968 film version of Ian Fleming's children's book, and featuring an unforgettable score by the Sherman Brothers  (Mary Poppins), Chitty Chitty Bang Bang is one family-friendly blockbuster that audiences will find "Truly Scrumptious." An eccentric inventor, Caractacus Potts sets about restoring an old race car from a scrap heap with the help of his children, Jeremy and Jemima. They soon discover the car has magical properties, including the ability to float and take flight. Trouble occurs when the evil Baron Bomburst desires the magic car for himself. The family joins forces with Truly Scrumptious and batty Grandpa Potts to outwit the dastardly Baron and Baroness and their villainous henchman, the Child Catcher. Filled with amazing stage spectacle and unforgettable songs, including the Academy Award-nominated title song, Chitty Chitty Bang Bang is a high-flying, fun-filled adventure for the entire family. The large cast and opportunities for true stage magic make this a challenging, but highly rewarding, show for any organization looking to bring a large-scale production with great name recognition to their theatre.	https://music.apple.com/us/album/chitty-chitty-bang-bang-original-london-cast-recording/159503641	https://is3-ssl.mzstatic.com/image/thumb/Music/4c/ca/41/mzi.irjvvcah.jpg/1000x1000bb.jpeg
89	Cinderella	Richard Rodgers	Oscar Hammerstein II	Rodgers & Hammerstein's Cinderella is the new Broadway adaptation of the classic musical. This contemporary take on the classic tale features Rodgers & Hammerstein's most beloved songs, including "In My Own Little Corner," "Impossible/It's Possible," and "Ten Minutes Ago," alongside an up-to-date, hilarious and romantic libretto by Tony Award-nominee Douglas Carter Beane.	https://music.apple.com/us/album/rodgers-hammersteins-cinderella-original-broadway-cast/1270809469	https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/ab/9a/17/ab9a1767-f91b-5ae9-2d31-d440a95b36f5/791558947236.jpg/1000x1000bb.jpeg
90	City of Angels	Cy Coleman	David Zippel	In the late 1940s, Stine, a bookish writer of detective stories, struggles to adapt his crime novel into a workable screenplay. As Stine tries to maintain some integrity in the backstabbing world of Hollywood, his protagonist, a hardboiled private eye named Stone, fights for survival in a city full of criminals and opportunists. In a clever design choice, the stories are told on a split stage: Stine’s world is in full color, while Stone’s appears in black and white. With wit, humor, and a fantastic Cy Coleman score, City of Angels captures the snappy dialogue of a Raymond Chandler novel and the glitzy showmanship of classic Hollywood; the result is a crowd-pleasing musical unlike any other.City of Angels opened on Broadway at the Virginia Theatre on December 11, 1989, starring Gregg Edelman, James Naughton, Kay McClelland and Randy Graff. The show won six Tony Awards, including Best Musical, and played for 879 performances.	https://music.apple.com/us/album/city-of-angels-original-broadway-cast-recording/197544477	https://is4-ssl.mzstatic.com/image/thumb/Music/f6/ff/e3/mzi.qtmisdtt.jpg/1000x1000bb.jpeg
91	Closer Than Ever	David Shire	Richard Maltby, Jr.	A look into the private song vault of Richard Maltby, Jr., and David Shire (Big; Starting Here, Starting Now; Baby), the review, Maltby and Shire's Closer Than Ever, is filled to the brim with the brilliance for which these musical theatre giants are known. Closer Than Ever is a nonstop exploration of everyday struggles in the "modern world." Topics ranging from unrequited adoration... to aging... to Muzak are tackled with resounding sincerity and precisely placed hilarity. Each song is a unique story told by a new character, taking audiences, not only into the songbook of Mr. Maltby and Mr. Shire, but into the minds of the individuals facing these completely relatable challenges. A superb choice for companies that have previously produced the work of Maltby and Shire, Closer Than Ever will inspire audiences to pause for self-reflection, whether presented as a fully realized production or a simple concert piece.	https://music.apple.com/us/album/closer-than-ever-original-off-broadway-cast-recording/334854621	https://is1-ssl.mzstatic.com/image/thumb/Music/af/97/eb/mzi.tnvsnfbj.jpg/1000x1000bb.jpeg
92	Come from Away	Irene Sankoff, David Hein	Irene Sankoff, David Hein	Come from Away is based on the true story of the time when the isolated community of Gander, Newfoundland, played host to the world. What started as an average day in a small town turned into an international sleepover, when 38 planes, carrying thousands of people from around the globe, were diverted to Gander’s airstrip on September 11, 2001. Undaunted by culture clashes and language barriers, the people of Gander cheered the stranded travelers with music, an open bar and the recognition that we’re all part of a global family.	https://music.apple.com/us/album/come-from-away-original-broadway-cast-recording/1440945336	https://is4-ssl.mzstatic.com/image/thumb/Music128/v4/62/4c/84/624c84ff-c060-1cc7-cc4c-c2412fafeefd/00888072027060.rgb.jpg/1000x1000bb.jpeg
93	Company	Stephen Sondheim	Stephen Sondheim	From musical theatre's most renowned composer, Company is largely regarded as a trailblazer of the dark-comedy, modern-musical genre and the winner of six Tony Awards, including Best Musical, Best Score, Best Lyrics and Best Book. On the night of his 35th birthday, confirmed bachelor, Robert, contemplates his unmarried state. Over the course of a series of dinners, drinks and even a wedding, his friends – "those good and crazy people [his] married friends" – explain the pros and cons of taking on a spouse. The habitually single Robert is forced to question his adamant retention of bachelorhood during a hilarious array of interactions. Company features a brilliantly brisk and energetic score containing many of Stephen Sondheim's best known songs. The strength of the piece lies in its vivid yet real characters, meaning impressive technical aspects aren't necessary to convey the story. It can be told as effectively with a cavalcade of automated set pieces as it can with a chair or two. Every audience member will see reflections of themselves in at least one of the characters onstage.	https://music.apple.com/us/album/company-original-broadway-cast-bonus-track/155662613	https://is1-ssl.mzstatic.com/image/thumb/Music/63/b1/60/mzi.zonxiaqv.jpg/1000x1000bb.jpeg
94	Cowardy Custard	Noël Coward, Alan Strachan, Gerald Frow, Wendy Toye	Noël Coward, Alan Strachan, Gerald Frow, Wendy Toye	An immense success in London. An imaginative and innovative presentation of Noel Coward's words, music, sketches, which also shows us something of the man himself. Cowardy Custard contains not only those classic medleys and duets, but also previously unpublished material, snippets of plays and dialogues, material from his autobiographies as background and even a few of his little known poems. The result is a kaleidoscopic glimpse of the Coward achievement.	https://music.apple.com/us/album/cowardy-custard-the-original-cast-recording/719343820	https://is1-ssl.mzstatic.com/image/thumb/Music6/v4/34/a3/57/34a35776-58f8-30e4-b8c7-75121152537b/886444215978.jpg/1000x1000bb.jpeg
95	Crazy For You	George Gershwin and Ira Gershwin	George Gershwin and Ira Gershwin	A zany rich-boy-meets-hometown-girl romantic comedy, Crazy For You® tells the story of young New York banker Bobby Child, who is sent to Deadrock, Nevada, to foreclose on a rundown theatre. In Deadrock, Bobby falls for spunky Polly Baker, the theatre owner’s daughter. But Polly takes an instant dislike to the city slicker, so Bobby vows – through cunning, razzmatazz, and a hilarious case of mistaken identity – to win Polly’s heart and save the theatre.	https://music.apple.com/us/album/crazy-for-you-original-london-cast-recording/259881724	https://is2-ssl.mzstatic.com/image/thumb/Music/a5/bf/c8/mzi.kobdotbv.jpg/1000x1000bb.jpeg
144	Gigi	Frederick Loewe	Alan Jay Lerner	In the elegant atmosphere of Paris in the 1890s, a wealthy and handsome aristocrat named Gaston falls for Gigi, a young and innocent girl raised to be a courtesan.	https://music.apple.com/us/album/gigi-new-broadway-cast-recording/994814927	https://is1-ssl.mzstatic.com/image/thumb/Music1/v4/21/d0/b4/21d0b433-02ec-4a5a-6ac4-3afcd1beff99/093624927532.jpg/1000x1000bb.jpeg
96	Cry-Baby	Adam Schlesinger	Adam Schlesinger	This jumping, jiving Tony nominee is a rebellious teen comedy event! Based on the cult classic, 1990 John Waters film, Cry-Baby features a delightfully demented book from the writers of Hairspray and a rockabilly score from the co-founder of Fountains of Wayne and the executive producer of "The Daily Show." It's 1954. Everyone likes Ike, nobody likes communism and Wade "Cry-Baby" Walker is the coolest boy in Baltimore. He's a bad boy with a good cause – truth, justice and the pursuit of rock and roll. Cry-Baby and the square rich girl, Allison, are star-crossed lovers at the center of this world. Fueled by hormones and the new rhythms of rock and roll, she turns her back on her squeaky clean boyfriend, Baldwin, to become a "drape" (a Baltimore juvenile delinquent) and Cry-Baby's moll. At the other end of the topsy-turvy moral meritocracy of 1954 America, Baldwin is the king of the squares and leads his close-harmony pals against the juvenile delinquents, who are ultimately arrested for arson, sending the drapes all off to prison. It's Romeo and Juliet meets High School Hellcats. Filled with unforgettable songs and a truly unique and fresh story, Cry-Baby is a perfect choice for any theatre looking to add a rockin' good time to their season. Cry-Baby, Allison and Baltimore's energetic juvenile delinquents will dance their way right into your audience's heart!	https://music.apple.com/us/album/cry-baby-the-musical-original-studio-cast-recording/1042723534	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/e0/d8/11/e0d811e0-74d7-7a1c-9d4c-e7f4d0968a44/859715598247_cover.jpg/1000x1000bb.jpeg
97	Cyrano	Michael J. Lewis	Anthony Burgess	Edmond Rostand's classic love story, Cyrano de Bergerac, has captivated the romantic in us all for more than a century, inspiring countless stage and film adaptations of the immortal tale, including this spectacular 1973 Broadway version of Cyrano, with book and lyrics by the pre-eminent translator of Rostand's masterpiece. A phenomenal swordsman, a born leader and an artistic, intelligent poet with the ability to enchant the hardest of souls, Cyrano is plagued with one tragic flaw – a nose that is bigger than can ever be imagined. He never comes to terms with his looks or how he thinks he appears to the woman whom he secretly loves, the beautiful Roxana; thus, when she tells him of her interest in the handsome yet inarticulate soldier, Christian, Cyrano helps the young man, acting as his muse and penning eloquent love letters that win her over. A lavish addition to any season with soaring ballads and rousing word- and sword-play, Cyrano is an ideal star vehicle to boot. Christopher Plummer won the Tony Award in 1974 for his portrayal of the legendary swordsman.	https://music.apple.com/us/album/cyrano-original-1973-broadway-cast-recording/1452552975	https://is5-ssl.mzstatic.com/image/thumb/Music114/v4/b5/73/bb/b573bb0a-9903-1bb6-e4e0-8b29f184cf5e/00075021037380.rgb.jpg/1000x1000bb.jpeg
98	Daddy Long Legs	Paul Gordon	Paul Gordon	Based on the classic novel, which inspired the 1955 movie starring Fred Astaire, Daddy Long Legs is a beloved tale in the spirit of Jane Austen, The Brontë Sisters and “Downton Abbey.” Daddy Long Legs features music and lyrics by Tony Award-nominated composer/lyricist, Paul Gordon (Jane Eyre), and Tony-winning librettist/director, John Caird (Les Misérables), and is a “rags-to-riches” tale of newfound love. Jerusha Abbott is the “Oldest Orphan in the John Grier Home” until a mysterious benefactor decides to send her to college to be educated as a writer. Required to write him a letter once a month, she is never to know the benefactor’s identity – so she invents one for him: Daddy Long Legs. Although she knows that he will never respond to her letters, she grows more and more fond of this elusive and kindly “old” gentleman. But another relationship soon begins to develop in Jerusha’s life. Jervis Pendleton is the well-do-do, “youngish” uncle of one of Jerusha’s roommates, who introduces her to a world of literature, travel and adventure. Through her correspondence with Daddy Long Legs and her growing intimacy with Jervis, Jerusha’s letters chronicle her emergence as a delightfully independent “New American Woman.” Yet, there is one startling fact that Jerusha has yet to uncover – a fact that will change her life forever. This charming two-hander filled with soaring melodies is a wonderful choice for college programs and community theatres with a sophisticated audience base.	https://music.apple.com/us/album/daddy-long-legs-original-off-broadway-cast-recording/1306104645	https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/64/e0/e8/64e0e849-9249-21d4-1087-a02d4d21baf4/791558449532.jpg/1000x1000bb.jpeg
99	Dames at Sea	Jim Wise	George Haimsohn and Robin Miller	A long-running hit Off Broadway that brought stardom to Bernadette Peters, this campy show is based on the nostalgia of Hollywood musicals of the '30s. It's big-time New York, into which sweet little Ruby from faraway Hometown, U.S.A. has come to make it big on Broadway. Who should she chance to meet but another boy from Hometown, U.S.A.: Dick, a sailor, who also has ambitions as a songwriter. Ruby begins in the chorus, and by the end of the day, in true Hollywood fashion, Dick saves her doomed Broadway show with a smash tune, as Ruby becomes a star on the deck of a battleship, which just happens to be passing by.	https://music.apple.com/us/album/dames-at-sea-original-off-broadway-cast-recording/261769284	https://is1-ssl.mzstatic.com/image/thumb/Features/56/a6/a1/dj.puweidyh.jpg/1000x1000bb.jpeg
100	Damn Yankees	Jerry Ross	Jerry Ross	Based on the novel, The Year the Yankees Lost the Pennant by Douglass Wallop, Damn Yankees the Broadway mega-hit and winner of seven Tony Awards, including Best Musical, hits it out of the park! The winning score by Adler and Ross and a devilish book by George Abbot have made this sporty musical comedy a true American classic. Middle-aged baseball fanatic Joe Boyd, trades his soul to the Devil, also known as Mr. Applegate, for a chance to lead his favorite team to victory in the pennant race against the New York Yankees. As young baseball sensation, Joe Hardy, he transforms the hapless Washington Senators into a winning team, only to realize the true worth of the life that he's left behind. Joe ultimately outsmarts Applegate, returns to his former self and shepherds the Senators to the World Series. Light, fast-paced and devilishly clever, Damn Yankees is a homerun hit, featuring all-American subject matter and an irreverent sense of humor. The perfect choice for a high school's spring musical or community theatre production, Damn Yankees is a wicked, romantic comedy, sure to please.	https://music.apple.com/us/album/damn-yankees-1994-original-broadway-cast-recording/1452667889	https://is2-ssl.mzstatic.com/image/thumb/Music124/v4/2d/96/bb/2d96bb4f-593a-7817-28ea-7676be986028/00731452239624.rgb.jpg/1000x1000bb.jpeg
101	Death Takes a Holiday (Musical)	Maury Yeston	Maury Yeston	In Death Takes a Holiday, it's just after World War I and the loneliest of souls arrives at an Italian villa disguised as a handsome young Prince, and for the first time experiences the joys and heartbreaks of life. The show began as an Alberto Casella play from the 1920s that was made into a much-loved 1934 film starring Fredric March as Death, disguised as a debonair nobleman. The original film was remade in 1998 as Meet Joe Black, starring Brad Pitt and Anthony Hopkins.Death Takes a Holiday opened Off-Broadway on July 14, 2011 at the Laura Pels Theatre as a Roundabout Theatre Company production.	https://music.apple.com/us/album/death-takes-a-holiday-original-off-broadway-cast-recording/470987165	https://is5-ssl.mzstatic.com/image/thumb/Music/b4/1f/3c/mzi.isohjpej.jpg/1000x1000bb.jpeg
102	Dessa Rose	Stephen Flaherty	Lynn Ahrens	A powerful, moving story surrounding two incredible women, Dessa Rose is a uniquely stirring musical drama that is the perfect blend of history and fiction. The storytelling for which Lynn Ahrens and Stephen Flaherty are most well known is masterfully exhibited in this thrilling musical based on the novel of the same name by Sherley Anne Williams. In a pre-Civil War America, passionate and innocent Dessa Rose is a young slave who is faced with a barrage of hardships because of her skin color. Ruth is a young, white mother who faces a barrage of hardships because of her gender. Through a series of inspiring turns ranging from comical to tragic, these two women become unlikely and lifelong friends. Dessa Rose is a must for groups that pride themselves on producing thought-provoking theatre. Affecting, harrowing and touching, Dessa Rose explores an array of emotions unmatched by most other musicals. Audiences will leave unanimously in awe of the musical's powerful message, which transcends race, gender and age.	https://music.apple.com/us/album/dessa-rose-original-cast-recording-lincoln-center-theater/199397197	https://is2-ssl.mzstatic.com/image/thumb/Music/88/57/a9/mzi.tdyrwdaw.tif/1000x1000bb.jpeg
103	Destry Rides Again	Harold Rome	Harold Rome	Destry Rides Again is based on the novel by Max Brand and the 1939 western movie starring Marlene Dietrich and James Stewart. Tom Destry is hired as the deputy sheriff of Bottleneck in order to rid the town of Kent and his gang. Frenchy, a saloon girl who is initially one of Kent’s followers, saves Destry’s life and becomes romantically involved with him.Destry Rides Again opened on Broadway at the Imperial Theatre on April 23, 1959, starring Dolores Gray and Andy Griffith. The show played for 472 performances.	https://music.apple.com/us/album/destry-rides-again-1982-original-london-cast/218384388	https://is4-ssl.mzstatic.com/image/thumb/Music/bb/27/2e/mzi.drokkrcq.tif/1000x1000bb.jpg
104	Dirty Rotten Scoundrels	David Yazbek	David Yazbek	Dirty Rotten Scoundrels, based on the popular 1988 MGM film, takes us to the French Riviera for high jinks and hilarity. Sophisticated, suave with a good dash of mischief, this hysterical comedy features a delightfully jazzy score by David Yazbek (The Full Monty) and was nominated for a staggering eleven Tony Awards. Lawrence Jameson makes his lavish living by talking rich ladies out of their money. Freddy Benson more humbly swindles women by waking their compassion with fabricated stories about his grandmother's failing health. After meeting on a train, they attempt to work together, only to find that this small French town isn't big enough for the two of them. They agree on a settlement: the first one to extract $50,000 from a young female target, heiress, Christine Colgate, wins, and the other must leave town. A hilarious battle of cons ensues that will keep audiences laughing, humming and guessing to the end! Dirty Rotten Scoundrels gives directors the wonderful opportunity to direct two leading men with a large ensemble. It's a great choice for community theatres looking to add some spice to their season!	https://music.apple.com/us/album/dirty-rotten-scoundrels-original-broadway-cast-recording/1303792460	https://is4-ssl.mzstatic.com/image/thumb/Music128/v4/b5/b8/3e/b5b83e13-e0b6-06c6-0fb9-9cb133f27f54/791558440638.jpg/1000x1000bb.jpeg
105	Disaster!	Various	Various	Disaster! is a new musical straight from Broadway, featuring some of the most unforgettable songs of the '70s. "Knock on Wood," "Hooked on a Feeling," "Sky High," "I Am Woman" and "Hot Stuff" are just a few of the scintillating hits in this hilarious musical comedy with a book by three-time Emmy Award nominee and SiriusXM Broadway host, Seth Rudetsky, and Jack Plotnick. It's 1979, and New York's hottest A-listers are lining up for the opening of a floating casino and discotheque. Also attending is a faded disco star, a sexy nightclub singer with her eleven-year-old twins, a disaster expert, a feminist reporter, an older couple with a secret, a pair of young guys who are looking for ladies, an untrustworthy businessman and a nun with a gambling addiction. What begins as a night of boogie fever quickly changes to panic as the ship succumbs to multiple disasters, such as earthquakes, tidal waves and infernos. As the night turns into day, everyone struggles to survive and, quite possibly, repair the love that they've lost... or at least escape the killer rats. Audiences and critics are wild for this hilarious homage to the era of bell-bottoms, platform shoes and the hustle. With larger-than-life characters, snappy dialogue and some of the most recognizable songs of the '70s, Disaster! will have your patrons dancing in their seats and rolling in the aisles. Proceed at your own risk and READ FOR FREE. "In the world of musical theater, jukebox musicals can be a huge train wreck with bits of a story loosely woven together to form a lackluster plot. But for Disaster!, it's the hits of the 70s (34 of them to be precise) that serve as the perfect musical punchlines to an already hysterical script." - Broadway World	https://music.apple.com/us/album/disaster-original-broadway-cast-recording/1150025220	https://is1-ssl.mzstatic.com/image/thumb/Music62/v4/43/c4/91/43c491e9-b09f-d2f6-b2ed-77d5a21e54df/859718129660_cover.jpg/1000x1000bb.jpeg
106	Divorce Me, Darling!	Sandy Wilson	Sandy Wilson	Divorce Me, Darling! is the perfect sequel to Sandy Wilson's hit musical, The Boy Friend. A loving homage to the musicals of the 1930s, this second outing is packed with dizzying dance numbers, zany plot twists and a delightful score. Polly and her friends are back in Nice for some fun in the sun without their husbands. They discover handsome, ex-playboy, Bobby Van Husen, is also in town… "sans" his wife and their old schoolmate, Maisie. When they spend an evening catching up, the door to yet another series of misunderstandings and complications is opened. This time, it involves a tell-tale lipstick smear, a trio of health nuts, a mysterious cabaret singer and a plot to assassinate a South American president. When Maisie and the girls' husbands descend on Nice, though, divorce is in the air! Divorce Me, Darling! is a brilliantly unique choice for a theatre company to close its season, especially if they opened it with The Boy Friend. The talent pool would already be honed and prepped, and audiences would love to see their favorite characters return to the French Riveria, where they all fell in love.	https://music.apple.com/us/album/divorce-me-darling-original-1997-revival-cast/1509754470	https://is4-ssl.mzstatic.com/image/thumb/Music123/v4/6a/07/0b/6a070b39-9f5b-862f-c486-ce3841dbf66b/605288209024.jpg/1000x1000bb.jpeg
145	Girl Crazy (Original 1930)	George Gershwin and Ira Gershwin	George Gershwin and Ira Gershwin	Wealthy playboy Danny Churchill has been sent by his parents to Custerville, Arizona, to manage his family’s ranch and to focus on more serious matters than alcohol and women. But Danny turns the place into a dude ranch, imports Broadway showgirls, and hires Kate Forthergill as an entertainer. Eventually, visitors come from both coasts to the ranch and Danny falls in love with the local postmistress, Molly Gray.Girl Crazy opened on Broadway at the Alvin Theatre on October 14, 1930, starring Allen Kearns as Danny and featuring debut performances by Ethel Merman (as Kate) and Ginger Rogers (as Molly). The production ran for 272 performances. The show served as the basis for the 1992 musical Crazy For You, which has a completely rewritten book and songs added from other Gershwin shows.	https://music.apple.com/us/album/girl-crazy-studio-cast-recording-1952/212389880	https://is3-ssl.mzstatic.com/image/thumb/Features/e1/59/ce/dj.ybzhbakr.jpg/1000x1000bb.jpeg
107	Do I Hear a Waltz?	Richard Rodgers	Stephen Sondheim	Leona, an unmarried American secretary 'of a certain age,' goes on a vacation to Venice where, under the spell of that enchanted city, she falls in love. The gentleman is an attractive, middle-aged shopkeeper, whose attentions give flight to her deepest dreams of romance. Too soon, however, he openly informs her that he is a contented family man, and Leona's hopes are dashed. She can, for a short time, harness romance, yet realizes that such a relationship would have nowhere to go. Still, might it be better than never having loved at all? This timeless story, whichwas also the basis of the movie Summertime starring Katharine Hepburn, remains a bittersweet testament to the complexities of the heart. Do I Hear A Waltz? opened on Broadway on March 18, 1965 at the 46th Street Theatre and closed on September 25, 1965 after 220 performances. It starred Elizabeth Allen and Sergio Franchi; other principal cast members included Carol Bruce, Madeleine Sherwood, Julienne Marie, Stuart Damon, Fleury D'Antonakis, and Jack Manning.	https://music.apple.com/us/album/do-i-hear-a-waltz-original-broadway-cast-recording/261769276	https://is4-ssl.mzstatic.com/image/thumb/Features/02/2f/93/dj.wsqqxtwl.jpg/1000x1000bb.jpeg
108	Doctor Dolittle	Leslie Bricusse	Leslie Bricusse	The classic tale of kindness to animals trots, crawls and flies onto the stage in Doctor Dolittle, the big Broadway-sized family musical. All of the characters we've come to love through the stories of Hugh Lofting and the magical movie musical are given new life in the stage version. The musical tells the classic tale of a wacky but kind Doctor who can talk to animals. The show takes the audience on a journey from the small English village of Puddleby-on-the-Marsh to the far corners of the world. Doctor Dolittle is wrongly accused of murder and, once pronounced innocent, continues with his search for the Great Pink Sea Snail – the oldest and wisest of the creatures on earth. Doctor Dolittle provides directors the wonderful flexibility of casting performers of all ages and types, including a large ensemble that calls for actors to portray talking animals.	https://music.apple.com/us/album/doctor-dolittle-world-premiere-london-cast-recording/539457803	https://is5-ssl.mzstatic.com/image/thumb/Music/v4/d1/f2/de/d1f2de13-5248-c616-4b58-1d65168249e0/Cover.jpg/1000x1000bb.jpeg
109	Dogfight	Benj Pasek	Benj Pasek	The hauntingly beautiful musical, Dogfight, by Pasek and Paul (Edges, James and the Giant Peach, A Christmas Story) and Peter Duchan, was praised by countless critics and nominated for numerous awards, winning the Lucille Lortel Award for Best Musical. Based on the 1991 Warner Brothers film, Dogfight takes audiences on a romantic and heartbreaking theatrical journey that stays with you long after the performance. It's November 21, 1963. On the eve of their deployment to a small but growing conflict in Southeast Asia, three young Marines set out for one final boys' night of debauchery, partying and maybe a little trouble. But, when Corporal Eddie Birdlace meets Rose, an awkward and idealistic waitress whom he enlists to win a cruel bet with his fellow recruits, she rewrites the rules of the game and teaches him the power of love and compassion. Studded with impressive songs, an unexpected love affair and a genuine and charming soul, Dogfight is a perfect way to show off your strong male talent and a unique opportunity for theatres looking to challenge and inspire their audiences.	https://music.apple.com/us/album/dogfight-original-cast-recording/1303959189	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/78/04/a4/7804a425-3b56-d72f-996c-dc8dc6bae671/791558947038.jpg/1000x1000bb.jpeg
110	Dr. Selavy's Magic Theatre	Stanley Silverman	Tom Hendry	Welcome to the extraordinary odyssey of a confused young man, led by wacky doctors through a labyrinth of wildly theatricalized versions of major life crises and temptations -- wealth, sensuality, power, romance, lost innocence, and death. Presided over by the enigmatic Dr. Selavy (or C'est La Vie, if you like), himself an illusion created by master trickster Marcel Duchamp, this outrageous journey leads our hero in an ironic dance through an eccentric fun house of extravagant awakenings to a climax of self-knowledge and acceptance. To the strains of an eminently hummable and upbeat score, this off-beat piece provides an adventurous departure from the traditional expectations of musical theatre.	https://music.apple.com/us/album/doctor-selavys-magic-theatre-original-soundtrack/1442863881	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/73/8b/de/738bde29-886f-e26a-c83c-dab7baa8d7ec/00011661867529.rgb.jpg/1000x1000bb.jpeg
111	Dracula The Musical	Frank Wildhorn	Don Black	Dracula The Musical is a thrilling drama of suspense and a Gothic romance of dreamlike temptation from the extraordinary team of Christopher Hampton, Don Black and Frank Wildhorn (Jekyll & Hyde, The Civil War). Set in Europe at the end of the Victorian Age, the story follows the famed vampire as he lusts for new blood. Jonathan Harker and Mina Murray fall victim to Dracula's unnatural charm and, along with Doctor Van Helsing, must fight Dracula's supernatural powers. Dracula will enthrall audiences with its powerful score and its potential for showcasing dark or gothic sets and costumes. Stagecraft experts will love bringing the undead to life in this haunting musical of unrequited love.	https://music.apple.com/us/album/dracula-the-musical-the-studio-cast-recording/442566853	https://is3-ssl.mzstatic.com/image/thumb/Music/a1/eb/52/mzi.baensqvj.jpg/1000x1000bb.jpeg
112	Dreamgirls	Henry Krieger	Tom Eyen	Through gospel, R&B, smooth pop, disco and more, Dreamgirls explores themes of ambition, hope and betrayal, all set in the glamorous and competitive world of the entertainment industry.	https://music.apple.com/us/album/dreamgirls-original-broadway-cast-album-1982/1443783797	https://is4-ssl.mzstatic.com/image/thumb/Music118/v4/55/fb/b9/55fbb9ce-24e0-a7f2-aaf9-519f5e84c61e/00720642200728.rgb.jpg/1000x1000bb.jpeg
113	Elegies for Angels, Punks, and Raging Queens	Janet Hood	Bill Russell	A celebration of lives lost to AIDS told in free-verse monologues with a blues, jazz, and rock score, this piece is designed to include the community in a theatrical response to the AIDS crisis. It is often performed as a benefit for fundraising and consciousness raising. Please not that in the U.K. this is a print-on-demand title and two to three days extra should be allowed for supply.The first full staging of Elegies for Angles, Punks and Raging Queens was presented by T.W.E.E.D. in association with Justin Ross as part of the Sixth Annual New Works Festival at the Ohio Theater in New York City on May 18, 1989.The musical was subsequently presented at the RAPP Arts Center in New York on February 21, 1990. The musical's first London fringe production was first presented by The King's Head Theatre and Giacomo Capizzano on November 10, 1992. The musical was subsequently presented on the West End by Giacomo Capizzano, Ltd. at the Criterion Theater in London on June 28, 1993. All original productions were directed by Bill Russell.	https://music.apple.com/us/album/elegies-for-angels-punks-raging-queens-original-london/539891609	https://is4-ssl.mzstatic.com/image/thumb/Music/v4/ec/e7/6f/ece76f12-96fa-b31f-d57c-0b78c25db105/Cover.jpg/1000x1000bb.jpeg
114	Elf The Musical	Matthew Sklar	Chad Beguelin	A title known the world over, Elf The Musical is a must-produce holiday musical that can easily become an annual tradition for any theatre. Based on the cherished 2003 New Line Cinema hit, Elf features songs by Tony Award nominees Matthew Sklar (The Wedding Singer) and Chad Beguelin (Disney's Aladdin on Broadway), with a book by Tony Award winners, Thomas Meehan (Annie, The Producers, Hairspray) and Bob Martin (The Drowsy Chaperone). Buddy, a young orphan, mistakenly crawls into Santa's bag of gifts and is transported to the North Pole. The would-be elf is raised, unaware that he is actually a human until his enormous size and poor toy-making abilities cause him to face the truth. With Santa's permission, Buddy embarks on a journey to New York City to find his birth father and discover his true identity. Faced with the harsh realities that his father is on the naughty list and his half-brother doesn't even believe in Santa, Buddy is determined to win over his new family and help New York remember the true meaning of Christmas. This modern-day holiday classic is sure to make everyone embrace their inner elf. After all, the best way to spread Christmas Cheer is singing loud for all to hear.	https://music.apple.com/us/album/elf-the-musical-original-broadway-cast-recording/1308320238	https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/c5/d3/e1/c5d3e1ea-a7b1-f1d4-10eb-e1f29d46d8d3/791558945331.jpg/1000x1000bb.jpeg
115	Ernest in Love	Lee Pockriss	Anne Croswell	Oscar Wilde's outlandish The Importance of Being Ernest is one of the most clever comedies in the English language and the basis for this beguiling musical version. Featuring a score teaming with frothy melodies and clever lyrics, Ernest in Love is a delightful romp through love and manners. In nineteenth-century England mischief and mayhem abound when two young gentlemen find themselves in over their heads. Posing as a fictitious brother, "Ernest," Jack successfully escapes his country estate to gallivant around London and court the lovely Gwendolyn. Meanwhile, Jack's friend, Algernon, avoids dining with his aunt, the persnickety Lady Bracknell, by visiting his "very ill" imaginary friend. Hilarity ensues when reality and fantasy collide, causing confusion and threatening the love lives of both Jack and Algernon. A faithful adaptation of Wilde's comic masterpiece, Ernest in Love features all of its much-beloved characters and most of the same production demands, with the addition of a small band. The clever, tuneful score is the perfect complement to Wilde's incomparable wordplay and immortal witticisms in a delightful reworking of what has been called "the funniest play in the English language."	https://music.apple.com/us/album/ernest-in-love-original-off-broadway-cast-recording/451767657	https://is1-ssl.mzstatic.com/image/thumb/Music/78/58/b3/mzi.rlovnlqi.jpg/1000x1000bb.jpeg
116	Everybody's Talking About Jamie	Dan Gillespie Sells, Tom MacRae, Jonathan Butterell	Dan Gillespie Sells, Tom MacRae, Jonathan Butterell	Jamie New is sixteen and lives on a council estate in Sheffield.Jamie doesn’t quite fit in.Jamie is terrified about the future.Jamie is going to be a sensation.Supported by his brilliant, loving mum and surrounded by his friends, Jamie overcomes prejudice, beats the bullies, and steps out of the darkness into the spotlight.Sixteen: the edge of possibility. Time to make your dreams come true.	https://music.apple.com/us/album/everybodys-talking-about-jamie-original-west-end-cast/1372709008	https://is4-ssl.mzstatic.com/image/thumb/Music128/v4/81/d2/2f/81d22fc7-1f94-c1ec-2a02-88b3ea5d3abc/5037300832180.jpg/1000x1000bb.jpeg
117	Evita	Andrew Lloyd Webber	Tim Rice	Evita brings to life the rags-to-riches rise of Eva Peron, the First Lady of Argentina.	https://music.apple.com/us/album/evita/1440730069	https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/44/6f/19/446f197a-8212-5af6-620a-878642296805/06UMGIM31307.rgb.jpg/1000x1000bb.jpeg
118	Fade Out - Fade In	Jule Styne	Betty Comden and Adolph Green	Fade Out - Fade In, a rollicking satire of Hollywood in the 1930s, takes place just after the introduction of talking pictures. Hope Springfield, an ebullient movie house usherette with no talent for performing, accidentally gets the starring role in a new movie. When the error is discovered, heads roll and the completed film is shelved. But Rudolf, the nephew of studio head Lionel Z. Governor, takes a liking to Hope and arranges for a sneak preview. The movie - surprisingly - is a success, and Hope becomes a star.Fade Out - Fade In opened on Broadway at the Mark Hellinger Theatre on May 26, 1964, starring Carol Burnett as Hope, Dick Patterson as Rudolf, and Lou Jacobi as Lionel Z. Governor. The show was a huge critical success, but the production staggered when Ms. Burnett was injured in a taxi cab accident, forcing the production to close for three months. The show reopened on February 15, 1965, but it never fully recovered from the break. Closing shortly thereafter, Fade Out- Fade In played a total of 271 performances.	https://music.apple.com/us/album/fade-out-fade-in-1964-original-broadway-cast-recording/1452387659	https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/72/d1/92/72d1924c-66fc-99d5-d0f5-c6c46520c25d/00044006797427.rgb.jpg/1000x1000bb.jpeg
119	Falsettoland	William Finn	William Finn	A continuation of the saga of Marvin from March of the Falsettos and In Trousers, this Off Broadway hit finds that archetypal contemporary gay man facing the specter of AIDS.	https://music.apple.com/us/album/falsettoland-original-off-broadway-cast/42322668	https://is5-ssl.mzstatic.com/image/thumb/Music/y2005/m01/d30/h06/s05.wclilayr.jpg/1000x1000bb.jpeg
120	Falsettos	William Finn	William Finn	Updated version! Materials are based on the 2016 Broadway revival.A seamless pairing of March of the Falsettos and Falsettoland, two acclaimed Off-Broadway musicals written nearly a decade apart, Falsettos is the tale of a neurotic New Yorker named Marvin, who leaves his wife Trina and young son Jason to live with his lover, Whizzer. In time, Trina marries his psychiatrist, Whizzer leaves him, and Marvin ends up alone. Two years later, Marvin and Whizzer reunite on the eve of Jason’s bar mitzvah, just as AIDS is beginning its insidious spread. With the help of their neighbors, Charlotte and Cordelia, Marvin and his entire family learn to grow up and face their future with love and dignity.	https://music.apple.com/us/album/falsettos-2016-broadway-cast-recording/1271833110	https://is4-ssl.mzstatic.com/image/thumb/Music128/v4/a1/77/d6/a177d64a-cd1a-1ef4-b62d-a8b2d4ad115b/791558450934.jpg/1000x1000bb.jpeg
167	Heathers The Musical	Kevin Murphy & Laurence O’Keefe	Kevin Murphy & Laurence O’Keefe	Heathers The Musical is the darkly delicious story of Veronica Sawyer, a brainy, beautiful teenage misfit who hustles her way into the most powerful and ruthless clique at Westerberg High: the Heathers. But before she can get comfortable atop the high school food chain, Veronica falls in love with the dangerously sexy new kid J.D. When Heather Chandler, the Almighty, kicks her out of the group, Veronica decides to bite the bullet and kiss Heather’s aerobicized ass...but J.D. has another plan for that bullet.	https://music.apple.com/us/album/heathers-the-musical-world-premiere-cast-recording/887521244	https://is1-ssl.mzstatic.com/image/thumb/Music118/v4/0d/3d/b8/0d3db88c-f42f-4ff8-4074-97a0eb7ea735/859712752819_cover.jpg/1000x1000bb.jpeg
121	Fame The Musical	Steve Margoshes	Jacques Levy	An unmistakable title from the unforgettable film and television franchise, Fame The Musical inspired generations to fight for fame and light up the sky like a flame! Conceived and developed by David De Silva – now known affectionately to the planet as "Father Fame" – this high-octane musical features the Academy Award-winning title song and a host of other catchy pop numbers. The show follows the final class of New York City's celebrated High School for the Performing Arts from their admission in 1980 to their graduation in 1984. All of the struggles, fears and triumphs – from prejudice to substance abuse – are depicted with razor-sharp focus as the young artists navigate the worlds of music, drama and dance. Fame is an international sensation that continues to reach new generations of performers and audience members. The show provides great opportunities to feature a diverse talent pool and showcase artistic mediums like dancing, singing, acting, rapping and musicianship.	https://music.apple.com/us/album/fame-the-musical/15865869	https://is3-ssl.mzstatic.com/image/thumb/Music/y2004/m06/d21/h12/s05.rwjsxjmd.jpg/1000x1000bb.jpeg
123	Far From Heaven	Scott Frankel	Michael Korie	Cathy Whitaker seems to be the picture-perfect wife and mother in 1957 suburban Connecticut. But roiling beneath the surface, secret longings and forbidden desires cause her world to unravel, with incendiary consequences.	https://music.apple.com/us/album/far-from-heaven-original-cast-recording/737925128	https://is1-ssl.mzstatic.com/image/thumb/Music/v4/df/25/d4/df25d4af-3cea-0e2b-823f-51c69022a79a/803607131920_cover.tif/1000x1000bb.jpeg
124	Fiddler on the Roof	Jerry Bock	Sheldon Harnick	Winner of nine Tony Awards when it debuted in 1964, Fiddler on the Roof is the brainchild of Broadway legends, Jerome Robbins and Harold Prince; songwriters, Jerry Bock and Sheldon Harnick; and bookwriter, Joseph Stein. Touching audiences worldwide with its humor, warmth and honesty, this universal show is a staple of the musical theatre canon. Set in the little village of Anatevka, the story centers on Tevye, a poor milkman, and his five daughters. With the help of a colorful and tight-knit Jewish community, Tevye tries to protect his daughters and instill them with traditional values in the face of changing social mores and the growing anti-Semitism of Czarist Russia. Rich in historical and ethnic detail, Fiddler on the Roof's universal theme of tradition cuts across barriers of race, class, nationality and religion, leaving audiences crying tears of laughter, joy and sadness.	https://music.apple.com/us/album/fiddler-on-the-roof-original-broadway-cast-recording/401383466	https://is3-ssl.mzstatic.com/image/thumb/Music/fa/08/86/mzi.yyapvphc.jpg/1000x1000bb.jpeg
125	Finian’s Rainbow	Burton Lane	E. Y. Harburg	Aging Irish dreamer Finian McLonerghan and his savvy daughter Sharon travel to America to bury a small pot of gold, which Finian believes will grow to yield millions. When they arrive in fictional Rainbow Valley in Missitucky, the McLonerghans encounter goodhearted sharecroppers, bigoted blowhard politicians... and a romantic leprechaun! One of America's classic and most original musicals, FINIAN'S RAINBOW remains as timely now as when it was first written.	https://music.apple.com/us/album/finians-rainbow-new-broadway-cast-recording/892827397	https://is2-ssl.mzstatic.com/image/thumb/Music/v4/37/55/32/375532a6-fa88-4225-78b0-11ecdbaf5690/803607108823_cover.tif/1000x1000bb.jpg
126	Fiorello!	Jerry Bock	Sheldon Harnick	From the legendary writers, Bock and Harnick (Fiddler on the Roof, She Loves Me) and George Abbott, comes the classic feel-good musical, Fiorello!. Winner of three Tony Awards, including Best Musical, this triumphant show is one of only eight musicals to have won the prestigious Pulitzer Prize for Drama. With crooked double-crossers and manipulators working the political puppets, "Tammany Hall" is in desperate need of an honest man to snip the strings. With guts and perseverance, Fiorello is just the man to put a bright, new shine on the Big Apple. His rise to power is a strained journey as LaGuardia does his best to retain his continuously positive outlook on life while navigating the ups and downs of his life in civil service. Set against the backdrop and beat of a a New York City in the midst of change, Fiorello! is a witty, sweet valentine to a little man with a big heart that will surely attract and charm audiences.	https://music.apple.com/us/album/fiorello-original-broadway-cast-recording/716402373	https://is5-ssl.mzstatic.com/image/thumb/Music/v4/9a/3c/0f/9a3c0f54-cbeb-40ff-3a8c-d4c85c941c53/05099923462557.jpg/1000x1000bb.jpeg
127	First Date	Alan Zachary and Michael Weiner	Alan Zachary and Michael Weiner	When blind date newbie Aaron is set up with serial-dater Casey, a casual drink at a busy New York restaurant turns into a hilarious high-stakes dinner. As the date unfolds in real time, the couple quickly finds that they are not alone on this unpredictable evening. In a delightful and unexpected twist, Casey and Aaron's inner critics take on a life of their own when other restaurant patrons transform into supportive best friends, manipulative exes and protective parents, who sing and dance them through ice-breakers, appetizers and potential conversational land mines. Can this couple turn what could be a dating disaster into something special before the check arrives?	https://music.apple.com/us/album/first-date-original-broadway-cast-recording/699152638	https://is3-ssl.mzstatic.com/image/thumb/Music118/v4/31/1e/f0/311ef055-28d5-de98-65bd-bab66b21f060/705105673035_cover.jpg/1000x1000bb.jpeg
128	First Daughter Suite	Michael John LaChiusa	Michael John LaChiusa	Tony Award-nominee Michael John LaChiusa imagines the inner lives and dreams of America's best-known daughters with a funny and moving follow-up to his 1993 musical First Lady Suite. A historical fantasia in four parts, First Daughter Suite follows Patricia Nixon and daughters Tricia and Julie, Rosalynn and Amy Carter, Betty and Susan Ford, Patti Davis and mom Nancy Reagan, and Barbara Bush and daughter-in-law Laura as they strive to live meaningful lives in the public eye, while dealing with the complex private relationships all of us face with our parents and children. This wholly captivating musical with a lush, sweeping score is a deeply felt new work about mothers, daughters and the surprising discoveries we make about one another as we grow.	https://music.apple.com/us/album/first-daughter-suite-original-cast-recording/1305310054	https://is3-ssl.mzstatic.com/image/thumb/Music118/v4/25/9e/19/259e19cb-e458-d687-f125-d9042241f18d/791558949636.jpg/1000x1000bb.jpeg
129	Five Guys Named Moe	Louis Jordan	Louis Jordan	An exuberant tribute to the music of rhythm and blues pioneer and alto saxophonist, Louis Jordan, Five Guys Named Moe is an international sensation. Initially produced in London's West End by the legendary Cameron Mackintosh, this exhilarating, all-embracing theatrical experience moved to Broadway in 1992 and was nominated for two Tony Awards. Five Guys Named Moe is about our hero, Nomax – he's broke, his lovely Lorraine left him and he's listening to the radio at 5:00 in the morning. Out of the radio, five guys named Moe appear. Set to Jordan's iconic rhythm and blues/jazz score, the Moes encourage Nomax to turn his life around and tell Lorraine that he loves her. Five Guys Named Moe is the perfect small cast show for communities with talented singers who are looking to feature African-American actors. A thorough MTI Study Guide provides cross-cultural enrichment for producers who are interested in learning more about Jordan, his career and the era in which he wrote. The recognizable and enticing score appeals to a variety of audiences, and the uproarious audience participation will have spectators leaping out of their seats to join the celebration!	https://music.apple.com/us/album/five-guys-named-moe-original-london-cast-recording/539487086	https://is5-ssl.mzstatic.com/image/thumb/Music/v4/a0/2c/87/a02c87b6-46ff-a7f1-5969-77559e8c5884/Cover.jpg/1000x1000bb.jpeg
130	Flora, The Red Menace	John Kander	Fred Ebb	Flora, The Red Menace was first presented on Broadway at the Alvin Theatre in May of 1965. It was directed by George Abbott and was Liza Minnelli's Broadway debut.	https://music.apple.com/us/album/flora-the-red-menace-original-broadway-cast-recording/347512186	https://is5-ssl.mzstatic.com/image/thumb/Music/b5/41/7e/mzi.fpibhrli.jpg/1000x1000bb.jpeg
131	Flower Drum Song	Richard Rodgers	Oscar Hammerstein II	The generation gap is given the Rodgers & Hammerstein treatment in this colorful approach to the age-old conflict. In San Francisco's Chinatown of the late '50s, nightclub owner Sammy Fong's traditional family has ordered him a picture-bride from China, hoping to end his pursuit of an enticing dancer. Mei Li arrives, shy and at sea in a world she doesn't understand, and it's clear that she's the wrong gal for the assimilated Sammy. However, Mei Li may be just the ticket for Sammy's buddy Wang Ta, whose traditionalist father is fighting a losing battle with his kids against rock 'n' roll, baseball, and other trappings of the modern American lifestyle. By turns raucous and heartfelt, this delightful Chinese puzzle of embracing the new while honoring the old is a celebration of American ingenuity.	https://music.apple.com/us/album/flower-drum-song-original-broadway-cast-recording/160758308	https://is4-ssl.mzstatic.com/image/thumb/Features/f3/70/71/dj.pmrenpzq.jpg/1000x1000bb.jpeg
132	Floyd Collins	Adam Guettel	Adam Guettel, Tina Landau	In 1925, while chasing a dream of fame and fortune by turning a Kentucky cave into a tourist attraction, Floyd Collins himself became the attraction when he got trapped 200 feet underground. Alone but for sporadic contact with the outside world, Floyd fought for his sanity and ultimately his life as the rescue effort above exploded into the first genuine media circus. Reporters and gawkers from across the country descended on the property, fueling the hysteria and manipulating the nation into holding its collective breath. This haunting musical - one of the most acclaimed in recent years - tells the transcendent tale of a true American dreamer.	https://music.apple.com/us/album/floyd-collins/63491671	https://is5-ssl.mzstatic.com/image/thumb/Music/y2005/m05/d12/h01/s06.nszmovhr.jpg/1000x1000bb.jpeg
133	Fly By Night	Kim Rosenstock, Michael Mitnick, Will Connolly	Kim Rosenstock, Michael Mitnick, Will Connolly	A star-crossed prophecy. A lot of music. Just not a lot of light. In this darkly comic rock-fable, a melancholy sandwich maker’s humdrum life is intersected by two entrancing sisters. A sweeping ode to young love set against the backdrop of the Northeast blackout of 1965, Fly By Night is a tale about making your way and discovering hope in a world beset by darkness.	https://music.apple.com/us/album/fly-by-night-original-off-broadway-cast-recording/1002485705	https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/91/70/4f/91704fc4-f785-271d-87e1-183631292d2b/859714874526_cover.jpg/1000x1000bb.jpeg
134	Follies	Stephen Sondheim	Stephen Sondheim	A true theatrical event, this legendary masterpiece is considered by many to be the greatest musical ever created. Surreal, sophisticated, compelling, heart wrenching and epic in scope, Follies by musical theatre legend, Stephen Sondheim, and author, James Goldman, uses the musical theatre as a metaphor for the collapse of American innocence and naivete in the post-Kennedy years. In Follies, the time is 1971, and theatrical impresario, Dimitri Weissmann, hosts a reunion of ex-Follies performers in his crumbling theatre, setting the stage for a parade of brilliant pastiche numbers, including "Losing My Mind," "I'm Still Here" and "Broadway Baby." Amid the reminiscing, two middle-aged couples confront some unpleasant truths about their past and present, coming face-to-face with the future. Follies is a true showcase for powerful dramatic actors with plenty of opportunities for seasoned, older performers. Spectacular and grand in scale, Follies has also proven ideal for concert presentation and features many of Stephen Sondheim's best-known songs.	https://music.apple.com/us/album/follies-new-broadway-cast-recording/481773992	https://is4-ssl.mzstatic.com/image/thumb/Music/93/62/d4/mzi.hdqxcpqd.jpg/1000x1000bb.jpeg
135	Footloose	Tom Snow, Eric Carmen, Sammy Hagar, Kenny Loggins and Jim Steinman	Dean Pitchford	The explosive movie musical bursts onto the live stage! With dynamic new songs augmenting the powerhouse hits from its bestselling Oscar-nominated score, Footloose celebrates the exhilaration of youth, the wisdom of listening to one another, and the power of forgiveness.	https://music.apple.com/us/album/footloose-the-musical-original-broadway-cast-recording/1308552484	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/e3/cd/17/e3cd175d-2685-71e0-b1e1-600c9316caa1/791558945430.jpg/1000x1000bb.jpeg
136	Forever Plaid	Various, James Raitt	Various	Forever Plaid is one of the most popular and successful musicals in recent memory. This deliciously fun revue is chock-full of classic barbershop quartet harmonies and pitch-perfect melodies! Once upon a time, there were four guys (Sparky, Smudge, Jinx and Frankie) who discovered that they shared a love for music and then got together to become their idols – The Four Freshman, The Hi-Lo's and The Crew Cuts. Rehearsing in the basement of Smudge's family's plumbing supply company, they became "Forever Plaid". On the way to their first big gig, the "Plaids" are broadsided by a school bus and killed instantly. It is at the moment when their careers and lives end that the story of Forever Plaid begins.... Singing in close harmony, squabbling boyishly over the smallest intonations and executing their charmingly outlandish choreography with overzealous precision, the "Plaids" are a guaranteed smash, with a program of beloved songs and delightful patter that keeps audiences rolling in the aisles when they're not humming along to some of the great nostalgic pop hits of the 1950s.	https://music.apple.com/us/album/forever-plaid-original-cast-recording/254986609	https://is5-ssl.mzstatic.com/image/thumb/Music/0f/92/83/mzi.srvqqmqy.jpg/1000x1000bb.jpeg
137	Freaky Friday	Tom Kitt	Brian Yorkey	The new musical, Freaky Friday, based on the beloved 1972 novel by Mary Rodgers and the hit Disney films (and developed by Disney Theatrical Productions expressly for licensing to theatres), features a book by Bridget Carpenter - the co-executive producer and writer on the beloved TV hits, "Friday Night Lights" and "Parenthood" - and music and lyrics by Tom Kitt and Brian Yorkey - the Pulitzer Prize-winning composers of Next to Normal and If/Then. When an overworked mother and her teenage daughter magically swap bodies, they have just one day to put things right again. Freaky Friday, a new musical based on the celebrated novel by Mary Rodgers and the hit Disney films, is a heartfelt, comedic, and unexpectedly emotional update on an American classic. By spending a day in each other's shoes, Katherine and Ellie come to appreciate one another's struggles, learn self-acceptance, and realize the immeasurable love and mutual respect that bond a mother and daughter. Read the Detailed Instrumentation for Freaky Friday	https://music.apple.com/us/album/freaky-friday-a-new-musical-studio-cast-recording/1440642030	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/89/6f/76/896f7687-21cb-51ba-9451-0ef66a8a309f/00050087360511.rgb.jpg/1000x1000bb.jpeg
138	Freckleface Strawberry The Musical	Gary Kupper	Gary Kupper	Freckleface Strawberry The Musical, based on the beloved New York Times best-selling book by celebrated actress, Julianne Moore, is a fun and touching family musical. Specifically created to perform for young audiences, families can step inside of the book's pages with Freckleface and friends as they learn to "love the skin they're in." Freckleface Strawberry will do anything to get rid of her freckles – from scrubbing them with soap to caking on makeup... and even wearing a ski mask to school! Will her schoolmates realize that it's her under the mask? Will Freckleface be brave enough to finally face her complexion in the mirror? With the help of her loveable schoolmates, including an amazingly talented ballerina, a cutie jock, a charming ditz and a totally kooky teacher, Freckleface learns that everyone is different – and that's what makes everyone special. Audiences will love Freckleface Strawberry The Musical, with soaring live music, opportunities for fun choreography and a freckleface full of laughs. With a small cast and minimal production requirements, this is the perfect show for touring or theatres with educational programs.	https://music.apple.com/us/album/freckleface-strawberry-original-cast-recording/407595514	https://is1-ssl.mzstatic.com/image/thumb/Music/52/d6/fd/mzi.hnkmtuix.jpg/1000x1000bb.jpeg
139	Fun Home	Jeanine Tesori	Lisa Kron	When her father dies unexpectedly, graphic novelist Alison dives deep into her past to tell the story of the volatile, brilliant, one-of-a-kind man whose temperament and secrets defined her family and her life. Moving between past and present, Alison relives her unique childhood playing at the family’s Bechdel Funeral Home, her growing understanding of her own sexuality, and the looming, unanswerable questions about her father’s hidden desires. Fun Home is a refreshingly honest, wholly original musical about seeing your parents through grown-up eyes.	https://music.apple.com/us/album/fun-home-a-new-broadway-musical/990340829	https://is3-ssl.mzstatic.com/image/thumb/Music1/v4/e3/cd/1b/e3cd1b25-895d-bdd3-8bdf-46ec645f4bc2/803607152925_cover.jpg/1000x1000bb.jpeg
140	Funny Girl	Jule Styne	Bob Merrill	In the Ziegfeld Follies, in Hollywood films, and on the radio, Fanny Brice was one of the most celebrated entertainers of her time. With humor, talent, and chutzpah, young Fanny, an awkward Jewish girl who "isn't pretty," defies the odds and becomes one of the greatest stars of her generation. Fanny's rise to super-stardom and her turbulent romance with gambler Nick Arnstein are explored through Bob Merrill and Jule Styne's unforgettable score, which includes "People," "Don't Rain On My Parade," "I'm the Greatest Star," "The Music That Makes Me Dance," and "You Are Woman, I Am Man." Funny Girl opened on Broadway on March 26, 1964 and played for 1,348 performances at the Winter Garden, Majestic, and Broadway Theatres. The original cast featured Barbra Streisand, Sydney Chaplin, Kay Medford and Jean Stapleton. A new London production opened at the Menier Chocolate Factory on December 2, 2015, starring Sheridan Smith as Fanny. The production transferred to London's Savoy Theatre in the West End, opening on April 9, 2016.	https://music.apple.com/us/album/funny-girl-50th-anniversary-edition/1443225608	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/ab/dc/c5/abdcc5e0-58c2-cd97-fecd-704f7c46f767/00602537702565.rgb.jpg/1000x1000bb.jpg
141	Gay's the Word	Ivor Novello	Alan Melville	Gay Daventry, a producer and stage star, goes bankrupt when her new London operetta, similar to a Ruritanian Ivor Novello musical, is a disappointing failure. She agrees with the show's ingénue, Linda, to open a drama school with Linda's money at Gay's country house in Folkestone. Meanwhile, two smugglers hope to use the school as a front for their illegal activities. When she finally presents her show at Town Hall, Gay unexpectedly finds herself onstage with her cast members, and ultimately attempts to auction off her valuables in an attempt to save her school. Little does she know that insodoing she will foil the smugglers and maybe even turn out a hit new show!	https://music.apple.com/us/album/gays-the-word-original-2012-london-cast/1506628670	https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/b2/e7/c1/b2e7c1e8-1f80-1b99-6b4e-34433f6abe58/605288208225.jpg/1000x1000bb.jpeg
142	Gentlemen Prefer Blondes	Jule Styne	Leo Robin	Based on Anita Loos’s 1925 bestseller of the same title, Gentlemen Prefer Blondes follows Lorelei Lee, a blonde from Little Rock, Arkansas, who sails to Europe with her friend Dorothy to perform in a nightclub in Paris. Hit songs include "Diamonds Are A Girl's Best Friend," "Bye Bye, Baby" and "I'm Just A Little Girl From Little Rock."Gentlemen Prefer Blondes opened on Broadway at the Ziegfeld Theatre on December 8, 1949, starring Carol Channing, Yvonne Adair, Jack McCauley, Eric Brotherson and George S. Irving. The production played for 740 performances. In 1995, a production at the Goodspeed Opera House transferred to the Lyceum Theatre in New York and starred KT Sullivan. In 2012, a staged concert production was presented by New York City Center's Encores!, starring Megan Hilty and Rachel York.	https://music.apple.com/us/album/gentlemen-prefer-blondes-encores-cast-recording-2012/554773560	https://is5-ssl.mzstatic.com/image/thumb/Music/v4/d3/9c/46/d39c46f7-f876-d7e9-171d-0e330719b3e1/886443513150.jpg/1000x1000bb.jpeg
143	George M!	George M. Cohan, Mary Cohan	George M. Cohan, Mary Cohan	George M! recounts the life story of George M. Cohan, a giant of the American musical theater who penned songs like “Yankee Doodle Dandy,” “Over There,” “You’re A Grand Old Flag,” and “Give My Regards to Broadway.” In his triumphant career, Cohan helped transform the Broadway musical from a slapdash patchwork of songs and sketches into a streamlined, book-driven musical story. Covering a sixty-year period from his childhood in vaudeville through his towering success on Broadway, George M! presents a rousing, tuneful portrait of this legendary song-and-dance man.George M! opened on Broadway at the Palace Theatre on April 10, 1968, starring Joel Grey, Jerry Dodge, Betty Ann Grove and Bernadette Peters. The production ran for 433 performances.	https://music.apple.com/us/album/george-m-original-broadway-cast-recording/376376918	https://is5-ssl.mzstatic.com/image/thumb/Music/30/86/00/mzi.yxnbdpnz.jpg/1000x1000bb.jpeg
146	Godspell	Stephen Schwartz	Stephen Schwartz	Godspell was the first major musical theatre offering from three-time Grammy and Academy Award winner, Stephen Schwartz (Wicked, Pippin, Children of Eden), and it took the world by storm. Led by the international hit, "Day by Day," Godspell features a parade of beloved songs, including "Prepare Ye the Way of the Lord," "Learn Your Lessons Well," "All for the Best," "All Good Gifts," "Turn Back, O Man" and "By My Side." A small group of people help Jesus Christ tell different parables by using a wide variety of games, storytelling techniques and hefty doses of comic timing. An eclectic blend of songs, ranging in style from pop to vaudeville, is employed as the story of Jesus' life dances across the stage. Dissolving hauntingly into the Last Supper and the Crucifixion, Jesus' messages of kindness, tolerance and love come vibrantly to life. Boasting a score with chart topping songs, a book by a visionary playwright (John-Michael Tebelak) and a feature film, Godspell is a sensation that continues to touch audiences. Because of its small technical demands and minimal cast size, it has become a staple of theatre companies, large and small.	https://music.apple.com/us/album/godspell-40th-anniversary-celebration-original-off/459757902	https://is5-ssl.mzstatic.com/image/thumb/Music/5f/83/6f/mzi.cdavvgfl.jpg/1000x1000bb.jpeg
147	Golden Rainbow	Walter Marks	Walter Marks	This big, razzle-dazzle musical set in Las Vegas, starred Steve Lawrence, as a ne'er do well dreamer, with Eydie Gorme as his late wife's sister, a no-nonsense realist who arrives to save her nephew Allie from his father's irresponsible and hedonistic ways. Based on the hit Broadway comedy,  A Hole in the Head, the sparkling score includes the hits "I Gotta Be Me"and "We Got Us."	https://music.apple.com/us/album/golden-rainbow-featuring-steve-lawrence-eydie-gorme/866035888	https://is4-ssl.mzstatic.com/image/thumb/Music6/v4/13/b3/07/13b307c8-04a5-581c-6498-c9af0e9b0ba3/894232237026.jpg/1000x1000bb.jpeg
148	Goldilocks	Leroy Anderson	Walter Kerr, Jean Kerr and Joan Ford	Back in the days of nickelodeon movies, producer Max who has a contract with beautiful comedienne, Maggie and an obsession with filming an epic set in Egypt entitled "Heart of Stone", over-spends on ostentatious Egyptian scenery much to the displeasure of his backers who threaten to pull the plug. To stave off the inevitable and keep the disillusioned Maggie on the set, Max tricks his backers and himself as he completes his film and much to his surprise, falls in love. Elaine Stritch and Don Ameche orignated the roles of Maggie and Max on Broadway.	https://music.apple.com/us/album/goldilocks-original-broadway-cast-recording/213746160	https://is1-ssl.mzstatic.com/image/thumb/Features/7c/8a/86/dj.nbpnkpul.jpg/1000x1000bb.jpeg
149	Goldilocks and the Three Bears	George Stiles	Anthony Drewe	When the worlds of bears and people collide, everyone learns that girls and bears aren't as ferocious as they may seem in the Theatre for Young Audience version of Goldilocks and the Three Bears. Award-winning writers, George Stiles and Anthony Drewe (Honk!, Mary Poppins), inject a bear-sized helping of music and mayhem into this classic fairytale, making it "just right" for the entire family. Goldilocks, on a trip into the forest, ventures into a seemingly uninhabited house. In the process of making herself feel at home, she turns the place into a gigantic mess! Little does she know that the house belongs to a family of three bears... who will not be too pleased to witness her handiwork. Featuring an unforgettable score and a story that every child knows and loves, this adaptation is perfect for family audiences. The minimal cast size and limited design needs make Goldilocks and the Three Bears a great show for touring or for any theatre with a strong Theatre for Young Audiences component.	https://music.apple.com/us/album/stiles-drewes-goldilocks-three-bears-studio-cast-recording/1270396464	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/d0/15/4f/d0154f5a-deea-8ba2-93c6-fce0c0a7e028/859722185270_cover.jpg/1000x1000bb.jpeg
150	Goodtime Charley	Larry Grossman	Hal Hackady	Rave reviews greeted the recent 42nd Street Moon Theatre's reworked revival of this Tony Award nominee that originally starred Joel Grey as Charles, the Dauphin, bastard son of Queen Isabella of Bavaria and a dissolute ne'er-do-well. This so-called "Goodtime Charley" meets his match in the Maid of Orleans, Joan of Arc. With her prodding and inspiration, "Goodtime Charley" grows from a fun-loving woman-chaser into Charles the VII, King of France encouraged by Joan who follows her "voices" to a greater fate as martyr and Saint.	https://music.apple.com/us/album/goodtime-charley-original-broadway-cast-recording/337633953	https://is5-ssl.mzstatic.com/image/thumb/Features/82/2c/df/dj.nmnbixsg.jpg/1000x1000bb.jpeg
151	Grand Hotel: The Musical	Robert Wright, Maury Yeston	Robert Wright, Maury Yeston	Come spend a night or two in the world's most luxurious and mysterious hotel. Esteemed bookwriter, Luther Davis (Kismet, Timbuktu!), collaborated again with the prolific, distinguished composer-lyricist team of Robert Wright and George Forrest (Kismet, Timbuktu!, Magdalena) to create Grand Hotel, a seamless musical that won multiple Tony and Drama Desk Awards. With additional music and lyrics by the great Maury Yeston, Tommy Tune's 1989 production of Grand Hotel featured early work from Jane Krakowsi and a legendary performance by Michael Jeter as Otto Kringelein It is 1928. The world is between wars, the stock market is booming, Berlin is the center of high life and optimism rules the day. However, underneath it all, much is happening with the Grand Hotel's illustrious clients. Inspired by Vicki Baum's period novel, issues of life and death, financial ruin, love and murder converge as people and come and go through the lobby of the Grand Hotel. Grand Hotel richly contrasts comedy, tragedy, glitz and realism and is sure to captivate both your actors and audiences. The nonstop book is a star vehicle for both a male and female actor, and the powerful score has ample opportunity for trained singers. This large cast dance show also features a diverse cast.	https://music.apple.com/us/album/grand-hotel-the-musical-original-broadway-cast-recording/357911381	https://is4-ssl.mzstatic.com/image/thumb/Music/e3/da/bd/mzi.mpzlozao.jpg/1000x1000bb.jpeg
152	Grease	Jim Jacobs and Warren Casey	Jim Jacobs and Warren Casey	Here is Rydell High's senior class of 1959: duck-tailed, hot-rodding "Burger Palace Boys" and their gum-snapping, hip-shaking "Pink Ladies" in bobby sox and pedal pushers, evoking the look and sound of the 1950s in this rollicking musical. Head "greaser" Danny Zuko and new (good) girl Sandy Dumbrowski try to relive the high romance of their "Summer Nights" as the rest of the gang sings and dances its way through such songs as "Greased Lightnin", "It's Raining on Prom Night", "Alone at the Drive-In Movie" recalling the music of Buddy Holly, Little Richard, and Elvis Presley that became the soundtrack of a generation. An eight-year run on Broadway and two subsequent revivals, along with innumerable school and community productions place Grease among the world's most popular musicals.	https://music.apple.com/us/album/grease-new-broadway-cast-recording/264542138	https://is4-ssl.mzstatic.com/image/thumb/Music/33/93/4b/mzi.celjrsdx.jpg/1000x1000bb.jpg
153	Green Day's American Idiot	Green Day	Billie Joe Armstrong, Green Day	The two-time Tony Award-winning hit musical Green Day's American Idiot, based on the Grammy Award-winning multi-platinum album, boldly takes the American musical where it's never gone before. This high-octane show includes every song from Green Day's album, American Idiot, as well as several songs from its follow-up release, 21st Century Breakdown. Johnny, Tunny and Will struggle to find meaning in a post-9/11 world. When the three disgruntled men flee the constraints of their hometown for the thrills of city life, their paths are quickly estranged when Tunny enters the armed forces, Will is called back home to attend to familial responsibilities, and Johnny's attention becomes divided by a seductive love interest and a hazardous new friendship. An energy-fueled rock opera, American Idiot, features little dialogue and instead relies on the lyrics from Green Day's groundbreaking album to execute the story line. American Idiot is a high-concept show with strong social messages and endless creative possibilities. It will surely add an enticing edge to any theatre's season. Download the logo and full marketing guidelines here.	https://music.apple.com/us/album/american-idiot-the-original-broadway-cast-recording/366916135	https://is2-ssl.mzstatic.com/image/thumb/Music/f2/be/03/mzi.uxygrgff.jpg/1000x1000bb.jpeg
154	Groundhog Day	Tim  Minchin	Tim  Minchin	Critically acclaimed on both the West End and Broadway, Groundhog Day revels in one man's journey of self-discovery, day after day.  Inspired by the hilarious film starring Bill Murray, Groundhog Day features a book by original co-screenwriter Dan Rubin, and music and lyrics by Tony Award-winner Tim Minchin (Matilda the Musical). How would you spend your time if forced to repeat the same day over and over again? Phil Connors, a seasoned big-city weatherman, is frustrated to be to reporting the annual Groundhog Day Ceremony in small town Punxsutawney, PA. His arrogance and cynicism are in direct opposition to the cheery townsfolk, who are ready for their favorite Groundhog to not see his shadow and welcome an early spring. After disdainfully covering the rodent's negative forecast, he awakens the next day only to discover it's February 2 once more. Initially in disbelief, Phil finally accepts he is doomed to repeat the same day over and over again....	https://music.apple.com/us/album/groundhog-day-musical-original-broadway-cast-recording/1215389487	https://is3-ssl.mzstatic.com/image/thumb/Music122/v4/c2/85/aa/c285aae7-9af1-6f3d-cacc-ce22cea8daef/886446408705.jpg/1000x1000bb.jpeg
155	Gunmetal Blues	Craig Bohmler, Marion Adler, Scott Wentworth	Craig Bohmler, Marion Adler, Scott Wentworth	Is this a hard-boiled detective tale disguised as a lounge act – or the other way around? Direct from The Red Eye Lounge, Buddy Toupee tickles the ivories and serves up plot concoctions like a Chandleresque Greek chorus. The private eye searches for a missing blonde through a double-dealing world of smoky bars, rain-slicked streets, and more blondes.	https://music.apple.com/us/album/gunmetal-blues/1144263667	https://is1-ssl.mzstatic.com/image/thumb/Music22/v4/c7/15/c6/c715c65c-fb6b-fe7e-b334-25e2c216194f/191018069124.jpg/1000x1000bb.jpeg
156	Gutenberg! The Musical!	Scott Brown, Anthony King	Scott Brown, Anthony King	In this two-man musical spoof, a pair of aspiring playwrights perform a backers’ audition for their new project - a big, splashy musical about printing press inventor Johann Gutenberg. With an unending supply of enthusiasm, Bud and Doug sing all the songs and play all the parts in their crass historical epic, with the hope that one of the producers in attendance will give them a Broadway contract – fulfilling their ill-advised dreams.Brown and King developed Gutenberg! at the Upright Citizens Brigade Theatre in New York City, where it ran for over a year with direction by Charlie Todd and musical direction by Barry Wyner. It starred the authors and Ken Keech. The show was par	https://music.apple.com/us/album/gutenberg-musical-original-off-broadway-cast-recording/676329088	https://is4-ssl.mzstatic.com/image/thumb/Music/v4/11/04/bf/1104bf55-840b-12bf-c3d4-074b510d83b7/803607098322_cover.tif/1000x1000bb.jpeg
157	Guys and Dolls	Frank Loesser	Frank Loesser	Considered by many to be the perfect musical comedy, Guys and Dolls ran for 1,200 performances when it opened on Broadway in 1950. It received nearly unanimous positive reviews from critics and won a bevy of awards, including Tony Awards, Drama Desks and Oliviers. Frequently revived, the show has been done with numerous all-star casts, including productions/concerts featuring Ewan McGregor, Jane Krakowski, Brian Stokes Mitchell and Jessica Biel. Set in Damon Runyon's mythical New York City, Guys and Dolls is an oddball romantic comedy. Gambler, Nathan Detroit, tries to find the cash to set up the biggest craps game in town while the authorities breathe down his neck; meanwhile, his girlfriend and nightclub performer, Adelaide, laments that they've been engaged for fourteen years. Nathan turns to fellow gambler, Sky Masterson, for the dough, and Sky ends up chasing the straight-laced missionary, Sarah Brown, as a result. Guys and Dolls takes us from the heart of Times Square to the cafes of Havana, Cuba, and even into the sewers of New York City, but eventually everyone ends up right where they belong. Frank Loesser's brassy, immortal score makes Guys and Dolls a crowd pleaser. The large cast features both a variety of ensemble and star roles. With a great collection of production resources from MTI, this highly producible show is a treat for audiences and performers of any age.	https://music.apple.com/us/album/guys-and-dolls-new-broadway-cast-recording-1992/258638090	https://is2-ssl.mzstatic.com/image/thumb/Features/62/ec/48/dj.jhujaxzk.jpg/1000x1000bb.jpeg
158	Gypsy	Jule Styne	Stephen Sondheim	Gypsy opened at the Broadway Theatre on May 21, 1959, starring Ethel Merman as Rose and Sandra Church as Louise. Later moving to the Imperial Theatre, the show played for a total of 702 performances. In London, Gypsy played for 300 performances at the Piccadilly Theatre, starring Angela Lansbury as Rose. This extremely successful show has been revived on Broadway no less than four times: starring Angela Lansbury in 1974, Tyne Daly in 1989, Bernadette Peters in 2003, and Patti LuPone in 2008. A 2015 revival at the Savoy Theatre in London starred Imelda Staunton.	https://music.apple.com/us/album/gypsy-original-broadway-cast-recording/164925460	https://is4-ssl.mzstatic.com/image/thumb/Features/2a/7e/25/dj.tcvoxrdr.jpg/1000x1000bb.jpeg
159	Hadestown	Anaïs Mitchell	Anaïs Mitchell	This intriguing and beautiful folk opera delivers a deeply resonant and defiantly hopeful theatrical experience. Following two intertwining love stories — that of young dreamers Orpheus and Eurydice, and that of immortal King Hades and Lady Persephone — Hadestown invites audiences on a hell-raising journey to the underworld and back. Inspired by traditions of classic American folk music and vintage New Orleans jazz, Mitchell’s beguiling sung-through musical pits industry against nature, doubt against faith, and fear against love.	https://music.apple.com/us/album/hadestown-myth-musical-original-cast-recording-live/1271398099	https://is4-ssl.mzstatic.com/image/thumb/Music118/v4/09/f9/77/09f97700-c939-706c-8c2e-4c20b0621186/190295768058.jpg/1000x1000bb.jpeg
160	Hair	Galt MacDermot	Gerome Ragni & James Rado	The American tribal love rock musical Hair celebrates the sixties counterculture in all its barefoot, long-haired, bell-bottomed, beaded and fringed glory. To an infectiously energetic rock beat, the show wows audiences with songs like "Aquarius," "Good Morning, Starshine," "Hair," "I Got Life," and "Let The Sun Shine." Exploring ideas of identity, community, global responsibility and peace, Hair remains relevant as ever as it examines what it means to be a young person in a changing world.Hair debuted Off-Broadway at Joseph Papp's Public Theater on October 17, 1967. The show was an instant sensation, moving to a second venue and playing 144 performances. On April 29, 1968 Hair opened on Broadway at the Biltmore Theatre, starring James Rado, Gerome Ragni, Lynn Kellogg and Melba Moore. Breaking all theatre conventions, the show made national headlines and played for 1,750 performances. A 1977 Broadway revival starred Randall Easterbrook, Michael Holt, Ellen Foley and Iris Rosenkrantz. In 2009, Hair returned to Broadway and played for 519 performances at the Al Hirshfeld Theatre, starring Gavin Creel, Will Swenson, Caissie Levy and Sasha Allen.	https://music.apple.com/us/album/hair-the-new-broadway-cast-recording/1308392091	https://is4-ssl.mzstatic.com/image/thumb/Music128/v4/07/fe/b2/07feb2ca-bb7f-04ae-c483-0d471a06fa48/791558196733.jpg/1000x1000bb.jpeg
161	Hairspray	Marc Shaiman	Marc Shaiman	The 1950s are out, and change is in the air! Hairspray, winner of eight Tony Awards, including Best Musical, is a family-friendly musical, piled bouffant-high with laughter, romance and deliriously tuneful songs. It's 1962 in Baltimore, and the lovable plus-size teen, Tracy Turnblad, has only one desire – to dance on the popular "Corny Collins Show." When her dream comes true, Tracy is transformed from social outcast to sudden star. She must use her newfound power to dethrone the reigning Teen Queen, win the affections of heartthrob, Link Larkin, and integrate a TV network... all without denting her 'do! Hairspray is ideal for a large cast of strong singers and dancers. It provides great opportunities in terms of set design, costuming and lighting choices. Licenses for Hairspray and Hairspray JR. will include a rider with the following language: MTI receives many inquiries about the casting requirements for Hairspray. At its core, Hairspray is a story about acceptance and inclusion (and rejection and exclusion) during the early days of the civil rights movement. The authors' artistic vision requires that, in order to clearly and appropriately tell that story, the cast members in the show accurately reflect the characters as written. As such, this Production Contract requires that the cast members in your production of Hairspray accurately reflect the character descriptions contained in the script. Note:   The use of make-up to portray black characters in your production (e.g., blackface) is not permitted under this Production Contract.  By signing below, you agree to inform the director of your production of the casting requirements and that such use of make-up is strictly prohibited. In the past, performance licenses for Hairspray did not include this provision. However, the authors have determined that expressly stating this requirement is an important component of insuring that licensed productions of the Hairspray accurately reflect the authors' intent. MTI and orignal Broadway choreographer Jerry Mitchell have partnered to revolutionize the way you choreograph your musicals with a new innovative resource: The Original Production (TOP). Use the Official Jerry Mitchell Choreography for Hairspray and Legally Blonde	https://music.apple.com/us/album/hairspray-original-broadway-cast-recording/157356876	https://is4-ssl.mzstatic.com/image/thumb/Features/77/7b/7d/dj.xdqznyyn.jpg/1000x1000bb.jpg
162	Hallelujah, Baby!	Jule Styne	Betty Comden and Adolph Green	Through the struggles and triumphs of a determined, talented, and resilient leading lady, Hallelujah, Baby! celebrates the African American experience in the first half of the 20th century. Arthur Laurents’ inventive book follows Georgina Franklin as she rises from domestic work in the 1920s to stardom in the late 1960s—all without aging a day.	https://music.apple.com/us/album/hallelujah-baby-original-broadway-cast-recording/442485096	https://is4-ssl.mzstatic.com/image/thumb/Music/6d/98/53/mzi.rqlzhixn.jpg/1000x1000bb.jpeg
163	Hands on a Hardbody	Trey Anastasio and Amanda Green	Amanda Green	For 10 hard-luck Texans, a new lease on life is so close they can touch it. Under a scorching sun for days on end, armed with nothing but hope, humor and ambition, they'll fight to keep at least one hand on a brand-new truck in order to win it. In the hilarious, hard-fought contest that is Hands on a Hardbody only one winner can drive away with the American Dream. Inspired by the true events of the acclaimed 1997 documentary of the same name by S.R. Bindler, produced by Kevin Morris and Bindler.Check out the videos below!Hands on a Hardbody was first presented on Broadway by Broadway Across America, Beth Williams, Barbara Whitman/Latitude Link, Dede Harris/Sharon Karmazin, Howard & Janet Kagan, John & Claire Caudwell, Rough Edged Souls, Joyce Primm Schweickert , Paula Black/Bruce Long, and Off The Aisle Productions/Freitag-Mishkin at the Brooks Atkinson Theatre in New York City on March 21, 2013. The musical was previously presented by by La Jolla Playhouse in La Jolla, California, on June 6, 2012.  It was also directed by Mr. Pepe.	https://music.apple.com/us/album/hands-on-a-hardbody-original-broadway-cast-recording/1308437408	https://is4-ssl.mzstatic.com/image/thumb/Music128/v4/20/99/83/20998310-dc8a-9b71-4f83-99b6fc3ef46b/791558947533.jpg/1000x1000bb.jpeg
164	Happy Days - A New Musical	Paul Williams	Paul Williams	Goodbye gray skies, hello blue! Happy days are here again with Richie, Potsie, Ralph Malph and the unforgettable "king of cool" Arthur "The Fonz" Fonzarelli. Based on the hit Paramount Pictures television series, Happy Days, A New Musical reintroduces one of America's best loved families, the Cunninghams -- yes, Howard, Marion and Joanie are here too -- to a whole new generation of kids and parents.	https://music.apple.com/us/album/happy-days-a-new-musical-original-sountrack/632957674	https://is4-ssl.mzstatic.com/image/thumb/Music2/v4/1b/d5/ed/1bd5edee-2b57-525f-7c09-573ec0695f0c/803607086022_cover.tif/1000x1000bb.jpeg
165	Happy Hunting	Harold Karr	Matt Dubey	A strong-willed matriarch meets high society in Happy Hunting, a star vehicle that was originally written for the incomparable Ethel Merman. The book was written by the diehard Lindsay and Crouse (Anything Goes), and the original production was directed by the legendary Abe Burrows. When Liz Livingstone – a rich, widowed Philadelphia hostess, at odds with the Main Line crowd – perceives a snub at the Grace Kelly-Prince Rainier "Wedding of the Year" in Monaco, she single-mindedly sets out to snare an even more impressively titled husband for her daughter. Things get predictably complicated when she succeeds... and then promptly falls for her intended son-in-law, herself! Meanwhile, the bride-to-be only has eyes for a society lawyer. Things really get interesting when Liz's dashing Duke turns out to be penniless. Happy Hunting features a gag-filled book and a delectable score, including the Merman classic, "Mutual Admiration Society." In addition to the star role, this large cast gives opportunities to many female performers, including teenagers. Happy Hunting is a flamboyant, bubbly, lighthearted romp!	https://music.apple.com/us/album/happy-hunting-original-broadway-cast-recording/337719599	https://is4-ssl.mzstatic.com/image/thumb/Music/8f/87/8f/mzi.oaxqxwnt.jpg/1000x1000bb.jpeg
166	Hazel Flagg	Jule Styne	Bob Hilliard	Hazel Flagg is based on the film Nothing Sacred, with screenplay by Ben Hecht from a story by James Street. A Vermont girl becomes the center of media attention when she is wrongly believed to be sick from radium poisoning.Hazel Flagg opened on Broadway at the Mark Hellinger Theatre on February 11, 1953, starring Helen Gallagher in the title role. The show played for 190 performances.	https://music.apple.com/us/album/hazel-flagg-original-broadway-cast-recording/309044055	https://is4-ssl.mzstatic.com/image/thumb/Music/ea/91/31/mzi.xssjnvtk.jpg/1000x1000bb.jpeg
168	Hello, Dolly!	Jerry Herman	Jerry Herman	This musical adaptation of Thornton Wilder's hit play The Matchmaker bursts with humor, romance, energetic dance, and some of the greatest songs in musical theatre history. The romantic and comic exploits of Dolly Gallagher-Levi, turn-of-the-century matchmaker and "woman who arranges things," are certain to thrill and entertain audiences again and again.The show's unforgettable songs include "Put On Your Sunday Clothes," "Ribbons Down My Back," "Before the Parade Passes By," "Hello, Dolly!," "Elegance," and "It Only Takes a Moment."Hello, Dolly! opened on Broadway on January 16, 1964 at the St. James Theatre. Opening with Carol Channing in the title role, the show ultimately played for 2,844 performances, making it - at the time - the longest-running Broadway musical in history. The West End production ran for 794 performances at London's Drury Lane Theatre.Hello, Dolly! has been revived several times on Broadway, most recently in 2017, starring Bette Midler as Dolly Levi.	https://music.apple.com/us/album/hello-dolly/1222140586	https://is3-ssl.mzstatic.com/image/thumb/Music111/v4/7a/35/4b/7a354bca-fbce-2ea5-076e-f49a3289364d/886446250793.jpg/1000x1000bb.jpeg
169	High Button Shoes	Jule Styne	Sammy Cahn	Based on Stephen Longstreet’s 1946 novel The Sisters Liked Them Handsome, High Button Shoes is a wacky tribute to Mack Sennett’s brand of screwball comedy. The score, which hilariously incorporates themes by Franz Liszt and Jacques Offenbach, features a string of delightful Jule Styne/Sammy Cahn numbers, including “Papa, Won’t You Dance With Me?,” “I Still Get Jealous,” and “On A Sunday By The Sea” (a.k.a. “The Bathing Beauty Ballet”). High Button Shoes opened on Broadway at the New Century Theatre on October 9, 1947, starring Phil Silvers and Nanette Fabray. The show later moved to the Shubert Theatre and the Broadway Theatre, playing for a total of 727 performances.	https://music.apple.com/us/album/high-button-shoes-original-broadway-cast-recording/1458790901	https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/fe/c7/1e/fec71ea7-e0bb-1d73-d826-6dbfff98bc9d/886443485983.jpg/1000x1000bb.jpeg
170	High Society	Cole Porter	Cole Porter, Susan Birkenhead	At their waterfront estate in Oyster Bay, the Lord family prepares for a lavish wedding weekend. The reluctant bride-to-be, famed socialite Tracy Lord, bristles when her playful ex-husband Dexter arrives to stir up trouble. Juggling a precocious younger sister, an uninspiring fiancé, a pesky ex-husband, a harried mother, a carousing uncle, and a pair of snooping reporters, Tracy struggles to make sense of her romantic life. The score is packed with Cole Porter standards, including “Ridin’ High,” “She’s Got That Thing,” “True Love,” “Just One Of Those Things,” “Let’s Misbehave,” “It’s All Right With Me,” and “Well, Did You Evah?”High Society opeend on Broadway at the St. James Theatre on Apr 27, 1998, starring Melissa Errico, Daniel McDonald, Randy Graff, Stephen Bogardus and John McMartin. It was revived in London at the Old Vic Theatre in 2015.	https://music.apple.com/us/album/high-society-original-uk-cast-recording/539747225	https://is5-ssl.mzstatic.com/image/thumb/Music/v4/8c/cd/c0/8ccdc0a7-551b-456d-5f84-3f4d6a5d5e9a/Cover.jpg/1000x1000bb.jpeg
171	Holiday Inn	Irving Berlin	Irving Berlin	Irving Berlin's Holiday Inn tells the story of Jim, who leaves the bright lights of show business behind to settle down on his farmhouse in Connecticut... but life just isn't the same without a bit of song and dance. Jim's luck takes a spectacular turn when he meets Linda, a spirited schoolteacher with talent to spare. Together they turn the farmhouse into a fabulous inn with dazzling performances to celebrate each holiday, from Thanksgiving to the Fourth of July. But when Jim's best friend Ted tries to lure Linda to Hollywood to be his new dance partner, will Jim be able to salvage his latest chance at love?	https://music.apple.com/us/album/irving-berlins-holiday-inn-original-broadway-cast-recording/1241504424	https://is4-ssl.mzstatic.com/image/thumb/Music127/v4/2e/2a/4d/2e2a4dda-2bd6-8260-e233-d984ca2e2cc1/791558651232.jpg/1000x1000bb.jpg
172	Honeymoon in Vegas	Jason Robert Brown	Jason Robert Brown	Based on the hit 1992 film, Honeymoon in Vegas is an hilarious new musical that centers on an unusual love triangle, featuring a wonderful new score by Tony-winning composer, Jason Robert Brown. Mild-mannered Brooklynite, Jack, promised his dying mother that he would never get married, but that was before he met his sweet and beautiful girlfriend, Betsy. Haunted by a fear of Mom's retribution, Jack avoids proposing but, when he finally summons the nerve to whisk oh-so-patient Betsy off to Las Vegas to get hitched, a dashing gambler named Tommy threatens to sweep his fiancée away to a life of luxury in Hawaii. Realizing what he's about to lose, Jack is determined to do anything to give his love story a happy ending. It all adds up to an action-packed honeymoon that no one will ever forget! With a classic appeal, Honeymoon in Vegas is sure to delight audiences of all ages. Fast, funny and irresistible, this non-stop laugh-riot is filled to the brim with unforgettable songs and characters. Bet the house on this insanely funny new musical that is full of skydiving Elvises, sexy chorus girls, red-hot romance and really cold feet.	https://music.apple.com/us/album/honeymoon-in-vegas-original-broadway-cast-recording/1442989181	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/3a/c5/3f/3ac53f06-9693-bfc5-6df2-659c595cec7b/00602547128553.rgb.jpg/1000x1000bb.jpeg
173	Honk!	George Stiles	Anthony Drewe	Since it first hatched in 1993, Stiles & Drewe's musical, Honk!, has winged its way around the world in over 8,000 productions and in many different languages. Winner of multiple awards, including the 2000 Olivier Award for Best Musical, this heartwarming celebration of being different is sure to delight audiences of all ages with its sparkling wit and memorable score. Ugly looks quite a bit different from his darling duckling brothers and sisters. The other animals on the farm are quick to notice and point this out, despite his mother's protective flapping. Feeling rather foul about himself, the little fowl finds himself on an adventure of self-discovery, all the while unknowingly outwitting a very hungry Cat. Along the way, Ugly meets a whole flock of unique characters and finds out that being different is not a bad thing to be. Perfect for casts of all sizes and budgets, small or large, Honk! is a popular family-friendly pick. The musical is also ideal for showcasing the talents of younger actors. With its bouncing score and universal story, this touching musical with plenty of heart will captivate audiences.	https://music.apple.com/us/album/honk-stiles-and-drewes-original-demo-recording/539886229	https://is2-ssl.mzstatic.com/image/thumb/Music/v4/45/3c/46/453c4687-efd5-54a2-d1a3-c043aae79257/Cover.jpg/1000x1000bb.jpeg
188	It Ain't Nothin' But the Blues	Dan Wheetman, Charles Bevel, Lita Gaithers, Randal Myler, Ron Taylor	Dan Wheetman, Charles Bevel, Lita Gaithers, Randal Myler, Ron Taylor	This sizzling revue of the blues and blues infused songs that changed the way the world hears the human heartbeat took New York by storm. Ravishing songs trace the evolution of the blues from Africa to Mississippi to Memphis to Chicago.	https://music.apple.com/us/album/it-aint-nothin-but-the-blues-original-broadway-cast-live/1444000724	https://is4-ssl.mzstatic.com/image/thumb/Music118/v4/94/16/c4/9416c45f-a32c-5c16-1d75-ac10e53e96e7/00008811215026.rgb.jpg/1000x1000bb.jpeg
174	Hot Mikado	Rob Bowman	David H. Bell	Cultures glide and collide in a hilarious and "hot" updating of Gilbert and Sullivan's perennial classic, The Mikado. Hot Mikado weaves an hilarious tale, where, despite life-or-death stakes, characters still find time to tap their toes and do their fair share of scatting. An indescribably wonderful opportunity for a culturally diverse organization, the musical is rich with intricate vocal lines that are ideal for a skilled group of vocalists. Because of its singular juxtaposition of Japanese culture with 1940s style, this show can prove just as yummy for visionary scenic designers and directors alike.	https://music.apple.com/us/album/hot-mikado-original-cast-recording/539466397	https://is4-ssl.mzstatic.com/image/thumb/Music/v4/a0/f4/8f/a0f48f0d-12c4-20f0-613a-7224cba1ffe9/Cover.jpg/1000x1000bb.jpeg
175	How Now, Dow Jones	Elmer Bernstein	Carolyn Leigh	This musical comedy follows Kate, the voice of Dow Jones, whose fiance won't marry her until the Dow Jones Averages hit 1,000. Bribery, adultery, and neurotic Republicans abound in this madcap and timely tale set in the heart of Wall Street.The original Broadway production of How Now, Dow Jones opened on December 7, 1967 starring Tony Roberts, Marlyn Mason, and Brenda Vaccaro. The David Merrick production was directed by George Abbott, with choreography by Gillian Lynne (and an uncredited Michael Bennett). It played 220 performances and was nominated for six Tony® Awards, including Best Musical, winning one for co-star Hiram Sherman.	https://music.apple.com/us/album/how-now-dow-jones-original-broadway-cast-recording/258594511	https://is3-ssl.mzstatic.com/image/thumb/Music/6c/5f/84/mzi.etjjrjsl.jpg/1000x1000bb.jpeg
176	How to Succeed in Business without Really Trying	Frank Loesser	Frank Loesser	Big business means big laughs in this delightfully clever lampoon of life on the corporate ladder. A tune-filled comic gem that took Broadway by storm, winning both the Tony Award for Best Musical and a Pulitzer Prize, How to Succeed in Business without Really Trying boasts an exhilarating score by Frank Loesser, including "I Believe in You," "Brotherhood of Man" and "The Company Way." A satire of big business and all it holds sacred, How to Succeed in Business without Really Trying follows the rise of J. Pierrepont Finch, who uses a little handbook called How to Succeed in Business without Really Trying to climb the corporate ladder from lowly window washer to high-powered executive, tackling such familiar but potent dangers as the aggressively compliant "company man," the office party, backstabbing coworkers, caffeine addiction and, of course, true love. An irreverent and tuneful romp, jam-packed with sly, swift and sharp jabs to the funny bone, How to Succeed in Business without Really Trying is a surefire hit! This show requires a large cast, featuring many roles for all types of performers and a great opportunity to showcase your male ensemble.	https://music.apple.com/us/album/how-to-succeed-in-business-without-really-trying-new/358399543	https://is2-ssl.mzstatic.com/image/thumb/Music/6c/a8/00/mzi.uxsbqmju.jpg/1000x1000bb.jpeg
177	I Can Get It For You Wholesale	Harold Rome	Harold Rome	Based on Jerome Weidman’s bestselling novel, I Can Get It For You Wholesale is the story of an ambitious young businessman artfully clawing his way to the top of the garment industry in 1930s New York. With humor and frankness, the show explores the perils of ambition and the price of success. Contrasting the swinging, jazzy rhythms of big city business with the earthy, traditional sounds of the characters’ Eastern European origins, I Can Get It For You Wholesale captures the energy and promise of a pivotal time in Jewish American history.I Can Get It For You Wholesale opened on Broadway at the Shubert Theatre on March 22, 1962, starring Elliott Gould, Lilian Roth and Marilyn Cooper. The show transferred to the Broadway Theatre and ran for a total of 300 performances. Barbra Streisand, who made her Broadway debut as Miss Marmelstein, earned a Tony nomination for Best Featured Actress in a Musical.	https://music.apple.com/us/album/i-can-get-it-for-you-wholesale-original-broadway-cast/289325523	https://is3-ssl.mzstatic.com/image/thumb/Music3/v4/90/e7/cf/90e7cf67-997a-4bbf-78f0-d54457081396/dj.zelkgbci.jpg/1000x1000bb.jpeg
179	I Love My Wife	Michael Stewart	Michael Stewart	A musical that takes place in Trenton, N.J.? Yes-- and a delightfully funny one too. It's about a would be menage a quatre-- two couples who want to plunge into liberated mutual sexuality but only manage to get their toes wet. The masculine pair of the foursome are Wally, a public relations man; and his friend Alvin, who's in the furniture moving business. Their respective wives in this escapade are Monica and Cleo. What is truly innovative about the show is putting the musicians on the stage-- not merely to play their instruments. Actually they are welded into the play, they sing, dress up in fancy clothes and keep commenting on the action.	https://music.apple.com/us/album/i-love-my-wife/1496217554	https://is5-ssl.mzstatic.com/image/thumb/Music113/v4/63/e5/06/63e50681-5f59-ed5a-a02b-d3b387f4d3a1/dj.ndiepggt.jpg/1000x1000bb.jpeg
180	I Love You, You're Perfect, Now Change	Jimmy Roberts	Joe DiPietro	This celebration of the mating game takes on the truths and myths behind that contemporary conundrum know as 'the relationship.' Act I explores the journey from dating and waiting to love and marriage, while Act II reveals the agonies and triumphs of in-laws and newborns, trips in the family car and pick-up techniques of the geriatric set. This hilarious revue pays tribute to those who have loved and lost, to those who have fallen on their face at the portal of romance, to those who have dared to ask, 'Say, what are you doing Saturday night?'For the 2018 updated version of I Love You, You're Perfect, Now Change,Click Here	https://music.apple.com/us/album/i-love-you-youre-perfect-now-change-hilarious-new-musical/1440786486	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/65/af/5f/65af5fad-730b-1963-742f-258121e8bb30/00030206577129.rgb.jpg/1000x1000bb.jpeg
196	Jesus Christ Superstar	Andrew Lloyd Webber	Tim Rice	A rock opera based on the last week of Jesus’ life.	https://music.apple.com/us/album/jesus-christ-superstar-remastered-2005/1440895002	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/f2/05/b7/f205b729-fe8f-84c1-2396-a09728f35844/00602557594225.rgb.jpg/1000x1000bb.jpeg
181	I Remember Mama	Richard Rodgers	Martin Charnin, Raymond Jessel	For his final score, Richard Rodgers turned to a play he and Hammerstein had produced on Broadway 35 years earlier that had gone on to become a modern classic. Set in San Francisco following the turn of the century, this story of a Norwegian family's survival in the New World is told in retrospect by the eldest daughter, a successful writer recounting the start of her career and the childhood that inspired it. She takes us back to relive familial hardships and triumphs including the near loss of their home, Papa's desperate return to Norway when he can no longer find work, and the sale of her first story-this one. But, of course, it's Mama she remembers most of all, always guiding their precarious journey with a firm hand and a warm heart.	https://music.apple.com/us/album/i-remember-mama-original-studio-cast-digital-remaster/192509107	https://is2-ssl.mzstatic.com/image/thumb/Music/37/00/24/mzi.vnthffbc.tif/1000x1000bb.jpeg
182	I'm Getting My Act Together and Taking It on the Road	Nancy Ford	Gretchen Cryer	I’m Getting My Act Together And Taking It On The Road was a controversial sensation at Joseph Papp’s Public Theater and Circle in the Square in the late ’70s. It is the story of a thirty-nine-year-old songwriter who is making a comeback, throwing out “the crap of the past” – her commercial sex kitten image – in order to forge a new identity, writing songs that express how she really feels and who she really is. Her manager (a former lover) is appalled. He likes her the way she used to be and says he can’t sell this “new woman.” They battle it out to a bittersweet, triumphant conclusion.Premiered at Joseph Papp's Public TheatreI'm Getting My Act Together and Taking It On the Road was part of the 2013 Encores! Series at New York City Center	https://music.apple.com/us/album/im-getting-my-act-together-taking-it-on-road-original/1486013237	https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/6c/64/44/6c6444d5-632b-7a78-2230-e109a8dd291e/605288207525.jpg/1000x1000bb.jpeg
183	If/Then	Tom Kitt	Brian Yorkey	With unforgettable songs and a deeply moving story by the Pulitzer Prize- and Tony Award-winning creators of Next to Normal, If/Then is a fascinating, ambitious and original new musical. If/Then simultaneously follows one woman's two possible life paths, painting a deeply moving portrait of the lives that we lead, as well as the lives that we might have led. Elizabeth, a city planner, moves back to New York to restart her life in the city of infinite possibilities. When her carefully designed plans collide with the whims of fate, Elizabeth's life splits into two parallel paths. If/Then follows both stories simultaneously, as this modern woman faces the intersection of choice and chance. If/Then is a contemporary Broadway musical about living in New York today and all of the possibilities of tomorrow. With a powerhouse role for a leading lady and rich and complex supporting roles, this show celebrates dynamite talent and the power of great storytelling.	https://music.apple.com/us/album/if-then-a-new-musical-original-broadway-cast-recording/860768697	https://is4-ssl.mzstatic.com/image/thumb/Music/v4/5d/fb/e2/5dfbe222-18bf-0f12-bf49-93e2c1f5f84e/886444560368.jpg/1000x1000bb.jpeg
184	In the Heights	Lin-Manuel Miranda	Lin-Manuel Miranda	In the Heights tells the universal story of a vibrant community in New York’s Washington Heights neighborhood - a place where the coffee from the corner bodega is light and sweet, the windows are always open and the breeze carries the rhythm of three generations of music. It’s a community on the brink of change, full of hopes, dreams and pressures, where the biggest struggles can be deciding which traditions you take with you, and which ones you leave behind.	https://music.apple.com/us/album/in-the-heights-original-broadway-cast-recording/1269639900	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/83/6f/a2/836fa2b7-662c-9b44-d25e-f43cf0d4dee3/791558888737.jpg/1000x1000bb.jpeg
185	In Transit	Kristen Anderson-Lopez	Kristen Anderson-Lopez	Swipe your metro card and bring Broadway's first and only a cappella musical to your stage. In Transit is a dynamic show that tells an all-too-relatable story about finding your way (and yourself) in New York City. From Academy Award-winner Kristen Anderson-Lopez (Frozen, Frozen JR.), James-Allen Ford, Russ Kaplan, and Sara Wordsworth (Frozen JR.), with vocal arrangements by Deke Sharon (Pitch Perfect, "The Sing Off"), In Transit will have everyone humming and beatboxing along. Jane is an actress juggling auditions and a soul-crushing desk job. Trent and Steven are engaged, but Trent's mother doesn't even know they're together. Ali is picking herself back up after being dumped by her longtime boyfriend. Nate is out of work and doing what he can to get by. Althea is a subway booth attendant who has no time for nonsense. They might not have much in common, but against the backdrop of the bustling Big Apple, their paths cross and affect each other. With irresistible a cappella songs, In Transit is a perfect fit for a talented ensemble of robust singers.	https://music.apple.com/us/album/in-transit-broadways-first-cappella-musical-original/1440770334	https://is4-ssl.mzstatic.com/image/thumb/Music128/v4/32/b4/0c/32b40c22-b012-19bf-f59b-e64344f58bc3/00050087368920.rgb.jpg/1000x1000bb.jpeg
186	Into the Woods	Stephen Sondheim	Stephen Sondheim	James Lapine and Stephen Sondheim take everyone's favorite storybook characters and bring them together for a timeless, yet relevant, piece... and a rare modern classic. The Tony Award-winning book and score are both enchanting and touching. The story follows a Baker and his wife, who wish to have a child; Cinderella, who wishes to attend the King's Festival; and Jack, who wishes his cow would give milk. When the Baker and his wife learn that they cannot have a child because of a Witch's curse, the two set off on a journey to break the curse. Everyone's wish is granted, but the consequences of their actions return to haunt them later with disastrous results. One of Sondheim's most popular works, Into the Woods is a musically sophisticated show with the opportunity to feature actors adept at dark comedy. Designers will especially enjoy highlighting the fantastical elements of this magical word.	https://music.apple.com/us/album/into-woods-original-broadway-cast-recording-bonus-tracks/219236910	https://is5-ssl.mzstatic.com/image/thumb/Music/b4/eb/34/mzi.wdgmwlkh.jpg/1000x1000bb.jpeg
187	Irma La Douce	Marguerite Monnot	Alexandre Breffort, Julian More, David Heneker and Monty Norman	Irma, the title character of the French musical Irma La Douce, is a young woman working the streets of Paris. Nestor le Fripé, a poor law student, falls for Irma and grows jealous of her clients. To remain Irma's only lover, Nestor assumes the disguise of a rich older man named Oscar, taking numerous jobs to support himself and Irma. Unable to sustain his exhausting life, Nestor ultimately “kills” Oscar. But the authorities, believing the murder actually took place, convict Nestor and send him to the Devil's Island penal colony. Nestor ultimately escapes and returns to Paris to prove his innocence and reunite with Irma.	https://music.apple.com/us/album/irma-la-douce-original-broadway-cast-recording/261666971	https://is2-ssl.mzstatic.com/image/thumb/Features/c6/ae/88/dj.wppdbmxr.jpg/1000x1000bb.jpeg
189	It Shoulda Been You	Barbara  Anselmi	Brian  Hargrove, Michael Cooper	A world where nothing is what it seems, religions collide, Machiavellian plots are revealed, promises are broken, secrets are exposed and hope springs from the most unlikely of places.... Is it the latest conflict in the Middle East? No, it's just the Steinberg wedding. The charming, funny and original new musical, It Shoulda Been You invites you to a wedding day that you'll never forget, where anything that can go wrong does, and love pops up in mysterious places. The bride is Jewish. The groom is Catholic. Her mother is a force of nature. His mother is a tempest in a cocktail shaker. And, when the bride's ex-boyfriend crashes the party, the perfect wedding starts to unravel faster than you can whistle "Here Comes the Bride!"  It's up to the sister of the bride to turn a tangled mess into happily ever after in this musical comedy for anyone who ever had parents. A non-stop, 90-minute laugh-riot, It Shoulda Been You is a guaranteed crowd-pleasing hit. This is a true ensemble show, featuring a dozen standout roles from old to young, making it a terrific choice for theatres wanting to feature their outstanding talent.	https://music.apple.com/us/album/it-shoulda-been-you-original-broadway-cast-recording/1304008223	https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/7c/58/7e/7c587e92-4bc2-0200-f4b3-bf86c89c7ab1/791558449235.jpg/1000x1000bb.jpeg
190	It's Only Life	John Bucchino	John Bucchino	John Bucchino's songs have been recorded and performed by Judy Collins, Patti LuPone, Yo-Yo Ma, Audra MacDonald, Liza Minnelli, Art Garfunkel and many others. Conceived by director Daisy Prince and the award-winnnig songwriter, It's Only Life is a musical revue about longing, fulfillment, loss, triumph and ultimately wisdom. According to the New York Times, Bucchino's 'flowing, finely made piano ballads describe an urban life in which relationships come and go in cycles of yearning, fulfillment, heartbreak and healing' - where romantic love is anticipated with 'high expectations, high anxiety and open hearts.' The show won LA's 2008 Ovation Award for Best Book/Lyrics/Music for an Original Musical.	https://music.apple.com/us/album/its-only-life-a-new-musical-revue/884351901	https://is4-ssl.mzstatic.com/image/thumb/Music4/v4/de/f5/ad/def5ad02-a01b-5ccf-77d3-4153e55e3201/803607063924_cover.tif/1000x1000bb.jpeg
191	It’s a Bird… It’s a Plane… It’s Superman	Charles Strouse	Lee Adams	Campy, dynamic, and larger than life, It's A Bird... It's A Plane... It's Superman® captures the sights and sounds of 1960s New York City as Superman battles a vengeful scientist determined to destroy the world’s symbol of good. Meanwhile, Daily Planet writer Lois Lane struggles to make sense of her rocky romance with the superhero, and Lois' ambitious coworker Max vows to make a name for himself by unveiling the Man of Steel's secret identity.It's A Bird... It's A Plane... It's Superman® opened on Broadway at the Alvin Theatre on March 29, 1966, starring Jack Cassidy, Patricia Marand, Linda Lavin, Michael O’Sullivan and Don Chastain. In 2013, New York City Center's Encores! revived the show, starring Edward Watts, Jenny Powers, Will Swenson, David Pittu and Alli Mauzey.	https://music.apple.com/us/album/its-bird-its-plane-its-superman-original-broadway-cast/261769293	https://is4-ssl.mzstatic.com/image/thumb/Features/51/d6/cb/dj.qmdomhxy.jpg/1000x1000bb.jpeg
192	Jane Eyre	Paul Gordon	Paul Gordon, John Caird	Charlotte Brontë's great love story comes to life with music to lift your heart and set your spirit soaring. This beloved tale of secrets and the lies that secrets create, of unimaginable hope and unspoken passion, reminds us what it is to fall deeply, truly and completely in love. Nominated for five Tony Awards, Jane Eyre explores religion, sexuality and protofeminism, all while enchanting audiences with a timeless love story. Jane's story begins in Gateshead, where she is in the unfortunate care of her cruel Aunt Sarah and cousin, John, as per her uncle's dying wish. The miserable young orphan is finally rescued when she is sent away to attend Lowood School for Girls. After six years, Jane leaves Lowood and is shortly after hired as a governess at Thornfield Hall. Here, she meets Mr. Edward Rochester, thus beginning her passionate and heart-wrenching journey of love, loss and the struggles of morality. This intellectual period drama is a wonderful work of theatre. It provides an opportunity for the classically trained voice, not to mention an excellent chance for all aspects of technical theatre to bring this masterful piece to life.	https://music.apple.com/us/album/jane-eyre-the-musical-original-broadway-cast-recording/251014518	https://is1-ssl.mzstatic.com/image/thumb/Music/9a/87/5d/mzi.oxyysdcn.jpg/1000x1000bb.jpeg
193	Jasper in Deadland	Hunter Foster, Ryan Scott Oliver	Hunter Foster, Ryan Scott Oliver	Jasper is lost in the living world. When you’re failing classes, kicked off the swim team, and your family is on the skids, life can feel like it’s going to hell. Yet, in all the disappointment, Jasper has his best friend, Agnes. In one night of teenage passion, Jasper and Agnes consummate a years-long friendship. But in the morning Agnes is gone, telling Jasper to meet her at their cliff. When he arrives there’s no sign of his best friend, only a swirling vortex to another world in the water below. Jasper dives into Deadland.	https://music.apple.com/us/album/jasper-in-deadland-world-premiere-recording/1308282301	https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/18/df/2e/18df2eeb-5ce7-634e-c1ee-7ea26a65ea88/791558949933.jpg/1000x1000bb.jpeg
194	Jekyll & Hyde	Frank Wildhorn	Leslie Bricusse	The epic struggle between good and evil comes to life on stage in the musical phenomenon, Jekyll & Hyde. Based on the classic story by Robert Louis Stevenson and featuring a thrilling score of pop rock hits from multi-Grammy- and Tony-nominated Frank Wildhorn and double-Oscar- and Grammy-winning Leslie Bricusse, Jekyll & Hyde has mesmerized audiences the world over. An evocative tale of two men – one, a doctor, passionate and romantic; the other, a terrifying madman – and two women – one, beautiful and trusting; the other, beautiful and trusting only herself– both women in love with the same man and both unaware of his dark secret. A devoted man of science, Dr. Henry Jekyll is driven to find a chemical breakthrough that can solve some of mankind's most challenging medical dilemmas. Rebuffed by the powers that be, he decides to make himself the subject of his own experimental treatments, accidentally unleashing his inner demons along with the man that the world would come to know as Mr. Hyde. This gothic musical is the perfect opportunity for your male and female stars to showcase their abilities. Jekyll & Hyde offers great flexibility for cast size and use of ensemble and its powerful rock score will require strong, versatile singers.	https://music.apple.com/us/album/jekyll-hyde-musical-1997-original-broadway-cast-recording/79026988	https://is3-ssl.mzstatic.com/image/thumb/Music/y2005/m08/d18/h18/mzi.gcxzjgpo.jpg/1000x1000bb.jpeg
195	Jerry's Girls	Jerry Herman	Jerry Herman	This Broadway hit features all the best songs for women from such immortal musicals as Mame, Hello Dolly!, Milk and Honey, Mack and Mabel, A Day in Hollywood/A Night in the Ukraine and La Cage Aux Folles.Jerry's Girls was first presented on Broadway at the St. James Theatre in December of 1985. It was directed by Larry Alford and starred Dorothy Loudon, Chita Rivera, and Leslie Uggams.	https://music.apple.com/us/album/jerrys-girls-original-cast/204215887	https://is2-ssl.mzstatic.com/image/thumb/Music/78/54/54/mzi.byvfzwnp.tif/1000x1000bb.jpeg
197	John & Jen	Andrew Lippa	Tom Greenwald	A truly original musical that honors brothers and sisters, as well as parents and children, set against the background of a changing America between 1950 and 1990, John & Jen is a gem of a show, brimming with intelligence, wit and beautiful melodies. This is the story of Jen and her relationships with the two Johns of her life: her younger brother, who was killed in Vietnam, and his namesake, the son who is trying to find his way in a confusing world. Jen and her younger brother, John, are growing up in the ever-changing world of mid-century America. As the country becomes divided over the war in Vietnam, so does the family, and battle lines are drawn between the once-close siblings. When John is killed in Vietnam, Jen is left to reconcile her memory of their fractured relationship along with her son and brother's namesake. With a cast of only two people, John & Jen is a tour-de-force for two actors, taking them from childhood, through adolescence, and beyond. A chamber musical, beautifully scored for piano, cello and percussion, John & Jen is a musical about connections, commitments and the healing of the human heart.	https://music.apple.com/us/album/john-jen-original-cast-recording-from-the-musical/1304583232	https://is4-ssl.mzstatic.com/image/thumb/Music128/v4/c6/f4/35/c6f43592-5f99-993b-a5b9-16c323ee4f2f/791558445930.jpg/1000x1000bb.jpeg
198	Joseph and the Amazing Technicolor Dreamcoat	Andrew Lloyd Webber	Tim Rice	The irresistible family musical about the trials and triumphs of Joseph, Israel’s favorite son.	https://music.apple.com/us/album/joseph-amazing-technicolor-dreamcoat-canadian-cast/1440914516	https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/53/c4/fb/53c4fbc3-7504-4ba2-5b55-01c3e4a2aa2a/00602557929843.rgb.jpg/1000x1000bb.jpeg
199	Judy's Scary Little Christmas	Joe Patrick Ward	Joe Patrick Ward	2002, Victory Theatre Center, Burbank CA - JSLC in association with The Victory Theatre Center.	https://music.apple.com/us/album/judys-scary-little-christmas-original-l-a-cast-album/544957645	https://is4-ssl.mzstatic.com/image/thumb/Music/v4/20/9d/13/209d132b-84bf-40cc-cbfd-bcbfb5dbea67/837101108102.jpg/1000x1000bb.jpeg
200	Junie B. Jones, The Musical	Zina Goldrich	Marcy Heisler	Created by Marcy Heisler and Zina Goldrich, the team that brought you Dear Edwina, comes Junie B. Jones, The Musical – a delightful adaptation of four of Barbara Park's best-selling books, brought to life in a genuinely comical (and not strictly-for-kids) musical developed by TheatreworksUSA. Awaken a young person's desire to read with the sassy little diva, Junie B. Jones, and her adventures in first grade. It's Junie B.'s first day of first grade, and a lot of things have changed for her: Junie's friend, Lucille, doesn't want to be her best pal anymore and, on the bus, Junie B. makes friends with Herb, the new kid at school. Also, Junie has trouble reading the blackboard and her teacher, Mr. Scary, thinks she may need glasses. Throw in a friendly cafeteria lady, a kickball tournament and a "Top-Secret Personal Beeswax Journal," and first grade has never been more exciting. Featuring a tremendously loveable character and fun-filled songs, Junie B. Jones will capture your audience members' hearts just as the books captivated an entire generation of students. The small cast, minimal design needs and performance accompaniment CD make this an ideal show for theatres looking to tour schools or with strong education programs.\r\nFor more about the Junie B. Jones books, visit www.juniebjones.com or a bookstore near you!	https://music.apple.com/us/album/junie-b-jones-the-musical-cast-album/1187073992	https://is5-ssl.mzstatic.com/image/thumb/Music111/v4/be/20/02/be200257-5439-0017-f8fc-b203970caeaf/191061165521.jpg/1000x1000bb.jpeg
201	Just So	George Stiles	Anthony Drewe	A project that was a quarter of a century in the making, began with a series of inspirational stories. Stiles and Drewe (Honk! and Mary Poppins) bring us an imaginatively empowering piece of theatre in Just So. Set to an eclectic, upbeat score, Kipling's Just So Stories are woven with wit and imagination into a song-filled journey through the jungle. "Before the High and Far-off Times... came the Time of the Very Beginnings," when everything was just so, until Pau Amma the Crab started playing with the ocean. This caused the lands to flood, disrupting the other animals and putting them in danger. While the rest of the animals accept their sad fate, Elephant's Child embarks on a journey to challenge and overcome the disobedient crab. Along the way, he meets other animals and discovers how the mysteries of their phenomenon came to be. Just So is a designer's dream come true, with overwhelming opportunity for elaborate sets and costumes. Audiences will not only be highly entertained but also inspired by the underlying message – that one determined individual can make a real difference in this world.	https://music.apple.com/us/album/just-so-world-premiere-cast-recording/539500794	https://is5-ssl.mzstatic.com/image/thumb/Music/v4/e3/b5/78/e3b57828-e591-45b3-01e8-7c8fd7c55f0e/Cover.jpg/1000x1000bb.jpeg
202	King's Rhapsody	Ivor Novello	Christopher Hassall	The King of Murania is dead! Long live the King! But the heir is Nikki, twenty years in exile, and living with actress Marta Karillos, disliked and distrusted by the people. To ensure a suitable succession, Elena, the Queen Mother, acidly witty and a schemer of genius, persuades Nikki to accept the crown, marry Cristiane - the snow princess from Norseland - and beget an heir as soon as is decently possible. 	https://music.apple.com/us/album/kings-rhapsody-the-dancing-years/579495811	https://is1-ssl.mzstatic.com/image/thumb/Music/v4/55/72/d0/5572d0d4-1de8-3913-6c70-0eec4345db3e/Cover.jpg/1000x1000bb.jpeg
203	Kinky Boots	Cyndi Lauper	Cyndi Lauper	Winner of six Tony Awards, including Best Musical, Kinky Boots features a joyous, Tony-winning score by Cyndi Lauper, and a hilarious, uplifting book by four-time Tony winner, Harvey Fierstein. Charlie Price has reluctantly inherited his father's shoe factory, which is on the verge of bankruptcy. Trying to live up to his father's legacy and save his family business, Charlie finds inspiration in the form of Lola. A fabulous entertainer in need of some sturdy stilettos, Lola turns out to be the one person who can help Charlie become the man that he is meant to be. As they work to turn the factory around, this unlikely pair find that they have more in common than they ever dreamed possible... and discover that, when you change your mind about someone, you can change your whole world. Kinky Boots is full of opportunities for a theatre to flex its artistic muscles with elaborate costumes, exhilarating choreography and a truly moving and powerful story. A surefire crowd pleaser, Kinky Boots will have your audiences dancing in the aisles and discovering why, sometimes, the best way to fit in... is to stand out!	https://music.apple.com/us/album/kinky-boots-original-broadway-cast-recording/638366374	https://is5-ssl.mzstatic.com/image/thumb/Music2/v4/0a/80/cc/0a80ccf8-5a32-0397-78da-2845c1f8f1bd/886443963597.jpg/1000x1000bb.jpeg
204	Kismet	Robert Wright	Robert Wright	With three Tony Awards (including Best Musical), a television version and an MGM smash film, Kismet is one of the most renowned musicals to grace the Great White Way. Kismet has proven a winner with audiences time and again, thanks to its exotic setting, appealing characters and wry sense of humor... not to mention a lush score that is adapted from the soaring melodies of Alexander Borodin. A series of well-navigated, sticky circumstances have landed the quick-witted Public Poet in opulence. His rolling in gold is cut short when his maneuvering comes full circle, though, and he is forced in front of the Wazir, who is set to chop off The Poet's hand. As luck would have it, a last-minute realization stays the Wazir's hand and saves The Poet's. The wild ride continues as The Poet's daughter falls in love with the handsome Caliph, The Poet falls in love with one of the Wazir's concubines and everyone falls in love with the whirlwind of occurrences that could only happen on an Arabian Night! Kismet is a surefire hit! Comedy reigns supreme in its masterful libretto, and delicious melodies abound in Kismet's score, thanks to the creative geniuses behind Grand Hotel and the writer responsible for Gentlemen Prefer Blondes. It's a must-produce for theatre companies across the world!	https://music.apple.com/us/album/kismet-musical-arabian-night-original-broadway-cast/368764300	https://is4-ssl.mzstatic.com/image/thumb/Music/d8/6f/af/mzi.gnthblnt.jpg/1000x1000bb.jpeg
205	Kiss Me, Kate	Cole Porter	Cole Porter	Passions run high as leading lady Lilli Vanessi and her ex-husband, actor/director Fred Graham, battle onstage and off in a production of Shakespeare's Taming of the Shrew. With romance, comedy, sophistication, and behind-the-scenes high jinks, Kiss Me, Kate combines the irreverent humor of four brilliant writers: Sam and Bella Spewack, Cole Porter and William Shakespeare. Musical numbers include "So In Love," "Wunderbar," "Tom, Dick or Harry," "Too Darn Hot," "Brush Up Your Shakespeare," "I Hate Men," "Always True to You (In My Fashion)" and "Another Op'nin, Another Show."	https://music.apple.com/us/album/kiss-me-kate-broadway-cast-recording/42327525	https://is1-ssl.mzstatic.com/image/thumb/Music/y2005/m01/d30/h07/s05.owvioabx.jpg/1000x1000bb.jpeg
206	Kiss of the Spider Woman	John Kander	Fred Ebb	Kiss of the Spider Woman revamps a harrowing tale of persecution into a dazzling spectacle that juxtaposes gritty realities with liberating fantasies. Cell mates in a Latin American prison, Valentin is a tough revolutionary undergoing torture and Molina is an unabashed homosexual serving eight years for deviant behavior. Molina shares his fantasies about an actress, Aurora (originated on Broadway by Chita Rivera) with Valentin. One of her roles is a Spider Woman who kills with a kiss.	https://music.apple.com/us/album/kiss-of-the-spider-woman-cast-recording/1452311032	https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/10/27/64/10276417-bb2a-3bf8-2823-ed41066e093a/00731452652621.rgb.jpg/1000x1000bb.jpeg
207	Kuni Leml	Raphael Crystal	Richard Engquist	This gem garnered the Outer Critics' Circle awards for best book, best music, best lyrics and best Off Broadway musical. A tale of young lovers defying tradition-- in this case the arranged match of the young heroine to the ultimate schlemiel, Kuni Leml is classic Yiddish farce. A family musical with universal appeal, it is bright, modern, and easy to produce.	https://music.apple.com/us/album/kuni-leml-cast-recording/41739851	https://is1-ssl.mzstatic.com/image/thumb/Music/y2005/m01/d20/h16/s05.fbieaacf.jpg/1000x1000bb.jpeg
208	Kurt Vonnegut's God Bless You, Mr. Rosewater	Alan Menken	Howard Ashman, Dennis Green	Kurt Vonnegut's God Bless You, Mr. Rosewater is an outrageous and savagely funny fantasy about people, their pleasures, pains and perversions, a penetrating satire on insanity – a millionaire's private lunacy. Featuring an infectious score by the Oscar- and Tony-winning team of Alan Menken and Howard Ashman (Beauty and the Beast, The Little Mermaid, Little Shop of Horrors), God Bless You, Mr. Rosewater is a legendary collaboration between one of America's greatest novelists and the songwriting team behind some of the greatest hits of all time. Eliot Rosewater, drunk, volunteer fireman and president of the fabulously rich Rosewater Foundation, is about to attempt a noble experiment with human nature, with a little help from writer, Kilgore Trout. The result is Vonnegut's funniest satire, an etched-in-acid portrayal of the greed, hypocrisy and follies of the flesh to which we are all heir. Any fan of the music of Menken and Ashman will delight in producing this gem, which marked the first collaboration for the two. Full of unforgettable characters and a rich and hysterically funny story, God Bless You, Mr. Rosewater is a perfect choice for theatres that are looking for hidden greats of musical theatre. Alan Menken speaks about his work: "Of all the musicals I've composed scores for in my career God Bless You, Mr. Rosewater is probably closest and dearest to my heart..." "... It was my very first commercially produced musical and, more importantly, my first collaboration with Howard Ashman. Adapted from Kurt Vonnegut's novella, it tells the story of Elliot Rosewater, the eccentric head of the Rosewater Foundation, son of Senator Rosewater, descendant of generations of wealthy and powerful Rosewater's, who finds in the poor and forgotten Americans in Rosewater Township, Indiana, the very people who most deserve his foundation's generosity. And that story struck a deep chord in both Howard and me. The fact that Kurt Vonnegut himself became creatively involved in our little musical was a total dream-come-true. If you look (and listen) carefully, the seeds of our later work are all over this musical. It was the cradle from which we emerged to write Little Shop of Horrors, The Little Mermaid and Aladdin . We lost Howard Ashman way too soon, or that list of titles would have been much longer. That makes it all the more meaningful to me that, nearly 40 years after its creation, God Bless You Mr Rosewater now joins those other titles out in the world."	https://music.apple.com/us/album/kurt-vonneguts-god-bless-you-mr-rosewater-premiere/1256577240	https://is5-ssl.mzstatic.com/image/thumb/Music117/v4/23/e8/a3/23e8a348-5d60-55a3-04c3-e4e46a95cee6/791558451139.jpg/1000x1000bb.jpeg
209	La Cage aux Folles	Jerry Herman	Jerry Herman	La Cage Aux Folles opened at The Palace Theatre in New York City on August 21, 1983. It was directed by Arthur Laurents.	https://music.apple.com/us/album/la-cage-aux-folles-new-broadway-cast-recording/893248699	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/27/7e/6c/277e6c0b-88c2-b5f0-a623-1636156ae40b/803607109424_cover.jpg/1000x1000bb.jpeg
210	Lady Day at Emerson's Bar and Grill	Lanie Robertson	Lanie Robertson	The time is 1959. The place is a seedy bar in Philadelphia. The audience is about to witness one of Billie Holiday’s last performances, given four months before her death. More than a dozen musical numbers are interlaced with salty, often humorous reminiscences to project a riveting portrait of the lady and her music.	https://music.apple.com/us/album/lady-day-at-emersons-bar-grill-original-broadway-cast/895448857	https://is3-ssl.mzstatic.com/image/thumb/Music4/v4/cd/f3/f4/cdf3f4d2-0a77-2300-56ef-186e3d82a487/803607142322_cover.tif/1000x1000bb.jpeg
211	Lady, Be Good!	George Gershwin and Ira Gershwin	George Gershwin and Ira Gershwin	The very first Broadway collaboration of the Gershwin brothers, Lady, Be Good! tells the story of an impoverished brother-and-sister dance team who will do anything to help one another. The tuneful score includes the hits "Oh, Lady Be Good!" and "Fascinating Rhythm."Lady, Be Good! opened on Broadway at the Liberty Theatre, December 1, 1924 and played for 330 performances starring Fred Astaire and his sister, Adele Astaire.	https://music.apple.com/us/album/lady-be-good-1992-studio-cast-recording/98411520	https://is4-ssl.mzstatic.com/image/thumb/Features/v4/b4/b8/c8/b4b8c87f-6739-e251-606f-c33bd3906fa8/dj.jchmmpkj.jpg/1000x1000bb.jpeg
212	Leap of Faith	Alan Menken	Glenn Slater	Love will get you every time... and one charismatic con man is about to find that out in the Tony-nominated Leap of Faith, based on the film of the same name that starred Steve Martin and Debra Winger. With a roof-raising score by eight-time Oscar winner Alan Menken (Disney's Beauty and the Beast, Little Shop of Horrors, Disney's The Little Mermaid), lyrics by Grammy winner Glenn Slater (Disney's Tangled), and a book by Janus Cercone and Tony winner Warren Leight, Leap of Faith boasts a tour-de-force creative team and is sure to have your audiences dancing in the aisles. The "Reverend" Jonas Nightingale, an electrifying performer and con artist, is travelling with his ministry when his bus breaks down in a small Kansas town. The part-time reverend and full-time crook pitches a tent and invites the locals to a revival. The sheriff, a woman named Marla McGowan, is determined to stop Jonas from separating the townspeople from their money, and Jonas' real challenge arises when he meets the sheriff and her son, whose love forces an ultimate cynic to take a real leap of faith. A moving tribute to the power of faith, Leap of Faith is a perfect show for organizations looking to entertain as well as inspire their audiences. Jonas Nightengale is a powerhouse role, providing the perfect opportunity to showcase a true star performer, as well as an ensemble that can bring the house down with sensational songs and explosive choreography.	https://music.apple.com/us/album/leap-of-faith-the-musical-original-broadway-cast-recording/1303992921	https://is1-ssl.mzstatic.com/image/thumb/Music118/v4/42/17/1f/42171f12-54ac-5615-aa74-c59b67b04bb1/791558946536.jpg/1000x1000bb.jpeg
213	Legally Blonde The Musical	Laurence O'Keefe	Laurence O'Keefe	A fabulously fun award-winning musical based on the adored movie, Legally Blonde The Musical, follows the transformation of Elle Woods as she tackles stereotypes and scandal in pursuit of her dreams. Action-packed and exploding with memorable songs and dynamic dances - this musical is so much fun, it should be illegal! Elle Woods appears to have it all. Her life is turned upside down when her boyfriend Warner dumps her so he can attend Harvard Law. Determined to get him back, Elle ingeniously charms her way into the prestigious law school. While there, she struggles with peers, professors and her ex. With the support of some new friends, though, Elle quickly realizes her potential and sets out to prove herself to the world. Legally Blonde The Musical is perfect for high school and community theatre, featuring a large ensemble and several big song-and-dance numbers. MTI and orignal Broadway choreographer Jerry Mitchell have partnered to revolutionize the way you choreograph your musicals with a new innovative resource: The Original Production (TOP). Use the Official Jerry Mitchell Choreography for Hairspray and Legally Blonde	https://music.apple.com/us/album/legally-blonde-musical-original-broadway-cast-recording/1270808926	https://is1-ssl.mzstatic.com/image/thumb/Music118/v4/8f/15/09/8f150909-3ae8-24e5-53a5-33612639bcb3/791558992335.jpg/1000x1000bb.jpeg
214	Les Misérables	Claude-Michel Schönberg	Herbert Kretzmer	Les Misérables is the world’s longest running musical — a true modern classic based on Victor Hugo's novel and featuring one of the most memorable scores of all time.  With countless awards to its name, Les Misérables is as groundbreaking today as it was when it first premiered in London in 1985. In nineteenth century France, Jean Valjean is released from 19 years of unjust imprisonment, but finds nothing in store for him but mistrust and mistreatment. He breaks his parole in hopes of starting a new life, initiating a lifelong struggle for redemption as he is relentlessly pursued by police inspector Javert, who refuses to believe that Valjean can change his ways. Finally, during the Paris student uprising of 1832, Javert must confront his ideals after Valjean spares his life and saves that of the student revolutionary who has captured the heart of Valjean's adopted daughter. His world view shattered, Javert commits suicide, and Valjean finally attains the peace that he has sought for so long. Epic, grand and uplifting, Les Misérables packs an emotional wallop that has thrilled audiences all over the world. The sung-through pop opera is ideal for a cast of exceptional singers and overflows with melodies that are already standards. A spectacle on Broadway and in London, Les Misérables is equally effective with a minimal set; it is its powerful affirmation of the human spirit that has made Les Misérables a popular masterpiece.	https://music.apple.com/us/album/les-miserables-the-original-london-cast-recording/1278417429	https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/2e/19/02/2e1902c8-18e0-fdb9-bbea-a702d9960fee/191773664817.jpg/1000x1000bb.jpeg
215	Let 'Em Eat Cake	George Gershwin	Ira Gershwin	Just when you thought it was safe to vote again, George and Ira Gershwin, George S. Kaufman and Morrie Ryskind serve up another helping of blistering political satire in this sequel to the unforgettable Of Thee I Sing. As the Depression rages on, President John P. Wintergreen loses his re-election campaign and is reduced to running a modest clothing store with his wife, Mary, in New York City. When the store goes bankrupt, he hits upon a way to capitalize on the discontent of the American people by promising them a revolution with each shirt sold. His business thrives and, with the help of a revolutionary named Kruger, he retakes the White House by force! Aiming its barbs at everything from totalitarianism to fashion shows, Let 'Em Eat Cake is a dark and cynical, yet, hilarious, American operetta featuring one of the Gershwins' most ambitious, forward-looking scores, making it a natural choice for concert presentation. Perfect for politically minded audiences, it's enjoyable as a sequel or on its own.	https://music.apple.com/us/album/gershwin-thee-i-sing-let-em-eat-cake-studio-cast-recording/371903655	https://is1-ssl.mzstatic.com/image/thumb/Music/48/46/83/mzi.ndrlpngb.jpg/1000x1000bb.jpeg
216	Li'l Abner	Gene de Paul	Johnny Mercer	Al Capp's world-famous characters populate this upbeat show in a delightful mixture of hillbilly nonsense and sharp, critical humor. A fun-filled, foot-stompin’ musical taken directly from the comics, Li'l Abner is laced with gentle satire, rib-tickling gags, and a host of brash, catchy tunes. The crowd-pleasing score features "If I Had My Druthers," "Jubilation T. Cornpone," "Namely You," "Progress Is the Root of All Evil" and "The Country’s in the Very Best of Hands."Li'l Abner opened on Broadway at the St. James Theatre on November 15, 1956, featuring Edith Adams, Peter Palmer, Howard St. John and Stubby Kaye. The show earned two Tony Awards and played for 693 performances.	https://music.apple.com/us/album/lil-abner/476373664	https://is1-ssl.mzstatic.com/image/thumb/Music/62/84/d2/mzi.erwuuqfy.tif/1000x1000bb.jpeg
217	Little Mary Sunshine	Rick Besoyan	Rick Besoyan	This hugely successful Off-Broadway show played for almost three years at New York’s Orpheum Theatre, winning an Obie award as the Best of the Season. Billed as “a musical about an old operetta,” Little Mary Sunshine gently spoofs such old-time favorites as Rose Marie and Naughty Marietta, but has a personality all its own. The plot is a little bit of everything: Colorado Rangers led by stalwart Captain Jim; the lovely Mary Sunshine and her “naughty” maid Nancy; a chorus of giggling schoolgirls; and the ominous but benevolent Indian chief. Hearts are won and lost and won again in this delightful, laugh-filled, and charming show.Little Mary Sunshine first appeared on November 18, 1959 at the Orpheum Theatre in New York City's. It was directed and choreographed by Ray Harrison.	https://music.apple.com/us/album/little-mary-sunshine-original-musical-soundtrack/716294092	https://is2-ssl.mzstatic.com/image/thumb/Music4/v4/2a/5b/9a/2a5b9a24-266e-0b61-418c-327211da17e6/00094637692950.jpg/1000x1000bb.jpeg
218	Little Shop of Horrors	Alan Menken	Howard Ashman	A deviously delicious Broadway and Hollywood sci-fi smash musical, Little Shop Of Horrors has devoured the hearts of theatre goers for over 30 years. Howard Ashman and Alan Menken (Disney's The Little Mermaid, Beauty And The Beast, and Aladdin) are the creative geniuses behind what has become one of the most popular shows in the world. The meek floral assistant Seymour Krelborn stumbles across a new breed of plant he names "Audrey II" - after his coworker crush. This foul-mouthed, R&B-singing carnivore promises unending fame and fortune to the down and out Krelborn as long as he keeps feeding it, BLOOD. Over time, though, Seymour discovers Audrey II's out of this world origins and intent towards global domination! One of the longest-running Off-Broadway shows, Little Shop Of Horrors, the charmingly tongue-in-cheek comedy has been produced worldwide to incredible success with technical aspects running the gamut from Broadway to PTA budgets. Companies can even rent the series of Audrey II puppets directly from MTI.	https://music.apple.com/us/album/little-shop-of-horrors-original-cast/1440905714	https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/7f/f5/1c/7ff51c34-c7cb-eb41-9a26-5c68c44cd33a/00720642202029.rgb.jpg/1000x1000bb.jpeg
219	Little Women	Jason Howland	Mindi Dickstein	Produced nationally and internationally, Little Women has been praised by critics for its ambition in adapting such a well-known story for the stage. This timeless, captivating story is brought to life in this glorious musical filled with personal discovery, heartache, hope and everlasting love. The original production starred the unparalleled Sutton Foster, who received Tony, Outer Critics Circle and Drama Desk nominations for her performance. Based on Louisa May Alcott's life, Little Women follows the adventures of sisters, Jo, Meg, Beth and Amy March. Jo is trying to sell her stories for publication, but the publishers are not interested – her friend, Professor Bhaer, tells her that she has to do better and write more from herself. Begrudgingly taking this advice, Jo weaves the story of herself and her sisters and their experience growing up in Civil War America. Little Women embodies the complete theatrical experience, guaranteeing a night filled with laughter, tears and a lifting of the spirit. Little Women features plenty of great opportunities for female actors and singers ranging in age from teenage to 60 years old. The show also has a flexible cast size that can include as few as ten or as many as 42 people! The powerful score soars with the sounds of personal discovery, heartache and hope – the sounds of a young America finding its voice.	https://music.apple.com/us/album/little-women-the-musical-original-broadway-cast-recording/1303796026	https://is4-ssl.mzstatic.com/image/thumb/Music118/v4/98/4a/ab/984aab89-4201-3418-9741-290c077f1b64/791558440539.jpg/1000x1000bb.jpeg
220	Lock Up Your Daughters!	Laurie Johnson	Lionel Bart	A story of elopement in eighteenth century London, Lock Up Your Daughters! was a London hit that has enjoyed a successful revival. Co-written by the award-winning lyricist of the classic OLIVER!	https://music.apple.com/us/album/lock-up-your-daughters-original-broadway-cast-recording/576624228	https://is3-ssl.mzstatic.com/image/thumb/Music/v4/4d/be/1c/4dbe1c87-72ad-2fa2-81ff-6bad5e876a55/887396665422.jpg/1000x1000bb.jpeg
221	Louisiana Purchase	Irving Berlin	Irving Berlin	The plot machinations of this 1940 hit musical could have been ripped from today's headlines. Set in New Orleans, the musical lampoons Huey Long and his stronghold on Louisiana politics. When Senator Loganberry arrives in the Big Easy to investigate the dubious doings at the Louisiana Purchasing Company, it isn't long before he's set up for plenty of scandal himself. In his review of the recent Carnegie Hall concert - the first time the musical had been seen or heard since its original Broadway run - New York Times critic Lawrence Van Gelder posited, 'Does the South still produce corrupt Democratic politicians and businessmen? Are there still Republican senators eager to expose them to further their own Presidential ambitions? Is sex still a weapon in these wars?' Louisiana Purchase answers these questions with a gleeful wink of the eye and a score full of Berlin magic!	https://music.apple.com/us/album/louisiana-purchase-original-new-york-cast-recording/40749383	https://is1-ssl.mzstatic.com/image/thumb/Music/y2005/m01/d02/h11/s05.jkonkngl.jpg/1000x1000bb.jpeg
222	Love Never Dies	Andrew Lloyd Webber	Glenn Slater, Charles Hart	The year is 1907. Ten years after his disappearance from the Paris Opera House, the Phantom has escaped to a new life in New York, where he lives amongst the screaming joy rides and freak-shows of Coney Island. In this new electrically-charged world, he has finally found a place for his music to soar. All that is missing is his love—Christine Daaé. Now one of the world’s finest sopranos, Christine is struggling in an ailing marriage to Raoul. With excitement, she accepts an invitation to travel to New York and perform at a renowned opera house. In a final bid to win back her love, the Phantom lures Christine, her husband, and their young son Gustave from Manhattan to the glittering and glorious world of Coney Island… not knowing what is in store for them…	https://music.apple.com/us/album/love-never-dies/1440789222	https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/fc/27/1b/fc271b55-6ad5-6622-185d-72bb36bfab3d/00602527349459.rgb.jpg/1000x1000bb.jpeg
223	Love's Labour's Lost	Michael Friedman	Michael Friedman	Romance, revelry and enchanting music ignite in this contemporary, yet lovingly faithful, musical adaptation of Shakespeare's comedy. Using the original text, Love's Labour's Lost reunites Obie Award winner, Michael Friedman (Bloody Bloody Andrew Jackson, The Fortress of Solitude) and two-time Tony Award nominee, Alex Timbers (Peter and the Starcatcher) as they bring their one-of-a-kind sensibility to the immortal words of the Bard. The King and his best buds decide at their five-year college reunion to swear off the joys of women. But when four cute, clever girls from their past show up, they're forced to reconsider all of that nonsense! Add in an outlandish Spanish exchange student, a performance art-loving professor and an entire brass band, and love and devotion are put to the test with hilarious results. Smart, sexy, outrageous and irreverent, Love's Labour's Lost is a madcap celebration of true love and coming of age. Featuring an ensemble cast and an infectious pop score, this is a perfect choice for any group looking for a fresh, clever and outrageously fun modernized classic.	https://music.apple.com/us/album/loves-labours-lost-original-cast-recording/1308571440	https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/f3/b0/ac/f3b0acc2-9745-4bdd-8813-1463982afe21/791558948530.jpg/1000x1000bb.jpeg
224	Loving Repeating	Stephen Flaherty	Gertrude Stein	From the Tony Award-winning team of director, Frank Galati, and composer, Stephen Flaherty, Loving Repeating is a chamber-scale musical about the life and loves of the American expatriate author, intellectual and modernist. Using exclusively selected writings of Stein's, Frank Galati's insightful adaptation and Stephen Flaherty's charming music bring to life Stein's great love of language, her life with Alice B. Toklas and her fascinating view of the world. Loving Repeating is an inspired homage to a pivotal twentieth-century artist. Loving Repeating follows Gertrude Stein from her student days in the late nineteenth century to the height of her artistic era in Paris as one of the "lost generation," a term that she coined to refer to those who came of age between the two world wars. The musical also explores the world of her capricious love affair with language, self-expression and her lifelong companion, Alice B. Toklas. A wonderful show that features excellent female roles, Loving Repeating is the perfect addition to any community theatre's season.	https://music.apple.com/us/album/loving-repeating-original-cast-recording/254913106	https://is1-ssl.mzstatic.com/image/thumb/Music/99/31/a5/mzi.tevpjkrb.tif/1000x1000bb.jpeg
244	Meet Me In St. Louis	Hugh Martin, Ralph Blane, Hugh Wheeler, Sally Benson	Hugh Martin, Ralph Blane, Hugh Wheeler, Sally Benson	It is the summer of 1903, and the Smith family eagerly anticipates the opening of the 1904 World’s Fair. Over the course of a year, the family's mutual respect, tempered with good-natured humor, helps them through romance, opportunity, and heartbreaks. The musical includes seven of the best-loved songs from the film, plus ten additional Martin and Blane songs written specially for the stage. Memorable musical numbers include "Have Yourself a Merry Little Christmas," "The Boy Next Door," "The Trolley Song," and "Whenever I’m with You."	https://music.apple.com/us/album/meet-me-in-st-louis-original-broadway-cast/43600904	https://is2-ssl.mzstatic.com/image/thumb/Music/y2005/m02/d05/h17/s05.xiwcjrcb.jpg/1000x1000bb.jpeg
225	Lucky in the Rain	Jimmy McHugh, Hoagy Carmichael	Dorothy Fields, Hoagy Carmichael	Praised by Variety for its "wit and style," Lucky in the Rain is a heartwarming romp from Emmy and Peabody Award winner, Sherman Yellen (The Rothschilds). It brings to stage the 1920s Paris composed of the likes of Hemingway, Picasso and the Fitzgeralds. Henderson Booth, a reporter who is new to Paris, meets fellow expatriate, Jane Wiley, who helps him secure a position with the newspaper at which she works. In a whirlwind of jazz, deceit, miscommunications and, lust, Booth and Ms. Wiley cross paths with everyone from Josephine Baker to Gertrude Stein and Alice B. Toklas. Although they aren't quite always on the same path, the star-crossed lovers do eventually find their way back to each other – making them Lucky in the Rain! Lucky in the Rain is a nostalgic and unabashedly sentimental love story that will delight audiences of all ages. Featuring such popular standards as "I Can't Give You Anything but Love," "Doin' the New Low Down" and an unforgettable version of "Sunny Side of the Street," its score is nothing short of remarkable. Lucky in the Rain has all of the right ingredients for a delicious musical theatre treat.	https://music.apple.com/us/album/lucky-in-the-rain-2000-studio-cast-recording/42324959	https://is2-ssl.mzstatic.com/image/thumb/Music/y2005/m01/d30/h07/s05.izghyxqj.tif/1000x1000bb.jpeg
226	Lucky Stiff	Stephen Flaherty	Lynn Ahrens	Tony Award-winning writing team, Lynn Ahrens and Stephen Flaherty's, first produced show, Lucky Stiff, premiered Off-Broadway at Playwrights Horizons. That incarnation's talented cast included Stephen Stout, Stuart Zagnit, Mary Testa and Julie White. A winner of the Richard Rodgers Award and Washington's Helen Hayes Award for Best Musical, Lucky Stiff is now performed frequently across the country. Based on the novel, The Man Who Broke the Bank at Monte Carlo by Michael Butterworth, Lucky Stiff is an offbeat, hilarious murder mystery farce, complete with mistaken identities, six million bucks in diamonds and a corpse in a wheelchair. The story revolves around an unassuming English shoe salesman who is forced to take the embalmed body of his recently murdered uncle on a vacation to Monte Carlo. Should he succeed in passing his uncle off as alive, Harry Witherspoon stands to inherit $6,000,000. If not, the money goes to the Universal Dog Home of Brooklyn... or else his uncle's gun-toting ex! Featuring a tuneful Flaherty and Ahrens score, an ensemble cast of zany characters and small rock combo orchestra, Lucky Stiff is an audience charmer. MTI offers plenty of theatrical resources to aid in producing the show, including a reference recording and advice from the authors on set and pacing.	https://music.apple.com/us/album/lucky-stiff-the-york-theatre-production/200524449	https://is3-ssl.mzstatic.com/image/thumb/Music/f9/e2/5c/mzi.bgqtclds.tif/1000x1000bb.jpeg
227	Lysistrata Jones	Lewis Flinn	Lewis Flinn	The Athens University basketball team hasn’t won a game in thirty years. But when spunky transfer student Lysistrata Jones dares the squad’s fed-up girlfriends to stop “giving it up” to their boyfriends until they win a game, the team's legendary losing streak could finally come to an end. With its modern take on the Aristophanes classic, Lysistrata Jones brings a contemporary pop/rock energy to Douglas Carter Beane's hilarious script.  After a highly acclaimed Greenwich Village production by the Transport Group Theater Company, Lysistrata Jones opened on Broadway at the Walter Kerr Theatre on Dember 14, 2011, starring Patti Murin in the title role.	https://music.apple.com/us/album/lysistrata-jones-original-broadway-cast-recording/525619594	https://is2-ssl.mzstatic.com/image/thumb/Music113/v4/ee/e2/45/eee24597-aa99-d979-2949-630d84de5163/884501704694_cover.jpg/1000x1000bb.jpeg
228	Mack & Mabel	Jerry Herman	Jerry Herman	This is a saga of the silent film era "when movies were movies", the story of legendary director Mack Sennett and his greatest star, the adorable Mabel Normand. It is told in flashback by Mack himself as the protagonist narrator, a broken man, made obsolete by talkies, bankrupt and forced to sell his studio, he reminisces about the past, recalling his triumphs and his turbulent love affair with Mabel whom he had discovered and made a star. He loves her, but cannot tell her, sending her into the arms of a rival who feeds her drugs.	https://music.apple.com/us/album/mack-mabel-1974-original-broadway-cast-recording-1992/1452268176	https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/2b/45/48/2b45488b-6b55-dd3f-4d58-23c69216636d/00008811052324.rgb.jpg/1000x1000bb.jpeg
229	Mad Libs Live!	Jeff Thomson	Robin Rothstein	Our story begins at the finals of Teen Superstars, the live TV show that will determine the most popular singing group at Blankville Central High. Virtuosa, Gogo, Geyser, and Merrily seem to have nothing in common – until just before airtime, when they realize that their songs are missing words! In the spirit of the 'World's Greatest Word Game,' our gang fills in the blanks with words from the audience! This truly interactive musical changes at every performance – thanks to you! Will GoGo get the girl? Will Geyser make new friends? Will Merrily come out of her shell? Will Virtuosa get out of the spotlight? And who will be the next Teen Superstars?? There is only one way to find out: Mad Libs Live!	https://music.apple.com/us/album/mad-libs-live-original-cast-recording/1324825106	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/31/d4/b2/31d4b21c-f63d-4df4-30ef-bf24455d249f/859724280515_cover.jpg/1000x1000bb.jpeg
230	Maggie Flynn	Hugo Peretti, Luigi Creatore, George David Weiss	Hugo Peretti, Luigi Creatore, George David Weiss	Shirley Jones starred on Broadway as Maggie Flynn, an open-hearted Irish young woman who runs a home on New York's Lower East Side for black children orphaned by the Civil War. She is fond of a Union officer and is about to wed, when out of the past wanders her wayward actor-husband Phineas, who left her to play Shakespeare and has now returned as a vagabond clown. As the war closes in, Confederate insurgents run guns into the city as the violence escalates. In a rip roaring finale, tempers flare, riots are quelled and true love finds its way to the heart of Maggie Flynn.	https://music.apple.com/us/album/maggie-flynn-the-original-broadway-cast-recording/444772375	https://is4-ssl.mzstatic.com/image/thumb/Music/27/a5/5f/mzi.obtmpxrg.jpg/1000x1000bb.jpeg
252	Myths & Hymns	Adam Guettel	Adam Guettel	In his song cycle, Myths & Hymns, Guettel paints an emotional landscape of faith and yearning that embraces a boundless spectrum of ideology and spirituality. The lyrics were inspired by Greek mythology and a 19th Century Presbyterian hymnal; the musical vocabulary sweeps from romantic art song and rock to Latin, gospel and R&B. Myths & Hymns elucidates our fantastic desire to transcend earthly bounds, our intrinsic need to connect with something or someone greater in our restless search for enlightenment. (Available for performance with piano only.)	https://music.apple.com/us/album/myths-and-hymns/63490698	https://is5-ssl.mzstatic.com/image/thumb/Music/y2005/m05/d12/h00/s06.xlhehpei.jpg/1000x1000bb.jpeg
231	Make Me a Song: The Music of William Finn	William Finn	William Finn	Make Me a Song: The Music of William Finn is a celebration showcasing the songs of one of the most acclaimed composer-lyricists currently writing for the musical theatre. A two-time Tony Award winner for the groundbreaking musical, Falsettos, and The 25th Annual Putnam County Spelling Bee, William Finn is a true living legend. Make Me a Song is big, boisterous and life-loving, like Finn himself. This poignant and compelling revue effortlessly weaves together songs from Finn's rich and touching songbook. Featuring classics from his hit shows juxtaposed with rarely heard selections from Romance in Hard Times, Elegies and the yet-to-be-produced The Royal Family, these treasured tunes tell personal, haunting and often hilarious tales. A testament to the exceptional career of this beloved songwriter, Make Me a Song brims with spectacular highlights that are sure to delight longtime fans and newcomers alike. Featuring a cast of four and no set, this intimate revue is a budget-saving opportunity. William Finn's music will allow strong singers to showcase their vocal and acting abilities.	https://music.apple.com/us/album/make-me-song-music-william-finn-live-recording-original/1308646843	https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/ec/a3/e1/eca3e1b7-a5ff-5d07-fe33-43ada2fbf4cc/791558442731.jpg/1000x1000bb.jpeg
232	Mame	Jerry Herman	Jerry Herman	When the ebullient and convivial socialite Mame Dennis suddenly becomes responsible for the upbringing of her nephew Patrick, the wealthy sophisticate embraces the challenge, introducing the boy to all of life's wonders. With spirit, humor, class and wit, Mame continues to thrill audiences around the globe. Jerry Herman's celebrated score includes the rousing title number, plus "Open a New Window," "If He Walked into My Life," "We Need a Little Christmas," "Bosom Buddies" and "That’s How Young I Feel." Mame opened on Broadway at the Winter Garden Theatre on May 24, 1966, starring Angela Lansbury, Beatrice Arthur and Frankie Michaels. A huge success, the show later transferred to the Broadway theatre, playing a total of 1,508 performances. The original London production at the Drury Lane Theatre played for 443 performances. In 1983, Mame was revived on Broadway, with Angela Lansbury reprising her Tony-winning performance.	https://music.apple.com/us/album/mame-original-motion-picture-soundtrack/74224193	https://is5-ssl.mzstatic.com/image/thumb/Music/y2005/m07/d05/h13/s06.ldxwykvo.jpg/1000x1000bb.jpg
233	Mamma Mia!	Björn Ulvaeus	Björn Ulvaeus	ABBA's hits tell the hilarious story of a young woman's search for her birth father. This sunny and funny tale unfolds on a Greek island paradise. On the eve of her wedding, a daughter's quest to discover the identity of her father brings three men from her mother's past back to the island they last visited 20 years ago. The story-telling magic of ABBA's timeless songs propels this enchanting tale of love, laughter and friendship, creating an unforgettable show. A large cast, non-stop laughs and explosive dance numbers combine to make Mamma Mia! a guaranteed smash hit for any theatre. A mother. A daughter. Three possible dads. And a trip down the aisle you'll never forget! As a supplement to the official billing, Mamma Mia! also contains additional Licensing Guidelines and Provisions licensees must follow with respect to Credits, Using Elements from Prior Productions, Minimum Cast Size and Logos/Artwork. Additional Guidelines	https://music.apple.com/us/album/mamma-mia-original-cast-recording/1440918663	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/b6/cf/5a/b6cf5ab6-bcfb-47bb-570a-94bb3c4f034e/00731454311526.rgb.jpg/1000x1000bb.jpeg
234	Man of La Mancha	Mitch Leigh	Joe Darion	Man of La Mancha is one of the world’s most popular musicals. Inspired by Miguel de Cervantes’ seventeenth-century masterwork Don Quixote and set during the Spanish Inquisition, the original 1965 production won five Tony Awards, including Best Musical. Cervantes is in prison awaiting trial during the Spanish Inquisition. He and his fellow prisoners perform a play-within-a-play, telling the story of the elderly Alonso Quijana, who renames himself "Don Quixote" and goes on a quest to right all wrongs in the world. The rousing, Spanish-inflected score includes the classic numbers “The Impossible Dream,” “I, Don Quixote,” “Dulcinea,” “I Really Like Him” and “Little Bird.”	https://music.apple.com/us/album/man-of-la-mancha-new-broadway-cast-recording-2002/255379115	https://is5-ssl.mzstatic.com/image/thumb/Music/86/d7/7f/mzi.ofbkktzo.jpg/1000x1000bb.jpeg
235	March of the Falsettos	William Finn	William Finn	A sequel to In Trousers, this musical furthers the story of Marvin and his journey in search of self-understanding, inner peace, and a life with a "happily ever after" ending. His extended family consists of ex-wife Trina, son Jason, gay lover Whizzer Brown, and psychiatrist Mendel, who complicates matters by becoming involved with Trina. By the end of the piece, Marvin is still unsettled, but he at least knows he has salvaged his relationship with his son.Originally produced by Playwrights Horizons in 1981. Subsequently produced in New York by Warner Theatre Productions, Inc., Coth Entertainment, Ltd. and The Whole Picture Co., Ltd.	https://music.apple.com/us/album/the-march-of-the-falsettos-original-cast-recording/98299006	https://is1-ssl.mzstatic.com/image/thumb/Music/f9/a2/91/mzi.clucllwt.jpg/1000x1000bb.jpeg
236	Marie Christine	Michael John LaChiusa	Michael John LaChiusa	A powerful re-telling of the tragic Medea myth set against the genteel life of privilege in New Orleans Creole society, and boisterous Chicago.	https://music.apple.com/us/album/marie-christine-original-broadway-cast-recording/258605008	https://is4-ssl.mzstatic.com/image/thumb/Music/a2/c5/ab/mzi.xtkzdcfp.jpg/1000x1000bb.jpeg
237	Marry Me a Little	Stephen Sondheim	Stephen Sondheim	A charming and bittersweet musical revue that features songs by Stephen Sondheim, the undisputed master of the contemporary Broadway musical. Two urban singles share a Saturday night of sweet fantasies and deep yearning while never leaving the confines of their solitary apartments. Together, they breathe new theatrical life and meaning into a collection of trunk songs that were culled from the final productions of Anyone Can Whistle, Follies, Company, A Funny Thing Happened on the Way to the Forum and A Little Night Music. Two single strangers, left alone in their studio apartments on a Saturday night, pass their time with sweetly secret, unshared fantasies, never knowing that they're just a floor away from each other and the end of their lonely dreams. A must for Sondheim aficionados, this easily produced one-act musical is also perfect as a benefit, curtain warmer or second-stage production, as it can be played on virtually any existing set... or no set at all. It's a smart, funny, sophisticated and moving evening, and a fascinating look at "the songs that got away."	https://music.apple.com/us/album/marry-me-a-little-new-cast-recording/1307099264	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/df/3f/df/df3fdf99-4908-6ca9-f9a1-e3639df16933/791558947434.jpg/1000x1000bb.jpeg
238	Mary Poppins	Richard M. Sherman, Anthony Drewe	Richard M. Sherman, Anthony Drewe	One of the most popular Disney movies of all time is capturing hearts in a whole new way: as a practically perfect musical! Based on the books by P.L. Travers and the classic Walt Disney film, Disney and Cameron Mackintosh's Mary Poppins delighted Broadway audiences for over 2,500 performances and received nominations for nine Olivier and seven Tony Awards, including Best Musical. The jack-of-all trades, Bert, introduces us to England in 1910 and the troubled Banks family. Young Jane and Michael have sent many a nanny packing before Mary Poppins arrives on their doorstep. Using a combination of magic and common sense, she must teach the family members how to value each other again. Mary Poppins takes the children on many magical and memorable adventures, but Jane and Michael aren't the only ones upon whom she has a profound effect. Even grown-ups can learn a lesson or two from the nanny who advises that "Anything can happen if you let it." Mary Poppins is an enchanting mixture of irresistible story, unforgettable songs, breathtaking dance numbers and astonishing stagecraft. This show is a perfect opportunity to showcase a strong, iconic female performer, as well as unique special effects and illusions.	https://music.apple.com/us/album/mary-poppins-the-supercalifragilistic-musical/1444019200	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/94/31/73/94317381-4203-67a4-af4f-b63f3a1c1b67/00050087238704.rgb.jpg/1000x1000bb.jpeg
239	Matilda The Musical	Tim  Minchin	Tim  Minchin	Inspired by the twisted genius of Roald Dahl, the Tony Award-winning Roald Dahl's Matilda The Musical is the captivating masterpiece from the Royal Shakespeare Company that revels in the anarchy of childhood, the power of imagination and the inspiring story of a girl who dreams of a better life. With book by Dennis Kelly and original songs by Tim Minchin, Matilda has won 47 international awards and continues to thrill sold-out audiences of all ages around the world. Matilda is a little girl with astonishing wit, intelligence and psychokinetic powers. She's unloved by her cruel parents but impresses her schoolteacher, the highly loveable Miss Honey. Over the course of her first term at school, Matilda and Miss Honey have a profound effect on each other's lives, as Miss Honey begins not only to recognize but also appreciate Matilda's extraordinary personality. Matilda's school life isn't completely smooth sailing, however – the school's mean headmistress, Miss Trunchbull, hates children and just loves thinking up new punishments for those who don't abide by her rules. But Matilda has courage and cleverness in equal amounts, and could be the school pupils' saving grace! Packed with high-energy dance numbers, catchy songs and an unforgettable star turn for a young actress, Matilda is a joyous girl power romp. Children and adults alike will be thrilled and delighted by the story of the special little girl with an extraordinary imagination.	https://music.apple.com/us/album/matilda-the-musical-original-broadway-cast-recording/715017813	https://is2-ssl.mzstatic.com/image/thumb/Music113/v4/11/9c/85/119c85f5-77d1-3c3e-a868-458007329b81/859711307683_cover.jpg/1000x1000bb.jpeg
240	Me and Juliet	Richard Rodgers	Oscar Hammerstein II	This show-within-a-show follows the romance between a chorus girl and an assistant stage manager leading to their secret marriage. Their happy union is threatened by the electrician who still carries a torch for the girl and, in a drunken rage, tries to kill them both. A contrasting romance involves the stage manager, whose credo never to fall for a girl in a show he's working on is complicated when a dancer he's been wooing is suddenly thrown into the cast of 'Me and Juliet.' Informed by rich insights into the world of Broadway-how jobs are gotten and lost, the inside tricks of the trade and the pitfalls of backstage romances - Me and Juliet is an innovative, irresistible show that consistently delivers both musically and dramatically.Me and Juliet opened on Broadway at the Majestic Theatre on May 28, 1953, featuring Isabel Bigley, Bill Hayes and Joan McCracken.	https://music.apple.com/us/album/me-and-juliet-original-broadway-cast-recording/571571975	https://is2-ssl.mzstatic.com/image/thumb/Music/v4/db/8d/bd/db8dbde6-899d-0a98-ae4d-ee8b2137d36f/090266148028.jpg/1000x1000bb.jpeg
241	Me and My Girl	Noel Gay	L. Arthur Rose and Douglas Furber	This grand old (1938) musical was revived in London in 1984 and came to New York in 1986. The late Viscount Hareford had a youthful, unfortunate marriage – and kept discreetly out of sight was a son and heir. The Hareford Hall set are despondent when the family solicitor finds the legitimate heir in the less than desirable Lambeth area of London. When Bill is brought to Hampshire, he is forced to decide if he should fit in with high society and lose his Cockney roots and his girlfriend.	https://music.apple.com/us/album/me-and-my-girl-1986-original-broadway-cast-recording/1444028950	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/8c/a7/78/8ca77835-a7cd-7e50-efd4-1dd825031e28/00076732619629.rgb.jpg/1000x1000bb.jpeg
242	Mean Girls	Jeff Richmond	Nell Benjamin	Mean Girls, the brutally hilarious musical from book writer Tina Fey (30 Rock), lyricist Nell Benjamin (Legally Blonde) and composer Jeff Richmond (Unbreakable Kimmy Schmidt), is taking Broadway by storm. Adapted from Fey's hit 2004 film, Mean Girls was nominated for a staggering 12 Tony Awards. Cady Heron may have grown up on an African savanna, but nothing prepared her for the wild and vicious ways of her strange new home: suburban Illinois. How will this naïve newbie rise to the top of the popularity pecking order? By taking on The Plastics, a trio of lionized frenemies led by the charming but ruthless Regina George. But when Cady devises a plan to end Regina’s reign, she learns the hard way that you can’t cross a Queen Bee without getting stung. "...Mean Girls is a marvel." - Entertainment Weekly	https://music.apple.com/us/album/mean-girls-original-broadway-cast-recording/1372106911	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/1d/dd/bd/1dddbd66-fedb-1d86-b550-f23d92f6fc37/075679872791.jpg/1000x1000bb.jpeg
243	Meet John Doe	Andrew Gerle	Eddie Sugarman	When ambitious newspaper reporter Ann Mitchell loses her job, she prints a phony letter from a "John Doe" who promises to jump off the Brooklyn Bridge on Christmas Eve to protest the state of society. Circulation goes through the roof and Ann convinces her editor to hire an out-of-work ballplayer to play "John" while she ghost-writes a column. With her words and his down-home charm, John Doe quickly becomes a national sensation and a complicated romance blooms between the pair. When the paper's powerful owner reveals his true plans for the John Doe movement, Ann and John must confront the hoax they've created and decide what is worth fighting for.	https://music.apple.com/us/album/meet-john-doe-original-studio-cast-recording/765760899	https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/a1/2b/ab/a12babcf-ddcd-7be2-bc37-60a1b4d59230/884501919814_cover.jpg/1000x1000bb.jpeg
245	Merrily We Roll Along	Stephen Sondheim	Stephen Sondheim	The authors of the landmark Company reunite to turn the traditional showbiz musical on its head in this thrilling and compelling Broadway fable about friendship, compromise and the high price of success. Stephen Sondheim and George Furth expertly blend the excitement and energy of a backstage musical with a poignant and emotional contemporary story about the importance of staying true to one's ideals. Merrily We Roll Along begins in the present and moves backwards, tracing the lives of wealthy, jaded composer, Franklin Shepard, and his two estranged friends through each milestone of their personal and professional lives (good and bad). The show ends with a touch of rueful irony, as the three best friends at the start of their careers face a bright future: young, talented and enthusiastic about the worlds waiting to be conquered. Merrily We Roll Along is a modest-sized show that crackles with the wit, humor and intensity that embody the spirit of New York City. With a brilliant "Broadway-style" score and that deep insight one expects from any Sondheim endeavor, Merrily We Roll Along is a spirited and moving cautionary tale for anyone who has ever pursued a dream.	https://music.apple.com/us/album/merrily-we-roll-along-2012-new-york-cast-recording/542006479	https://is1-ssl.mzstatic.com/image/thumb/Features/v4/30/d1/87/30d18798-b885-81dd-5163-e6f56329a3d7/V4HttpAssetRepositoryClient-ticket.cfkzdbcg.jpg-8839678075210807666.jpg/1000x1000bb.jpeg
246	Miss Saigon	Claude-Michel Schönberg	Alain Boublil, Alain Boublil	A tragedy of passion and beauty, Miss Saigon is one of the most stunning theatrical spectacles of all time. Nominated for an incredible number of Olivier, Tony and Drama Desk Awards, Miss Saigon is the second massively successful offering from the creators of  Les Misérables, Claude-Michel Schönberg and Alain Boublil. In the turmoil of the Vietnam War, Chris, an American soldier, and Kim, a Vietnamese girl, fall in love and marry but are distressingly separated when Saigon falls. As years pass, Chris, unable to contact Kim, remarries and attempts to move on with his life. Kim, however, gives birth to Chris' son and waits faithfully for Chris' return. When circumstances bring Chris back to Vietnam, he learns the truth but, before he is able to speak with Kim, she takes her own life to ensure that their son will be taken back to America with his father. Miss Saigon is an epic, daring musical that is universal in its emotional power. The sung-through, pop-inflected score gives a multi-ethnic cast of strong singers ample opportunities to shine. Meanwhile, its fluid cinematic structure gives directors and designers a field day.	https://music.apple.com/us/album/miss-saigon-definitive-live-recording-original-cast/1443419594	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/77/3f/46/773f46cf-99df-d362-d291-9636fc343268/00602547025326.rgb.jpg/1000x1000bb.jpeg
247	Murder Ballad	Juliana  Nash	Julia Jordan, Juliana  Nash	A Downtown and Off-Broadway sensation, Murder Ballad was the must see theatre experience of 2013. Conceived by Jonathan Larson Award winner and two-time Susan Smith Blackburn Prize finalist, Julia Jordan, with book and lyrics by Jordan and music and lyrics by indie rock singer/songwriter, Juliana Nash, Murder Ballad is a steamy and fun thriller with a razor's edge. Murder Ballad is the dramatic story of a love triangle gone wrong, centering on Sara, an uptown girl who seems to have it all, but whose downtown past lingers enticingly and dangerously in front of her. Originally performed in a bar, with the audience immersed in the action, Murder Ballad is a perfect opportunity for theatre companies who produce their shows in unique environments, but would also fit perfectly into a more conventional theatre.	https://music.apple.com/us/album/murder-ballad-a-new-musical-world-premiere-cast-recording/641215770	https://is1-ssl.mzstatic.com/image/thumb/Music2/v4/71/63/60/71636012-d95b-c318-45c7-4f793a95028a/859709946078_cover.tif/1000x1000bb.jpeg
248	My Fair Lady	Fredrick Loewe	Alan Jay Lerner	My Fair Lady played for 2,717 performances on Broadway at the Mark Hellinger, Broadhurst and Broadway Theatres starring Rex Harrison, Julie Andrews, Stanley Holloway and Robert Coote. It was the longest running musical at the time. It played for 2,281 performances in London at the Drury Lane Theatre. It was revived on Broadway in 1976 for 377 performances, in 1981 for 181 performances, and most recently in 1993 for 165 performances at the Virginia Theatre starring Richard Chamberlain as Professor Henry Higgins.	https://music.apple.com/us/album/my-fair-lady-original-broadway-cast/285116400	https://is1-ssl.mzstatic.com/image/thumb/Music/ef/dc/14/mzi.nuiziktg.jpg/1000x1000bb.jpeg
249	My Favorite Year	Stephen Flaherty	Lynn Ahrens	A classic musical comedy with a heart of gold, My Favorite Year features a tuneful score by the incomparable Tony-winning songwriters, Lynn Ahrens and Stephen Flaherty, and is based on the hit Peter O'Toole film of the same name. The show opened on Broadway in 1993, and Andrea Martin won her first Tony Award for her hilarious turn in the original production. It's 1954, and Benjy Stone, writers' assistant on TV's "King Kaiser Comedy Cavalcade," is assigned the daunting task of babysitting the veteran Hollywood swashbuckler, Alan Swann. The reckless Swann is in town to do a live guest appearance on the show and his antics and alcoholism nearly get Benjy fired. When Benjy is given an unexpected glimpse into Swann's broken heart, though, he begins to discover a thing or two about life and love. My Favorite Year has a large cast with many featured characters, making it the perfect choice for a company that is looking to highlight an array of talented actors and also give opportunities to those in the chorus. Filled with juicy comedy roles, the snappy book by Joseph Dougherty will appeal to audiences who are looking for laughs.	https://music.apple.com/us/album/my-favorite-year-music-from-the-musical/298564064	https://is2-ssl.mzstatic.com/image/thumb/Music/a9/88/0b/mzi.ciclmvkr.jpg/1000x1000bb.jpeg
250	My Life with Albertine	Ricky Ian Gordon	Richard Nelson, Ricky Ian Gordon	The musical focuses on Proust's obsession with his red-haired mistress, Albertine. Departing from the typical 'boy meets girl' plot, it explores the darkness of jealousy. Young Marcel, the hero, irrationally believes that Albertine is having lesbian affairs while older Marcel (played by a different actor), reflects on this seminal period in his young life interacting with himself at 17. Simple lullabies and children's songs reflecting Marcel's childish character before his affair are juxtaposed with operatic dirges, capturing the tragic effect of his self-inflicted destruction of happiness. This fascinating play preserves both the essence and themes of Proust's work.	https://music.apple.com/us/album/my-life-albertine-original-off-broadway-cast-recording/1202586817	https://is5-ssl.mzstatic.com/image/thumb/Music122/v4/18/89/d8/1889d815-85e0-f6b8-d66a-4aa846f7901c/803607021320_cover.jpg/1000x1000bb.jpeg
251	My One And Only	George Gershwin and Ira Gershwin	George Gershwin and Ira Gershwin	My One and Only opened on Broadway at the St. James Theatre on May 1, 1983, starring Tommy Tune and Twiggy. (Tune also co-choreographed with Thommie Walsh.) The show ran until March 3, 1985, playing a total of 767 performances.	https://music.apple.com/us/album/my-one-and-only-1983-original-broadway-cast/79028382	https://is3-ssl.mzstatic.com/image/thumb/Music/y2005/m08/d18/h19/mzi.grbomptg.jpg/1000x1000bb.jpeg
253	Natasha, Pierre & The Great Comet of 1812	Dave Malloy	Dave Malloy	From the celebrated and award-winning composer Dave Malloy comes Natasha, Pierre & The Great Comet of 1812, an electropop opera based on a scandalous slice of Leo Tolstoy’s War and Peace. Young and impulsive, Natasha Rostova arrives in Moscow to await the return of her fiancé from the front lines. When she falls under the spell of the roguish Anatole, it is up to Pierre, a family friend in the middle of an existential crisis, to pick up the pieces of her shattered reputation. Following a critically exalted premiere at Ars Nova in New York City, a subsequent Off-Broadway transfer, and an acclaimed run on Broadway, this award-winning musical expands the possibilities for the genre with its daring score and bold storytelling. Natasha, Pierre & the Great Comet of 1812 premiered at Ars Nova in New York City in October 2012, under the direction of Rachel Chavkin.	https://music.apple.com/us/album/natasha-pierre-great-comet-1812-original-broadway-cast/1225252826	https://is4-ssl.mzstatic.com/image/thumb/Music122/v4/47/e2/b2/47e2b294-2069-f3d9-0338-10017f7bddc8/093624912170.jpg/1000x1000bb.jpeg
254	Naughty Marietta	Victor Herbert	Rida Johnson Young	Victor Herbert’s operetta Naughty Marietta is set in New Orleans in 1780. The story follows Captain Richard Warrington, who is commissioned to capture the mysterious French pirate who calls himself Bras Priqué, and how a beautiful runaway who calls herself Naughty Marietta, complicates this task.Naughty Marietta opened on Broadway at the New York Theatre on November 7, 1910 and played for 136 performances, starring Emma Trentini in the title role and Orville Harrold as Captain Warrington. It has been revived several times and was transformed into an MGM movie in 1935 starring Jeanette MacDonald and Nelson Eddy.	https://music.apple.com/us/album/naughty-marietta-o-s-t-1935/483806157	https://is5-ssl.mzstatic.com/image/thumb/Music/f2/4e/ab/mzi.bkrxkiyw.tif/1000x1000bb.jpeg
255	New Girl in Town	Bob Merrill	Bob Merrill	Based on Anna Christie, Eugene O'Neill's Pulitzer Prize-winning play, New Girl in Town is a passionate, joyous musical by Broadway master George Abbott and then-newcomer Bob Merrill. The 1921 classic is brought to colorful turn-of-the--century New York in this solid star vehicle that blends the moving tenderness of the original play with appealing melodies and infectious dances. An old Swedish sailor is overjoyed when his daughter, Anna, visits him after fifteen years of living in St. Paul. His crony, Marthy, realizes that she is not the sweet innocent whom her father imagines, though, but rather a former streetwalker who's come back to reassemble the pieces of her shattered life. Anna gradually fits in with her father's friends, even falling in love for the first time... until an envious Marthy spills the truth about Anna's past at a neighborhood ball, nearly destroying her dream of happiness. Written for the incomparable Gwen Verdon, the show is ideal for a charismatic "triple-threat" performer. Fans of the incomparable O' Neil will flock to see this musical adaptation of his work.	https://music.apple.com/us/album/new-girl-in-town-original-broadway-cast-recording/332595116	https://is3-ssl.mzstatic.com/image/thumb/Features/51/51/fe/dj.mzkygwoh.jpg/1000x1000bb.jpeg
256	Newsies	Alan Menken	Jack Feldman	It's time to carry the banner on your stage with Disney's Newsies! Set in turn-of-the century New York City, Newsies is the rousing tale of Jack Kelly, a charismatic newsboy and leader of a band of teenaged "newsies." When titans of publishing raise distribution prices at the newsboys’ expense, Jack rallies newsies from across the city to strike against the unfair conditions and fight for what's right! Based on the 1992 motion picture and inspired by a true story, Newsies features a Tony Award-winning score by Alan Menken (Little Shop of Horrors, Sister Act) and Jack Feldman and a book by Tony Award winner Harvey Fierstein (Kinky Boots). Featuring the now classic songs “Carrying the Banner,” “Seize the Day,” and “Santa Fe,” Newsies is packed with non-stop thrills and a timeless message, perfect for the whole family and every audience. Enjoy this free, downloadable Production Handbook. Providing your audiences with a tool to explore the show’s themes and background allows them to engage deeply with the material in their own time. Enjoy this free Performance Guide, which you are welcome to download and distribute to your audiences. Read the Detailed Instumentation for Newsies	https://music.apple.com/us/album/newsies-original-broadway-cast-recording/1269594633	https://is4-ssl.mzstatic.com/image/thumb/Music128/v4/db/5c/38/db5c388c-1af6-4df1-2819-50028f46ded7/791558945737.jpg/1000x1000bb.jpeg
257	Next to Normal	Tom Kitt	Brian Yorkey	Next to Normal, with book and lyrics by Brian Yorkey and music by Tom Kitt, explores how one suburban household copes with crisis and mental illness. Winner of three 2009 Tony Awards, including Best Musical Score and the 2010 Pulitzer Prize, Next to Normal was also chosen as "one of the year's ten best shows" by critics around the country, including The Los Angeles Times, The Washington Post, Rolling Stone and The New York Times. Dad's an architect; Mom rushes to pack lunches and pour cereal; their daughter and son are bright, wise-cracking teens, appearing to be a typical American family. And yet their lives are anything but normal because the mother has been battling manic depression for 16 years. Next to Normal takes audiences into the minds and hearts of each character, presenting their family's story with love, sympathy and heart. This deeply moving piece of theatre provides a wonderful opportunity for performers to explore dramatic material and showcase vocal talents with an energetic pop/rock score. Next to Normal is an emotional powerhouse that addresses such issues as grieving a loss, ethics in modern psychiatry, and suburban life and is ideal for community theatres, as well as colleges and regional theatre companies.	https://music.apple.com/us/album/next-to-normal-original-broadway-cast-recording/1271833957	https://is1-ssl.mzstatic.com/image/thumb/Music118/v4/22/fc/eb/22fceb46-4603-b637-11db-c1d80db8ac5d/791558993325.jpg/1000x1000bb.jpeg
258	Nice Work If You Can Get It	George and Ira Gershwin	George and Ira Gershwin	A hilarious new screwball comedy, Nice Work If You Can Get It pokes fun at the Prohibition era in a clash of elegant socialites and boorish bootleggers, all set to the glorious songs of George and Ira Gershwin. Highlights from the score include "Fascinating Rhythm," "Let's Call The Whole Thing Off," "Someone To Watch Over Me," "Sweet and Low Down," "Delishious" and the title song.Nice Work If You Can Get It opened on Broadway at the Imperial Theatre, April 24, 2012, and played for 478 performances starring Matthew Broderick and Kellie O’Hara as Jimmy and Billie.	https://music.apple.com/us/album/nice-work-if-you-can-get-it-original-broadway-cast-recording/1443755203	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/98/a0/d5/98a0d5b0-887a-1b35-08ba-7fb55a2e6914/00826663137415.rgb.jpg/1000x1000bb.jpeg
259	No Way to Treat a Lady	Douglas J. Cohen	Douglas J. Cohen	This theatrically-charged musical comedy thriller about a publicity-crazed actor-turned-killer and the endearing detective who pursues him is based on the bestselling novel that became a renowned movie. It is a devilish blend of humor, romance, and murder with four meaty roles, two requiring great versatility.	https://music.apple.com/us/album/no-way-to-treat-a-lady-original-cast-recording/1305443369	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/69/19/95/6919959e-ada7-21c3-e0f1-49b853894151/791558946833.jpg/1000x1000bb.jpeg
260	No, No, Nanette	Vincent Youmans	Irving Caesar and Otto Harbach	No, No, Nanette is a lighthearted romp showcasing the charming music of Vincent Youmans. The wacky story involves three couples sharing a cottage in Atlantic City in the midst of a blackmail scheme, with plenty of deception, romantic mishaps, and comical misunderstandings. The score includes two of the best-known songs in musical theatre - "Tea for Two" and "I Want to Be Happy" - as well as "I've Confessed To The Breeze," "You Can Dance With Any Girl" and "Take a Little One-Step."No, No, Nanette was first presented in London and played for 665 performances at the Palace Theatre. It then ran for 321 performances on Broadway at the Globe Theatre. The New York revival played for 861 performances at the Forty-Sixth Street Theatre in 1971. The cast for the revival included Ruby Keeler, Jack Gilford, Bobby Van, Helen Gallagher, Susan Watson and Patsy Kelly.	https://music.apple.com/us/album/no-no-nanette-new-broadway-cast-recording-1971/213765813	https://is5-ssl.mzstatic.com/image/thumb/Features/v4/cb/f3/8d/cbf38d06-77cb-badc-49b7-18fc175d9f2a/V4HttpAssetRepositoryClient-ticket.wkmhjkla.jpg-690499163595535777.jpg/1000x1000bb.jpeg
261	Noel and Gertie	Noël Coward	Sheridan Morley	A triumph in London, this witty and moving show tells of the friendship between two of this century's greatest stage personalities: Gertrude Lawrence and Noël Coward. Although they only appeared in two productions together, Private Lives and Tonight at 8:30, they epitomized an era of style and elegance. The songs, sketches and snippets of scenes pieced together here have the entrancing effect of accurately portraying this remarkable duo and the era they helped to define.	https://music.apple.com/us/album/no%C3%ABl-and-gertie-original-london-cast/218997632	https://is5-ssl.mzstatic.com/image/thumb/Music/10/94/47/mzi.cpkpjrhk.tif/1000x1000bb.jpeg
262	Now Is the Time for All Good Men	Nancy Ford	Gretchen Cryer	A new teacher in a small midwestern town encounters fear, hypocrisy, anger and resentment because of his stance a conscientious objector during the turbulent 1960's. From the authors of I'm Getting My Act Together and Taking It on the Road.	https://music.apple.com/us/album/now-is-time-for-all-good-men-original-off-broadway/451769283	https://is4-ssl.mzstatic.com/image/thumb/Music/be/2c/ad/mzi.rowvtomw.jpg/1000x1000bb.jpeg
263	Now. Here. This.	Jeff Bowen	Jeff Bowen	The show follows the evolution and adventures of four friends in a natural history museum as they journey through time--from the present day museum, to the past, and back again. Inspired by various exhibits (bees, reptiles, early man, ancient civilizations and outer space), the foursome shares their stories about friendship, hoarding, hiding, laughing, living, dying and middle school in an attempt to step directly into that elusive "present moment": the Now. Here. This.	https://music.apple.com/us/album/now-here-this-original-cast-recording/1306250883	https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/e3/90/8f/e3908fa8-244f-75fa-f970-f6cbc950052d/791558946635.jpg/1000x1000bb.jpeg
264	Nunsense	Dan Goggin	Dan Goggin	The show is a fundraiser put on by the Little Sisters of Hoboken to raise money to bury sisters accidently poisoned by the convent cook, Sister Julia (Child of God).	https://music.apple.com/us/album/nunsense-30th-anniversary-cast-recording/646595816	https://is1-ssl.mzstatic.com/image/thumb/Music2/v4/94/d2/70/94d270c5-9168-e7b9-6dfc-ff55f5acce23/884501905725.jpg/1000x1000bb.jpeg
265	Of Thee I Sing	George Gershwin	Ira Gershwin	Of Thee I Sing, produced by Sam H. Harris, opened at the Music Box Theatre on December 26, 1931 and ran for 441 performances.	https://music.apple.com/us/album/gershwin-thee-i-sing-let-em-eat-cake-studio-cast-recording/371903655	https://is1-ssl.mzstatic.com/image/thumb/Music/48/46/83/mzi.ndrlpngb.jpg/1000x1000bb.jpeg
266	Oh, Captain!	Jay Livingston and Ray Evans	Jay Livingston and Ray Evans	In this musical adaptation of the 1953 film The Captain's Paradise, an English sea captain sails from Surrey to Paris every week, keeping a wife in England and a mistress in Paris.Oh, Captain! opened on Broadway at the Alvin Theatre on February 4, 1958, starring Tony Randall, Abbe Lane, SusanJohnson, Jacquelyn McKeever, Edward Platt, Paul Valentine and ballerina Alexandra Danilova. The show played for 192 performances.	https://music.apple.com/us/album/oh-captain-original-broadway-cast-recording/427870207	https://is1-ssl.mzstatic.com/image/thumb/Music/b6/7d/58/mzi.ckfjhaxb.jpg/1000x1000bb.jpeg
267	Oh, Kay!	George Gershwin and Ira Gershwin	George Gershwin and Ira Gershwin	Oh, Kay! skewers the upper class in an uproarious Prohibition musical comedy. This 1926 romp, which served as inspiration for Nice Work If You Can Get It, features a host of Gershwin standards, including "Someone To Watch Over Me," "Clap Yo' Hands," "Do, Do, Do," "Heaven On Earth," and "Fidgety Feet."Oh, Kay! opened on Broadway at the Imperial Theatre on November 8, 1926, and played for 256 performances starring Gertrude Lawrence and Victor Moore.	https://music.apple.com/us/album/george-and-ira-gershwins-oh-kay/98407835	https://is3-ssl.mzstatic.com/image/thumb/Features/67/ef/13/dj.guromlxb.jpg/1000x1000bb.jpg
268	Oil City Symphony	Various	Various	The auditorium has been swept. The crepe paper has been hung. Four music stands sit on an improvised stage. From the creators of Pump Boys and Dinettes comes the knee-slapping and award-winning revue, Oil City Symphony, the story of four graduates who return to their alma mater to honor their beloved music teacher. Remember… it's hip to be square. The four musicians of Oil City High are proud, eager – not necessarily gifted – and slightly competitive. Performing a bizarre program that ranges from the "1812 Overture" to "The Stars and Stripes Forever" to rock standards, sentimental favorites and off-beat original songs, the four fill their tribute concert with good old-fashioned fun that even includes an audience-participatory rendition of "The Hokey-Pokey," and punch and cookies. Easy and economical to produce, Oil City Symphony is a knee-slapping, sweetly nutty tribute that's an ideal showcase for four charismatic actor-singer-musicians.	https://music.apple.com/us/album/oil-city-symphony-original-cast-recording/40743359	https://is2-ssl.mzstatic.com/image/thumb/Music/y2005/m01/d02/h10/s05.ffwcxzny.jpg/1000x1000bb.jpeg
269	Oklahoma!	Richard Rodgers	Oscar Hammerstein II	Rodgers and Hammerstein’s first collaboration remains, in many ways, their most innovative, setting the standards and rules of modern musical theatre. In a Western territory just after the turn of the 20th century, a high-spirited rivalry between local farmers and cowboys provides a colorful background for Curly, a charming cowboy, and Laurey, a feisty farm girl, to play out their love story. Their romantic journey, as bumpy as a surrey ride down a country road, contrasts with the comic exploits of brazen Ado Annie and hapless Will Parker in a musical adventure embracing hope, determination and the promise of a new land.	https://music.apple.com/us/album/oklahoma-2019-broadway-cast-recording/1466325624	https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/f5/76/b3/f576b38f-c4c0-b342-74ce-411e53517c95/19UMGIM48315.rgb.jpg/1000x1000bb.jpeg
270	Oliver!	Lionel Bart	Lionel Bart	Consider yourself at home with Lionel Bart's classic musical based on the Charles Dickens novel, Oliver Twist. The Tony and Olivier Award-winning show is one of the few musicals to win an Academy Award for Best Picture and is widely hailed as a true theatrical masterpiece by actors and audience members alike. The streets of Victorian England come to life as Oliver, a malnourished orphan in a workhouse, becomes the neglected apprentice of an undertaker. Oliver escapes to London and finds acceptance amongst a group of petty thieves and pickpockets led by the elderly Fagin. When Oliver is captured for a theft that he did not commit, the benevolent victim, Mr. Brownlow takes him in. Fearing the safety of his hideout, Fagin employs the sinister Bill Sikes and the sympathetic Nancy to kidnap him back, threatening Oliver’s chances of discovering the true love of a family. Oliver! is a musical theatre masterpiece, perfectly showcasing the talents of a large ensemble cast as they bring these classic characters and score to life.	https://music.apple.com/us/album/oliver-2009-london-cast-recording/1278454889	https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/5d/9a/2b/5d9a2ba2-03c5-fed3-bfb9-c262bc291753/884977337778.jpg/1000x1000bb.jpg
271	Olympus on My Mind	Grant Sturiale	Barry Harman	This Broadway hit is based on the Amphitryon myth. Jupiter comes to Earth in human form to woo beautiful Alcemene, wife of Amphitryon. He appears to her in the body of her absent husband and quickly wins her love. Things go swimmingly until the real Amphitryon shows up. The chorus consists of Tom, Dick, Horace and the delightfully dizzy Dolores (who is only in the show because she is the wife of its financial backer.)	https://music.apple.com/us/album/olympus-on-my-mind-original-off-broadway-cast/202799017	https://is5-ssl.mzstatic.com/image/thumb/Music/f4/73/79/mzi.yfepqkaj.tif/1000x1000bb.jpeg
272	On A Clear Day You Can See Forever	Burton Lane	Alan Jay Lerner	In order to quit smoking, eccentric Daisy Gamble seeks help from psychiatrist Dr. Mark Bruckner. Under hypnosis, Daisy describes memories of her 18th-century London life as the confident and commanding Melinda Wells. As Mark grows increasingly fascinated by Daisy's former persona, romantic complications ensue. Burton Lane and Alan Jay Lerner's melodic score includes the gorgeous title song, plus "Come Back To Me," "Hurry, It's Lovely Up Here," "What Did I Have That I Don't Have?" and "Melinda."On A Clear Day You Can See Forever opened on Broadway at the Mark Hellinger Theatre on October 17, 1965, starring Barbara Harris and John Cullum. The original production ran or 280 performances. A revised version of the show opened on Broadway at the St. James Theatre on December 11, 2011, starring Harry Connick, Jr. as Dr. Mark Bruckner.	https://music.apple.com/us/album/on-clear-day-you-can-see-forever-original-broadway/332561506	https://is2-ssl.mzstatic.com/image/thumb/Features/79/ab/7e/dj.okpoazrr.jpg/1000x1000bb.jpeg
273	On The Town	Leonard Bernstein	Betty Comden and Adolph Green	On The Town, the energetic wartime musical about three sailors on a 24-hour leave in New York City, features thrilling music by Leonard Bernstein with playful lyrics and book by Betty Comden and Adolph Green. The show's celebrated score includes a number of musical theatre standards, including "Come Up to My Place," "I Can Cook, Too," "Some Other Time" and "New York, New York."	https://music.apple.com/us/album/on-the-town-new-broadway-cast-recording/971870562	https://is3-ssl.mzstatic.com/image/thumb/Music49/v4/8d/3d/fb/8d3dfb34-a88a-5c6c-d556-16e646a8c0da/dj.mysudgmh.jpg/1000x1000bb.jpeg
274	On the Twentieth Century	Cy Coleman, Adolph Green, Betty Comden	Cy Coleman, Adolph Green, Betty Comden	Whether performed with elaborate scenery or on a simple scale, this brilliantly comic musical appeals to audiences everywhere. As in the classic original, the story concerns the efforts of a flamboyant theatrical impresario Oscar Jaffe to persuade glamorous film star (and former amour) Lily Garland to appear in his next production while outwitting rival producers, creditors and religious nut Letittia Primrose. And all this before the 20th Century Ltd. reaches NYC!	https://music.apple.com/us/album/on-the-twentieth-century-original-broadway-cast-recording/1014684208	https://is2-ssl.mzstatic.com/image/thumb/Music7/v4/52/f2/ea/52f2ea31-cefe-f0fa-b887-be8fcf86f0d5/886445299533.jpg/1000x1000bb.jpeg
275	On Your Toes	Richard Rodgers	Lorenz Hart	Junior's folks pull him from the family's vaudeville act and pack him off to school where he becomes a music teacher. He meets Sydney, a composer, and Frankie, a coed who's fallen hard for him, and together they set about trying to sell Sydney's new jazz ballet to a Russian ballet company. The prima ballerina wants to teach Junior more than a few new steps, but with her assistance, "Slaughter On Tenth Avenue" is produced with Junior dancing the lead. In one of the funniest set pieces ever devised, Junior dances the premiere while being shot at from the audience by thugs who've mistaken him for a dancer who owes on a gambling debt. 	https://music.apple.com/us/album/on-your-toes/1441364719	https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/80/50/da/8050da22-2a38-b1da-2e54-3ccfef60d2f4/605288205729.jpg/1000x1000bb.jpeg
276	Once	Glen  Hansard	Glen  Hansard	From the very first note, Once draws you in and never lets go. This emotionally captivating musical is the only show to have music that won an Academy Award, a Grammy Award, an Olivier Award and a Tony Award. On the streets of Dublin, an Irish musician and a Czech immigrant are drawn together by their shared love of music. Over the course of one fateful week, an unexpected friendship and collaboration quickly evolves into a powerful but complicated love story, underscored by emotionally charged music. Featuring all of the magical songs from the critically acclaimed film, including the Oscar-winning "Falling Slowly," this achingly beautiful, joyously uplifting show strikes an unforgettable chord in audiences and speaks to the power of music to connect us all. A show like that only comes around Once.	https://music.apple.com/us/album/once-a-new-musical-original-broadway-cast-recording/506880915	https://is2-ssl.mzstatic.com/image/thumb/Music/c0/8c/e1/mzi.ibnceiic.jpg/1000x1000bb.jpg
285	Panama Hattie	Cole Porter	Cole Porter	Panama Hattie is the nickname for the colorful Hattie Maloney, who owns and performs in her own night club in the Panama Canal Zone. She is engaged to a navy officer who has a child from a previous marriage, but Hattie and the child don’t really get along. After many twists and turns, Hattie is praised by the Navy after she thwarts a terrorist attack on the Panama Canal, and she can finally marry her fiancé.Panama Hattie opened on Broadway at the 46th Street Theatre on October 30, 1940, starring Ethel Merman as the title character. The production played for 501 performances. In 1943, the show ran for 308 performances at the Piccadilly Theatre in London, with Bebe Daniels as Hattie.	https://music.apple.com/us/album/panama-hattie-original-cast-recording/330020433	https://is3-ssl.mzstatic.com/image/thumb/Music/3a/e7/56/mzi.uvszrkqv.tif/1000x1000bb.jpeg
277	Once on This Island	Stephen Flaherty	Lynn Ahrens	From the Tony Award-winning songwriting team of Lynn Ahrens and Stephen Flaherty (Seussical, Ragtime), comes the Olivier Award-winning Once on This Island. This highly original and theatrical Caribbean adaptation of the popular fairy tale, The Little Mermaid, garnered eight Tony nominations for its Broadway run, including Best Musical, Book and Score. Ti Moune, a peasant girl, rescues a wealthy boy from the other side of the island, Daniel, with whom she falls in love. Unbeknownst to Ti Moune, the pompous gods who preside over the island make a bet with one another over which is stronger, love or death, the stakes being Ti Moune's life. When she pursues Daniel, who has returned to his people, Ti Moune is shunned because of her lowly status. Her determination and capacity to love, though, is not enough to win Daniel's heart, and Ti Moune pays the ultimate price; but the gods turn Ti Moune into a tree that grows so strong and so tall, it breaks the wall that separates the societies and ultimately unites them. Once on This Island's small band, minimal set requirements and flexibly sized cast make it a producer and director's dream. It possesses such a strong, emotional backbone that it can stand tall, from the grandest to most modest of scales. A comprehensive and informative study guide created for the 2017 Broadway Revival. Study Guide	https://music.apple.com/us/album/once-on-this-island-original-london-cast/191571614	https://is5-ssl.mzstatic.com/image/thumb/Music/f9/2d/07/mzi.mjusytyx.tif/1000x1000bb.jpeg
278	Once Upon a Mattress	Mary Rodgers	Marshall Barer	Many moons ago in a far-off place, Queen Aggravain decreed no couples could marry until her son, Prince Dauntless, found a bride. Princesses came from far and wide to win the hand of the prince, but none could pass the impossible tests given to them by the Queen. That is, until the “shy” swamp princess, Winnifred the Woebegone, showed up. Would she be able to pass the Sensitivity Test, marry her prince and help Lady Larkin and Sir Harry to the altar? Carried on a wave of wonderful songs, by turns hilarious and raucous, romantic and melodic, this rollicking spin on the classic tale The Princess and the Pea provides some side-splitting shenanigans. For after all, a princess is a delicate thing.	https://music.apple.com/us/album/once-upon-a-mattress-new-broadway-cast-recording-1996/937187570	https://is4-ssl.mzstatic.com/image/thumb/Music3/v4/17/55/d5/1755d598-5062-3d40-3d2f-5a40f179ccf2/884977032635.jpg/1000x1000bb.jpeg
279	Ordinary Days	Adam Gwon	Adam Gwon	From one of musical theatre's most exciting new composers comes Ordinary Days, a refreshingly honest and funny musical about making real connections in the city that never sleeps (but probably should at some point).Ordinary Days tells the story of four young New Yorkers whose lives intersect as they search for fulfillment, happiness, love, and cabs. Through a score of vibrant and memorable songs, their experiences ring startlingly true to life. Ordinary Days is an original musical for anyone who's ever struggled to appreciate the simple things in a complex place. With equal doses of humor and poignancy, it celebrates how 8.3 million individual stories combine in unexpected ways to make New York City such a unique and extraordinary home.	https://music.apple.com/us/album/ordinary-days-original-cast-recording/1306108152	https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/a1/b1/ca/a1b1ca4c-34ed-b457-1955-5d15ba14757f/791558944433.jpg/1000x1000bb.jpeg
280	Out Of This World	Cole Porter, Dwight Taylor, Reginald Lawrence	Cole Porter, Dwight Taylor, Reginald Lawrence	Based on Plautus’ ancient Greek comedy Amphitryon, Out Of This World revolves around the god Jupiter who hopes to have an earthly affair with the mortal Helen. To win her over, Jupiter disguises himself as Helen’s husband until he is tracked down by his wife Juno.Out Of This World opened on Broadway at the New Century Theatre on December 21, 1950 and played for 157 performances, starring George Jongeyans as Jupiter and Charlotte Greenwood as Juno.	https://music.apple.com/us/album/out-of-this-world-original-broadway-cast-recording/261770556	https://is2-ssl.mzstatic.com/image/thumb/Features/27/a3/a1/dj.duzjrtyj.jpg/1000x1000bb.jpeg
281	Pacific 1860	Noël Coward, Noel Coward, Barry Day	Noël Coward, Noel Coward, Barry Day	Life carries on serenely in Samolo, a South Sea island jewel in Queen Victoria's crown, until Madame Salvador, the celebrated diva, arrives to disturb the safe routine of the Stirling family and particularly that of Kerry, their youngest son. The two fall in love but middle class Victorian morality parts them until... Pacific 1860 features one of Coward's most attractive scores, written for the show that starred Mary Martin and re-opened Drury Lane after World War II, but never heard in the U.S.	https://music.apple.com/us/album/pacific-1860-original-london-cast/254022365	https://is4-ssl.mzstatic.com/image/thumb/Music/f9/da/62/mzi.argohpgv.tif/1000x1000bb.jpeg
282	Pacific Overtures	Stephen Sondheim	Stephen Sondheim	Stephen Sondheim and John Weidman (authors of Assassins) mix elements of Kabuki theatre with the conventions of the Broadway musical in Pacific Overtures, a highly original, inventive, powerful, educational and surprisingly humorous theatrical experience. Considered by many to be the artistic pinnacle of the legendary Sondheim/Prince collaborations, this exploration of culture and imperialism pushes the boundaries of musical theatre further than ever before. Commodore Matthew Perry's 1853 mission to open trade relations with isolationist Japan through gunboat diplomacy forges an unlikely friendship between the samurai, Kayama, and the Americanized fisherman, Manjiro. Kayama and Manjiro – and all of Japanese society – must face the wave of Westernization that follows. Its epic scope, ethnic cast and subject matter, and sheer ambition make Pacific Overtures a unique and worthwhile effort for any theatre, large or small, that is looking for a challenge.	https://music.apple.com/us/album/pacific-overtures-original-broadway-cast-recording/366551472	https://is1-ssl.mzstatic.com/image/thumb/Music/55/52/7d/mzi.vxbdujpd.jpg/1000x1000bb.jpeg
283	Paint Your Wagon	Frederick Loewe	Alan Jay Lerner	One of the team’s early Broadway collaborations, Lerner and Loewe’s Paint Your Wagon is an homage to the Old West, featuring gorgeous standards such as “They Call the Wind Maria,” “I Talk to the Trees,” and “Wand’rin’ Star.” A hardened old California gold prospector, Ben Rumson, strikes it rich when his daughter, Jennifer finds gold and the love of a local miner, Julio. The town grows more populous and prosperous as news of the strike spreads, but Jennifer heads east to attend school. When she returns, Jennifer finds the town abandoned as its citizens head off to another gold strike, leaving Jennifer to reunite with her father and create a new life with Julio.	https://music.apple.com/us/album/paint-your-wagon-original-broadway-cast-recording/272102080	https://is3-ssl.mzstatic.com/image/thumb/Music/86/6c/b8/mzi.ijjjyukn.jpg/1000x1000bb.jpeg
284	Pal Joey	Richard Rodgers	Lorenz Hart	Rodgers & Hart's hit show was decades ahead of its time-- this tuneful musical comedy features a likable, scrappy anti-hero making his way through Chicago in the early 1940s.	https://music.apple.com/us/album/pal-joey-1995-original-new-york-cast-recording/55034466	https://is4-ssl.mzstatic.com/image/thumb/Music/y2005/m03/d31/h04/s05.nlxirqzz.jpg/1000x1000bb.jpeg
286	Parade	Jason Robert Brown	Jason Robert Brown	Amid religious intolerance, political injustice and racial tension, the stirring Tony Award-winning Parade explores the endurance of love and hope against all the odds. With a book by acclaimed playwright Alfred Uhry (Driving Miss Daisy) and a rousing, colorful and haunting score by Jason Robert Brown (Songs For a New World, The Last Five Years, Bridges of Madison County), Parade is a moving examination of the darkest corners of America's history. In 1913, Leo Frank, a Brooklyn-raised Jew living in Georgia, is put on trial for the murder of thirteen-year-old Mary Phagan, a factory worker under his employ. Already guilty in the eyes of everyone around him, a sensationalist publisher and a janitor's false testimony seal Leo's fate. His only defenders are a governor with a conscience and, eventually, his assimilated Southern wife who finds the strength and love to become his greatest champion. Daring, innovative and bold, Parade is filled with soaring music and a heart-wrenching story, offering a moral lesson about the dangers of prejudice and ignorance that should not be forgotten. Groups looking for powerful, moving theatrical experiences will need to look no further than this unforgettable show.	https://music.apple.com/us/album/parade-original-broadway-cast-recording/258619831	https://is4-ssl.mzstatic.com/image/thumb/Features/2d/0c/81/dj.suyljbce.jpg/1000x1000bb.jpeg
287	Personals	Seth Friedman, Marta Kauffman, William Dreskin, Joel Phillip Friedman, Stephen Schwartz, Alan Menken, David Crane	Seth Friedman, Marta Kauffman, William Dreskin, Joel Phillip Friedman, Stephen Schwartz, Alan Menken, David Crane	This is a wonderful collection of songs about people who place lonely hearts ads: lonely people looking for that certain someone. In other words: Personals is about Most of Us, about the unending search for love in the Post Me Decade.	https://music.apple.com/us/album/personals/189503872	https://is1-ssl.mzstatic.com/image/thumb/Music/a4/de/21/mzi.dhhwgrue.tif/1000x1000bb.jpeg
288	Peter Pan (1954 Broadway Version)	Morris "Moose" Charlap, Jule Styne	Carolyn Leigh, Betty Comden	Based on J.M. Barrie's classic tale and featuring an unforgettable score by Morris "Moose" Charlap and Jule Styne with lyrics by Carolyn Leigh and Betty Comden and Adolph Green, Peter Pan is one of the most beloved and frequently performed family favorites of all time. This high-flying Tony Award-winning musical has been performed around the world and delighted audiences for 60 years. Peter and his mischievous fairy sidekick, Tinkerbell, visit the nursery of the Darling children late one night and, with a sprinkle of pixie dust, begin a magical journey across the stars that none of them will ever forget. In the adventure of a lifetime, the travelers come face to face with a ticking crocodile, a fierce Indian tribe, a band of bungling pirates and, of course, the villainous Captain Hook. Featuring the iconic songs, "I'm Flying," "I've Gotta Crow," "I Won't Grow Up" and "Never Never Land," and a rousing book full of magic, warmth and adventure, Peter Pan is the perfect show for the child in all of us... who dreamed of soaring high and never growing up. Peter Pan is a dream come true for theatres looking to spread their technical wings and entertain countless families.	https://music.apple.com/us/album/peter-pan-original-broadway-cast-recording/259881150	https://is3-ssl.mzstatic.com/image/thumb/Music/9a/4a/98/mzi.bamzkgwz.jpg/1000x1000bb.jpeg
289	Philemon	Harvey Schmidt	Tom Jones	Told with the distinct voice of Tom Jones and Harvey Schmidt (The Fantasticks and I Do! I Do!), the tragically triumphant tale of Philemon is the pair's most adventurous Broadway venture yet. In the third-century Roman Empire, Cockian the clown finds himself face-to-face with a rigid Commander who sentences him to death. In a particularly sticky situation, the Commander grants Cockian life... on one condition: he must impersonate the secretly executed Christian leader, Philemon, to obtain information that would enable the Roman Empire to capture and execute more Christians. Valuing his life, Cockian does the Commander's bidding. His traipse into espionage, however, becomes much more than a means to survive and shows Cockian what it means to love. With its minimal cast, orchestra and production requirements, Philemon capitalizes on the intimacy, imagination and mythic quality that characterizes this writing team's astounding body of work. This gem of a piece can captivate audiences in any venue; from the cozy black box to the massive music hall.	https://music.apple.com/us/album/philemon-original-cast-recording/1464918378	https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/40/87/46/408746fc-896c-e20f-e47b-0bce9534b155/632433350324.jpg/1000x1000bb.jpeg
290	Pipe Dream	Richard Rodgers	Oscar Hammerstein II	From the pages of Steinbeck, the drifters and dropouts along Cannery Row spring to life in this uncommon story of love and hope. When Suzy, a homeless girl, is picked up for stealing food, she's taken in by Fauna, the big-hearted Madam of the Bear Flag Café (which is no café at all). Here she meets Doc, a carefree marine biologist, and soon romance is in the air. Rodgers & Hammerstein struck a new tone with Pipe Dream: warm and highly personal. It illuminates Rodgers & Hammerstein’s benevolence for outcasts who are infinitely capable of every emotion and longing felt by the more fortunate members of society.	https://music.apple.com/us/album/pipe-dream-original-cast-recording/347499131	https://is5-ssl.mzstatic.com/image/thumb/Music/9c/da/5e/mzi.nvuqtkpk.jpg/1000x1000bb.jpeg
291	Pippin	Stephen Schwartz	Stephen Schwartz	With an infectiously unforgettable score from four-time Grammy winner, three-time Oscar winner and musical theatre giant, Stephen Schwartz, Pippin is the story of one young man's journey to be extraordinary. Winner of four 2013 Tony Awards including Best Musical Revival, this updated circus-inspired version of Pippin continues to captivate and appeal to the young at heart throughout the world. Heir to the Frankish throne, the young prince Pippin is in search of the secret to true happiness and fulfillment. He seeks it in the glories of the battlefield, the temptations of the flesh and the intrigues of political power (after disposing of his father, King Charlemagne the Great). In the end, though, Pippin finds that happiness lies not in extraordinary endeavors, but rather in the unextraordinary moments that happen every day. Equally poignant as a black box production or as a splashy, spectacle-driven extravaganza, Pippin's message is universal and will connect with audiences across the age spectrum.	https://music.apple.com/us/album/pippin-new-broadway-cast-recording/1269634124	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/20/7a/c4/207ac4fa-5356-6c0f-c19a-c5e201210de6/791558947335.jpg/1000x1000bb.jpeg
292	Plain and Fancy	Albert Hague	Arnold B Horwitt	Two sophisticated New Yorkers, with property to sell, find themselves stranded in Bird-in-Hand, PA and their encounters with the local Amish provide a charming and eye-opening look into the 'plain' people of this rural enclave as "country mouse meets city mouse."  The lush score includes the 50's chart-topper "Young and Foolish" among other musical gems.	https://music.apple.com/us/album/plain-and-fancy/715706873	https://is1-ssl.mzstatic.com/image/thumb/Music4/v4/71/20/72/712072a6-198c-0313-ebc6-d1ad2208496f/05099923734258.jpg/1000x1000bb.jpeg
293	Pretty Woman: The Musical	Bryan Adams	Bryan Adams	The classic film starring Julia Roberts is now a hit musical! Pretty Woman: The Musical, features an original score by Grammy Award-winner Bryan Adams  ("Summer of '69," "Everything I Do") and his longtime songwriting partner Jim Vallance, and a book by the movie's legendary director Garry Marshall and screenwriter J.F. Lawton. Once upon a time in the late '80s, unlikely soulmates Vivian and Edward overcame all odds to find each other… and themselves. Experience the moments you love from the movie - and get to know these iconic characters in a whole new way - in this dazzlingly theatrical take on a love story for the ages. Pretty Woman: The Musical will lift your spirits and light up your heart.	https://music.apple.com/us/album/pretty-woman-the-musical-original-broadway-cast-recording/1423345741	https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/fd/d5/e4/fdd5e453-f92b-180a-d24d-1085ab16271a/075679864994.jpg/1000x1000bb.jpeg
294	Privates on Parade	Denis King	Peter Nichols	Music hall routines with clever and ribald lyrics highlight this British hit about an army entertainment unit in post World War II Malaya.	https://music.apple.com/us/album/privates-on-parade-original-1978-cast-recording/620043677	https://is2-ssl.mzstatic.com/image/thumb/Music2/v4/eb/0e/5d/eb0e5d07-7c39-61d1-2dbb-486e5be611bc/POP1.jpg/1000x1000bb.jpeg
295	Promises, Promises	Burt Bacharach	Hal David	In New York City in the 1960s, an ambitious accountant named Chuck Baxter lends out his apartment to his supervisors, who need a discreet place for illicit afternoon rendezvous. Miserable and exploited, Chuck finds a beacon of hope in coworker Fran, who is trapped in a romantic predicament of her own. The bittersweet romantic comedy features a groundbreaking contemporary score from composer Burt Bacharach. The score includes the blockbuster hit “I’ll Never Fall In Love Again,” plus “Knowing When To Leave,” “Turkey Lurkey Time,” “Whoever You Are,” and the title song. Promises, Promises opened on Broadway at the Shubert Theatre on December 1, 1968, starring Jill O'Hara, Jerry Orbach and Marian Mercer. A resounding hit, the show played for 1,281 performances. It was revived on Broadway at the Broadway Theatre in 2010, starring Kristin Chenoweth, Sean Hayes and Katie Finneran.	https://music.apple.com/us/album/promises-promises-new-broadway-cast-recording-2010/377017459	https://is5-ssl.mzstatic.com/image/thumb/Music/83/27/e1/mzi.cwvbiufe.jpg/1000x1000bb.jpeg
296	Pump Boys and Dinettes	Jim Wann, John Foley, Mark Hardwick, Debra Monk, Cass Morgan, John Schimmel	Jim Wann, John Foley, Mark Hardwick, Debra Monk, Cass Morgan, John Schimmel	The 'Pump Boys' sell high octane on Highway 57 in Grand Ole Opry country and the 'Dinettes', Prudie and Rhetta Cupp, run the Double Cupp diner next door. Together they fashion an evening of country western songs that received unanimous raves on and off-Broadway. With heartbreak and hilarity, they perform on guitars, piano, bass and, yes, kitchen utensils.Pump Boys and Dinettes first appeared at the Colonnades Theatre in New York City on October 1, 1981.	https://music.apple.com/us/album/on-broadway-pump-boys-and-dinettes/213740297	https://is1-ssl.mzstatic.com/image/thumb/Features/4f/3e/12/dj.ajpejnle.jpg/1000x1000bb.jpeg
297	Purlie	Gary Geld	Peter Udell	Purlie Victorious, that strutting, new fangled preacher man is back home and he wants a church and he wants freedom. Witty, memorable music and a whole lotta of fun unfold as Purlie outmaneuvers ol' Colonel and gets his girl Lutiebelle (or she gets him!).	https://music.apple.com/us/album/purlie-original-broadway-cast-recording/347511637	https://is5-ssl.mzstatic.com/image/thumb/Music/fb/92/ba/mzi.btooajhv.jpg/1000x1000bb.jpeg
298	Putting It Together	Stephen Sondheim	Stephen Sondheim	Putting It Together is a musical revue showcasing the songs of Stephen Sondheim (Sweeney Todd, Follies, A Funny Thing Happened...). Drawing its title from a song in Sunday in the Park with George, it celebrates Sondheim's incomparable career in musical theatre. Featuring nearly thirty Sondheim tunes, Putting It Together is performed by only five people who are thrown together at a party in a Manhattan penthouse. With a bit of imagination, the guests transform the apartment into the stage of an abandoned theatre, an estate in Sweden, an island outside of Paris, a street off the Roman Forum, the woods of a fairy tale and a mythical town in the Southwest. This tribute in the form of a revue provides a wonderful opportunity for simple sets and costumes. Sondheim's music will allow performers to showcase their vocal and acting abilities.	https://music.apple.com/us/album/sondheim-putting-it-together-original-1993-off-broadway/286855525	https://is3-ssl.mzstatic.com/image/thumb/Music/8f/94/72/mzi.xqqoiolr.jpg/1000x1000bb.jpeg
299	Queen Of The Mist	Michael John LaChiusa	Michael John LaChiusa	Based on an astounding and outrageous true story, Anna Edson Taylor, who, in 1901 at the age of 63, set out to be the first woman to shoot Niagara Falls in a barrel of her own design. Navigating both the treacherous Falls and a fickle public with a ravenous appetite for sensationalism, this unconventional heroine vies for her legacy in a world clamoring with swindling managers, assassins, revolutionaries, moralizing family, anarchists and activists. Convinced that there is greatness in her and determined not to live as ordinary, she sets out to battle her fear and tempt her fate. With a soaring score that incorporates turn of the century themes with LaChiusa's signature complexity and insight, Queen of the Mist is the story of a single great fall, and how one woman risked death so that she could live.	https://music.apple.com/us/album/queen-of-the-mist-original-cast-recording/1342397055	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/ec/87/0b/ec870b8d-3a72-4734-8fee-e5c59dd17e1c/791558946031.jpg/1000x1000bb.jpeg
300	Ragtime	Stephen Flaherty	Lynn Ahrens	Written by the award-winning composer/lyricist team of Stephen Flaherty and Lynn Ahrens (Once on This Island, Seussical and Lucky Stiff), noted playwright Terrence McNally, and based on E.L. Doctorow's distinguished novel, Ragtime is the winner of the 1998 Tony Awards for Best Score, Book and Orchestrations, and both the Drama Desk and Outer Critics Circle Awards for Best Musical and Best Score. Called by TIME Magazine "A triumph for the stage," and by the International Herald Tribune "the best musical in twenty years," this acclaimed musical is filled with pageantry, emotion and hope, bursting onto the stage like no other musical. At the dawn of a new century, everything is changing... and anything is possible. Set in the volatile melting pot of turn-of-the-century New York, three distinctly American tales are woven together – that of a stifled upper-class wife, a determined Jewish immigrant and a daring young Harlem musician – united by their courage, compassion and belief in the promise of the future. Together, they confront history's timeless contradictions of wealth and poverty, freedom and prejudice, hope and despair... and what it means to live in America. The Tony-winning score is just as diverse as the melting pot of America itself, drawing upon many musical styles, from the ragtime rhythms of Harlem and Tin Pan Alley to the klezmer of the Lower East Side, from bold brass band marches to delicate waltzes, from up-tempo banjo tunes to period parlor songs and expansive anthems. A truly unique and powerful portrait of America, Ragtime is sure to inspire actors and audiences alike!	https://music.apple.com/us/album/ragtime-the-musical-original-broadway-cast-recording-l/274487578	https://is1-ssl.mzstatic.com/image/thumb/Features/84/3f/18/dj.dzulukrh.jpg/1000x1000bb.jpeg
302	Redhead	Albert Hague	Dorothy Fields	Redhead won six Tony Awards when it opened in 1959, including Best Musical. Featuring the legendary Gwen Verdon in the title role and marking the directing debut of none other than Bob Fosse, this Golden Age smash features great songs, high-spirited dancing and a murder mystery, too! When a young actress is murdered in 1900s London, the enterprising Simpson Sisters' Waxworks installs a tableau of the grisly deed. Muscle man Tom Baxter, the actress' friend, comes to complain and there, he meets Essie Whimple, a plain girl with a hyperactive imagination. Smitten with Tom, Essie pretends to have been attacked by the murderer, as well, and hijinks ensue – complete with cunning disguises, spine-tingling chases and an ill-fated show at the Odeon Musical Hall! With a large ensemble cast, Redhead has a variety of great roles for a strong chorus, in addition to a star turn for a "triple-threat" lead actress. The winning, Golden Age score featuring toe-tapping melodies by Albert Hague and witty, memorable lyrics by Dorothy Fields, paired with the heavy dance component, make this show a surefire crowd-pleaser.	https://music.apple.com/us/album/redhead-original-broadway-cast-recording/337720292	https://is1-ssl.mzstatic.com/image/thumb/Music/c2/5d/db/mzi.jvbizkcu.jpg/1000x1000bb.jpeg
303	Reefer Madness	Dan Studney	Kevin Murphy	Inspired by the original 1936 film of the same name, this raucous musical comedy takes a tongue-in-cheek look at the hysteria caused when clean-cut kids fall prey to marijuana, leading them on a hysterical downward spiral filled with evil jazz music, sex and violence. You won't be able to resist the spoofy fun of Reefer Madness. The addictive, clever musical numbers range from big Broadway-style showstoppers to swing tunes like 'Down at the Ol' Five and Dime' and the Vegas-style 'Listen to Jesus, Jimmy,' featuring J.C. Himself leading a chorus of showgirl angels. Refeer Madness is a highly stylized and satirical political commentary that will leave you wanting more.	https://music.apple.com/us/album/reefer-madness-original-motion-picture-soundtrack-original/1308283036	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/27/d6/a4/27d6a441-cb02-0846-2326-6d3e7343a021/791558443233.jpg/1000x1000bb.jpeg
304	Rent	Jonathan Larson	Jonathan Larson	Set in the East Village of New York City, Rent is about falling in love, finding your voice and living for today. Winner of the Tony Award for Best Musical and the Pulitzer Prize for Drama, Rent has become a pop cultural phenomenon. with songs that rock and a story that resonates with audiences of all ages. Based loosely on Puccini's La Boheme, Jonathan Larson's Rent follows a year in the life of a group of impoverished young artists and musicians struggling to survive and create in New York's Lower East Side, under the shadow of HIV/AIDS. The physical and emotional complications of the disease pervade the lives of Roger, Mimi, Tom and Angel. Maureen deals with her chronic infidelity through performance art; her partner, Joanne, wonders if their relationship is worth the trouble. Benny has sold out his Bohemian ideals in exchange for a hefty income and is on the outs with his former friends. Mark, an aspiring filmmaker, feels like an outsider to life in general. How these young bohemians negotiate their dreams, loves and conflicts provides the narrative thread to this groundbreaking musical. This is theatre at its best – exuberant, passionate and joyous. Regional theatres will love the freedom and flexibility that Rent offers; minimal costuming and sets are required.	https://music.apple.com/us/album/rent-original-broadway-cast-recording/1440843820	https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/75/8d/55/758d55cc-a737-091a-2eed-dc32e02f38dd/00602547869074.rgb.jpg/1000x1000bb.jpeg
305	Return to the Forbidden Planet	Bob Carlton	Bob Carlton	Inspired by Shakepeare's The Tempest, this jukebox musical is packed with rock 'n' roll classics such as Heard it Through the Grapevine, Young Girl, Good Vibrations, and Gloria. Blast off on a routine flight and crash into the planet D'Illyria where a sci fi version of The Tempest set to rock and roll golden oldies unfolds with glee. The planet is inhabited by a sinister scientist, Dr. Prospero; his delightful daughter Miranda; Ariel, a faithful robot on roller skates; and an uncontrollable monster, the product of Prospero's Id, whose tentacles penetrate the space craft.Return to the Forbidden Planet started life with the Bubble Theatre Company as an open-air performance in a tent. A revised in-door production appeared at The Everyman Theatre in Liverpool and the Tricycle Theatre in London. Return to the Forbidden Planet in its final version opened at the Cambridge Theatre in London's West End on September 11, 1989. It won the Olivier Award for Best New Musical for both 1989 and 1990.	https://music.apple.com/us/album/return-to-the-forbidden-planet/303614375	https://is2-ssl.mzstatic.com/image/thumb/Music/33/ee/21/mzi.sxfzvxpg.jpg/1000x1000bb.jpeg
306	Road Show	Stephen Sondheim	Stephen Sondheim	From the team that brought us Assassins and Pacific Overtures, Road Show is based on the true story of the Mizner Brothers. Featuring Obie-winning music and lyrics by Stephen Sondheim and an intricately written book by John Weidman, the piece ran at The Public Theatre in 2008 after being developed at the New York Theatre Workshop and the Goodman Theatre in Chicago in its previous incarnations. From the Alaskan Gold Rush in the 1890s to the Florida real estate boom in the 1930s, Road Show is the story of men and women in late nineteenth century America, willing to take risks to grab their piece of the American Dream. Spanning 40 years, Road Show specifically focuses on Addison and Wilson Mizner, two brothers who are constantly looking for the next way to strike it rich. This quest turns into a test of morality and judgment for the two brothers that will change their lives in unexpected ways. The latest offering from American musical theater staple, Stephen Sondheim, Road Show features a medium-sized cast with strong, complex roles for a variety of types. This tale of dreamers who scramble for success, identity and love at the turn of the twentieth century will strike a chord with audiences looking for a skillfully written, intelligent piece of musical theatre history.	https://music.apple.com/us/album/road-show-soundtrack-from-the-musical/320263881	https://is2-ssl.mzstatic.com/image/thumb/Music/48/c0/3c/mzi.aryhqvbb.jpg/1000x1000bb.jpeg
307	Robert and Elizabeth	Ron Grainer	Ronald Millar	The year 1845 finds the Moulton Barrett family of London tight in the grip of a tyrannical father. His invalid daughter Elizabeth is gaining a brilliant reputation as a writer. Her verses reach Robert Browning who falls in love with her before they have ever met. Browning sweeps into Elizabeth's life with the invigorating force of a sea breeze and her father senses that his absolute authority is in danger. Tension mounts as Edward Moulton Barrett and Robert Browning engage in a struggle for Elizabeth's life and happiness. A big hit in London's West End.	https://music.apple.com/us/album/robert-and-elizabeth/691255962	https://is1-ssl.mzstatic.com/image/thumb/Features/v4/39/4d/1b/394d1bf8-1e2e-0a25-3d09-1533a148988b/dj.iwurhnkx.jpg/1000x1000bb.jpeg
308	Rock of Ages	Chris D'Arienzo	Chris D'Arienzo	Rock of Ages opened on Broadway at the Brooks Atkinson Theatre on April 7, 2009. As of August 31, 2014, it is the 30th longest running show with 2168 performances.	https://music.apple.com/us/album/rock-of-ages-original-broadway-cast-recording/317696075	https://is3-ssl.mzstatic.com/image/thumb/Music113/v4/02/66/5b/02665b21-03c6-6c3f-958f-0e79c267130b/794043915161.jpg/1000x1000bb.jpeg
309	Rocky	Stephen Flaherty	Lynn Ahrens	Rocky  is a 2012 musical with music and lyrics by Tony® winners and Academy Award® nominees Stephen Flaherty and Lynn Ahrens, and a book by multiple Tony winner Thomas Meehan, adapted from the acclaimed Oscar®-nominated screenplay by Sylvester Stallone. The show had its world premiere in Hamburg in 2012 and opened on Broadway in 2014 at the Winter Garden Theatre. The musical follows the plot of the Academy Award-winning Best Picture classic, Rocky. Rocky  brings to life the story of Rocky Balboa, a small-time boxer from working-class Philadelphia, who is chosen to take on the reigning world heavyweight champion, Apollo Creed, when the undefeated fighter's scheduled opponent is injured. While training with former bantamweight contender Mickey, Rocky tentatively begins a relationship with Adrian, the wallflower sister of his meat-packer pal Paulie. They establish a touching rapport, especially in the scenes featuring Rocky's efforts to coax Adrian out of her own shell. Because Rocky really is a tender love story camouflaged under a burly exterior, Ahrens' and Flaherty's beautiful and energized score includes two moving duets for Rocky and Adrian, while the book explores the depths and complexity of their relationship.	https://music.apple.com/us/album/rocky-broadway-original-broadway-cast-recording/1443200296	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/8c/89/33/8c89335c-11a6-d7ab-df6b-32dd0eea70a2/00602537847099.rgb.jpg/1000x1000bb.jpeg
311	Rothschild & Sons	Jerry Bock	Sheldon Harnick	With a score by Tony Award winners Sheldon Harnick and Jerry Bock (Fiddler on the Roof, She Loves Me), Rothschild & Sons tells the tale of the Rothschild family, who built a business empire from nothing in the face of adversity and bigotry. But above all, Rothschild & Sons is a one-act epic about faith, persistance, and how family gives the greatest wealth of all. Shrewd, charismatic, resourceful and ambitious, Mayer Rothschild and his five sons struggle to overcome the prejudice of late-eighteenth-century European society, as they build a family banking business that takes them from the Jewish ghetto to the courts of the rich and powerful. On the way, they come to dominate European finance, help fund Napoleon's defeat and secure a Declaration of Rights for their people from the Crowned Heads of State. It is truly Europe's most famous rags-to-riches story. Powerful and informative in nature, Rothschild & Sons, much like Fiddler on the Roof, is an impactful, important, and must-see piece for all audiences. Requiring most actors to play multiple roles, it creates ample opportunities to feature an array of talented actor-singers who will love sinking their teeth into the ambitious and bold libretto/score.	https://music.apple.com/us/album/rothschild-sons-original-off-broadway-cast/1119181138	https://is5-ssl.mzstatic.com/image/thumb/Music18/v4/df/05/ff/df05ff4a-0993-900e-e21e-047bb8c0dbb4/Rothschild_Cover1.jpg/1000x1000bb.jpeg
312	Sandy Wilson's The Boy Friend	Sandy Wilson	Sandy Wilson	The Jazz Age lives on in Sandy Wilson's The Boy Friend, a light romantic spoof of 1920s musical comedy. Written in the fifties as "a new musical of the twenties," this is still considered the most successful and witty of the send-up musicals. Set against the backdrop of the French Riviera, this romantic spoof of 1920s musical comedies tells the story of English heiress, Polly, who is longing for only one thing: a boy friend. Polly's father, convinced that any boy who isn't wealthy will court Polly strictly for her financial situation, forbids her to engage any potential suitors. Honoring his wishes, Polly explains to Tony, the messenger boy with whom she's fallen in love, that she is no rich girl. This is just the tip of the mistaken identity iceberg, as love proceeds to find its way charmingly through nearly every member of the cast and bring them all to a happy ending. The Boy Friend is an essential Golden Age musical. Filled to the brim with tongue-in-cheek moments that both parents and grandparents will love, The Boy Friend has a catchy score and opportunities for complex dance numbers. With a fair amount of featured actor/actress roles, it's also an unforgettable chance to showcase a comedic and cheery talent pool.	https://music.apple.com/us/album/the-boy-friend-original-broadway-cast-recording/272094221	https://is2-ssl.mzstatic.com/image/thumb/Features/3d/8e/8f/dj.kwnawobm.jpg/1000x1000bb.jpeg
313	Saturday Night	Stephen Sondheim	Stephen Sondheim	In 1953, Saturday Night was to mark the Broadway debut of a young, new writer named Stephen Sondheim. Owing to the death of the original producer, Saturday Night's New York opening was delayed some 47 years! But now it's here, brimming with all of the charm and youthful vitality of a talent blossoming into greatness. Saturday Night tells the unassuming story of a group of Brooklyn boys, trying to make good in the stock market in 1929. Unfortunately, one of them, Gene, is so eager to climb the social ladder and impress his sweetheart that he invests his friends' money in a swank apartment near the Brooklyn Bridge, even going so far as to sell the gang's precious automobile! Based on a play by two brothers who were responsible for the classic film, Casablanca, Saturday Night features a fetching, tuneful Broadway-style score that hints at Sondheim's triumphs-to-come while staying firmly rooted in the Rodgers and Hammerstein tradition. Saturday Night is a nostalgic charmer that will appeal to every audience and is a must for Sondheim fans.	https://music.apple.com/us/album/saturday-night-original-cast-recording/98431408	https://is2-ssl.mzstatic.com/image/thumb/Music/0e/c1/fe/mzi.nyscxigv.jpg/1000x1000bb.jpg
314	Say, Darling	Jule Styne	Betty Comden and Adolph Green	Say, Darling is a three-act, behind-the-scenes comedy about the creation of a Broadway musical. Inspired by Richard Bissell's semi-autobiographical novel, which chronicled his experience in transferring his novel 7½ Cents into The Pajama Game, Say, Darling is more "straight play with music" than "traditional book musical." Each of the eleven original songs by Jule Styne, Betty Comden, and Adolph Green is sung within the context of the show the characters are rehearsing. Say, Darling opened on Broadway at the ANTA Playhouse on April 3, 1958, starring Vivian Blaine, David Wayne, Johnny Desmond and Robert Morse. The show later transferred to the Martin Beck Theatre, playing a total of 332 performances.	https://music.apple.com/us/album/say-darling-original-broadway-cast-recording/451264954	https://is1-ssl.mzstatic.com/image/thumb/Music/57/8b/7c/mzi.focwqvfn.jpg/1000x1000bb.jpeg
315	School of Rock	Andrew Lloyd Webber	Glenn Slater	Andrew Lloyd Webber’s new hit musical, based on the much-loved film of the same name.	https://music.apple.com/us/album/school-of-rock-the-musical-original-cast-recording/1056441943	https://is5-ssl.mzstatic.com/image/thumb/Music42/v4/1b/24/fa/1b24fa71-3f8c-3196-4996-7382ba474c1b/mzm.jcjkqckl.jpg/1000x1000bb.jpeg
316	Scrooge!	Leslie Bricusse	Leslie Bricusse	In 1970, renowned writer/composer/lyricist Leslie Bricusse adapted the classic Charles Dickens tale A Christmas Carol into the hit screen musical Scrooge. Now available as a charming stage musical, Scrooge has enjoyed a hugely successful tour of England and a season at London’s Dominion Theatre starring the late Anthony Newley. Included are six new songs not performed in the film. This sure-fire audience pleaser is available in two versions: as a full-length musical and in a fifty-five-minute adaptation that is ideal for small theatre groups and schools, where it can be performed as a short play or as part of a seasonal concert. Selected pieces from the most popular musical numbers are included in the shortened adaptation.	https://music.apple.com/us/album/scrooge-original-london-cast/189513999	https://is3-ssl.mzstatic.com/image/thumb/Music/a8/35/5b/mzi.oofxddiw.tif/1000x1000bb.jpeg
317	See Rock City and Other Destinations	Adam Mathias, Brad Alexander	Adam Mathias, Brad Alexander	See Rock City & Other Destinations was produced off-Broadway by Transport Group at the Duke Theatre on 42nd Street in 2010.	https://music.apple.com/us/album/see-rock-city-other-destinations-original-off-broadway/616123404	https://is3-ssl.mzstatic.com/image/thumb/Music/v4/56/6e/ec/566eec31-f717-90a2-26da-06b34ebcf6bd/859708541458_cover.tif/1000x1000bb.jpeg
318	Seussical	Stephen Flaherty	Lynn Ahrens	Now one of the most performed shows in America, Seussical is a fantastical, magical, musical extravaganza! Tony winners, Lynn Ahrens and Stephen Flaherty (Lucky Stiff, My Favorite Year, Once on This Island, Ragtime), have lovingly brought to life all of our favorite Dr. Seuss characters, including Horton the Elephant, The Cat in the Hat, Gertrude McFuzz, lazy Mayzie and a little boy with a big imagination – Jojo. The colorful characters transport us from the Jungle of Nool to the Circus McGurkus to the invisible world of the Whos. The Cat in the Hat tells the story of Horton, an elephant who discovers a speck of dust that contains the Whos, including Jojo, a Who child sent off to military school for thinking too many "thinks." Horton faces a double challenge: not only must he protect the Whos from a world of naysayers and dangers, but he must guard an abandoned egg, left in his care by the irresponsible Mayzie La Bird. Although Horton faces ridicule, danger, kidnapping and a trial, the intrepid Gertrude McFuzz never loses faith in him. Ultimately, the powers of friendship, loyalty, family and community are challenged and emerge triumphant. Seussical is fun for the whole family! Performers of all ages will be excited to portray the characters from the familiar Dr. Seuss fables. This musical provides wonderful creative opportunities for set, lighting and costume design. An alternate orchestration is available in keys more appropriate for a female Cat in the Hat. Oh, the Cats you can cast! Whether you cast a male or female actor as the The Cat in the Hat, we've got the orchestration for you! Find out more!	https://music.apple.com/us/album/seussical-2000-original-broadway-cast/1440752431	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/ab/19/94/ab1994b3-9bf4-4f94-137b-e4fdd07f2ebe/00601215979220.rgb.jpg/1000x1000bb.jpg
319	Seven Brides for Seven Brothers	Gene dePaul	Johnny Mercer	Based on the classic film, Seven Brides for Seven Brothers is an authentic piece of Americana, a time-tested romantic comedy with a special, contemporary relevance. Bringing the raucous Oregon frontier from the screen to the stage, it is a crowd-pleasing hit that has audiences cheering from the opening scene to the curtain call. Saddle up for a joyride in this tale of stubborn men and cunning women. The men in question are Adam and his six unruly brothers, who think they know what a woman's place is and how to keep her there. It takes Milly, Adam's spirited new wife, and six other savvy women to show them who's the boss. As a film, Seven Brides for Seven Brothers delighted audiences with its whirlwind romances, memorable songs, and iconic choreography, and this energetic and adventurous staged version does the same. With its large ensemble, the show is perfect for community theatres and university and college productions that want to showcase a wide range of talent and guarantee everyone a starring moment.	https://music.apple.com/us/album/seven-brides-for-seven-brothers-original-london-cast/539819564	https://is5-ssl.mzstatic.com/image/thumb/Music/v4/7a/ce/63/7ace63c0-7838-5c64-7ea3-8cb3b28a33f3/Cover.jpg/1000x1000bb.jpeg
320	She Loves Me	Jerry Bock	Sheldon Harnick	An intimate and touching show, featuring music by Jerry Bock and Sheldon Harnick (Fiddler on the Roof) and book by Joe Masteroff (Cabaret), She Loves Me was nominated for five Tony Awards in 1964. The 1993 Broadway revival won the Olivier Award for Best Musical Revival, the Drama Desk Award for Outstanding Revival of a Musical and the 1994 Critics Circle Award for Best Musical. Considered by many to be the most charming musical ever written, She Loves Me is a warm romantic comedy with an endearing innocence and a touch of old world elegance. Set in a 1930s European perfumery, we meet shop clerks, Amalia and Georg, who, more often than not, don't see eye to eye. After both respond to a "lonely hearts advertisement" in the newspaper, they now live for the love letters that they exchange, but the identity of their admirers remains unknown. Join Amalia and Georg to discover the identity of their true loves... and of all the twists and turns along the way! She Loves Me showcases a small but strong ensemble cast playing a range of memorable characters of all ages. An ideal Christmas or Valentine's Day show, this heart-warming story will be adored by your entire audience.	https://music.apple.com/us/album/she-loves-me-2016-broadway-cast-recording/1303974015	https://is1-ssl.mzstatic.com/image/thumb/Music118/v4/a9/e5/b2/a9e5b2cb-0f60-12e1-aab8-b30683837551/791558950236.jpg/1000x1000bb.jpeg
321	SHOUT! The Mod Musical	Various	Various	With its irresistible blend of hip-swiveling hits, eye-popping fashions and outrageous dance moves, SHOUT! The Mod Musical takes audiences back to the music, style and freedom of the 1960s. Created by Phillip George and David Lowenstein, SHOUT! features terrific new arrangements of such classic tunes as "To Sir with Love," "Downtown," "Son of a Preacher Man" and "Goldfinger." The review follows five groovy gals as they come of age during those glorious days that made England swing. Traveling in time from 1960 to 1970, SHOUT! chronicles the dawning liberation of women, from the rise of Dusty Springfield, Petula Clark and Cilla Black as independent women with major careers, to their American counterparts, redefining themselves in the face of changing attitudes about gender. With a shimmy and shake, the songs are tied together by hilarious sound bites from the period – from '60s advertisements to letters answered by an advice columnist who thinks that every problem can be solved with a "fetching new hair style and a new shade of lipstick." The songs in this delightful musical resonate with a timeless quality that appeals to every generation. A wonderful choice to showcase strong, female talent at any community theatre, high school or college.	https://music.apple.com/us/album/shout-original-cast-recording-the-mod-musical-soundtrack/202964056	https://is4-ssl.mzstatic.com/image/thumb/Music/30/f6/e5/mzi.imcscnxk.jpg/1000x1000bb.jpeg
322	Show Boat	Jerome Kern	Oscar Hammerstein II	Spanning the years from 1880 to 1927, this lyrical masterpiece concerns the lives, loves and heartbreaks of three generations of show folk on the Mississippi, in Chicago and on Broadway (and their lifelong friends). The primary plot follows Magnolia, the naive daughter of the show boat captain, as she marries a gambler and moves with him to Chicago. His gambling continues as his debts compound, and soon he deserts her and their young daughter. A subplot concerns the potential arrest of Magnolia's selfless best friend on charges of miscegenation when it's discovered that she is of mixed race, and her subsequent downward spiral into despair. The passing of time reunites Magnolia and her now-grown daughter with her family on the show boat as well as with her husband, who eventually returns offering a hopeful second chance at familial fulfillment.	https://music.apple.com/us/album/showboat-original-cast-rsc-opera-north-production-first/204084992	https://is3-ssl.mzstatic.com/image/thumb/Music/2e/d3/03/mzi.olgwfrvz.tif/1000x1000bb.jpeg
323	Shrek The Musical	Jeanine Tesori	David Lindsay-Abaire	Based on the Oscar-winning DreamWorks Animation film, Shrek The Musical is a Tony Award-winning fairy tale adventure, featuring all new songs from Jeanine Tesori (Thoroughly Modern Millie; Caroline, or Change) and a sidesplitting book by David Lindsay-Abaire. Shrek brings all the beloved characters you know from the film to life on stage and proves there's more to the story than meets the ears. "Once upon a time, there was a little ogre named Shrek...." And thus begins the tale of an unlikely hero who finds himself on a life-changing journey alongside a wisecracking Donkey and a feisty princess who resists her rescue. Throw in a short-tempered bad guy, a cookie with an attitude and over a dozen other fairy tale misfits, and you've got the kind of mess that calls for a real hero. Luckily, there's one on hand... and his name is Shrek. Shrek presents a treasure trove of creative opportunities, including costumes, sets, puppets (there is a fire-breathing dragon after all) and more! Irreverently fun for the whole family, Shrek proves that beauty is truly in the eye of the ogre.	https://music.apple.com/us/album/shrek-the-musical-original-cast-recording/1444088140	https://is4-ssl.mzstatic.com/image/thumb/Music128/v4/9c/99/46/9c9946d2-bfe5-3e4f-afb3-c3b57c31b6e8/00602517970618.rgb.jpg/1000x1000bb.jpeg
325	Side Show	Henry Krieger	Bill Russell	Based on the true story of conjoined twins Violet and Daisy Hilton, who became stars during the Depression, Side Show is a moving portrait of two women joined at the hip whose extraordinary bondage brings them fame but denies them love. Told almost entirely in song, the show follows Violet and Daisy's progression from England to America, around the vaudeville circuit, and to Hollywood on the eve of their appearance in the 1932 movie Freaks.	https://music.apple.com/us/album/side-show-original-cast-recording/262934635	https://is4-ssl.mzstatic.com/image/thumb/Music/5f/e0/33/mzi.almxpyte.jpg/1000x1000bb.jpeg
326	Silk Stockings	Cole Porter	Cole Porter	The tense relations between Soviet Russia and the West are lovingly satirized in Silk Stockings, where agents of all kinds cross paths in Paris, far away from both Moscow and Hollywood.Silk Stockings opened on Broadway at the Imperial Theatre on February 24, 1955, starring Hildegarde Neff, Don Ameche and Gretchen Wyler. The show played for 478 performances.	https://music.apple.com/us/album/silk-stockings-original-broadway-cast-recording/796551270	https://is1-ssl.mzstatic.com/image/thumb/Music4/v4/82/06/21/82062133-d2c5-d5c7-ef64-0fd9a60670bf/886444415132.jpg/1000x1000bb.jpeg
327	Singin' in the Rain	Arthur Freed, Nacio Herb Brown	Arthur Freed, Nacio Herb Brown	The "Greatest Movie Musical of All Time" is faithfully and lovingly adapted by Broadway legends, Betty Comden and Adolph Green, from their original award-winning screenplay in Singin' in the Rain. Each unforgettable scene, song and dance is accounted for, including the show-stopping title number, complete with an onstage rainstorm! Hilarious situations, snappy dialogue and a hit-parade score of Hollywood standards make Singin' in the Rain the perfect entertainment for any fan of the golden age of movie musicals. Singin' in the Rain has all the makings of a Tinseltown tabloid headline – the starlet, the leading man and a love affair that could change lives and make or break careers! In silent movies, Don Lockwood and Lina Lamont are a hot item but, behind the scenes, things aren't always as they appear on the big screen! Meanwhile, Lina's squeaky voice might be the end of her career in "talking pictures" without the help of a talented young actress to do the talking and singing for her. Filled with every memorable moment from the film and a downpour of unforgettable songs, Singin' in the Rain is a guaranteed hit for any theatre. The technical elements can be challenging but well worth the effort when the audience is left leaping to their feet. Three extrodinary roles for dancers and a tour de force comedic turn make this a perfect choice for any theatre with an abundance of talent ready to shine.	https://music.apple.com/us/album/singin-in-the-rain-original-cast-recording/539458302	https://is3-ssl.mzstatic.com/image/thumb/Music/v4/bf/8c/96/bf8c9641-9b2f-df37-f07b-b356868c7456/Cover.jpg/1000x1000bb.jpeg
328	Sister Act	Alan Menken	Glenn Slater	Sister Act is the feel-good musical comedy smash based on the hit 1992 film that has audiences jumping to their feet! Featuring original music by Tony- and eight-time Oscar winner, Alan Menken (Newsies, Beauty and the Beast, Little Shop of Horrors), this uplifting musical was nominated for five Tony Awards, including Best Musical. When disco diva, Deloris Van Cartier, witnesses a murder, she is put in protective custody in the one place the cops are sure she won't be a found: a convent! Disguised as a nun, she finds herself at odds with both the rigid lifestyle and uptight Mother Superior. Using her unique disco moves and singing talent to inspire the choir, Deloris breathes new life into the church and community but, in doing so, blows her cover. Soon, the gang is giving chase, only to find them up against Deloris and the power of her newly found sisterhood. Filled with powerful gospel music, outrageous dancing and a truly moving story, Sister Act will leave audiences breathless. The cast is chock full of amazing roles for women of all ages, making this a perfect choice for high schools and community theatres. A sparkling tribute to the universal power of friendship, Sister Act is reason to REJOICE!	https://music.apple.com/us/album/sister-act-divine-musical-comedy-original-london-cast/1270807706	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/75/35/9e/75359e9c-58cc-e62e-7494-6d6a5e8527a2/791558444636.jpg/1000x1000bb.jpeg
329	Sister Robert Anne's Cabaret Class	Dan Goggin	Dan Goggin	Sister Robert Anne is feisty, street-smart, hilarious and immensely talented. As she "teaches" us how to put together a cabaret act, she takes us on a journey of some of the most memorable numbers by award-winning composer Dan Goggin. The Cabaret Class is performed on a simple set by Sister Robert Anne and her accompanist.	https://music.apple.com/us/album/sister-robert-annes-cabaret-class/507682140	https://is4-ssl.mzstatic.com/image/thumb/Music/2f/37/0e/mzi.izhykitn.jpg/1000x1000bb.jpeg
330	Smoke on the Mountain	Connie Ray, Alan Bailey, Mike Craver, Mark Hardwick	Connie Ray, Alan Bailey, Mike Craver, Mark Hardwick	Smoke on the Mountain tells the story of a Saturday Night Gospel Sing at a country church in North Carolina’s Smoky Mountains in 1938. The show features two dozen rousing bluegrass songs played and sung by the Sanders Family, a traveling group making its return to performing after a five-year hiatus. Pastor Oglethorpe, the young and enthusiastic minister of Mount Pleasant Baptist Church, has enlisted the Sanders Family in his efforts to bring his tiny congregation into “the modern world.” Between songs, each family member “witnesses” – telling a story about an important event in their life. Though they try to appear perfect in the eyes of a congregation who wants to be inspired by their songs, one thing after another goes awry and they reveal their true – and hilariously imperfect – natures. By the evening’s end, the Sanders Family have endeared themselves to us by revealing their weaknesses and allowing us to share in their triumphs.	https://music.apple.com/us/album/smoke-on-the-mountain/194526044	https://is3-ssl.mzstatic.com/image/thumb/Music/32/5f/fe/mzi.dmhbljsp.jpg/1000x1000bb.jpg
331	Smokey Joe's Cafe - The Songs of Leiber and Stoller	Jerry Leiber, Mike Stoller	Jerry Leiber, Mike Stoller	Leiber and Stoller, as much as anyone, virtually invented rock 'n' roll, and now their songs provide the basis for an electrifying entertainment that illuminates a golden age of American culture. In an idealized '50's setting, the classic themes of love won, lost and imagined blend with hilarious set-pieces and slice-of-life emotions. Featuring nearly 40 of the greatest songs ever recorded, Smokey Joe's Cafe isn't just great pop music - it's compelling musical theatre.	https://music.apple.com/us/album/smokey-joes-cafe-the-songs-of-leiber-and-stoller/272867994	https://is5-ssl.mzstatic.com/image/thumb/Features/v4/a3/46/28/a34628cb-2386-c9d0-1887-8dbbefe07ca1/dj.qymexrlh.jpg/1000x1000bb.jpeg
332	Snoopy!!!	Larry Grossman	Hal Hackady	Based on the beloved Peanuts comic strip by Charles Schulz, Snoopy!!! sparkles with wit and warmth as it depicts life as seen through the eyes of Schulz's unforgettable characters. Musical numbers include "Just One Person," "Poor Sweet Baby," "Don’t Be Anything Less (Than Everything You Can Be)," "Edgar Allen Poe" and "Daisy Hill."	https://music.apple.com/us/album/snoopy-the-musical-original-london-cast/201947969	https://is5-ssl.mzstatic.com/image/thumb/Music/cb/dc/43/mzi.bvkbtlit.tif/1000x1000bb.jpeg
333	Something Rotten!	Karey Kirkpatrick	Karey Kirkpatrick	Welcome to the Renaissance and the outrageous, crowd-pleasing musical farce, Something Rotten.  Created by Grammy Award-winning songwriter Wayne Kirkpatrick, and successful screenwriters Karey Kirkpatrick and John O’Farrell, Something Rotten was lauded by audience members and critics alike, receiving several Best Musical nominations and hailed by Time Out New York as "the funniest musical comedy in at least 400 years". Set in the 1590s, brothers Nick and Nigel Bottom are desperate to write a hit play but are stuck in the shadow of that Renaissance rock star known as "The Bard." When a local soothsayer foretells that the future of theatre involves singing, dancing and acting at the same time, Nick and Nigel set out to write the world’s very first musical. But amidst the scandalous excitement of opening night, the Bottom Brothers realize that reaching the top means being true to thine own self, and all that jazz. Something Rotten features large song and dance numbers, and a wacky cast of over-the-top characters, each given his or her own special moment in the show to shine.  Throughout its Broadway run, the musical received a show-stopping standing ovation from audiences... in the beginning of the first act!  It’s become clear that “nothing’s as amazing as a musical,” so don’t miss your chance to bring this history-twisting tale to your stage. Read the perusal for free!	https://music.apple.com/us/album/something-rotten-original-broadway-cast-recording/1269635586	https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/9b/4c/5a/9b4c5a0b-a0f0-6b0f-38ed-12c02ce0617d/791558959536.jpg/1000x1000bb.jpeg
334	Something's Afoot	James Mc	James Mc	A zany, entertaining musical that takes a satirical poke at Agatha Christie mysteries and musical styles of the English music hall of the ’30s. Ten people are stranded in an isolated English country house during a raging thunderstorm. One by one they’re picked off by cleverly fiendish devices. As the bodies pile up in the library, the survivors frantically race to uncover the identity and motivation of the cunning culprit.	https://music.apple.com/us/album/somethings-afoot-world-premiere-studio-cast/1504884235	https://is2-ssl.mzstatic.com/image/thumb/Music113/v4/72/65/66/726566ec-7c6c-7567-d4aa-0e0029602398/Somethings_Afoot_Cover_Scan.jpg/1000x1000bb.jpeg
336	Song and Dance	Andrew Lloyd Webber	Don Black	Song & Dance is comprised of Tell Me on a Sunday, a one-woman song cycle Andrew Lloyd Webber penned with Don Black, and Variations, a musical piece the composer wrote for his brother Julian.\r\nThe Tony-nominated musical’s first act follows a young English girl living in New York, who begins to wonder whether—in fact—she’s been looking for love in all the wrong places. The second act is a dance concert, set to Lloyd Webber’s Variations. Based on Paganini’s “Caprice in A minor,” it can be adapted to a myriad of choreographic genres including tap, jazz and modern, commenting and complimenting the events portrayed in the Song portion of the show.	https://music.apple.com/us/album/song-dance-original-broadway-cast-recording/274481442	https://is1-ssl.mzstatic.com/image/thumb/Features/0e/e2/9d/dj.jbsrtfkp.jpg/1000x1000bb.jpeg
337	Song of Norway	Edvard Grieg, Robert Wright, George Forrest, Milton Lazarus, Homer Curran, Edwin Lester	Edvard Grieg, Robert Wright, George Forrest, Milton Lazarus, Homer Curran, Edwin Lester	Song of Norway is a romantic operetta based loosely on the life of composer Edvard Grieg, whose best loved compositions are transformed into glorious vocal numbers.Song of Norway opened on Broadway at the Imperial Theatre on August 21, 1944, starring Irra Petina, Robert Shafer, and Lawrence Brooks as Edvard Grieg. The show later transferred to the Broadway Theatre, playing a total of 860 performances. Song of Norway was the first Broadway show to open in London after the Second World War. It played for 526 performances at the Palace Theatre in the West End.	https://music.apple.com/us/album/song-norway-original-studio-cast-complete-recording/219043234	https://is2-ssl.mzstatic.com/image/thumb/Music/d7/5b/60/mzi.nzyjqtfj.tif/1000x1000bb.jpeg
338	Songs for a New World	Jason Robert Brown	Jason Robert Brown	It's about one moment. It's about hitting the wall and having to make a choice... or take a stand... or turn around and go back. These are the stories and characters of today, the Songs for a New World. The first musical from Tony Award winner, Jason Robert Brown (Parade, Bridges of Madison County), this moving collection of powerful songs examines life, love and the choices that we make. Brown transports his audience from the deck of a 1492 Spanish sailing ship to a ledge, 57 stories above Fifth Avenue, to meet a startling array of characters that range from a young man who has determined that basketball is his ticket out of the ghetto to a woman whose dream of marrying rich nabs her the man of her dreams... and a soulless marriage. With a small, powerhouse multi-ethnic cast and a driving, exquisitely crafted score that runs the gamut of today's popular music, Songs for a New World is a great way to bring the next generation into the theatre.	https://music.apple.com/us/album/songs-for-new-world-new-york-city-center-2018-encores/1446494281	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/a0/cc/12/a0cc1281-f483-faf1-d581-16faa5be5ab9/791558456134.jpg/1000x1000bb.jpeg
339	South Pacific	Richard Rodgers	Oscar Hammerstein II	Nellie, a spunky nurse from Arkansas, falls in love with a mature French planter, Emile. Nellie learns that the mother of his children was an island native and, unable to turn her back on the prejudices with which she was raised, refuses Emile's proposal of marriage. Meanwhile, the strapping Lt. Joe Cable denies himself the fulfillment of a future with an innocent Tonkinese girl with whom he's fallen in love out of the same fears that haunt Nellie. When Emile is recruited to accompany Joe on a dangerous mission that claims Joe's life, Nellie realizes that life is too short not to seize her own chance for happiness, thus confronting and conquering her prejudices.	https://music.apple.com/us/album/south-pacific-original-broadway-cast-recording/193001294	https://is5-ssl.mzstatic.com/image/thumb/Music/73/31/a2/mzi.lkorhxlp.jpg/1000x1000bb.jpeg
340	SpongeBob SquarePants, the New Musical	Various	Various	Spongebob, Patrick, Sandy, Squidward and all of Bikini Bottom face total annihilation—until a most\r\nunexpected hero rises to take center stage. 	https://music.apple.com/us/album/spongebob-squarepants-new-musical-original-cast-recording/1271587570	https://is3-ssl.mzstatic.com/image/thumb/Music118/v4/eb/81/2a/eb812af9-9562-c4b4-0488-b87b16ee388d/886446245720.jpg/1000x1000bb.jpeg
341	Spring Awakening	Duncan Sheik	Steven Sater	The winner of eight Tony Awards, including Best Musical, told by Duncan Sheik and Steven Sater through what Entertainment Weekly called, "the most gorgeous Broadway score this decade," Spring Awakening explores the journey from adolescence to adulthood with a poignancy and passion that is illuminating and unforgettable. The landmark musical is an electrifying fusion of morality, sexuality and rock and roll that is exhilarating audiences across the nation like no other musical in years. It is Germany, 1891, a world where the grown-ups hold all the cards. The beautiful young Wendla explores the mysteries of her body and wonders aloud where babies come from... until Mama tells her to shut it and put on a proper dress. Elsewhere, the brilliant and fearless young Melchior interrupts a mind-numbing Latin drill to defend his buddy, Moritz – a boy so traumatized by puberty that he can't concentrate on anything... not that the Headmaster cares. He strikes them both and tells them to turn in their lesson. One afternoon, in a private place in the woods, Melchior and Wendla meet by accident and soon find within themselves a desire unlike anything they've ever felt. As they fumble their way into one another's arms, Moritz flounders and soon fails out of school. When even his one adult friend, Melchior's mother, ignores his plea for help, he is left so distraught that he can't hear the promise of life offered by his outcast friend, Ilse. Naturally, the Headmasters waste no time in pinning the "crime" of Moritz's suicide on Melchior to expel him. And soon, Mama learns that her little Wendla is pregnant. Now the young lovers must struggle against all odds to build a world together for their child. This celebration of rebellion provides the perfect opportunity to feature performers of all types, as well as the creative flexibility with the use of costumes, set pieces and lighting. Featuring a pop rock score, this is an ideal show for talented vocalists with strong acting abilities. Join this group of late nineteenth century German students on their passage as the navigate teenage self-discovery and coming of age anxiety in a powerful celebration of youth and rebellion in the daring, remarkable Spring Awakening.	https://music.apple.com/us/album/spring-awakening-feat-steven-sater/1440732230	https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/7a/4a/2c/7a4a2c38-beb4-a4b6-a62c-787caabd1717/00602517201002.rgb.jpg/1000x1000bb.jpeg
342	Starlight Express	Andrew Lloyd Webber	Richard Stilgoe, David Yazbek	A child’s train set magically comes to life in this Cinderella story following Rusty the Steam train.	https://music.apple.com/us/album/starlight-express-original-cast-recording-remastered/1444025436	https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/88/73/ed/8873ed63-6b46-629c-2479-9fd67a788597/06UMGIM56875.rgb.jpg/1000x1000bb.jpeg
343	Starting Here, Starting Now	David Shire	Richard Maltby, Jr.	Starting Here, Starting Now is a thrilling and touching musical revue using the songs of Richard Maltby, Jr., and David Shire (Big, Baby, Closer Than Ever). In only 24 songs, Starting Here, Starting Now offers a tender-tough inventory of love and the lonesome lack thereof. Made for each other, the wry lyrics of Richard Maltby, Jr., combined with David Shire‘s buoyant music, forge a fast-moving, ingratiating look at how love can go right, wrong or nowhere. Using songs from their various early musicals (produced or otherwise), this bold, extroverted journey takes a winsome cast of three through the maze of modern relationships with its heart firmly on its sleeve. As with all of Maltby and Shire's work, each song is an impeccably crafted story – original, engaging, bursting with character and showcasing the versatility and charisma of its performer. From tender ballads to hysterical husband-hunting laments, from wry comments on trendy marriages to ecstatic shouting-from-the-rooftop celebration, Starting Here, Starting Now has an appealing freshness that has made it a perennial favorite throughout the world.	https://music.apple.com/us/album/starting-here-starting-now-original-cast-recording/575798753	https://is4-ssl.mzstatic.com/image/thumb/Features/v4/06/cb/0c/06cb0cfd-0322-6a16-7dc7-6375215750dd/dj.hraqpwaa.jpg/1000x1000bb.jpeg
344	Steel Pier	John Kander and Fred Ebb	John Kander and Fred Ebb	In the honky tonk world of marathon dancing in Atlantic City in 1933, a captivating assortment of depression era souls eager to dance their way into fame and prizes gather on the Steel Pier. The spectacle is presided over by an oily tongued emcee who is secretly married to Rita Racine, the champion dancer. Her usual partner doesn't show up, so she is paired with a handsome pilot on leave. As the hours of dancing whirl on, Rita becomes increasingly disillusioned with her sleazy, conniving husband and more and more infatuated with the handsome young aviator and a vision of life in a peaceful cottage. Songs by the creators of Chicago, Cabaret and other Broadway classics perfectly capture the rhythms of the 1930's dance era.	https://music.apple.com/us/album/steel-pier-original-broadway-cast-recording/254830089	https://is1-ssl.mzstatic.com/image/thumb/Music/8d/70/06/mzi.nbezzugz.jpg/1000x1000bb.jpeg
345	Stephen Ward	Andrew Lloyd Webber, Christopher Hampton, Don Black	Andrew Lloyd Webber, Christopher Hampton, Don Black	Stephen Ward deals with the victim of the Profumo Affair—not, as is widely supposed, John “Jack” Profumo himself, the disgraced Minister for War, nor even the fatally wounded Conservative government of Harold Macmillan, but the society osteopath whose private libertarian experiments blew up in his own and everyone else’s face.	https://music.apple.com/us/album/stephen-ward-original-cast-recording/1443165037	https://is3-ssl.mzstatic.com/image/thumb/Music118/v4/67/aa/5d/67aa5dac-c6ea-7b82-b076-cbabc97bc9fb/00602537665747.rgb.jpg/1000x1000bb.jpeg
346	Stop the World - I Want to Get Off	Leslie Bricusse and Anthony Newley	Leslie Bricusse and Anthony Newley	Stop The World - I Want To Get Off is a thought-provoking tale about the fleeting nature of worldly success. In a circus-like world, the hero - an Everyman character named Littlechap - is born, grows up, faces life's many challenges, and ultimately makes a choice celebrating the perpetual cycle of life.	https://music.apple.com/us/album/stop-world-i-want-to-get-off-original-broadway-cast/1443526710	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/37/07/9c/37079ca7-718d-437f-5876-821ee7205408/00042282026125.rgb.jpg/1000x1000bb.jpeg
347	Strike up the Band	George Gershwin	Ira Gershwin	The hilarity of Strike up the Band proves that "all is farcical in love and war!" with this romp; a true joy embodied on the stage. With music by George Gershwin, lyrics by Ira Gershwin and script by George S. Kaufman, this Broadway classic offers songs ranging from playful Gilbert and Sullivan pastiches to heart-clutching ballads (most notably "The Man I Love"), woven into a goofy plot that is loaded with blatant anti-war, big-business satire. The overly proud owner of the Fletcher American Cheese Co. has convinced the U.S. government to declare war on Switzerland, who has protested a tariff on imported cheese. Add two pairs of star-crossed lovers, one very overbearing mother, a cagey government official and a strange man who always places himself in the right place at the most interesting times; mix them all together, and you are left with a side-splitting romp of cheese-y proportions! Beneath this title's exterior beats an observant heart that is as relevant today as when it opened. The magnificence of its Gershwin score is sheer splendor. Performers and audience members alike will be chomping at the bit and, given the brilliance of the material, it can be produced just as effectively as a concert piece.	https://music.apple.com/us/album/strike-up-the-band-2011-studio-cast-recording/640642290	https://is3-ssl.mzstatic.com/image/thumb/Music/v4/f2/94/2c/f2942cac-585b-4c47-7b81-4a59e0724872/803607110024_cover.tif/1000x1000bb.jpeg
348	Sunday in the Park with George	Stephen Sondheim	Stephen Sondheim	Inspired by the painting, A Sunday Afternoon on the Island of La Grande Jatte by Georges Seurat, Sunday in the Park with George, Stephen Sondheim and James Lapine's stunning masterpiece, merges past and present into beautiful, poignant truths about life, love and the creation of art. One of the most acclaimed musicals of our time, this moving study of the enigmatic painter, Georges Seurat, won a Pulitzer Prize and was nominated for an astounding ten Tony Awards, including Best Musical. The days leading up to the completion of his most famous painting, A Sunday Afternoon on the Island of La Grande Jatte, Georges Seurat is struggling to make meaningful art and maintaining a relationship with his lover, Dot. Amid the scorn of the artistic community, Seurat's artistic ability thrives while his love diminishes. A century later, Seurat's descendant – named George and also an artist – finds himself burnt out and in search of what artistic path to follow, but he finds the answer to his future in the past. An ensemble of strong singing actors performs this challenging and heartbreaking work about our need to connect to the past, present and future. Sunday in the Park with George features two coveted starring roles made famous by the Broadway performances of Mandy Patinkin and Bernadette Peters. The show may be staged simply, as in its original workshop production, or with the grandeur of Seurat's masterpiece.	https://music.apple.com/us/album/sunday-in-the-park-with-george-2017-broadway-cast-recording/1287258612	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/12/98/24/129824b9-81c2-0487-990e-fcba82cfe2db/093624909378.jpg/1000x1000bb.jpeg
349	Sunset Boulevard	Andrew Lloyd Webber	Don Black and Christopher Hampton	Based on the Billy Wilder film, the musical version of Sunset Boulevard is a tale of faded glory and unfulfilled ambition.	https://music.apple.com/us/album/sunset-boulevard-original-broadway-cast/1506216302	https://is2-ssl.mzstatic.com/image/thumb/Music113/v4/56/48/94/564894cd-a571-e37c-5eb8-f82a80e4eaca/18UMGIM42185.rgb.jpg/1000x1000bb.jpeg
350	Sweeney Todd	Stephen Sondheim	Stephen Sondheim	Sweeney Todd has become a bloody, worldwide success since being awarded eight Tony's, (including Best Musical), for its Broadway premiere. Stephen Sondheim's and Hugh Wheeler's (A Little Night Music, Pacific Overtures) tasty, thrilling, theatrical treat has simultaneously shocked, awed and delighted audiences across the world. An infamous tale, Sweeney Todd, an unjustly exiled barber, returns to nineteenth century London, seeking vengeance against the lecherous judge who framed him and ravaged his young wife. The road to revenge leads Todd to Mrs. Lovett, a resourceful proprietress of a failing pie shop, above which, he opens a new barber practice. Mrs. Lovett's luck sharply shifts when Todd's thirst for blood inspires the integration of an ingredient into her meat pies that has the people of London lining up... and the carnage has only just begun! Extremely popular with opera companies and in concert presentation, Sweeney Todd is equally effective as an intimate chamber musical. Featuring two unforgettable star turns and some of the most chilling music ever written for the stage, this masterpiece is sure both to thrill and delight audiences.	https://music.apple.com/us/album/sweeney-todd-demon-barber-fleet-street-original-broadway/1086882395	https://is2-ssl.mzstatic.com/image/thumb/Music69/v4/2e/0e/76/2e0e76a1-2198-c858-8f0b-272cc3f20c8a/886445768930.jpg/1000x1000bb.jpeg
351	Sweet Charity	Cy Coleman	Dorothy Fields	Inspired by Federico Fellini's Nights of Cabiria, Sweet Charity explores the turbulent love life of Charity Hope Valentine, a hopelessly romantic but comically unfortunate dance hall hostess in New York City.	https://music.apple.com/us/album/sweet-charity-original-broadway-cast-recording/309259279	https://is1-ssl.mzstatic.com/image/thumb/Features/4a/6e/63/dj.hsfsajpi.jpg/1000x1000bb.jpeg
352	Take Me Along	Bob Merrill	Bob Merrill	In a small Connecticut town on July 4, 1906, Nat and Essie Miller head a middle class New England family with teenage children who are coming of age, falling in love, and desperately trying to stay out of trouble. Bob Merrill's rousing and lovely score includes "Staying Young," "That's How It Starts," "Promise Me A Rose," and the title song.Take Me Along opened on Broadway at the Shubert Theatre on October 22, 1959, starring Jackie Gleason, Walter Pidgeon, Eileen Herlie, Robert Morse and Una Merkel. The production played for 448 performances.	https://music.apple.com/us/album/take-me-along-original-broadway-cast-recording/332584592	https://is1-ssl.mzstatic.com/image/thumb/Features/b9/5c/4d/dj.flziojpm.jpg/1000x1000bb.jpeg
353	Tarzan	Phil Collins	Phil Collins	Based on Disney's epic animated musical adventure and Edgar Rice Burrough's Tarzan of the Apes, Tarzan features heart-pumping music by rock legend, Phil Collins, and a book by Tony Award-winning playwright, David Henry Hwang. High-flying excitement and hits, like the Academy Award winning "You'll Be in My Heart," as well as "Son of Man" and "Two Worlds," make Tarzan an unforgettable theatrical experience. Washed up on the shores of West Africa, an infant boy is taken in and raised by gorillas who name him Tarzan. Apart from striving for acceptance from his ape father, Tarzan's life is mostly monkey business until a human expedition treks into his tribe's territory, and he encounters creatures like himself for the first time. Tarzan struggles to navigate a jungle, thick with emotion, as he discovers his animal upbringing clashing with his human instincts. A title that is recognizable the world over, Tarzan is a powerhouse of a musical that will be a major ticket seller in a theatre's season while offering endless opportunities for creative staging, costuming and set design. A free, downloadable Production Handbook is available here (PDF).	https://music.apple.com/us/album/tarzan-broadway-musical-soundtrack-from-musical-cast/1452867332	https://is5-ssl.mzstatic.com/image/thumb/Music114/v4/5d/27/8c/5d278c56-490c-2cda-5f57-b01123214d6e/00050086154173.rgb.jpg/1000x1000bb.jpeg
354	Tell Me On a Sunday	Andrew Lloyd Webber	Don Black	Tell Me on a Sunday follows a young English girl, who has recently landed in New York. Brimming with optimism, she sets out to seek success, companionship and, of course, love. But as she weaves her way through the maze of the city and her own anxieties, frustrations and heartaches, she begins to wonder whether—in fact—she’s been looking for love in all the wrong places.The show contains some of Andrew Lloyd Webber’s most-treasured songs including “Tell Me on a Sunday,” “Come Back with the Same Look in Your Eyes,” and “Nothing Like You’ve Ever Known.”The intimate one-woman one-act musical is the perfect showcase for a talented performer to shine.	https://music.apple.com/us/album/tell-me-on-a-sunday-1980-cast-recording/1444198917	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/ba/c4/7d/bac47d17-4eb3-cc23-a019-0f6db3b5bd06/00602557830255.rgb.jpg/1000x1000bb.jpeg
355	Tenderloin	Jerry Bock	Sheldon Harnick	Set in New York at the turn-of-the-century, the Tony-nominated Tenderloin reunited the authors, director and producers of the Pulitzer Prize-winning smash-hit, Fiorello! The sparkling, youthful score by Sheldon Harnick and Jerry Bock (Fiddler on the Roof, She Loves Me) stayed on the Billboard charts for 34 weeks when the original cast album was released. Dr. Brock is a crusading Minister who has dedicated himself to cleaning up the section of New York devoted to vice, the area known as the "Tenderloin". The "do-gooder," Reverend Brock, is aided by a reporter, Tommy Howatt, with a hidden agenda of his own. Brock is unaware that Tommy, his supposed associate, is in league with a dishonest policeman, Lieutenant Schmidt. The two of them frame Brock with doctored photographs. In court, though, Tommy – who has been converted to religion by a choir girl named Laura – admits the truth. A cleanup of the area begins. Brock doesn't remain to witness the change – he moves his campaign on to Detroit. Described as a "gay nineties" Guys and Dolls, Tenderloin is a must-produce for any theatre looking to produce Golden-Age Broadway musicals. A big, rousing, somewhat-risqué show with lots of dancing and the hit songs, "Artificial Flowers," "Little Old New York" and "Good Clean Fun," Tenderloin is a vintage show that still packs quite a punch.	https://music.apple.com/us/album/tenderloin-original-broadway-cast/716194901	https://is1-ssl.mzstatic.com/image/thumb/Music/v4/47/39/dd/4739dde3-4b7a-cd5c-1271-a44b5ddf2aa7/05099923763852.jpg/1000x1000bb.jpeg
356	Tess of the D'Urbervilles	Alex Loveless	Alex Loveless	First produced in 2014 at the New Wimbledon Studio Theatre by Stepping Out Theatre in Association with Partisan and Fallen Angel Theatre	https://music.apple.com/us/album/tess-of-the-durbervilles/1368588616	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/80/70/8c/80708c10-3f57-7839-d476-65f32313c355/5054960647541_cover.jpg/1000x1000bb.jpeg
357	The 25th Annual Putnam County Spelling Bee	William Finn	William Finn	Winner of the Tony and the Drama Desk Awards for Best Book, The 25th Annual Putnam County Spelling Bee has charmed audiences across the country with its effortless wit and humor. Featuring a fast-paced, wildly funny and touching book by Rachel Sheinkin and a truly fresh and vibrant score by William Finn, this bee is one unforgettable experience. An eclectic group of six mid-pubescents vie for the spelling championship of a lifetime. While candidly disclosing hilarious and touching stories from their home lives, the tweens spell their way through a series of (potentially made-up) words, hoping never to hear the soul-crushing, pout-inducing, life un-affirming "ding" of the bell that signals a spelling mistake. Six spellers enter; one speller leaves! At least the losers get a juice box. A riotous ride, complete with audience participation, The 25th Annual Putnam County Spelling Bee is a delightful den of comedic genius. The small cast and unit set make this a perfect option for high schools or community theatres. The 25th Annual Putnam County Spelling Bee is a fast-paced crowd pleaser and an instant theatre patron favorite.	https://music.apple.com/us/album/25th-annual-putnam-county-spelling-bee-original-broadway/1306116987	https://is1-ssl.mzstatic.com/image/thumb/Music118/v4/b2/94/dd/b294dda5-2461-5365-b6c3-328667aa5e3f/791558440737.jpg/1000x1000bb.jpeg
358	The Apple Tree	Jerry Bock	Jerry Bock	The brilliant songwriting team behind Fiddler on the Roof and She Loves Me bring us another witty, tuneful and utterly charming musical in The Apple Tree. The original production was directed by Mike Nichols and helped launch the career of Barbara Harris, who won a Tony for her role. The Apple Tree is made up of three musical miniatures that can be presented separately, or in any combination, to fill out a theatrical evening. "The Diary of Adam and Eve" is a quirky, touching spin on the tale of the world's first couple, adapted from Mark Twain's Extracts from Adam's Diary. "The Lady or the Tiger?" is a rock and roll fable set in a mythical barbarian kingdom, which explores the fickleness of love. "Passionella" is based on Jules Feiffer's offbeat Cinderella-story about a chimney sweep whose dreams of being a "glamorous movie star" nearly sabotage her one chance for true love. The Apple Tree is the perfect star vehicle for a woman and a man. Modest in its production requirements, this small cast show soars with Bock and Harnick's trademark warmth and humanity, amidst tongue-in-cheek humor.	https://music.apple.com/us/album/the-apple-tree-original-broadway-cast-recording/211380941	https://is1-ssl.mzstatic.com/image/thumb/Features/e0/59/81/dj.iyodviaw.jpg/1000x1000bb.jpeg
359	The Baker's Wife	Stephen Schwartz	Stephen Schwartz	Old-world charm permeates every moment of The Baker's Wife, a true gem of a musical by legendary authors, Joseph Stein (Fiddler on the Roof) and Stephen Schwartz (Godspell, Wicked, Pippin). This romantic musical has developed a loyal following for its lush score featuring the song "Meadowlark." The bickering residents of a rural village in 1935 Provence, France, have been without a baker for seven weeks. They finally find peace and contentment in the new baker, Aimable, and his attractive young wife, Genevieve. However, when Genevieve is lured away by a handsome young gigolo, the middle-aged baker loses all zest for life and baking. When he refuses to bake, the villagers must work as a team to bring Aimable and Genevieve back together.	https://music.apple.com/us/album/the-bakers-wife-original-london-cast/1486013271	https://is3-ssl.mzstatic.com/image/thumb/Music113/v4/ee/79/7d/ee797d4f-a6e2-ea01-58bc-799a0fb3a086/605288207228.jpg/1000x1000bb.jpeg
360	The Ballad of Little Jo	Mike Reid	Sarah Schlesinger	Set in the late 19th century, The Ballad of Little Jo is based on an admired independent film and inspired by the remarkable real-life frontier story of Josephine Monaghan.Josephine, a young society woman living in Boston, bears a child out of wedlock. In search of a new life and an income to support herself and her baby, she leaves her newborn son in the care of her sister and travels out West alone. For nearly 20 years, she makes her home in a tough Idaho mining town disguised as a man called "Jo."The stunning score features a fantastically contrasting blend of rousing chorales and soaring ballads as it tells the sweeping tale of manifest destiny and love, loss and acceptance.The Ballad of Little Jo has received multiple acclaimed productions. Steppenwolf Theatre Company produced The Ballad of Little Jo in 2000 as its first musical and it was subsequently mounted in 2003 at London's Bridewell Theatre. In summer 2017, The Ballad of Little Jo played Two River Theater in Red Bank, NJ, starring Teal Wicks (Wicked, Finding Neverland), Eric William Morris (Be More Chill, Mamma Mia!), Jane Bruce (Elf, The Theory of Relativity), and Daniel K. Isaac (According to My Mother, Billions).A cast album was released in November 2017.	https://music.apple.com/us/album/the-ballad-of-little-jo-original-cast-recording/1442926412	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/27/b7/84/27b784a9-0611-dba8-ddc6-d1beca4d1046/00888072041752.rgb.jpg/1000x1000bb.jpeg
361	The Band's Visit	David Yazbek	David Yazbek	“Once, not long ago, a group of musicians came to Israel from Egypt. You probably didn’t hear about it. It wasn’t very important.” The Egyptian Police Band arrives in Israel to play a concert. After a mix-up at the border, they are sent to a remote village in the middle of the desert. With no bus until morning and no hotel in sight, these unlikely travelers are taken in by the locals. Under the spell of the desert sky, their lives become intertwined in the most unexpected ways.	https://music.apple.com/us/album/the-bands-visit-original-broadway-cast-recording/1346806048	https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/09/d0/bb/09d0bbe1-6980-e64e-466a-280fb079cd86/791558454635.jpg/1000x1000bb.jpeg
362	The Beautiful Game	Andrew Lloyd Webber	Ben Elton	The story of a group of Belfast teenagers from both sides of the religious divide during “The Troubles.”	https://music.apple.com/us/album/the-beautiful-game-original-cast-recording/1452393667	https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/9b/b0/b8/9bb0b8e7-3168-b58a-3e76-e63a33e6aec9/00044006546322.rgb.jpg/1000x1000bb.jpeg
363	The Best Little Whorehouse in Texas	Carol Hall	Carol Hall	This happy-go-lucky view of small-town vice and statewide political side-stepping recounts the good times and the demise of the Chicken Ranch, known since the 1850s as one of the better pleasure palaces in all of Texas. Governors, senators, mayors, and even victorious college football teams frequent Miss Mona’s cozy bordello, until that Puritan nemesis Watchdog focuses his television cameras and his righteous indignation on the institution.	https://music.apple.com/us/album/best-little-whorehouse-in-texas-original-1978-broadway/1452565704	https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/a7/3a/c7/a73ac743-52dc-2242-8f92-58336fdbe199/00008811168322.rgb.jpg/1000x1000bb.jpeg
364	The Biograph Girl	David Heneker	Warner Brown and David Heneker	Set in the early 20th century when silent film was still a new form of media, Dorothy and Lillian Gish follow their family friend, the newly dubbed Mary Pickford, to New York City to become actresses in moving pictures. They are introduced to D.W. Griffith and he casts Lillian in his film The Birth of a Nation. The movie's lack of success forces D.W. to vow make an even bigger movie, while Lillian struggles with maintaining the image that he audiences have attributed to her. When Intollerance is also a commercial flop, D.W. urges Lillian to take an offer from another studio so that she can earn a living wage. Soon after the industry makes a huge shift with the introduction of sound in pictures, forcing every film industry member to asses their place in the business.	https://music.apple.com/us/album/biograph-girl-soundtrack-from-musical-original-london/200709357	https://is1-ssl.mzstatic.com/image/thumb/Music/90/4d/89/mzi.kxxbysqg.tif/1000x1000bb.jpeg
365	The Boys From Syracuse	Richard Rodgers	Lorenz Hart	Twins! More twins! Women-chased and chaste! The first musical ever adapted from Shakespeare remains the most madcap musical farce ever to animate the stage. Antipholus and his wily servant, Dromio, travel to Ephesus in search of their respective twins, from whom they were separated in a shipwreck. Naturally, they are immediately taken for their brothers and we're off and running on a riotous chase from marketplace to marital bed. Perplexed wives, disgruntled courtesans, outraged constables and an audience roaring with laughter are left in its wake before this show's tangled web is unraveled, and Rodgers & Hart & Abbott have triumphed once again!	https://music.apple.com/us/album/the-boys-from-syracuse-studio-cast-recording-1953/213131489	https://is2-ssl.mzstatic.com/image/thumb/Features/3b/2e/3b/dj.yqnruebu.jpg/1000x1000bb.jpeg
366	The Bridges of Madison County	Jason Robert Brown	Jason Robert Brown	Based on the best-selling novel, and developed by Tony Award winner Jason Robert Brown (The Last Five Years, Parade, Songs for a New World) and Pulitzer Prize winner Marsha NormanThe Bridges of Madison County captures the lyrical expanse of America's heartland along with the yearning entangled in the eternal question, "What if...?" Winner of the 2014 Tony Award for Best Score and Orchestrations, this sweeping romance about the roads we travel, the doors we open and the bridges we dare to cross will leave audiences breathless. Francesca Johnson, a beautiful Italian woman who married an American soldier to flee war-ravaged Italy, looks forward to a rare four days alone on her Iowa farm when her family heads to the 1965 State Fair. When ruggedly handsome, National Geographic photographer, Robert Kincaid, pulls into her driveway seeking directions, though, what happens in those four days may very well alter the course of Francesca's life. With a soaring score and a heartbreaking story, The Bridges of Madison County is a touching and powerful addition to any theatre's season. The tour de force roles of Francesca and Robert are a dream come true for any actor, while the ensemble is rich with characters who tell their own individual stories and receive plenty of focus on stage.	https://music.apple.com/us/album/bridges-madison-county-original-broadway-cast-recording/1270809834	https://is4-ssl.mzstatic.com/image/thumb/Music128/v4/b1/f8/45/b1f845e7-e577-c93b-2884-418908ce6681/791558948431.jpg/1000x1000bb.jpeg
367	The Civil War	Frank Wildhorn	Frank Wildhorn	Drawing on letters, diaries, firsthand accounts and the words of Abraham Lincoln, Frederick Douglass and Walt Whitman, The Civil War is a thrilling and awe-inspiring "dramatic theatrical concert." The original Broadway production was nominated for multiple Tony Awards, including Best Musical, and features an unforgettable score filled with Gospel, Country, Rock and Folk by Frank Wildhorn (Jekyll & Hyde, Dracula, Bonnie & Clyde). This epic thematic revue puts a human face on the greatest tragedy of American history. It explores the experiences of the soldiers and leaders who fought for their way of life. It also examines the lives of the lovers and families whom they left behind, as well as the hopes and fears of the slaves whose freedom was at stake. This musical passionately asks us to consider our beliefs about freedom, honor and faith. The Civil War calls for a large, predominantly male cast, while the score provides many solo opportunities for strong singers. This intense work delves into one of our nation's most defining times and is packed with feeling and messages expressed directly through the wide variety of musical numbers performed, making it the perfect choice for theatres looking to mount a large scale production that will inspire, move and educate.	https://music.apple.com/us/album/the-civil-war-the-complete-work/1143668591	https://is4-ssl.mzstatic.com/image/thumb/Music62/v4/55/19/d3/5519d32f-1602-2028-56fe-f66394c38058/603497872039.jpg/1000x1000bb.jpg
368	The Desert Song	Sigmund Romberg	Otto Harbach, Oscar Hammerstein II and Frank Mandel	With mystery, intrigue, and romance, Sigmund Romberg's operetta dramatizes the 1925 uprising of the Riffs, a group of Moroccan fighters, against French colonial rule.	https://music.apple.com/us/album/the-desert-song-studio-cast-recording/556700643	https://is2-ssl.mzstatic.com/image/thumb/Music/v4/b7/11/f6/b711f623-93b1-ccaf-b53c-99b5f46874d2/886443485976.jpg/1000x1000bb.jpeg
369	The Drowsy Chaperone	Lisa Lambert	Lisa Lambert	Winner of five Tony Awards, including Best Book and Best Original Score, The Drowsy Chaperone is a loving send-up of the Jazz Age musical, featuring one show-stopping song and dance number after another. With the houselights down, a man in a chair appears on stage and puts on his favorite record: the cast recording of a fictitious 1928 musical. The recording comes to life and The Drowsy Chaperone begins as the man in the chair looks on. Mix in two lovers on the eve of their wedding, a bumbling best man, a desperate theatre producer, a not-so-bright hostess, two gangsters posing as pastry chefs, a misguided Don Juan and an intoxicated chaperone, and you have the ingredients for an evening of madcap delight. Hailed by New York Magazine as "The Perfect Broadway Musical," The Drowsy Chaperone is a masterful meta-musical, poking fun at all the tropes that characterize the musical theatre genre. Because of its many featured roles and accessible script, The Drowsy Chaperone will fit perfectly into any company's season or school's calendar.	https://music.apple.com/us/album/the-drowsy-chaperone-original-broadway-cast-recording/1304463727	https://is4-ssl.mzstatic.com/image/thumb/Music118/v4/01/bb/8c/01bb8c52-4ca3-67b5-8227-762feb95f8e1/791558441130.jpg/1000x1000bb.jpeg
370	The Evolution of Mann	Douglas J. Cohen, Dan Elish	Douglas J. Cohen, Dan Elish	The Evolution of Mann follows Henry Mann, a thirty-something-year-old single New Yorker eager to settle down… or so he thinks. After receiving an invitation to his ex-fiancée’s wedding, Henry and his lesbian roommate embark on a quest to find his soulmate, his perfect date. theevolutionofmannmusical.comThe Evolution of Mann made its Off-Broadway debut at the Cell Theatre in New York on September 23, 2018, starring Max Crumm, Allie Trimm and Leslie Hiatt.	https://music.apple.com/us/album/evolution-mann-new-musical-original-off-broadway-cast/1450734627	https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/44/c2/9e/44c29e28-ff76-38a9-95c7-74aca3e6593b/859730430065_cover.jpg/1000x1000bb.jpeg
371	The Fantasticks	Harvey Schmidt	Tom Jones	"Try To Remember" a time when this romantic charmer wasn't enchanting audiences around the world. The Fantasticks is the longest-running musical in the world and with good reason: at the heart of its breathtaking poetry and subtle theatrical sophistication is a purity and simplicity that transcends cultural barriers. The result is a timeless fable of love that manages to be nostalgic and universal at the same time. The Fantasticks is a funny and romantic musical about a boy, a girl, and their two fathers who try to keep them apart. The narrator, El Gallo, asks the audience to use their imagination and follow him into a world of moonlight and magic. The boy and the girl fall in love, grow apart and finally find their way back to each other after realizing the truth in El Gallo's words that, "without a hurt, the heart is hollow." With its minimal costumes, small band and virtually nonexistent set, The Fantasticks is an intimate show that may be performed in virtually any space, engaging the audience's imagination and showcasing a strong ensemble cast. Its moving tale of young lovers who become disillusioned, only to discover a more mature, meaningful love is punctuated by a bountiful series of catchy, memorable songs, many of which have become classics.	https://music.apple.com/us/album/the-fantasticks-the-new-off-broadway-recording/1303814134	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/fc/9d/9b/fc9d9baa-59c0-5bfa-6fe4-49e0f63f6278/791558441536.jpg/1000x1000bb.jpeg
372	The Frogs	Stephen Sondheim	Stephen Sondheim	From the writers behind A Funny Thing Happened on the Way to the Forum comes the hilarious send up of Greek comedy and satire, The Frogs. Loosely based on a comedy written in 405 B.C. by Aristophanes, The Frogs playfully explores the great challenges of human existence: confronting our fears, understanding life and death and challenging the distractions that can prevent us from achieving our goals. This boisterously hilarious, yet poignant, musical follows Dionysos, Greek god of wine and drama, and his slave, Xanthias, on a journey to Hades to collect renowned critic and playwright, George Bernard Shaw, so that he may enlighten the easily misled and coerced masses of Earth. Along this journey, Dionysus and Xanthias meet Chekhov, Congreve, Ibsen, Brecht and, of course, the chorus of frogs. Then, Shakespeare shows up and starts declaiming his greatest hits; before long, he engages in a battle of words with Mr. Shaw. Who will win the honor of becoming reincarnated: The Bard or Bernard? The Frogs stays true to its heritage, mixing Aristophanic pratfall satire with a Sondheim score that swings from witty to pretty to rambunctious, but it also mirrors the Greek original for the serious issue of the role of the arts in a world beset by war and folly. This musical is ideal for a regional theatre looking to inject a bit of Greek satire into its season.	https://music.apple.com/us/album/a-year-with-frog-and-toad-original-cast-recording/571088394	https://is1-ssl.mzstatic.com/image/thumb/Music/v4/17/b8/35/17b83565-da46-e3d9-d93d-4d0e053fb651/803607041625_cover.tif/1000x1000bb.jpeg
373	The Full Monty	David Yazbek	David Yazbek	Based on the cult hit film of the same name, The Full Monty, a ten-time Tony Award nominee, is filled with honest affection, engaging melodies and the most highly anticipated closing number of any show.  The powerhouse team of Terrence McNally (Ragtime) and David Yazbek (Dirty Rotten Scoundrels) cooks up While spying on their wives at a "Girls' Night Out," a group of unemployed steelworkers from Buffalo sees how much they enjoy watching male strippers. Jealous, out of work and feeling emasculated, the men come up with a bold and unclothed way to make some quick cash. In preparing, they find themselves extremely exposed; not merely physically but emotionally. As they conquer their fears, self-consciousness and prejudices, the men come to discover that they're stronger as a group, and the strength that they find in each other gives them the individual courage to "let it go." The Full Monty is a story full of heart. Right to the end, audiences will be wondering if these lovable misfits will really pull it off. With a raucous mix of razor-sharp humor and toe-tapping pizzazz, this heartwarming, upbeat comedy is a must for any theatre looking for a big hit.	https://music.apple.com/us/album/the-full-monty-original-broadway-cast-recording/255400375	https://is3-ssl.mzstatic.com/image/thumb/Features/f3/fa/d2/dj.xzptayef.jpg/1000x1000bb.jpeg
374	The Golden Apple	John Latouche, Jerome Moross	John Latouche, Jerome Moross	In Washington state at the turn of the 20th century, the small town of Angel’s Roost is thrown into confusion when old Menelaus’s capricious wife Helen runs off with a traveling salesman named Paris, who was in town to judge an apple pie bake-off. Restless Ulysses, just returned from the Spanish-American War, sets off to retrieve Helen, leaving his wife Penelope for a ten-year adventure. The operetta's rousing score includes the jazz standard "Lazy Afternoon."	https://music.apple.com/us/album/the-golden-apple-original-broadway-cast-recording/272105022	https://is5-ssl.mzstatic.com/image/thumb/Features/60/06/c2/dj.izfhtksz.jpg/1000x1000bb.jpeg
375	The Goodbye Girl	Marvin Hamlisch	David Zippel	A warm, light-hearted romantic comedy musical based on Neil Simon's award-winning film. The Goodbye Girl turns the film comedy into an adventure about love and commitment. It follows the unlikely romance between Paula, a bitter single mother who has been jilted one too many times, and Eliot, the opinionated actor who shows up – unexpectedly – on her doorstep with a lease to sublet her apartment. It features the same unique humor that has made Neil Simon the most popular playwright in Broadway history. Add a score by Marvin Hamlisch (A Chorus Line) and David Zippel (City of Angels, Disney's Hercules, Disney's Mulan), and you have an instant contemporary classic. The Goodbye Girl is a jubilant musical with catchy tunes, and a joyous addition to any theatre season.	https://music.apple.com/us/album/the-goodbye-girl-original-broadway-cast-recording/181564835	https://is5-ssl.mzstatic.com/image/thumb/Features/ff/a1/57/dj.iipiehji.jpg/1000x1000bb.jpeg
376	The Happiest Girl in the World	Jacques Offenbach	E.Y. Harburg	The Happiest Girl in the World is based on the comedy Lysistrata by Aristophanes and tales of Greek mythology by Thomas Bulfinch, set to the music of Jacques Offenbach. It focuses on the women of Ancient Greece and Sparta who, inspired by virginal goddess Diana, vow to withhold sex from their husbands and lovers until they promise to put an end to their fighting. Complications ensue when Diana’s uncle, the underworld ruler Pluto, balks at the notion of peace and attempts to derail her plan.The Happiest Girl in the World opened on Broadway at the Martin Beck Theatre on April 3, 1961 and played for 98 performances. The cast included Cyril Ritchard, Janice Rule and Lainie Kazan.	https://music.apple.com/us/album/happiest-girl-in-world-original-broadway-cast-recording/435742103	https://is2-ssl.mzstatic.com/image/thumb/Music/2d/31/24/mzi.rcmdphhq.jpg/1000x1000bb.jpeg
377	The Human Comedy	William Saroyan, William Dumaresq, Galt MacDermot	William Saroyan, William Dumaresq, Galt MacDermot	A pop folk opera about small town life in America during the early days of World War II produced in New York by Joseph Papp.	https://music.apple.com/us/album/the-human-comedy-original-broadway-cast-recording/440894445	https://is4-ssl.mzstatic.com/image/thumb/Music/6d/9e/b2/mzi.vitiipyw.jpg/1000x1000bb.jpeg
378	The Hunchback of Notre Dame	Alan Menken	Stephen Schwartz	Based on the Victor Hugo novel and songs from the Disney animated feature, The Hunchback of Notre Dame showcases the film’s Academy Award-nominated score, as well as new songs by Menken and Schwartz. Peter Parnell’s new book embraces story theatre and features verbatim passages from Hugo’s gothic novel. The musical begins as the bells of Notre Dame sound through the famed cathedral in fifteenth-century Paris. Quasimodo, the deformed bell-ringer who longs to be "Out There," observes all of Paris reveling in the Feast of Fools. Held captive by his devious caretaker, the archdeacon Dom Claude Frollo, he escapes for the day and joins the boisterous crowd, only to be treated cruelly by all but the beautiful gypsy, Esmeralda. Quasimodo isn’t the only one captivated by her free spirit, though – the handsome Captain Phoebus and Frollo are equally enthralled. As the three vie for her attention, Frollo embarks on a mission to destroy the gypsies – and it’s up to Quasimodo to save them all. A sweeping score and powerful story make The Hunchback of Notre Dame an instant classic. Audiences will be swept away by the magic of this truly unforgettable musical.	https://music.apple.com/us/album/the-hunchback-of-notre-dame-studio-cast-recording/1270209325	https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/3e/84/9e/3e849e64-d3bc-0688-41cc-a1c5039b9684/791558984132.jpg/1000x1000bb.jpeg
379	The It Girl	Paul McKibbins	BT McNicholl	Here is a lighthearted tribute to silent movies and Clara Bow that reinvents her 1927 film about a sassy department store salesclerk who wins an advertising contest held to find the girl with the elusive, thrilling quality known as It. Among those she enchants with sexy charm is the heir to the retail empire that employs her.	https://music.apple.com/us/album/the-it-girl-original-cast/191625521	https://is4-ssl.mzstatic.com/image/thumb/Music/da/60/61/mzi.rzomzqml.tif/1000x1000bb.jpeg
380	The King and I	Richard Rodgers	Oscar Hammerstein II	It is 1862 in Siam when an English widow, Anna Leonowens, and her young son arrive at the Royal Palace in Bangkok, having been summoned by the King to serve as tutor to his many children and wives. The King is largely considered to be a "barbarian" by those in the West, and he seeks Anna's assistance in changing his image, if not his ways. With both keeping a firm grip on their respective traditions and values, Anna and the King grow to understand and respect one another in a truly unique love story.	https://music.apple.com/us/album/king-i-music-theater-lincoln-center-cast-recording/187950839	https://is1-ssl.mzstatic.com/image/thumb/Music/43/33/88/mzi.xdzppjuv.jpg/1000x1000bb.jpeg
381	The Last Five Years	Jason Robert Brown	Jason Robert Brown	Jason Robert Brown's Drama Desk winner, The Last Five Years, has been translated into a handful of languages and was named one of TIME Magazine's ten best shows of 2001. A testament to the show's longevity, and spurred by the show's regional popularity, The Last Five Years enjoyed an Off-Broadway revival at Second Stage in 2013. A film adaptation was released in 2014, starring Anna Kendrick and Jeremy Jordan An emotionally powerful and intimate musical about two New Yorkers in their twenties who fall in and out of love over the course of five years, the show's unconventional structure consists of Cathy, the woman, telling her story backwards while Jamie, the man, tells his story chronologically; the two characters only meet once, at their wedding in the middle of the show. Featuring a two-person cast, The Last Five Years is a great opportunity for actors with both range and stamina. This intimate musical is perfect for small theatre companies and black box venues.	https://music.apple.com/us/album/the-last-five-years-original-cast-recording/1307194034	https://is1-ssl.mzstatic.com/image/thumb/Music128/v4/6d/2e/86/6d2e8600-624d-9beb-6c53-7a3895493474/888072016262.jpg/1000x1000bb.jpeg
382	The Last Smoker in America	Peter Melnick	Bill Russell	The Last Smoker in America is a raucous, irreverent and unfiltered new musical comedy, with book and lyrics by Tony Award® nominee Bill Russell (Side Show) and music by Drama Desk® nominee Peter Melnick (Adrift in Macao). Enter an America where the government is in your kitchen, sniffing for outlawed cigarettes! The extreme anti-smoking laws test the sanity of one suburban family. Pam is having an impossible time trying to quit. Her husband Ernie retreats to the basement to relive the rock star dreams of his youth, while their teenage son Jimmy only turns away from his videogames to explore his gangster rapper persona. Adding to the dysfunctional dynamic is anti-smoking fanatic Phyllis, the neighbor who can’t keep her nose out of everyone else’s business. This original and hilarious new musical will leave you craving for more!	https://music.apple.com/us/album/the-last-smoker-in-america-original-cast-recording/657893844	https://is4-ssl.mzstatic.com/image/thumb/Music/v4/a5/ba/f2/a5baf285-18bb-13bf-b543-19c6e503e87d/859709973838_cover.tif/1000x1000bb.jpeg
383	The Last Sweet Days of Isaac	Nancy Ford	Gretchen Cryer	This two-part, two-person rock musical was a long-running, award-winning hit Off-Broadway. Acclaimed by New York critics as the freshest musical since Hair, it is a sad and funny spoof of computerized claustrophobia in a world where one mechanical breakdown can end it all. In the first act, Isaac and Ingrid are trapped in an elevator. They talk, make a fumbling try at sex and depart. In the second act, Isaac is in jail with a television that sends and receives pictures. Alice is in the next cell. Though Isaac and Alice can only see each other through their television screens, they try to communicate.	https://music.apple.com/us/album/last-sweet-days-isaac-original-off-broadway-cast-recording/309029614	https://is5-ssl.mzstatic.com/image/thumb/Music/27/19/96/mzi.wtlthekw.jpg/1000x1000bb.jpeg
384	The Light in the Piazza	Adam Guettel	Adam Guettel	Margaret Johnson, the wife of an American businessman, is touring the Tuscan countryside with her daughter, Clara. While sightseeing, Clara - a beautiful, surprisingly childish young woman - loses her hat in a sudden gust. As if guided by an unseen hand, the hat lands at the feet of Fabrizio Naccarelli, a handsome Florentine, who returns it to Clara. This brief episode, charged with coincidence and fate, sparks an immediate and intense romance between Clara and Fabrizio. Margaret, extremely protective of her daughter, attempts to keep Clara and Fabrizio apart. But as events unfold, a secret is revealed: in addition to the cultural differences between the young lovers, Clara is not quite all that she appears. Unable to suppress the truth about her daughter, Margaret is forced to reconsider not only Clara's future, but her own hopes as well.	https://music.apple.com/us/album/light-in-piazza-original-broadway-cast-recording-international/74335753	https://is5-ssl.mzstatic.com/image/thumb/Music/y2005/m07/d06/h18/s06.zzziucdl.jpg/1000x1000bb.jpeg
385	The Likes of Us	Andrew Lloyd Webber	Tim Rice	The Likes of Us follows Barnardo’s arrival in London’s East End in 1866, his initial evangelical work and his eventual recognition of the plight and poverty amongst homeless children in the capital. The two-act show depicts Barnardo’s first meeting with Syrie Elmslie, who eventually became his wife, and how the first Barnardo’s home for children came into being in 1867.	https://music.apple.com/us/album/the-likes-of-us-live-from-the-sydmonton-festival/1452339030	https://is3-ssl.mzstatic.com/image/thumb/Music124/v4/83/5f/f1/835ff189-ee11-520e-42fd-177b42b5faa5/00602498748343.rgb.jpg/1000x1000bb.jpeg
386	The Little Mermaid	Alan Menken	Howard Ashman	Based on one of Hans Christian Andersen's most beloved stories and the classic animated film, Disney's The Little Mermaid is a hauntingly beautiful love story for the ages. With music by eight-time Academy Award winner, Alan Menken, lyrics by Howard Ashman and Glenn Slater and a compelling book by Doug Wright, this fishy fable will capture your heart with its irresistible songs, including "Under the Sea," "Kiss the Girl" and "Part of Your World." Ariel, King Triton's youngest daughter, wishes to pursue the human Prince Eric in the world above, bargaining with the evil sea witch, Ursula, to trade her tail for legs. But the bargain is not what it seems, and Ariel needs the help of her colorful friends, Flounder the fish, Scuttle the seagull and Sebastian the crab to restore order under the sea. Disney's The Little Mermaid offers a fantastic creative opportunity for rich costumes and sets, as well as the chance to perform some of the best-known songs from the past 30 years. A free, downloadable Production Handbook is available here (PDF).	https://music.apple.com/us/album/the-little-mermaid-original-broadway-cast-recording/1440768351	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/62/d2/bc/62d2bc0d-1886-46ce-7400-2f40f9c59e54/00050087111816.rgb.jpg/1000x1000bb.jpeg
387	The Mad Ones	Kait Kerrigan, Brian Lowdermilk	Kait Kerrigan, Brian Lowdermilk	The Mad Ones, formerly known as The Unauthorized Autobiography of Samantha Brown), opened off-Broadway (Prospect Theater Company at 59E59) on November 17, 2017. Even before the show began to be licensed in December 2019, The Mad Ones sold 15,000+ individual pieces of digital sheet music, amassed millions of YouTube views and inspired thousands of fan videos.	https://music.apple.com/us/album/the-mad-ones-studio-cast-recording/1488850389	https://is1-ssl.mzstatic.com/image/thumb/Music123/v4/f9/4b/75/f94b75a2-8cc2-3bfc-e063-ff497471db28/19CRGIM15705.rgb.jpg/1000x1000bb.jpeg
388	The Merry Widow	Franz Lehar	Charles George	All the world famous songs have been retained, embellished with new lyrics that critics believe to be the best words ever to the Lehar score. There's a new story of a dashing European prince and his romance with a beautiful American widow. The comedy is clever and wholesome and is not difficult to cast or stage.	https://music.apple.com/us/album/merry-widow-music-theater-lincoln-center-cast-recording/435733754	https://is1-ssl.mzstatic.com/image/thumb/Music/1d/41/3b/mzi.hjvgcfqr.jpg/1000x1000bb.jpeg
389	The Mikado (Operetta)	Arthur Sullivan	W.S. Gilbert	The hapless lovers in The Mikado are mercilessly buffeted by social restrictions, legal inconsistencies, judicial inequities, government stupidities, and that's just the first act! Poor dears - it would be absolutely tragic if it weren't so hysterically funny.	https://music.apple.com/us/album/the-mikado-original-cast/268879841	https://is5-ssl.mzstatic.com/image/thumb/Music/0b/18/4b/mzi.hmsumesu.tif/1000x1000bb.jpeg
390	The Most Happy Fella	Frank Loesser	Frank Loesser	From the composer of Guys and Dolls comes this touching, dramatic and intensely personal love story. Your heart will be warmed by this May-to-December romance, when a city bride is wooed by an aging Italian grape farmer who nearly botches everything... until his true goodness shines through. With a gorgeous score and spirited dancing, it's a simple and touching love story that makes for an extraordinary night of theatre. Tony, a middle-aged vintner, makes a mail order marriage proposal, which is accepted under the girl's mistaken assumption that a photo of his young, handsome foreman is her intended husband. Her hurt and humiliation when she learns the truth, as well as a terrible accident that nearly kills Tony as he hurries to meet her, almost ends the relationship before it begins, but a loving understanding blossoms between them during Tony's long convalescence. Filled with sweeping ballads, intense dramatic arias and tuneful, splashy Broadway-style numbers, this ambitious "Broadway opera" has found a home on opera and musical-theatre stages alike. Its sizable score showcases strong singers, including a mature operatic baritone and a young soprano ingénue for the two lead roles. The rest of the large cast consists of a winsome comic duo for the secondary leads and a host of other compelling characters. The show's lasting popularity has led to two Broadway revivals, the latter with a two-piano accompaniment that is available for rental.	https://music.apple.com/us/album/the-most-happy-fella-original-broadway-cast-recording/483035130	https://is5-ssl.mzstatic.com/image/thumb/Music/d6/72/04/mzi.wgfxtzlu.jpg/1000x1000bb.jpeg
391	The Music Man	Meredith Willson	Meredith Willson	By turns wicked, funny, warm, romantic and touching, The Music Man is family entertainment at its best. Meredith Willson's six-time, Tony Award-winning musical comedy has been entertaining audiences since 1957 and is a family-friendly story to be shared with every generation. The Music Man follows fast-talking traveling salesman, Harold Hill, as he cons the people of River City, Iowa, into buying instruments and uniforms for a boys' band that he vows to organize – this, despite the fact that he doesn't know a trombone from a treble clef. His plans to skip town with the cash are foiled when he falls for Marian, the librarian, who transforms him into a respectable citizen by curtain's fall. Perfect for professional theatres, community groups, summer stock and schools alike, this award-winning, critically acclaimed Broadway classic is an all-American institution, thanks to is quirky characters, charmingly predictable dramatic situations and one-of-a-kind, nostalgic score of rousing marches, barbershop quartets and sentimental ballads, which have become popular standards. The cast features a soaring soprano ingenue, parts for young performers and children, and one of the musical theatre's treasures, a tour de force leading role for a charismatic actor who doesn't need to be a trained singer.	https://music.apple.com/us/album/the-music-man-original-broadway-cast/1442948380	https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/5d/90/a3/5d90a30c-e918-7045-195e-57e7839b27ba/00602547869005.rgb.jpg/1000x1000bb.jpeg
392	The Mystery of Edwin Drood	Rupert Holmes	Rupert Holmes	Based on Charles Dickens’ final unfinished novel, this hilarious whodunit invites the audience to solve its mystery by choosing the identity of the murderer. The tale is presented as a show-within-a-show, as the Music Hall Royale - a delightfully loony Victorian theatre company - presents Dickens’ brooding mystery.	https://music.apple.com/us/album/mystery-edwin-drood-2013-new-broadway-cast-recording/598018778	https://is3-ssl.mzstatic.com/image/thumb/Music/v4/db/d9/69/dbd9694c-7bb7-50bd-d0fe-5fd9732b00b2/021471988321.jpg/1000x1000bb.jpeg
393	The New Moon	Sigmund Romberg	Oscar Hammerstein II, Frank Mandel and Laurence Schwab	In 1788 New Orleans, Robert, a French revolutionist wanted by the Crown, is caught and put aboard The New Moon to stand trial in France. Mutiny is instigated by his beloved Marianne, and everyone on board starts a new, flourishing island republic which comes under attack from the French just as a revolution there changes everything.The New Moon opened on Broadway at the Imperial Theatre on September 19, 1928, starring Evelyn Herbert, Robert Halliday and William O’Neal. The operetta later transferred to the Casino Theatre, playing a total of 519 performances. Two Broadway revivals followed, in 1942 and 1944.	https://music.apple.com/us/album/the-new-moon-2004-encores-cast-recording/1304699449	https://is4-ssl.mzstatic.com/image/thumb/Music118/v4/cc/41/4c/cc414c37-6db6-38e1-ca93-23d5eab70bdd/791558440331.jpg/1000x1000bb.jpeg
394	The Pajama Game	Jerry Ross	Jerry Ross	The Pajama Game was awarded the 1955 Tony for Best Musical and, over half of a century later, claimed the award for Best Revival of a Musical, proving that the story is truly timeless. With an energetic score by Richard Adler and Jerry Ross (Damn Yankees), The Pajama Game is brimming with songs and dances that have become musical theatre standards, including "Steam Heat" and "Hernando's Hideaway." Conditions at the Sleep-Tite Pajama Factory are anything but peaceful as sparks fly between new superintendent, Sid Sorokin, and Babe Williams, leader of the union grievance committee. Their stormy relationship comes to a head when the workers strike for a 7 ½ cent pay increase, setting off not only a conflict between management and labor, but a battle of the sexes as well. Featuring plenty of fun and splashy production numbers, including a comic "dream ballet," The Pajama Game is filled with standout featured roles and a large ensemble, making it a perfect choice for high schools and community theatres. This perennial favorite is a surefire crowd-pleaser and a glowing example of solid, classic musical comedy.	https://music.apple.com/us/album/the-pajama-game-original-broadway-cast-recording/215525560	https://is4-ssl.mzstatic.com/image/thumb/Music113/v4/09/1c/37/091c3780-1da4-61f6-17c3-80cad0909912/696998925328.jpg/1000x1000bb.jpeg
395	The People vs. Friar Laurence, The Man Who Killed Romeo and Juliet	Ron West, Phil Swann	Ron West, Phil Swann	The People Vs. Friar Laurence, The Man Who Killed Romeo and Juliet is the Romeo and Juliet story told from the perspective of Friar Laurence. It was created using the following formula: Troubled teenagers + feuding families + political intrigue = musical comedy.  The show, a smash hit for Chicago Shakespeare Theater, is the funniest mash up of Shakespeare, Gilbert & Sullivan, sketch comedy, and American theater you've ever seen.IMPORTANT: While all audiences will enjoy the play, it includes some strong language some producers may be uncomfortable with, so the authors have provided an appendix to the script wherein the coarser language has been redacted.The People vs. Friar Laurence was first presented by David Castellani at the Tamarind Theater in Los Angeles in January 2004. It was subsequently presented by Chicago Shakespeare Theater in May 2004. The cast included Nicole Parker (Mad-TV, Wicked), Keegan-Michael Key (Key and Peele), and Brian Gallivan (Sassy Gay Friend).	https://music.apple.com/us/album/people-vs-friar-laurence-man-who-killed-romeo-juliet/57661626	https://is4-ssl.mzstatic.com/image/thumb/Music/y2005/m04/d12/h13/s05.iddsdhqn.tif/1000x1000bb.jpeg
396	The People vs. Mona	Jim Wann, Patricia Miller	Jim Wann, Patricia Miller	Mona Mae Katt, a third-generation Latina-American, owns the Frog Pad, the long-time musical heart of Tippo, GA, a town in need of a plan to revive itself. She is accused of killing C.C. Katt, recording studio operator and her husband of ten hours, by hitting him over the head with her Stratocaster guitar. She is defended by Jim Summerford, a Southern gentleman who’s never won a case against prosecutor and Mayoral candidate Mavis Frye—his fiancé. As Jim tries to prove Mona’s innocence, he becomes attracted to her, and Mavis ups the stakes: she wants to convict Mona, marry Jim, take office, tear down the Frog Pad, and put up a Casino—bringing in bucks, but taking away Tippo’s artistic and social traditions in the process. And if Mona is found guilty, the odds are Mavis will get her way.	https://music.apple.com/us/album/people-vs-mona-original-cast-recording-york-theatre/328170133	https://is4-ssl.mzstatic.com/image/thumb/Music/f5/50/8b/mzi.lnwdhfpa.tif/1000x1000bb.jpeg
397	The Phantom of the Opera	Andrew Lloyd Webber	Charles Hart	Rights to perform the iconic Tony-winning tuner are currently available only to high schools, youth groups and colleges.The Phantom of the Opera tells the story of a masked figure who lurks beneath the catacombs of the Paris Opera House, exercising a reign of terror over all who inhabit it. He falls madly in love with an innocent young soprano, Christine, and devotes himself to creating a new star by nurturing her extraordinary talents and by employing all of the devious methods at his command.Andrew Lloyd Webber’s enthralling score includes “Think of Me,” “Angel of Music,” “‘Music of the Night,” “All I Ask of You,” “Masquerade” and the title song.	https://music.apple.com/us/album/the-phantom-of-the-opera-original-london-cast/1452159631	https://is5-ssl.mzstatic.com/image/thumb/Music124/v4/e0/f3/cb/e0f3cb36-aa3e-7267-d406-7682cc07c258/00731454392822.rgb.jpg/1000x1000bb.jpeg
398	The Pirates of Penzance	W.S. Gilbert, Arthur Sullivan, Peter Murray	W.S. Gilbert, Arthur Sullivan, Peter Murray	Gilbert and Sullivan are the undisputed masters of comic operetta and the proud parents of the modern musical. That their works are more in demand today than when they were created over a century ago is ample proof of their lasting brilliance. When the hero of The Pirates of Penzance was but a boy, his father instructed his nurse to have him apprenticed as a pilot. She thought he said 'pirate' and thus the zany troubles began.	https://music.apple.com/us/album/the-pirates-of-penzance-original-cast-recording/268824831	https://is5-ssl.mzstatic.com/image/thumb/Music/09/fb/4b/mzi.cifpaiyn.tif/1000x1000bb.jpeg
399	The Prince and the Pauper	Neil Berg	Neil Berg and Bernie Garzia	Mark Twain’s timeless tale about look-alike boys who change places – and the destiny of a nation – is transformed into a swashbuckling musical. Enter medieval London and meet the young, protected Prince who gazes from his window at a world he is not allowed to explore, while a destitute boy dreams of escaping the thievery and filth that surround him. The Prince and the Pauper dazzled audiences of all ages in its multi-year run at the Lambs Theatre in New York City. It overflows with the thrill of adventure, the power of youth, magical sword fights, and enchanting songs.	https://music.apple.com/us/album/the-prince-and-the-pauper/200741744	https://is3-ssl.mzstatic.com/image/thumb/Music/d6/f3/db/mzi.iatgtpps.tif/1000x1000bb.jpeg
400	The Producers	Mel Brooks	Mel Brooks	Bialystock and Bloom! Those names should strike terror and hysteria in anyone familiar with Mel Brooks' classic cult comedy film. Now as a big Broadway musical, The Producers once again sets the standard for modern, outrageous, in-your-face humor. It is a truly "boffo" hit, winning a record twelve Tony Awards and wowing capacity crowds night after night. The plot is simple: a down-on-his-luck Broadway producer and his mild-mannered accountant come up with a scheme to produce the most notorious flop in history, thereby bilking their backers (all "little old ladies") out of millions of dollars. Only one thing goes awry: the show is a smash hit! The antics of Max Bialystock and Leo Bloom as they maneuver their way fecklessly through finding a show (the gloriously offensive "Springtime for Hitler"), hiring a director, raising the money and finally going to prison for their misdeeds is a lesson in broad comic construction. At the core of the insanely funny adventure is a poignant emotional journey of two very different men who become friends. With a truly hysterical book co-written by Mel Brooks and Thomas Meehan (Annie) and music and lyrics by Mr. Brooks, The Producers skewers Broadway traditions and takes no prisoners as it proudly proclaims itself an "equal opportunity offender!"	https://music.apple.com/us/album/the-producers-original-broadway-cast-recording/357911384	https://is3-ssl.mzstatic.com/image/thumb/Music/ef/ab/5f/mzi.oypkcner.jpg/1000x1000bb.jpeg
401	The Ragged Child	David Nield	Frank Whately	Broadcast on the BBC in 1988, The Ragged Child became a flagship production and title for the UK's National Youth Music Theatre. Critics have largely hailed The Ragged Child as "moving" and "stirring." The dire straits of the poor and destitute of 1850's London is mirrored in the tragic lives of siblings Joe & Annie Cooper. As they are fighting in the streets for survival and reprieve from the deadly cholera outbreak, Lord Shaftesbury is fighting in the House of Lords for the education of the ignorant, illiterate poor. As Lord Shaftesbury's quest has a successful outcome, the Coopers are not so lucky. They're the last of the unfortunate souls to slip through the fingers of necessary charity. The Ragged Child comes from a creative team that has a staggering number of musicals under its belt, including Drake, Tin Pan Ali and The Roman Invasion of Ramsbottom. It's a well-crafted tale that is the ideal choice for a theatre company that would like to feature young artists. The Ragged Child also has potential to couple well with schools' history curricula.	https://music.apple.com/us/album/the-ragged-child-original-nymt-london-cast-recording/539452597	https://is4-ssl.mzstatic.com/image/thumb/Music/v4/c4/34/c0/c434c0db-7a8b-cc26-43f0-ffe2c70e55ee/Cover.jpg/1000x1000bb.jpeg
402	The Red Mill	Victor Herbert	Henry Blossom, Forman Brown	Two American vaudevillians find themselves stranded and penniless in a small Dutch village. Despite some comic misunderstandings, dramatic schemes, and romantic heartbreaks, everything works out in the end.The Red Mill opened on Broadway at the Knickerbocker Theatre on September 24, 1906. This Broadway revival of the operetta opened at the Ziegfeld Theatre on October 16, 1945, starring Michael O’Shea, Eddie Foy Jr., Juli Lynne Charlot, Eddie Dew, Charles Collins, Odette Myrtil and Hal Price.The show later transferred to the 46th Street Theatre and the Shubert Theatre, playing a total of 531 performances.	https://music.apple.com/us/album/the-red-mill-original-musical-recording-ep/687657547	https://is3-ssl.mzstatic.com/image/thumb/Music6/v4/7e/ff/a3/7effa3ee-cff0-fa0b-5613-18c5aff2e64d/888003033696.jpg/1000x1000bb.jpeg
403	The Rink	John Kander	Fred Ebb	This innovative musical is set in a sort of Coney Island of the mind, on the ragged fringe of the New York show-biz world. Anna Antonelli's roller rink is about to be demolished, and with it Anna's sour memories of her Lothario of a husband and her painfully shy daughter Angel. The rink becomes an arena in which mother and daughter examine their past, present and future. Liza Minnelli and Chita Rivera originated the roles of Angel and Anna on Broadway.The Rink was first presented on Broadway in February 1984 at the Martin Beck Theatre under the direction of AJ Antoon. It starred Liza Minnelli and Chita Rivera.	https://music.apple.com/us/album/the-rink-original-broadway-cast-remastered/185371622	https://is4-ssl.mzstatic.com/image/thumb/Music/e3/09/f1/mzi.kzbuwewp.tif/1000x1000bb.jpeg
404	The Roar of the Greasepaint --- The Smell of the Crowd	Leslie Bricusse and Anthony Newley	Leslie Bricusse and Anthony Newley	A rousing music-hall allegory, The Roar of the Greasepaint - The Smell of the Crowd explores British class structure through the antics of two comic figures: Sir, who has everything, and Cocky, who has nothing. The two clowns fiercely compete in a “Game of Life,” in which Sir holds every advantage. Cocky struggles to overcome the obstacles Sir lays in his path, and soon grows as judgmental and bellicose as Sir himself. In time, Cocky and Sir reconcile and develop a mutual, if cautious, understanding.The Roar of the Greasepaint - The Smell of the Crowd opened on Broadway at the Shubert Theatre on May 16, 1965, starring Anthony Newley, Cyril Ritchard, Sally Smith and Joyce Jillson. The production played for 231 performances.	https://music.apple.com/us/album/roar-greasepaint-smell-crowd-original-broadway-cast/254969848	https://is1-ssl.mzstatic.com/image/thumb/Music/d1/14/b3/mzi.xpslpzse.jpg/1000x1000bb.jpeg
405	The Rocky Horror Show	Richard O'Brien	Richard O'Brien	In this cult classic, sweethearts Brad and Janet, stuck with a flat tire during a storm, discover the eerie mansion of Dr. Frank-N-Furter. As their innocence is lost, Brad and Janet meet a houseful of wild characters, including a rocking biker and a creepy butler. Through elaborate dances and rock songs, Frank-N-Furter unveils his latest creation: a muscular man named "Rocky."	https://music.apple.com/us/album/the-rocky-horror-show-the-new-broadway-cast-recording/254751354	https://is4-ssl.mzstatic.com/image/thumb/Music/05/4c/41/mzi.xsuevqgh.jpg/1000x1000bb.jpg
406	The Scarlet Pimpernel	Frank Wildhorn	Nan Knighton	The Scarlet Pimpernel is a swashbuckling action/adventure musical, based on Baroness Orczy’s famous 20th-century novel about the French Revolution and the battle for Liberty, Equality and Fraternity.	https://music.apple.com/us/album/the-scarlet-pimpernel-original-broadway-cast-recording/322026450	https://is5-ssl.mzstatic.com/image/thumb/Music/65/5d/c7/mzi.iaxanroi.jpg/1000x1000bb.jpeg
407	The Scottsboro Boys	John Kander	John Kander	The thrilling, final collaboration by musical theatre greats, John Kander and Fred Ebb (The World Goes 'Round), The Scottsboro Boys has been hailed as one of the most visionary pieces ever to grace the Broadway stage. Nominated for twelve Tony Awards, The Scottsboro Boys confronts an infamous event in the history of the American criminal justice system. In 1931, nine black men were ripped from a train in Alabama and accused of rape by two white women. Hauled to jail without a shred of actual evidence against them, The Scottsboro Boys were rushed through trial procedures, found guilty and sentenced to death. What occurred in the years following the trials was a harrowing tale of bravery and strength in the face of great adversity. The Scottsboro Boys   is haunting and courageous, grappling with tough themes that still affect our society. Whether presented in an intimate setting or in a larger theater, this show will touch every audience member. With its brilliant stew of performance styles and piercing new songs, it is truly a triumph of the American Musical Theatre.	https://music.apple.com/us/album/scottsboro-boys-original-off-broadway-cast-music-from/399225920	https://is4-ssl.mzstatic.com/image/thumb/Music/dc/f7/05/mzi.qwpndlei.jpg/1000x1000bb.jpeg
408	The Secret Garden	Marsha Norman, Lucy Simon	Marsha Norman	This enchanting classic of children's literature is reimagined inbrilliant musical style by composer Lucy Simon and Marsha Norman, thePulitzer Prize-winning playwright of 'Night Mother. Orphaned inIndia, 11 year-old Mary Lennox returns to Yorkshire to live with herembittered, reclusive uncle Archibald and his invalid son Colin. Theestate's many wonders include a magic garden which beckons the childrenwith haunting melodies and the "Dreamers," spirits from Mary's past whoguide her through her new life, dramatizing The Secret Garden's compelling tale of forgiveness and renewal. Also Available - SCHOOL VERSION perfect for Young Performers!The Secret Garden opened at the St. James Theatre on April 25, 1991 after 23 previews. The show played for a total of 709 performances and closed on January 3, 1993.	https://music.apple.com/us/album/the-secret-garden-original-broadway-cast-recording/1366007565	https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/41/72/fc/4172fca5-7650-0037-9996-2f9230b8e182/886445010046.jpg/1000x1000bb.jpeg
409	The Secret Life of Walter Mitty	Leon Carr	Earl Shuman	Onhis fortieth birthday Walter Mitty reflects on his drab, ordinary life.Defeated in his quest for wealth and glory by family responsibilities, amortgage, and a routine job, he creates elaborate fantasies in which he is thehero. His secret world is so enticing that he often loses sight of the boundarybetween dream and reality and comically slips into his imagination. Anattractive would be chanteuse aptly named Willa de Wisp encourages Walter toleave his wife, shed the burdens of suburban living and really live the secretlife. Unfortunately it is as unattainable as it is appealing. At the end of theplay Walter discovers that he is happily committed to the real world, completewith its mortgages and responsibilities.The Secret Life of Walter Mitty was first presented at the Players Theatre, New York City on October 26, 1964.	https://music.apple.com/us/album/secret-life-walter-mitty-original-off-broadway-cast/417048631	https://is5-ssl.mzstatic.com/image/thumb/Music/97/6c/e7/mzi.iefbtekp.jpg/1000x1000bb.jpeg
410	The Sound of Music	Richard Rodgers	Oscar Hammerstein II	The final collaboration between Rodgers & Hammerstein was destined to become the world's most beloved musical. Featuring a trove of cherished songs, including "Climb Ev'ry Mountain," "My Favorite Things," "Do Re Mi," "Sixteeen Going on Seventeen" and the title number, The Sound of Music won the hearts of audiences worldwide, earning five Tony Awards and five Oscars. The inspirational story, based on the memoir of Maria Augusta Trapp, follows an ebullient postulate who serves as governess to the sevenchildren of the imperious Captain Von Trapp, bringing music and joy tothe household. But as the forces of Nazism take hold of Austria, Maria and the entire VonTrapp family must make a moral decision.	https://music.apple.com/us/album/the-sound-of-music-original-soundtrack-recording/258585763	https://is2-ssl.mzstatic.com/image/thumb/Features/6d/b8/1f/dj.ujpnpnvs.jpg/1000x1000bb.jpeg
411	The Spitfire Grill	James Valcq, Lee David Zlotoff, Fred Alley	James Valcq, Lee David Zlotoff, Fred Alley	A feisty parolee follows her dreams, based on a page from an old travelbook, to a small town in Wisconsin and finds a place for herself workingat Hannah's Spitfire Grill. The Grill is for sale, but there are notakers for the only eatery in the depressed town, so newcomer Percyconvinces Hannah to raffle it off. Entry fees are one hundred dollarsand the best essay on why you want the Grill wins. Soon, mail arrives bythe wheelbarrow and things really start cookin' at the Spitfire Grill.	https://music.apple.com/us/album/the-spitfire-grill/1501408159	https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/6f/7d/a7/6f7da732-95b4-e797-6381-4d748b6f80e0/194660884541.jpg/1000x1000bb.jpeg
412	The Story of My Life	Neil Bartram	Neil Bartram	Nominated for four 2009 Drama Desk Awards, including Outstanding Musical, The Story of My Life is a Broadway rarity: an intimate musical that candidly explores the simplicity of human need and the complexity of emotions under which it lies buried. Composer-lyricist Neil Bartram and librettist Brian Hill have created an authentic and affecting work, told through a series of songs – in turn playful, touching and dramatic. The Story of My Life inspires us to reconnect with those who were part of the earliest chapters of our own life stories. The Story of My Life follows the friendship of Alvin and Thomas, two men from a small town. These lifelong friends are reunited after Alvin's mysterious death. In the abstract world of his mind, Thomas struggles to write Alvin's eulogy while recounting the many turns that their lives have taken since meeting as children. Alvin searches through the manuscripts and stories in Thomas' mind to lead him on a journey of remembrance. Through music and song, these two friends recount their adventures, explore their past dissonance and ultimately discover what is at the base of every strong friendship... love. The Story of My Life features a unique cast of only two actors, which provides extremely specialized direction opportunities. This musical is perfect for an intimate space, whether it be a community theatre or a small college venue.	https://music.apple.com/us/album/the-story-of-my-life-original-broadway-cast-recording/644279802	https://is1-ssl.mzstatic.com/image/thumb/Music/v4/9b/b5/4b/9bb54b1f-c95d-2407-ea6c-9a7ea5c783ba/803607098124_cover.tif/1000x1000bb.jpeg
413	The Student Prince	Sigmund Romberg	Dorothy V. Donnelly	Karl Franz, prince of the kingdom of Karlsberg, has grown up sheltered and under tutors. Since childhood, he has been engaged to Princess Margaret. His grandfather, the king, sends him to improve his social skills as a regular student at the venerable University of Heidelberg. Karl and his entourage take up quarters at a local inn, and helped by new friends, Detlef, Lucas, and Von Asterberg, the prince soon starts enjoying student life. He also falls in love with Kathie, the innkeeper’s niece, and the couple considers eloping. But when Prince Karl learns that his grandfather is dying, he realizes that he must return to Karlsberg to become the new king, and to honor the arranged marriage which neither he nor the princess wants.The Student Prince opening on Broadway at Jolson’s 59th Street Theatre on December 2, 1924, starring Howard Marsh and Roberta Beatty. The show became the longest-running show of that decade, playing for 608 performances. It was revived twice on Broadway, in 1931 and in 1943, and at the New York City Opera in 1988.	https://music.apple.com/us/album/student-prince-original-studio-cast-first-complete/210459440	https://is1-ssl.mzstatic.com/image/thumb/Music/33/8f/c9/mzi.nefrafff.tif/1000x1000bb.jpeg
414	The Sweet Smell of Success	Marvin Hamlisch	Craig Carnelia	It’s New York, 1952. Welcome to Broadway, the glamour and power capital of the universe. J.J. Hunsecker rules it all with his daily gossip column in the New York Globe, syndicated to sixty million readers across America. J.J. has the goods on everyone, from the president to the latest starlet. And everyone feeds J.J. scandal, from J. Edgar Hoover and Senator Joe McCarthy down to a battalion of hungry press agents who attach their news to a client that J.J. might plug. When a young press agent, Sidney, tries to hitch his wagon to J.J. while keeping secrets about his client’s new relationship with J.J.’s sister, he learns that you can become no one if J.J. turns on you.Sweet Smell of Success was first presented on Broadway at the Martin Beck Theatre in March of 2002 under the direction of Nicholas Hytner. It starred John Lithgow.	https://music.apple.com/us/album/sweet-smell-of-success-original-broadway-cast-recording/212250927	https://is2-ssl.mzstatic.com/image/thumb/Features/26/94/46/dj.jqvfdbor.jpg/1000x1000bb.jpeg
415	The Tap Dance Kid	Charles Blackwell, Henry Krieger, Robert Lorick	Charles Blackwell, Henry Krieger, Robert Lorick	This long running Broadway musical also had a lengthy tour. It's a wonderful cornucopia of music, drama, comedy and above all, tap dancing. The story concerns a 10 year old Black kid named Willie who doesn't want to be a lawyer like his stern father; just has to dance , like his uncle, an aspiring Broadway choreographer who is very much Willie's mentor. And, dance he does!	https://music.apple.com/us/album/the-tap-dance-kid/1441812460	https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/b7/68/d9/b768d99b-2361-c36a-01b9-b8e6ff6a3ac9/605288204227.jpg/1000x1000bb.jpeg
416	The Theory of Relativity	Neil Bartram	Neil Bartram	From Drama Desk Award nominees Neil Bartram and Brian Hill (The Story of My Life), The Theory of Relativity is a joyous and moving look about our surprisingly interconnected lives.  Whether you're allergic to cats, in love for the first or tenth time, a child of divorce, a germaphobe or simply a unique individual, audience members and actors alike are sure to find themselves in this fresh new musical. Through a seemingly unrelated collection of songs, scenes and monologues, The Theory of Relativity introduces a compelling array of characters experiencing the joys and heartbreaks, the liaisons and losses, the inevitability and the wonder of human connection.	https://music.apple.com/us/album/the-theory-of-relativity-original-cast-recording/1117279859	https://is5-ssl.mzstatic.com/image/thumb/Music20/v4/7a/8c/c8/7a8cc883-a733-0c33-b8c5-821f4bdf61dd/803607163525_cover.jpg/1000x1000bb.jpeg
417	The Three Little Pigs	George Stiles	Anthony Drewe	From Stiles and Drewe, the award-winning musical team behind Honk! and Broadway's Mary Poppins, comes The Three Little Pigs, a "very curly musical tail" that is perfect for the whole family! This new version of the classic story is full of catchy songs, clever rhymes and silly charm, but also has some very smart things to say about home and family. When the pigpen starts to look like a real sty, Mama says it's time to leave and build something new. Help Cha, Siu and Bao watch for wolves while they use hay, sticks and bricks to make it in a big, bad world. Featuring a small cast, a short running time and minimal design requirements The Three Little Pigs is the perfect option for children's touring companies or theatres with strong educational components. The Three Little Pigs teaches little ones how success can be achieved through hard work and perseverance. Filled with humor, this endearing tale will leave you squealing with glee and howling with laughter!	https://music.apple.com/us/album/stiles-drewes-three-little-pigs-studio-cast-recording/1243932299	https://is3-ssl.mzstatic.com/image/thumb/Music127/v4/d3/b3/58/d3b3584c-18cf-9241-ff85-f352c4d0d050/859721299183_cover.jpg/1000x1000bb.jpeg
418	The Toxic Avenger	David Bryan	Joe DiPietro, David Bryan	Based on Lloyd Kaufman's cult film and winner of the Outer Critics Circle Award for Best Off-Broadway Musical, The Toxic Avenger is a charming love story and laugh-out-loud musical that has it all: an unlikely hero, his beautiful girlfriend, a corrupt New Jersey mayor and two guys who play... well, everyone else ... bullies, mobsters, old ladies and stiletto-wearing back up singers.  With book and lyrics by Joe DiPietro and music and lyrics by David Bryan, the show also features the most memorable and unbelievable duet you'll ever see on any stage. Melvin Ferd, the Third, wants to clean up Tromaville, the most polluted town in New Jersey (just off Exit 13B on the Turnpike). Foiled by the mayor's bullies, Melvin is dumped into a vat of radioactive toxic waste, only to reemerge as The Toxic Avenger, New Jersey's first superhero. Affectionately known as Toxie, our new hero is a seven-foot mutant freak with superhuman strength and a heart as big as Newark. He's out to save New Jersey, end global warming, and woo the blind librarian in town. It's a toxic love story with an environmental twist! The Toxic Avenger will leave audiences laughing in the aisles as it rocks the house. Featuring a wailin' rock score, this comical musical has something for everyone to enjoy.	https://music.apple.com/us/album/the-toxic-avenger-musical-music-from-the-musical/313224943	https://is5-ssl.mzstatic.com/image/thumb/Music/9c/47/c5/mzi.kmfxfwjk.jpg/1000x1000bb.jpg
419	The Unsinkable Molly Brown	Meredith Willson	Meredith Willson	Miners, brawls, pretty girls, love, romance, maritime disasters and Meredith Willson's music and lyrics – The Unsinkable Molly Brown is the rags-to-riches love story of Molly and Leadville Johnny Brown, owners of the richest mine in the U.S. at the turn of the twentieth century. A comedic, yet honest, commentary on the classes and the human spirit of the Colorado settlers, this grand musical is a tour de force with rousing and sentimental songs, as well as dances that are reminiscent of the times. This spirited tale of a legendary, real-life American original follows the exploits of Molly Brown, whose feisty determination to rise above her impoverished beginnings leads her from the backwoods of Hannibal, Missouri, to the palaces of Europe. Along the way, she marries a lucky prospector, enters the highest echelons of Monte Carlo society, survives the sinking of the Titanic and, most importantly, earns the approval that she so desperately seeks from those "Beautiful People of Denver." Funny, light, uplifting and uniquely American,  The Unsinkable Molly Brown charmed Broadway and film audiences with its irresistible, outrageous title role, in the tradition of such unforgettable characters as Auntie Mame, Dolly Levi and Mama Rose, as well as Meredith Willson's rousing score, in the tradition of his immortal The Music Man.	https://music.apple.com/us/album/the-unsinkable-molly-brown/715959141	https://is5-ssl.mzstatic.com/image/thumb/Music4/v4/53/26/b0/5326b0c0-1a28-345b-b92d-1a6025b5eb7a/00094639531653.jpg/1000x1000bb.jpeg
420	The View UpStairs	Max Vernon	Max Vernon	When Wes, a young fashion designer from 2017, buys an abandoned building in the French Quarter of New Orleans, he finds himself transported to the UpStairs Lounge, a vibrant seventies gay bar. As this forgotten community comes to life, Wes embarks on an exhilarating journey of self-exploration that spans two generations of queer history. This smash Off Broadway hit features a gritty, glam rock score and a tight-knit ensemble of unforgettable characters. The View UpStairs asks what has been gained and lost in the fight for equality, and how the past can help guide all of us through an uncertain future.	https://music.apple.com/us/album/the-view-upstairs-original-cast-recording/1266730437	https://is3-ssl.mzstatic.com/image/thumb/Music118/v4/2d/38/25/2d3825d4-179d-c7c3-97b5-eeff8179ffe8/859722112696_cover.jpg/1000x1000bb.jpeg
421	The Who's Tommy	Pete Townshend, John Entwistle	Pete Townshend, John Entwistle	Based on the iconic 1969 rock concept album, The Who's Tommy is an exhilarating story of hope, healing and the human spirit. The story of the pinball-playing, deaf, dumb and blind boy who triumphs over his adversities has inspired, amazed and puzzled audiences for more than 40 years. This five-time Tony Award-winning musical was translated to the stage by theatrical wizard, Des McAnuff, into a high-energy, one-of-a-kind theatrical event. After witnessing the accidental murder of his mother's lover by his father, Tommy is traumatized into catatonia and, as the boy grows, he suffers abuse at the hands of his sadistic relatives and neighbors. As an adolescent, he's discovered to have an uncanny knack for playing pinball and, when his mother finally breaks through his catatonia, he becomes an international pinball superstar. The Who's Tommy features an exhilarating score that is timeless in its youthful appeal, giving the show a cross-generational appeal that has made it a smash-hit in high schools and colleges around the world. A small rock band orchestration allows you to capture the excitement of the New York production on a modest budget.	https://music.apple.com/us/album/the-whos-tommy-original-cast-recording/269404986	https://is5-ssl.mzstatic.com/image/thumb/Features/af/f8/92/dj.xldjrtim.jpg/1000x1000bb.jpeg
422	The Wild Party	Michael John LaChiusa	Michael John LaChiusa	Manhattan decadence in the 1920's provides the backdrop for this tough musical fable. Queenie, a vaudeville chorine, hosts the blow-out of the title with her vicious lover, a black-face minstrel. The guests are a vivid collection of the unruly and the undone: Queenie's conniving rival; a cocaine-sniffing bisexual playboy; a washed-up boxer; a black brother act; a diva of indeterminate age and infinite life experience; the fresh-off-the-farm ingénue whose naïveté quickly evaporates; a lesbian actress and her comatose girlfriend; and the bargain basement Valentino who catches Queenie's roving eye. The jazz and gin soaked party rages to a mounting sense of threat as artifice and illusion are stripped away. When midnight debauchery leads to tragedy at dawn, the high-flying characters land with a sobering thud, reminding us that no party lasts forever.	https://music.apple.com/us/album/the-wild-party-2000-original-broadway-cast-recording/1452564497	https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/6f/8c/72/6f8c729b-21d1-680c-f8a0-b1c64d8c2caf/00601215900323.rgb.jpg/1000x1000bb.jpeg
423	The Wild Party	Andrew Lippa	Andrew Lippa	A steamy prohibition tale, steamrolling and roaring its way across the stage, Andrew Lippa's Wild Party was an Off-Broadway gem that garnered an array of industry accolades, including Drama Desk, Outer Critics Circle and Obie awards. Based on Joseph Moncure March's 1928 narrative poem of the same name, this darkly brilliant show features one of the most exciting, pulse-racing scores ever written. Lovers Queenie and Burrs decide to throw the party-to-end-all-parties in their Manhattan apartment. After the colorful arrival of a slew of guests living life on the edge, Queenie's wandering eyes land on a striking man named Black. As the decadence is reaching a climax, so is Burrs' jealousy, which erupts and sends him into a violent rage. Gun in hand and inhibitions abandoned, Burrs turns on Queenie and Black. The gun gets fired, but who's been shot? Andrew Lippa's Wild Party is a favorite of universities and theatre companies that like to push the envelope. Creative potential leaps from its pages. If staged in an intimate space, the audience might feel as if they're party guests, themselves!	https://music.apple.com/us/album/the-wild-party-original-off-broadway-cast-recording/253676482	https://is1-ssl.mzstatic.com/image/thumb/Music/91/14/58/mzi.wkztkygr.jpg/1000x1000bb.jpeg
424	The Will Rogers Follies	Cy Coleman	Betty Comden & Adolph Green	The Will Rogers Follies opened on Broadway at the Palace Theatre on May 1, 1991, starring Keith Carradine, Cady Huffman, Dee Hoty and Dick Latessa. The production, under the direction of Tommy Tune, ran for 981 performances.	https://music.apple.com/us/album/the-will-rogers-follies-original-broadway-cast-recording/171490243	https://is4-ssl.mzstatic.com/image/thumb/Music/0a/38/44/mzi.apptbntn.jpg/1000x1000bb.jpeg
425	The Wiz	William F. Brown, Charlie Smalls	William F. Brown, Charlie Smalls	A beloved Broadway gem, The Wiz infuses L. Frank Baum’s The Wonderful Wizard of Oz with a dazzling mix of rock, gospel, and soul music. 	https://music.apple.com/us/album/the-wiz-original-soundtrack/1452848487	https://is5-ssl.mzstatic.com/image/thumb/Music114/v4/ef/22/0b/ef220bc7-88dd-7c9b-e193-1b01cbce9551/00008811164928.rgb.jpg/1000x1000bb.jpg
426	The Woman in White	Andrew Lloyd Webber	David Zippel	Walter Hartright’s life is changed forever after a chance encounter with a mysterious woman, dressed in white, desperate to reveal her chilling secret. When he takes up his position as drawing master to the beautiful Laura Fairlie and her half-sister, Marion, he sees in Laura’s face an eerie reflection of the forlorn creature he met previously.\r\nWalter and Laura’s feelings for each other are thwarted by her engagement to the sinister Sir Percival Glyde. What is the connection between Laura, Sir Percival and the woman in white? Is Sir Percival’s friend Count Fosco, with his unusual taste for white mice and poison, really as charming and well-meaning as he seems? Can true love prevail?	https://music.apple.com/us/album/the-woman-in-white/1485439698	https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/0f/5f/48/0f5f488c-36f5-0300-c8bc-7c3448da658b/19UMGIM94393.rgb.jpg/1000x1000bb.jpeg
427	The World Goes 'Round	John Kander	Fred Ebb	Enter the world of distinguished and celebrated writing team, Kander and Ebb. The World Goes 'Round is a stunning revue of the songbook from the multi-Tony award-winning team, with the original production winning three Drama Desk Awards. Filled with humor, romance, drama and nonstop melody, this title is a thrilling celebration of life and the fighting spirit that keeps us all going. Five individuals find themselves careening through the world of love, babies and coffee. From Cabaret to Chicago, the nonstop hit-parade features unforgettable gems, including "Mr. Cellophane," "Maybe This Time," "Cabaret" and "New York, New York," seamlessly interwoven into a passionate, harmonious, up-tempo evening of musical theatre. The World Goes 'Round is brought to life by a small, multi-talented cast, making it a wonderful addition to a season on a limited budget. With minimal set requirements, but infinite possibilities, this musical is sure to delight directors and designers alike. The musical arrangements and witty libretto will undoubtedly enthrall audiences and send them home humming a tune or two.	https://music.apple.com/us/album/and-the-world-goes-round-original-cast-recording/306670221	https://is1-ssl.mzstatic.com/image/thumb/Music/0d/5f/7b/mzi.fsdrcvwz.jpg/1000x1000bb.jpeg
428	They're Playing Our Song	Marvin Hamlisch	Carole Bayer Sager	A funny, romantic show about an established composer and his relationship with an aspiring young female lyricist, not unlike Carole Bayer Sager. Professionally, their relationship works beautifully - but ultimately leads to conflict on the home front. Of course, there's a happy ending.	https://music.apple.com/us/album/theyre-playing-our-song-the-original-cast-recording/1452257820	https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/72/a5/19/72a519ad-2515-695b-1612-6ba14c8f8bdc/00042282624024.rgb.jpg/1000x1000bb.jpeg
429	Things To Ruin	Joe Iconis, John Simpkins	Joe Iconis, John Simpkins	Things to Ruin is an incendiary collection of song by Kleban and Larson Award Winner Joe Iconis.	https://music.apple.com/us/album/things-to-ruin-songs-joe-iconis-original-cast-recording/1303837306	https://is1-ssl.mzstatic.com/image/thumb/Music118/v4/41/6f/cd/416fcd81-e037-da27-2ed2-1063060dcdb9/791558444537.jpg/1000x1000bb.jpeg
445	Victor/Victoria	Henry Mancini, Frank Wildhorn	Leslie Bricusse	In jazz-age Paris, singer Victoria Grant struggles to make ends meet. With some help from her flamboyant friend Toddy, Victoria ultimately achieves stardom by masquerading as a man, "Count Victor Grazinski," who performs as a female impersonator. When macho businessman King Marchan develops feelings for "Victor" and Victoria reciprocates, comic hijinks ensue. Musical numbers include "Le Jazz Hot," "You and Me," "Almost a Love Song," "Trust Me," "Living in the Shadows," "Paris By Night" and "Crazy World. Victor/Victoria opened on Broadway at the Marquis Theatre on October 3, 1995, starring Julie Andrews, Michael Nouri and Tony Roberts. The show played for 734 performances, with Liza Minelli and Raquel Welch later assuming the title role.	https://music.apple.com/us/album/victor-victoria-original-motion-picture-soundtrack/1455904620	https://is4-ssl.mzstatic.com/image/thumb/Music123/v4/00/6c/57/006c5781-fec0-d287-59e6-28aa7036e9ce/794043187988.jpg/1000x1000bb.jpeg
430	Thoroughly Modern Millie	Jeanine Tesori	Dick Scanlan	The winner of six Tony Awards, including Best Musical, Thoroughly Modern Millie was the 2002 season's most awarded new show on Broadway! Based on the 1967 Academy Award-winning film, Thoroughly Modern Millie takes you back to the height of the Jazz Age in New York City, when "moderns," including a flapper named Millie Dillmount, were bobbing their hair, raising their hemlines, entering the workforce and rewriting the rules of love. This high-spirited musical romp is a delightful valentine to the long-standing spirit of New York City and the people who seek to discover themselves there. Set in New York City in 1922, Thoroughly Modern Millie tells the story of young Millie Dillmount from Kansas, who comes to New York in search of a new life for herself. Her grand plan is to find a job as a secretary for a wealthy man and then marry him. However, her plan goes completely awry. The owner of her dingy hotel kidnaps young girls to sell to the Far East, her wealthy boss is slow in proposing marriage and the man she actually falls in love with doesn't have a dime to his name... or so he tells her. Filled with frisky flappers, dashing leading men and a dragon lady of a villainess that audiences will love to hate, Thoroughly Modern Millie is a perfectly constructed evening of madcap merriment. From explosive tap numbers to a "Fred and Ginger" routine on a window ledge, this is the perfect show for theatres that are looking to show off the dance skills of their performers. In Millie Dillmount, musical theatre has found a new heroine for the ages in  Thoroughly Modern Millie! An insightful and in depth podcast with Jeanine Tesori and Dick Scanlan on the portrayal of characters in Thoroughly Modern Millie. Character portrayal in Thoroughly Modern Millie	https://music.apple.com/us/album/thoroughly-modern-millie-original-broadway-cast-recording/259881726	https://is1-ssl.mzstatic.com/image/thumb/Music/59/77/b2/mzi.vnpreqyt.jpg/1000x1000bb.jpeg
431	Three Guys Naked from the Waist Down	Michael Rupert	Jerry Colker	The three guys are stand up comics. Wild and crazy and very very hip, their unique blend of intellectual and slap stick humor propels them from unpaid neophyte performers to the Johnny Carson Show, instant stardom, and their own television show. Then, commercial success evaporates the magic.	https://music.apple.com/us/album/three-guys-naked-from-waist-down-original-off-broadway/201953604	https://is3-ssl.mzstatic.com/image/thumb/Music/07/88/6d/mzi.ihukxlcm.tif/1000x1000bb.jpeg
432	Three Wishes for Jamie	Ralph Blane	Ralph Blane	Starring John Raitt on Broadway, Jamie McRuin is offered three wishes and his wise choices—travel, a dream girl to marry and a son who will speak the old Gaelic tongue—offer some charming surprises.Three wishes for Jamie opened March 21, 1952 at the Mark Hellinger Theatre, after playing out-of-town tryouts in Los Angeles and San Francisco in the summer of 1951, closing temporarily, then reopening in a revised form for out-of-town tryouts in early 1952 in New Haven, Philadelphia, and Boston. It closed on June 7, 1952, after a run of 91 performances.	https://music.apple.com/us/album/three-wishes-for-jamie-original-broadway-cast/716444391	https://is2-ssl.mzstatic.com/image/thumb/Music4/v4/9c/b9/09/9cb909ae-d6be-65c5-4888-65e460f39b17/05099923763951.jpg/1000x1000bb.jpeg
433	Tick, Tick... Boom!	Jonathan Larson	Jonathan Larson	Before Rent, there was Tick, Tick... Boom!. This autobiographical musical by Jonathan Larson, the Pulitzer Prize- and Tony Award-winning composer of Rent, is the story of a composer and the sacrifices that he made to achieve his big break in theatre. Containing fourteen songs, ten characters, three actors and a band, Tick, Tick... Boom! takes you on the playwright/composer's journey that led to a Broadway blockbuster. His girlfriend wants to get married and move out of the city, his best friend is making big bucks on Madison Avenue and, yet, Jon is still waiting on tables and trying to write the great American musical. Set in 1990, this compelling story of personal discovery is presented as a rock musical filled with instantly appealing melodies and a unique blend of musical theatre styles.	https://music.apple.com/us/album/tick-tick-boom/298680038	https://is5-ssl.mzstatic.com/image/thumb/Music/58/44/9c/mzi.mpivgxac.jpg/1000x1000bb.jpeg
434	Tintypes	Various	Various	Tintypes is a tune-filled panorama; a musical melting pot; the Great American Songbook come to life. It offers snapshots – tintypes, if you will – ­of America in its last Age of Innocence. This Tony-nominated, nostalgic musical revue takes us back to turn-of-the-century America and is a brew of popular songs from 1890 to 1917. The story of these changing times blazes to life in a tuneful, high-spirited brew of popular songs from 1890 to 1917, performed by five archetypes of the period: Anna Held, the beautiful music hall star; Emma Goldman, the notorious socialist; a black, female domestic worker; a Chaplin-esque Russian immigrant; and the outrageous Teddy Roosevelt, the youngest man ever to be elected President of the United States. Despite its small cast, orchestra and unit set, Tintypes is an epic work about the end of an era. Filled with memorable songs of the era and both hilarious and moving storytelling, this is a perfect choice for theatres that are looking to educate, as well as entertain.	https://music.apple.com/us/album/tintypes/55037590	https://is5-ssl.mzstatic.com/image/thumb/Music/y2005/m03/d31/h04/s05.jdnfemrj.jpg/1000x1000bb.jpeg
435	Titanic	Maury Yeston	Maury Yeston	Titanic opened on Broadway at the Lunt-Fontanne Theatre on March 29, 1997, and played for 804 performances.	https://music.apple.com/us/album/titanic-a-new-musical-original-broadway-cast-recording/260650222	https://is1-ssl.mzstatic.com/image/thumb/Features/bd/8a/02/dj.zlseapyo.jpg/1000x1000bb.jpeg
436	Tootsie	David Yazbek	David Yazbek	Tootsie is the New York Times Critic's Pick that has audiences rolling in the aisles in what is being hailed as "Broadway's funniest new musical!" (The New York Post). With music and lyrics by Tony Award-winning David Yazbek (The Band's Visit, Dirty Rotten Scoundrels) and a laugh-out-loud book by Robert Horn (13 the Musical), it comes as no surprise that Tootsie won Best Book of a Musical and received a staggering 11 Tony Award Nominations, including Best Musical and Best Score. Michael Dorsey is a skilled actor with a talent for not keeping a job. Desperate and out-of-work, Michael makes a last-ditch effort at making his dreams come true...by disguising himself as actress Dorothy Michaels. In a meteoric rise to Broadway stardom, Dorothy soon has audiences falling at her feet while Michael (disguised as Dorothy) is falling for his co-star, Julie. It isn't long before Michael realizes that maintaining his greatest acting success is going to be much harder than he expected. "This sassy riot is the kind of big, brash Broadway musical that gives audiences what they paid for." - Hollywood Reporter	https://music.apple.com/us/album/tootsie-original-broadway-cast-recording/1465291429	https://is2-ssl.mzstatic.com/image/thumb/Music123/v4/53/12/d6/5312d6d1-f854-6473-4d1b-987eebca2fc3/19UMGIM46283.rgb.jpg/1000x1000bb.jpeg
437	Top Banana	Johnny Mercer	Johnny Mercer	Top Banana is the zany and uproarious story of variety-show host Jerry Biffle, the ratings-obsessed star of the Blendo Soap Program. While courting the department-store model Sally Peters, Jerry introduces her to Cliff Lane, a singer on his show. Cliff and Sally fall in love and plan to get married, but Jerry is oblivious to their romantic involvement.Top Banana opened on Broadway at the Winter Garden Theatre on November 1, 1951, starring Phil Silvers as Jerry Biffle. The show played for 350 performances. In 1954, a film adaptation of the show featured several cast members from the Broadway production.	https://music.apple.com/us/album/top-banana-original-broadway-cast/716146945	https://is1-ssl.mzstatic.com/image/thumb/Music6/v4/cb/2e/11/cb2e11a5-c133-ae9c-86de-5e81c118ae44/05099923764453.jpg/1000x1000bb.jpeg
438	Triumph of Love	Jeffrey Stock	Susan Birkenhead	An anachronistic adaptation of the classic Marivaux comedy of the same name, Triumph of Love is full of delicious deception, gender confusions and all the complexities of l'amour, revealing the beauty, absurdities and bittersweet nature of love. Along with their hilarious "henchmen," Princess Leonide and the handsome Agis become lost on the messy path to love. One of them loves the other. The other is planning to kill her but unknowingly falls in love with her when she claims to be an on-the-run bride. This, after Agis discovers that she is not a male student, as her original disguise suggested – a disguise that proved convincing enough for another woman to fall in with her. All of this fun, and we've not yet made it to intermission! The riotous romp only gains momentum, as multiple stories of swift infatuation come to a head for our cast of characters. This charming chamber musical is a perfect showcase for actors with toned comedic chops. Thanks to the minimal set and costume demands, Triumph of Love fits flawlessly into any space or on any budget. Audiences everywhere will be engrossed with the sexy repartee, comical buffoonery and unexpected tenderheartedness	https://music.apple.com/us/album/triumph-of-love-soundtrack-from-the-broadway-show/187523244	https://is2-ssl.mzstatic.com/image/thumb/Music/87/a8/9d/mzi.sxktlzfj.tif/1000x1000bb.jpeg
439	Tuck Everlasting	Claudia Shear, Chris Miller, Nathan Tysen, Tim Federle	Claudia Shear, Chris Miller, Nathan Tysen, Tim Federle	Eleven-year-old Winnie Foster yearns for a life of adventure beyond her white picket fence, but not until she becomes unexpectedly entwined with the Tuck Family does she get more than she could have imagined. When Winnie learns of the magic behind the Tuck’s unending youth, she must fight to protect their secret from those who would do anything for a chance at eternal life. As her adventure unfolds, Winnie faces an extraordinary choice: return to her life, or continue with the Tucks on their infinite journey.	https://music.apple.com/us/album/tuck-everlasting-original-broadway-cast-recording/1117418355	https://is3-ssl.mzstatic.com/image/thumb/Music18/v4/91/2c/5e/912c5e42-97ad-9173-19a5-bd2170674594/093624918998.jpg/1000x1000bb.jpeg
440	Twelfth Night (Taub)	Shaina Taub	Shaina Taub	Named one of the best theatrical productions of 2018 by Time, The Hollywood Reporter and The Washington Post, Twelfth Night is a rousing contemporary musical adaptation of Shakespeare’s classic romantic comedy about mistaken identity and self-discovery.Twelfth Night tells the story of Viola, a young heroine who washes up on the shores of Illyria, disguises herself as a man, is sent to court a countess and falls hard for a Duke. As she navigates this strange and wonderful new land, she finds her true self and true love in the process.Featuring an original jazz-funk score by Shaina Taub, with a flexible-sized cast and running 90 minutes long, Twelfth Night is appropriate for all audiences and groups.	https://music.apple.com/us/album/twelfth-night-original-public-works-cast-recording/1436659916	https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/5a/2b/40/5a2b4090-1357-baf9-b5fd-473a83abc619/00888072078987.rgb.jpg/1000x1000bb.jpeg
441	Two Gentlemen of Verona	Galt MacDermot	John Guare	Based on William Shakespeare’s comedy of the same name, Two Gentlemen of Verona tells the story of lifelong friends Proteus and Valentine, who leave their rural hometown to experience life in urban Milan. Valentine falls in love with Sylvia, whose father has betrothed her against her will to the wealthy but undesirable Thurio, and plots to win her hand. Disregarding his loyalty to Valentine and his hometown sweetheart, Julia, Proteus also sets his sights on Sylvia. He plans to expose his friend's intentions to her father, have Valentine banished from Milan, and claim her for himself.Two Gentlemen of Verona opened on Broadway at the St. James Theatre, December 1, 1971 and played for 614 performances starring Raul Julia, Clifton Davis, Jonelle Allen and Diana Davila.	https://music.apple.com/us/album/two-gentlemen-verona-1971-original-broadway-cast-recording/1452357640	https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/69/c4/42/69c442da-43af-9581-965f-8cf6baf263b0/00044001756528.rgb.jpg/1000x1000bb.jpeg
442	Unexpected Joy	Janet Hood	Bill Russell	In modern-day Cape Cod, Joy, a baby boomer and proud hippie, is holding a memorial concert for the other half of her popular musical duo, Jump & Joy. When her tightly wound, conservative daughter and her sweet, rebellious granddaughter arrive from Oklahoma, sparks fly as one family seeks to find the common ground in their different values, dreams, and goals. A heartfelt and hilarious story that celebrates diversity and acceptance, Unexpected Joy weaves folk-rock, pop, and blues in bringing together a family that hasn’t experienced true joy in decades.	https://music.apple.com/us/album/unexpected-joy-original-off-broadway-cast-recording/1433888119	https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/ec/68/0b/ec680b52-0b72-234e-7562-0c2bdb8d27b4/Unexpected_Cover_Scan.jpg/1000x1000bb.jpeg
443	Urinetown	Mark Hollmann	Mark Hollmann	Winner of three Tony Awards, three Outer Critics Circle Awards, two Lucille Lortel Awards and two Obie Awards, Urinetown is an hilarious musical satire of the legal system, capitalism, social irresponsibility, populism, bureaucracy, corporate mismanagement, municipal politics and musical theatre itself! Hilariously funny and touchingly honest, Urinetown provides a fresh perspective on one of America's greatest art forms. In a Gotham-like city, a terrible water shortage, caused by a 20-year drought, has led to a government-enforced ban on private toilets. The citizens must use public amenities, regulated by a single malevolent company that profits by charging admission for one of humanity's most basic needs. Amid the people, a hero decides that he's had enough and plans a revolution to lead them all to freedom! Inspired by the works of Bertolt Brecht and Kurt Weill, Urinetown is an irreverently humorous satire in which no one is safe from scrutiny. Praised for reinvigorating the very notion of what a musical could be, Urinetown catapults the "comedic romp" into the new millennium with its outrageous perspective, wickedly modern wit and sustained ability to produce gales of unbridled laughter.	https://music.apple.com/us/album/urinetown-the-musical/298680046	https://is3-ssl.mzstatic.com/image/thumb/Music/5f/19/dd/mzi.roleidhe.jpg/1000x1000bb.jpeg
444	Vanities: The Musical	David Kirshenbaum	David Kirshenbaum	Vanities: The Musical chronicles the life-affirming journey of three vivacious Texas teens from cheerleaders to sorority sisters to housewives to liberated women and beyond. This musical captures a snapshot-sharp portrait of the lives, loves, disappointments, and dreams of these young women growing up during the turbulent sixties and seventies and reconnecting in the late 1980s.	https://music.apple.com/us/album/vanities-a-new-musical-original-cast-recording/1303643327	https://is2-ssl.mzstatic.com/image/thumb/Music118/v4/48/2b/d9/482bd9de-8606-cc5a-7e67-2cf2a4e84c8e/791558993738.jpg/1000x1000bb.jpeg
446	Violet	Jeanine Tesori	Brian Crawley	Winner of the Drama Critics' Circle Award and Lucille Lortel Award for Best Musical when it premiered Off-Broadway in 1997, and then on to a Tony-nominated Broadway debut in 2014 with a revised version, Violet is a moving musical featuring show-stopping anthems, ranging from American-roots to folk to gospel.  With a score from Tony-winning composer Jeanine Tesori (Caroline, or Change; Thoroughly Modern Millie; Shrek; Fun Home) and book and lyrics by the acclaimed Brian Crawley (A Little Princess), Violet is inspired by the short story, The Ugliest Pilgrim by Doris Betts, astounding critics and audiences alike in two separate decades. As a girl, Violet was struck by a wayward axe blade when her father was chopping wood, leaving her with a visible scar across her face. With enough money finally saved she's traveling across the Deep South in 1964 towards a miracle – the healing touch of a TV evangelist who will make her beautiful. Although she may not succeed in having the scar on her face healed, Violet is able to repair those scars that are lying deeper than her skin. On the way, she meets a young, African-American soldier whose love for her reaches far past her physical "imperfections." Violet is a powerhouse piece of theatre that needs no more than a few chairs and talented performers to take an audience's breath away. It is a must for companies that are dedicated to depicting moving stories onstage.	https://music.apple.com/us/album/violet-original-broadway-cast-recording/873243147	https://is3-ssl.mzstatic.com/image/thumb/Music4/v4/4a/d0/ae/4ad0aec3-3857-9fc7-99e2-30bcca3371dc/1176626.tif/1000x1000bb.jpeg
447	Waitress	Sara Bareilles	Sara Bareilles	Brought to life on Broadway by a groundbreaking all-female creative team, Waitress features original music and lyrics by six-time Grammy nominee Sara Bareilles ("Brave," "Love Song"), and a book by acclaimed screenwriter Jessie Nelson. Nominated for four Tony Awards (including Best Musical), and cherished by audiences and critics alike, Waitress is inspired by Adrienne Shelly's beloved film and offers a special recipe for finding happiness in unexpected places. Jenna, a waitress and expert pie maker, is stuck in a small town and a loveless marriage. Faced with an unexpected pregnancy, Jenna fears she may have to abandon the dream of opening her own pie shop…until a baking contest in a nearby county and the town's handsome new doctor offer her a tempting recipe for happiness. Supported by her quirky crew of fellow waitresses and loyal customers, Jenna summons the secret ingredient she's been missing all along — courage. "A delicious tale that's not simply about getting Prince Charming, but getting its heroine to take action and discover her worth!" — Variety	https://music.apple.com/us/album/waitress-original-broadway-cast-recording/1117418120	https://is5-ssl.mzstatic.com/image/thumb/Music30/v4/58/52/bf/5852bf93-c9ff-6e7e-029f-0c245584ec8c/093624920106.jpg/1000x1000bb.jpeg
448	War Paint	Doug Wright, Michael Korie, Scott Frankel	Doug Wright, Michael Korie, Scott Frankel	Helena Rubinstein and Elizabeth Arden defined beauty standards for the first half of the twentieth century. Brilliant innovators with humble roots, both were masters of self-invention who sacrificed everything to become the country’s first major female entrepreneurs. They were also fierce competitors whose fifty-year tug-of-war would give birth to an industry. From Fifth Avenue society to the halls of Congress, their rivalry was relentless and legendary – pushing both women to build international empires in a world dominated by men.	https://music.apple.com/us/album/war-paint-original-broadway-cast-recording/1235156376	https://is3-ssl.mzstatic.com/image/thumb/Music122/v4/cf/26/29/cf262974-c498-ce80-c8b2-4c4e55c5e0fa/791558451535.jpg/1000x1000bb.jpeg
449	We Aren't Kids Anymore	Drew Gasparini	Drew Gasparini	We Aren't Kids Anymore explores the collision of artistic expression and the realities of growing up. How do we hold on to our childhood dreams and ideals as adult disillusionment sets in? How do we sustain life as artists without settling for others’ definitions of success? And how do we recover when we lose those battles?  This new theatrical song cycle was born of Drew Gasparini’s journey forging a creative path and navigating the world at large, and his desire to offer empathy and hope to everyone doing the same.	https://music.apple.com/us/album/we-arent-kids-anymore-studio-cast-recording/1505652745	https://is4-ssl.mzstatic.com/image/thumb/Music113/v4/dd/d6/95/ddd69512-0dfd-1044-3456-5bfffdd559bc/20CRGIM21493.rgb.jpg/1000x1000bb.jpeg
450	Weird Romance	Alan Menken	David Spencer	This off-beat musical by the composer of Little Shop of Horrors and the Disney films Aladdin, Beauty and the Beast, and The Little Mermaid is two one-act musicals of speculative fiction. The first, The Girl Who Was Plugged In, is about a homeless bag-lady whose soul is transplanted into the body of a gorgeous female android by a company which manufactures celebrities. The second, Her Pilgrim Soul, is about a scientist who researches holographic imaging. One day a mysterious "living" holograph, apparently a woman long dead, appears and changes his life forever.	https://music.apple.com/us/album/weird-romance-original-off-broadway-cast-recording/403757623	https://is5-ssl.mzstatic.com/image/thumb/Music/45/48/ab/mzi.hoelfmkz.jpg/1000x1000bb.jpeg
451	West Side Story	Leonard Bernstein	Stephen Sondheim	From the first notes to the final breath, West Side Story is one of the most memorable musicals and greatest love stories of all time. Arthur Laurents' book remains as powerful, poignant and timely as ever. The score by Leonard Bernstein and lyrics by Stephen Sondheim are widely regarded as among the best ever written. The world's greatest love story takes to the streets in this landmark Broadway musical that is one of the theatre's finest accomplishments. Shakespeare's Romeo and Juliet is transported to modern-day New York City as two young, idealistic lovers find themselves caught between warring street gangs, the "American" Jets and the Puerto Rican Sharks. Their struggle to survive in a world of hate, violence and prejudice is one of the most innovative, heart-wrenching and relevant musical dramas of our time. Highlighting the talents of a young ensemble cast, West Side Story has found popularity in schools as well as professional theatres throughout the world. Its exciting, sophisticated score by Leonard Bernstein is often considered Broadway's finest, its songs a part of the nation's musical heritage. As originally staged by the legendary Jerome Robbins, the show is an impressive showcase for accomplished dancers (a guide featuring the original choreography is available for rental). And, with a reduced orchestration and transpositions on demand, this masterpiece is easier to mount than ever before!	https://music.apple.com/us/album/west-side-story-new-broadway-cast-recording-2009/316530985	https://is2-ssl.mzstatic.com/image/thumb/Features/v4/b9/c5/2a/b9c52ab2-5343-97d5-4bb9-f6679b6c0f01/V4HttpAssetRepositoryClient-ticket.ldmsizdb.jpg-7201712960429847873.jpg/1000x1000bb.jpeg
452	What about Luv?	Howard Marren	Susan Birkenhead	Fetching melodies, razor-sharp lyrics and zinging one-liners are the order of the day in this brilliant adaptation of the hilarious tongue-in-cheek comedy about love, What about Luv? From Susan Birkenhead, the Tony-nominated writer behind Jelly's Last Jam and Triumph of Love, and based on the hit play by Murray Schisgal, comes this non-stop laugh-riot that will keep you guessing until the very end. It all takes place on the Brooklyn Bridge. Harry, despondent and depressed, is about to end it all by jumping, but his old school buddy, Milt (who also happens to be at the bridge that night – to kill his wife, Ellen) coaxes him off of the ledge. When neurotic Harry and brainy Ellen fall in love, allowing Milt to run off with the girl from the office, it looks like everything will turn out rosy. But one year later, Ellen no longer loves Harry, Milt wants his wife back, and – together – they plot Harry's demise on the same bridge where they'd saved his life. One thing leads to several others, and a very damp fur coat, neuroses, intrigue, passion, jealousy and a used paper bag all add up to one of the most hilarious small musicals ever written! What about Luv? features a small band, a unit set and great comic roles, making it an excellent choice for theatres that are looking to have a huge success with a smaller show.	https://music.apple.com/us/album/what-about-luv-original-premiere-cast/1509020282	https://is2-ssl.mzstatic.com/image/thumb/Music123/v4/77/0e/d1/770ed18d-7694-c6e2-1081-ffe63e93558f/605288209727.jpg/1000x1000bb.jpeg
453	What Makes Sammy Run?	Ervin Drake	Ervin Drake	What Makes Sammy Run? is based on Budd Schulberg’s novel about Sammy Glick, a kid from New York’s Lower East Side, who is determined to escape the ghetto there and seek opportunity and success in Hollywood, even if it requires deception and betrayal.What Makes Sammy Run? opened on Broadway at the 54th Street Theatre on February 27, 1964, starring Steve Lawrence, Robert Alda and Sally Ann Howes. The show ran for 540 performances.	https://music.apple.com/us/album/what-makes-sammy-run-original-broadway-cast-recording/396207428	https://is2-ssl.mzstatic.com/image/thumb/Music/4c/f8/71/mzi.ujezllyo.jpg/1000x1000bb.jpeg
454	Where's Charley?	Frank Loesser	Frank Loesser	What do you get when two musical theatre masters, Frank Loesser and George Abbott, adapt one of the most successful farces of all time? Where's Charley?, a tuneful comedy classic that earned lead actor Ray Bolger (of Wizard of Oz fame) a Tony Award and launched Loesser's career (Guys and Dolls)! George Abbot's book preserves all of the laughs from the record-breaking play, Charlie's Aunt, upon which the show is based. Oxford University students Charley and Jack invite the young and winsome Kitty and Amy to lunch under the chaperoning eye of Donna Lucia, Charley's wealthy aunt (it is, after all, 1892). But when Donna Lucia doesn't show, a desperate Charley disguises himself as his aunt so that the young ladies can visit. Charley is unaware that they've brought a chaperone of their own: Amy's stuffy uncle, who promptly falls for Charley's aunt-like charms! When the real aunt shows up, it's all downhill from there: quick changes, fast-talking, marriage proposals, compromising situations and rowdy hilarity. Where's Charley? offers a star turn for a talented leading man amongst a medium-sized cast. Featuring Loesser's critically acclaimed, but fairly obscure, score, Where's Charley? is a chance to introduce audiences to a classic Golden Age musical that they'll love, but that they probably haven't already heard, while keeping the interest of die-hard fans.	https://music.apple.com/us/album/wheres-charley/691971194	https://is4-ssl.mzstatic.com/image/thumb/Music4/v4/af/e8/5b/afe85b44-245a-9c63-0765-a9b09c05fa57/724356507159.jpg/1000x1000bb.jpeg
455	Whistle Down The Wind	Andrew Lloyd Webber	Jim Steinman	Swallow, a 15-year-old girl growing up in America’s deep South in the fifties, discovers a mysterious man hiding out in a barn. When she asks who he is and the first words he utters are “Jesus Christ,” it’s as if all her prayers have been answered.\r\nSwallow and the town’s other children vow to protect the stranger from the world that waits outside—the townspeople who are determined to catch a fugitive hiding in their midst. As fantasy and reality collide, Swallow is torn between the two and begins to discover who she is and where she is going.	https://music.apple.com/us/album/whistle-down-the-wind-original-cast-recording/1452667913	https://is5-ssl.mzstatic.com/image/thumb/Music124/v4/b9/0e/83/b90e831e-8f7e-cd83-c3a7-9a14edf73418/00731454726122.rgb.jpg/1000x1000bb.jpeg
456	White Christmas	Irving Berlin	Irving Berlin	Veterans Bob Wallace and Phil Davis have a successful song-and-dance act after World War II. With romance in mind, the two follow a duo of beautiful singing sisters en route to their Christmas show at a Vermont lodge, which just happens to be owned by Bob and Phil's former army commander. The dazzling score features well-known standards including "Blue Skies," "I Love A Piano," "How Deep Is the Ocean" and the perennial favorite, "White Christmas." White Christmas is an uplifting musical worthy of year-round productions.	https://music.apple.com/us/album/irving-berlins-white-christmas-original-broadway-cast/1307081301	https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/87/aa/02/87aa024c-60f3-b2fb-d277-835a09e01bda/791558122534.jpg/1000x1000bb.jpeg
457	Woman of the Year	John Kander	Fred Ebb	Lauren Bacall made a triumphant return to Broadway in this Tony® Award-winning musical adaptation of the famous Tracy/Hepburn film. Tess Harding is a high-powered anchorwoman of a network TV morning news show. She makes some derogatory remarks about comic strips on the air and comes head-to-head with Sam Craig, a famous cartoonist who introduces a lampoon of Tess into his comic strip. The feud turns to romance and marriage but not to harmony in this delightful battle of the sexes between two outsized egos.	https://music.apple.com/us/album/woman-of-the-year-original-broadway-cast-recording/1034401800	https://is5-ssl.mzstatic.com/image/thumb/Music18/v4/0b/13/9b/0b139bfd-b235-21df-5d28-cacb10ff4fc3/mzm.wcrgjkkv.jpg/1000x1000bb.jpeg
465	Zorba!	John Kander	Fred Ebb	This splendid musical ran for a year on Broadway and was followed by a widely acclaimed national tour. The story of Zorba, the Greek, carefree vagabond and his chosen friend and master, unworldly Nikos; the romance of Zorba and the aging courtesan Madame Hortense and of Nikos and the withdrawn, beautiful widow; a mine disaster, murder, suicide, a blood feud—Zorba! has all the ingredients that make for dramatically engaging theatre. The powerful score from the composers of Cabaret and  Kiss of the SpiderWoman includes Life Is, No Boom-Boom, The Butterfly and I Am Free. Compelling music and a rousing story make Zorba! an outstanding opportunity for musical theatre performers and audiences alike.Zorba! was first presented on Broadway at the Imperial Theatre in November 1968.	https://music.apple.com/us/album/zorba-original-broadway-cast-recording/715757070	https://is1-ssl.mzstatic.com/image/thumb/Music/v4/2b/02/62/2b0262f5-c75e-2299-cfa0-5fa055e6dcce/05099924215855.jpg/1000x1000bb.jpeg
458	Women on the Verge of a Nervous Breakdown	David Yazbek	David Yazbek	Gazpacho, anyone? A musical adaptation of Pedro Almodóvar's beloved film of the same name, Women on the Verge of a Nervous Breakdown is the brainchild of the talented team behind Dirty Rotten Scoundrels. Preserving the unusual and exhilarating tone and style of the Oscar-nominated film, Women on the Verge will delight both fans of the film and newcomers to the raucous tale. Both touching and hilarious, Women on the Verge is a story about women and the men who pursue them... finding them, losing them, needing them and rejecting them. At the center is Pepa, whose friends and lovers are blazing a trail through 1980s Madrid. Along with Pepa, there's her missing (possibly philandering) lover, Ivan; his ex-wife of questionable sanity, Lucia; their son, Carlos; Pepa's friend, Candela  and her terrorist boyfriend; a power-suited lawyer; and a taxi driver who dispenses tissues, mints and advice in equal proportion. Mayhem and comic madness abound, balanced by the empathy and heart that are trademarks of Almodóvar's work. Women on the Verge of a Nervous Breakdown has a small, ensemble cast with many featured roles for women. The upbeat, memorable score is great for trained singers, giving many actors an opportunity to shine. Perfect for companies looking for a zany, contemporary show with a built-in fan base.	https://music.apple.com/us/album/women-on-verge-nervous-breakdown-original-broadway/1306252487	https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/85/40/7c/85407cfa-9e93-46e3-e615-b841dd027ab3/791558944730.jpg/1000x1000bb.jpeg
459	Wonderful Town	Leonard Bernstein	Betty Comden and Adolph Green	In the summer of 1935, Ruth, an aspiring writer, and Eileen, an actress and dancer, leave rural Ohio to seek success in the big city. Due to their limited budget, the sisters wind up sharing a less-than ideal basement apartment in Greenwich Village. Together and individually, they pursue their dreams, overcome heartbreak, encounter a motley assortment of colorful characters, and - ultimately - find love. 	https://music.apple.com/us/album/wonderful-town-original-broadway-cast/1452218301	https://is5-ssl.mzstatic.com/image/thumb/Music114/v4/83/03/fb/8303fb04-6a71-2167-3156-8fc51f293bb7/00044001460227.rgb.jpg/1000x1000bb.jpeg
460	Xanadu	Jeff Lynne	Jeff Lynne	This Tony Award-nominated, hilarious, roller skating, musical adventure about following your dreams despite the limitations others set for you, rolls along to the original hit score composed by pop-rock legends, Jeff Lynne and John Farrar. Based on the Universal Pictures cult classic movie of the same title, which starred Olivia Newton-John and Gene Kelly, Xanadu is hilarity on wheels for adults, children and anyone who has ever wanted to feel inspired. Xanadu follows the journey of a magical and beautiful Greek muse, Kira, who descends from the heavens of Mount Olympus to Venice Beach, California in 1980 on a quest to inspire a struggling artist, Sonny, to achieve the greatest artistic creation of all time – the first ROLLER DISCO! (Hey, it's 1980!) But, when Kira falls into forbidden love with the mortal Sonny, her jealous sisters take advantage of the situation, and chaos abounds. Xanadu is a moving, electrifying tale of endless fun that will keep audiences in stitches while the original legendary, chart-topping tunes lift them out of their seats. With a small cast and limited design needs, this is a perfect choice for high schools and community theatres looking to have a bonafide 80s blast. You'll want to keep the music in your head and Xanadu in your heart... forever.	https://music.apple.com/us/album/xanadu-original-broadway-cast-recording/523750114	https://is5-ssl.mzstatic.com/image/thumb/Music128/v4/cc/cb/97/cccb979e-e1ee-a2c4-dbf3-4e376de47a54/803607085827_cover.jpg/1000x1000bb.jpeg
461	You're A Good Man, Charlie Brown	Clark Gesner	Clark Gesner	You're A Good Man, Charlie Brown opened on March 7, 1967 and played for 1,597 performances in New York at the theatre 80 St. Marks with Gary Burghoff in the title role. This version was revived on Broadway in 1971 and played for 32 performances at the John Golden Theatre. A new version, You're A Good Man, Charlie Brown (Revised), was presented on Broadway in 1999 and played for 149 performances at the Ambassador Theatre with Tony Award-winning performances by Roger Bart as Snoopy and Kristin Chenoweth as Sally.	https://music.apple.com/us/album/youre-a-good-man-charlie-brown/258630220	https://is2-ssl.mzstatic.com/image/thumb/Features/35/9b/03/dj.rcuhmqup.jpg/1000x1000bb.jpeg
462	Young Frankenstein	Mel Brooks	Mel Brooks	From the creators of the record-breaking Broadway sensation, The Producers, comes this monster new musical comedy. The comedy genius, Mel Brooks, adapts his legendarily funny film into a brilliant stage creation – Young Frankenstein! Grandson of the infamous Victor Frankenstein, Frederick Frankenstein (pronounced "Fronk-en-steen") inherits his family's estate in Transylvania. With the help of a hunchbacked sidekick, Igor (pronounced "Eye-gore"), and a leggy lab assistant, Inga (pronounced normally), Frederick finds himself in the mad scientist shoes of his ancestors. "It's alive!" he exclaims as he brings to life a creature to rival his grandfather's. Eventually, of course, the monster escapes and hilarity continuously abounds. Every bit as relevant to audience members who will remember the original as it will be to newcomers, Young Frankenstein has all the of panache of the screen sensation with a little extra theatrical flair added. It will surely be the perfect opportunity for a production company to showcase an array of talents. With such memorable tunes as "The Transylvania Mania," "He Vas My Boyfriend" and "Puttin' on the Ritz," Young Frankenstein is scientifically proven, monstrously good entertainment.	https://music.apple.com/us/album/young-frankenstein-the-new-mel-brooks-musical/1440728422	https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/ee/c9/35/eec93561-78c3-1450-5e1b-20f9ca240ec7/00602517599604.rgb.jpg/1000x1000bb.jpeg
463	Your Own Thing	Hal Hester and Danny Apolinar	Hal Hester and Danny Apolinar	Your Own Thing is a rock musical loosely based on William Shakespeare’s Twelfth Night. Set in the late 1960s in the land of Illyria (which looks very much like New York City), it is a tale of separated twins, mistaken identities, love triangles and “doing your own thing.”Your Own Thing opened off-Broadway at the Orpheum Theatre on January 13, 1968 and played for 933 performances. The original cast included Leland Palmer, Marcia Rodd, Marian Mercer, Rusty (Russ) Thacker, Tom Ligon, John Kuhner, Michael Valenti, Igors Gavin, Imogene Bliss and Danny Apolinar.	https://music.apple.com/us/album/your-own-thing-original-off-broadway-cast-recording/332595114	https://is2-ssl.mzstatic.com/image/thumb/Features/03/8b/9c/dj.spbiojwy.jpg/1000x1000bb.jpeg
464	Zombie Prom	Dana P. Rowe	John Dempsey	ZOMBIE PROM was produced at The Red Barn Theatre in Key West, Florida in February, 1993.  Joy Hawkins, director; Dana P. Rowe, musical director.	https://music.apple.com/us/album/zombie-prom-original-off-broadway-cast-recording/539771528	https://is1-ssl.mzstatic.com/image/thumb/Music/v4/f8/b3/17/f8b31799-9697-c7a2-57d9-9dc0fe42e4e5/Cover.jpg/1000x1000bb.jpeg
78	Carmen Jones	Oscar Hammerstein II, Georges Bizet	Oscar Hammerstein II, Georges Bizet	In a Southern town during World War II, an army corporal named Joe is stationed near a parachute factory where Carmen Jones is employed. Fickle and flirtatious, Carmen manages to steal Joe away from his fiancée, and the army as well, and they run off to Chicago together. But Carmen loses interest in Joe when she meets and successfully woos Husky Miller, a prize fighter on his way to the top. Mad with jealousy, Joe waits for Carmen outside the stadium the night of Husky's big fight to make a last desperate plea for her love. When she denies him resolutely, he stabs her to death in a rage of passion, to the eerie accompaniment of the crowd inside the stadium cheering Husky's victory.Carmen Jones opened at the Brodway Theatre on December 2, 1943, starrring Muriel Smith as Carmen. The production ran for 503 performances. Otto Preminger directed a film adaptation of the musical in 1954, starring Dorothy Dandridge, Harry Belafonte and Pearl Bailey. In 2018, the Classic Stage Company revived Carmen Jones, under the direction of John Doyle, with Anika Noni Rose in the title role.	https://music.apple.com/us/album/carmen-jones-1943-original-broadway-cast-recording/1452590021	https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/43/91/8f/43918f89-cda9-2c33-18dc-c81de37eb869/00044006678023.rgb.jpg/1000x1000bb.jpeg
178	I Do! I Do!	Harvey Schmidt	Tom Jones	The story of a marriage is at the center of I Do! I Do!, an intimate and nostalgic work by Harvey Schmidt and Tom Jones (The Fantasticks). Written as a star vehicle for theatre legends, Mary Martin and Robert Preston, the original Broadway production received seven Tony Award nominations. The show begins with Michael and Agnes on their wedding day. Their vows behind them, they look forward to spending the rest of their lives together. We watch as they go through their wedding night jitters, raise a family and negotiate midlife crises. Michael eventually admits to his infidelity, and, although Agnes is angered by his actions, she forgives him and the couple reconciles. They rediscover how much they really need each other. Then, after 50 years of marriage, the couple leaves their house to the next pair of newlyweds. This touching story of two soul mates navigating the perils of life is set to a tuneful, charming score. With minimal set and costume requirements, I Do! I Do! is ideal for regional theatre companies with smaller troupes on a limited budget.	https://music.apple.com/us/album/i-do-i-do/272105075	https://is4-ssl.mzstatic.com/image/thumb/Music/5b/af/3c/mzi.aeqwywhw.jpg/1000x1000bb.jpg
324	Side by Side by Sondheim	Jule Styne	Stephen Sondheim	Get ready to laugh, cry and fall in love with lyrics that are heartbreakingly true and music that captures the soaring emotions of a new generation with Side by Side by Sondheim. Simple and unpretentious, this Tony Award-winning musical is a perfect introduction to the work of this contemporary master and a must for diehard fans. Stephen Sondheim has been the leading composer of musical theatre for the past fifty years. His work is timeless. From the streets of ancient Rome, through nineteenth-century Japan and turn-of-the-century Sweden, to the high-rise apartments of 1970 Manhattan, his songs represent a definitive time and place, and yet move beyond their particular settings to speak to us all. Now, with this award-winning revue of his earlier work, some of the most lush, unforgettable songs from this musical theatre master are presented in one magical evening. Featuring music from Company, Follies, A Little Night Music, A Funny Thing Happened on the Way to the Forum, Anyone Can Whistle and Pacific Overtures, not to mention the classics written with musical theatre giants, Leonard Bernstein, Jule Styne and Richard Rodgers, this dazzling array of some of Sondheim's best-known songs demonstrates his masterful craft and astounding creativity. Minimal sets and costumes, a small cast and two pianos allow the brilliant songs to shine. The proceedings are run by a charming, pithy narrator whose virtually nonexistent musical requirements are ideal for a nonsinging, local celebrity with limited rehearsal time.	https://music.apple.com/us/album/side-by-side-by-sondheim-original-london-cast-recording/272102185	https://is3-ssl.mzstatic.com/image/thumb/Features/66/7f/0b/dj.pjznvywv.jpg/1000x1000bb-60.jpg
122	Fanny	Harold Rome	Harold Rome	Based on Marcel Pagnol’s stage and film trilogy Marius, Fanny and César, Fanny is a romantic tale of love, secrets and passion set in the seaport milieu of old Marseille.Fanny opened on Broadway at the Majestic Theatre on November 4, 1954, starring Ezio Pinza, Walter Slezak, Florence Henderson and William Tabbert. The show later moved to the Belasco Theatre, playing a total of 888 performances.	https://music.apple.com/us/album/fanny-original-broadway-cast-recording/332568448	https://is1-ssl.mzstatic.com/image/thumb/Features/13/ef/a0/dj.nntvigdw.jpg/500x500bb-60.jpg
335	Sondheim on Sondheim	Stephen Sondheim	Stephen Sondheim	Hailed as a "revelatory revue full of wonderful moments" and a "funny, affectionate and revealing tribute to musical theater's greatest living composer and lyricist," Sondheim on Sondheim is an intimate portrait of the famed songwriter in his own words... and music. Through the use of exclusive interview footage, audiences get an inside look at the personal life and artistic process of famed composer, Stephen Sondheim. His story. His inspiration. His genius. The tapestry of creativity that characterizes Stephen Sondheim remained largely undiscussed, especially by the man himself, until the creation of Sondheim on Sondheim. Ranging from the beloved to the obscure, the carefully selected two-dozen songs hang from a framework of in-depth video interviews, delving into Sondheim's personal life and artistic process. Far from the typical song cycle, Sondheim on Sondheim has massive theatrical potency, as well as inarguable staying power. The incomparable James Lapine brilliantly curated a collection of songs that have been masterfully arranged by David Loud. In addition, Sondheim on Sondheim's multimedia facets make it equally at home on a Broadway-sized stage as it would be in a black box space. Included in the rehearsal set for Sondheim on Sondheim is the video content required for the show. This video content is supplied on an external hard drive that includes a single-channel video playback system and all 100 required video segments. The rehearsal set also includes a video playback instruction guide and cue sheet. Please note the video playback system can ONLY be used on Macs. There is no Windows compatibility.	https://music.apple.com/us/album/sondheim-on-sondheim-original-broadway-cast-recording/780135884	https://is2-ssl.mzstatic.com/image/thumb/Music/v4/10/ab/77/10ab77aa-da7d-9235-6052-48f2a5256c14/1100152.tif/500x500bb-60.jpg
310	Romance/Romance	Keith Herrmann	Barry Harman	Two one act musicals take varied looks at romance seekers. The first is a delightful romp through the sexual ennui of turn of the century Vienna based on Schnitzler's tale The Little Comedy. Act 2 is a modern look at affection and disaffection in a two couple summer house in the Hamptons based on the Jules Renard play Summer Share. An Off Off Broadway sensation that successfully moved to Broadway, Romance/Romance is a perfect change from the modern mega musical.	https://music.apple.com/tr/album/romance-romance-original-broadway-cast/209447161	https://is5-ssl.mzstatic.com/image/thumb/Music/cc/38/52/mzi.ieetmllo.tif/500x500bb-60.jpg
\.


--
-- Data for Name: suggestions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.suggestions ("suggestionId", title, composer, notes) FROM stdin;
1	Dear Evan Hansen	Pasek and Paul	contemporary pop feel, deals with teenagers, mental health
2	Six: The Musical	Lucy Moss, Toby Marlow	definite pop/rock feel, like a rock concert
3	Moulin Rouge	Various	80-00s pop songs
4	Jersey Boys	Four Seasons	jukebox musical with Four Seasons songs
5	Passion	Stephen Sondeim	Super dramatic, classic or opera sounding?
6	Emma	Paul Gordon	very little women-y sounding
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tags ("tagId", name) FROM stdin;
1	Adolescence/Childhood
2	Aging
3	All Female
4	Asian Interest
5	Based on Children's Books
6	Based on True Events
7	Betrayal
8	Black/African-American Interest
9	Business
10	Childhood
11	Christianity
12	Christmas
13	Current Events
14	Death
15	Disney Shows
16	Drag Performance
17	Economic/Financial Interest
18	Education
19	Fairy Tales
20	Feminism
21	Friendship
22	Illness/Health
23	Jewish Interest
24	Latinx Interest
25	LGBTQ+ Interest
26	Love
27	Marriage
28	Media
29	Memory
30	NYC
31	Parenting/Family
32	Politics
33	Religious Themes
34	Sexuality
35	Spectacle
36	Sports
37	Theatre for Young Audiences (TYA)
38	Theatre on the Edge
39	Theatre/Entertainment Industry
40	Tony Award Winners
41	War
42	Women's Interest
43	Dark
44	Mental Health
45	Western Setting
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users ("userId", username) FROM stdin;
1	sierra
5	sam
\.


--
-- Name: collections_collectionId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."collections_collectionId_seq"', 26, true);


--
-- Name: genres_genreId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."genres_genreId_seq"', 1, false);


--
-- Name: musicalStyles_musicalStyleId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."musicalStyles_musicalStyleId_seq"', 1, false);


--
-- Name: musicals_musicalId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."musicals_musicalId_seq"', 1, false);


--
-- Name: suggestions_suggestionId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."suggestions_suggestionId_seq"', 6, true);


--
-- Name: tags_tagId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."tags_tagId_seq"', 1, false);


--
-- Name: users_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."users_userId_seq"', 39, true);


--
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY ("collectionId");


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY ("genreId");


--
-- Name: musicalStyles musicalStyles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."musicalStyles"
    ADD CONSTRAINT "musicalStyles_pkey" PRIMARY KEY ("musicalStyleId");


--
-- Name: musicals musicals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.musicals
    ADD CONSTRAINT musicals_pkey PRIMARY KEY ("musicalId");


--
-- Name: suggestions suggestions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suggestions
    ADD CONSTRAINT suggestions_pkey PRIMARY KEY ("suggestionId");


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY ("tagId");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY ("userId");


--
-- Name: collectionItems collectionItems_collectionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."collectionItems"
    ADD CONSTRAINT "collectionItems_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES public.collections("collectionId");


--
-- Name: collectionItems collectionItems_musicalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."collectionItems"
    ADD CONSTRAINT "collectionItems_musicalId_fkey" FOREIGN KEY ("musicalId") REFERENCES public.musicals("musicalId");


--
-- Name: collections collections_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT "collections_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId");


--
-- Name: genreSeeds genreSeeds_genreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."genreSeeds"
    ADD CONSTRAINT "genreSeeds_genreId_fkey" FOREIGN KEY ("genreId") REFERENCES public.genres("genreId");


--
-- Name: genreSeeds genreSeeds_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."genreSeeds"
    ADD CONSTRAINT "genreSeeds_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId");


--
-- Name: likedMusicals likedMusicals_musicalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."likedMusicals"
    ADD CONSTRAINT "likedMusicals_musicalId_fkey" FOREIGN KEY ("musicalId") REFERENCES public.musicals("musicalId");


--
-- Name: likedMusicals likedMusicals_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."likedMusicals"
    ADD CONSTRAINT "likedMusicals_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId");


--
-- Name: musicalGenres musicalGenres_genreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."musicalGenres"
    ADD CONSTRAINT "musicalGenres_genreId_fkey" FOREIGN KEY ("genreId") REFERENCES public.genres("genreId");


--
-- Name: musicalGenres musicalGenres_musicalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."musicalGenres"
    ADD CONSTRAINT "musicalGenres_musicalId_fkey" FOREIGN KEY ("musicalId") REFERENCES public.musicals("musicalId");


--
-- Name: musicalStyleCategories musicalStyleCategories_musicalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."musicalStyleCategories"
    ADD CONSTRAINT "musicalStyleCategories_musicalId_fkey" FOREIGN KEY ("musicalId") REFERENCES public.musicals("musicalId");


--
-- Name: musicalStyleCategories musicalStyleCategories_musicalStyleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."musicalStyleCategories"
    ADD CONSTRAINT "musicalStyleCategories_musicalStyleId_fkey" FOREIGN KEY ("musicalStyleId") REFERENCES public."musicalStyles"("musicalStyleId");


--
-- Name: musicalStyleSeeds musicalStyleSeeds_musicalStyleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."musicalStyleSeeds"
    ADD CONSTRAINT "musicalStyleSeeds_musicalStyleId_fkey" FOREIGN KEY ("musicalStyleId") REFERENCES public."musicalStyles"("musicalStyleId");


--
-- Name: musicalStyleSeeds musicalStyleSeeds_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."musicalStyleSeeds"
    ADD CONSTRAINT "musicalStyleSeeds_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId");


--
-- Name: musicalTags musicalTags_musicalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."musicalTags"
    ADD CONSTRAINT "musicalTags_musicalId_fkey" FOREIGN KEY ("musicalId") REFERENCES public.musicals("musicalId");


--
-- Name: musicalTags musicalTags_tagId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."musicalTags"
    ADD CONSTRAINT "musicalTags_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES public.tags("tagId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

