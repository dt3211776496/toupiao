--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-01-12 00:41:46 IST

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
-- TOC entry 266 (class 1259 OID 25944)
-- Name: projectInfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."projectInfo" (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    name character varying NOT NULL,
    url character varying NOT NULL,
    handle character varying NOT NULL,
    "ownerId" uuid NOT NULL,
    logo character varying,
    wid character varying NOT NULL
);


ALTER TABLE public."projectInfo" OWNER TO postgres;

--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE "projectInfo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."projectInfo" IS 'List of all website as project.';


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN "projectInfo".wid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."projectInfo".wid IS 'website unique id';


--
-- TOC entry 267 (class 1259 OID 25947)
-- Name: websites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."projectInfo" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.websites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 2969 (class 0 OID 25944)
-- Dependencies: 266
-- Data for Name: projectInfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 267
-- Name: websites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.websites_id_seq', 10, true);


--
-- TOC entry 2813 (class 2606 OID 26002)
-- Name: projectInfo projectInfo_ownerId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."projectInfo"
    ADD CONSTRAINT "projectInfo_ownerId_key" UNIQUE ("ownerId");


--
-- TOC entry 2815 (class 2606 OID 25973)
-- Name: projectInfo websites_handle_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."projectInfo"
    ADD CONSTRAINT websites_handle_key UNIQUE (handle);


--
-- TOC entry 2817 (class 2606 OID 25955)
-- Name: projectInfo websites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."projectInfo"
    ADD CONSTRAINT websites_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 25971)
-- Name: projectInfo websites_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."projectInfo"
    ADD CONSTRAINT websites_url_key UNIQUE (url);


--
-- TOC entry 2821 (class 2606 OID 25979)
-- Name: projectInfo websites_wid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."projectInfo"
    ADD CONSTRAINT websites_wid_key UNIQUE (wid);


--
-- TOC entry 2966 (class 3256 OID 25957)
-- Name: projectInfo Enable insert for authenticated users only; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable insert for authenticated users only" ON public."projectInfo" FOR INSERT TO authenticated WITH CHECK (true);


--
-- TOC entry 2967 (class 3256 OID 25956)
-- Name: projectInfo Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public."projectInfo" FOR SELECT TO authenticated USING (true);


--
-- TOC entry 2965 (class 0 OID 25944)
-- Dependencies: 266
-- Name: projectInfo; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public."projectInfo" ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE "projectInfo"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."projectInfo" TO anon;
GRANT ALL ON TABLE public."projectInfo" TO authenticated;
GRANT ALL ON TABLE public."projectInfo" TO service_role;


GRANT ALL ON SEQUENCE public.websites_id_seq TO anon;
GRANT ALL ON SEQUENCE public.websites_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.websites_id_seq TO service_role;


-- Completed on 2023-01-12 00:41:49 IST

--
-- PostgreSQL database dump complete
--
