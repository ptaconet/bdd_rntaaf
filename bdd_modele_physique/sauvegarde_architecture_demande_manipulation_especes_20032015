--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-03-20 15:07:41 RET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 10 (class 2615 OID 17753)
-- Name: demande_manipulation_especes; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA demande_manipulation_especes;


ALTER SCHEMA demande_manipulation_especes OWNER TO postgres;

SET search_path = demande_manipulation_especes, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 271 (class 1259 OID 17835)
-- Name: autorisation_demande; Type: TABLE; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

CREATE TABLE autorisation_demande (
    fk_numero_demande integer NOT NULL,
    avis_cep character varying(15),
    recommandations_cep text,
    avis_cnpn character varying(15),
    recommandations_cnpn text,
    decision_adm_superieur character varying(15),
    duree integer
);


ALTER TABLE demande_manipulation_especes.autorisation_demande OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 17803)
-- Name: demande; Type: TABLE; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

CREATE TABLE demande (
    numero_demande integer NOT NULL,
    date_demande date,
    saison character(9),
    fk_programme integer,
    district character varying(15),
    site character varying(100),
    date_debut date,
    date_fin date,
    finalite_inventaire boolean,
    finalite_suivi_pop boolean,
    finalite_etude_ecoethologique boolean,
    finalite_etude_parasitologique boolean,
    finalite_etude_genetique boolean,
    finalite_etude_biometrique boolean,
    finalite_etude_physiologique boolean,
    finalite_etude_epidemiologique boolean,
    finalite_autre text,
    type_capture_euthanasie boolean,
    type_capture_definitive boolean,
    type_capture_temporaire_relachediffere boolean,
    type_capture_temporaire_relacheimmediat boolean,
    mode_capture_manuelle boolean,
    mode_capture_aufilet boolean,
    mode_capture_pieges boolean,
    mode_capture_autre text,
    marquage boolean,
    marquage_fishtag boolean,
    marquage_baguesplastiques boolean,
    marquage_porcimark boolean,
    marquage_nyanzol boolean,
    marquage_leger_autre text,
    marquage_baguemetal boolean,
    marquage_aileron boolean,
    marquage_transpondeur boolean,
    marquage_definitif_autre text,
    marquage_autre text,
    equipement boolean,
    equipement_gps boolean,
    equipement_gls boolean,
    equipement_vhf boolean,
    equipement_argos boolean,
    equipement_externe_autre text,
    equipement_interne_sondeoesophagienne boolean,
    equipement_interne_autre text,
    prelevement boolean,
    prelevement_lavagestomacal boolean,
    prelevement_prisedesang boolean,
    prelevement_muscles boolean,
    prelevement_autres text,
    prelevement_interventionchirugicale boolean,
    prelevement_type_interventionchirugicale text,
    commentaires text,
    piece_jointe boolean
);


ALTER TABLE demande_manipulation_especes.demande OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 17801)
-- Name: demande_numero_demande_seq; Type: SEQUENCE; Schema: demande_manipulation_especes; Owner: postgres
--

CREATE SEQUENCE demande_numero_demande_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE demande_manipulation_especes.demande_numero_demande_seq OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 267
-- Name: demande_numero_demande_seq; Type: SEQUENCE OWNED BY; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER SEQUENCE demande_numero_demande_seq OWNED BY demande.numero_demande;


--
-- TOC entry 261 (class 1259 OID 17754)
-- Name: demandeur; Type: TABLE; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

CREATE TABLE demandeur (
    nom character varying(50) NOT NULL,
    prenom character varying(50),
    organisme_rattachement character varying(100),
    adresse character varying(200),
    telephone character varying(20),
    mail character varying(50),
    mot_de_passe character varying(15)
);


ALTER TABLE demande_manipulation_especes.demandeur OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 17819)
-- Name: espece_demande; Type: TABLE; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

CREATE TABLE espece_demande (
    pk_espece_demande integer NOT NULL,
    fk_numero_demande integer,
    fk_espece_manipulee character varying(100),
    nb_individus_adultes_males smallint,
    nb_individus_adultes_femelles smallint,
    nb_individus_adultes_indetermines smallint,
    nb_individus_juveniles_males smallint,
    nb_individus_juveniles_femelles smallint,
    nb_individus_juveniles_indetermines smallint,
    nb_individus_indetermines smallint,
    nb_individus_oeufs smallint,
    nb_individus_total smallint
);


ALTER TABLE demande_manipulation_especes.espece_demande OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 17817)
-- Name: espece_demande_pk_espece_demande_seq; Type: SEQUENCE; Schema: demande_manipulation_especes; Owner: postgres
--

CREATE SEQUENCE espece_demande_pk_espece_demande_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE demande_manipulation_especes.espece_demande_pk_espece_demande_seq OWNER TO postgres;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 269
-- Name: espece_demande_pk_espece_demande_seq; Type: SEQUENCE OWNED BY; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER SEQUENCE espece_demande_pk_espece_demande_seq OWNED BY espece_demande.pk_espece_demande;


--
-- TOC entry 266 (class 1259 OID 17796)
-- Name: especes; Type: TABLE; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

CREATE TABLE especes (
    nom_commun character varying(100) NOT NULL,
    nom_scientifique character varying(100),
    famille character varying(50),
    ordre character varying(50),
    classe character varying(50),
    protection_nationale boolean
);


ALTER TABLE demande_manipulation_especes.especes OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 17759)
-- Name: programme; Type: TABLE; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

CREATE TABLE programme (
    titre text,
    numero smallint NOT NULL,
    fk_responsable character varying(50)
);


ALTER TABLE demande_manipulation_especes.programme OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 17788)
-- Name: sites_amsterdam; Type: TABLE; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

CREATE TABLE sites_amsterdam (
    nom_site character varying(100) NOT NULL,
    toponyme_site character varying(100),
    toponyme_type character varying(100),
    demande_pour_acces boolean,
    statut_protection character varying(20),
    latitude integer,
    longitude integer,
    the_geom public.geometry(Point,32743)
);


ALTER TABLE demande_manipulation_especes.sites_amsterdam OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 17780)
-- Name: sites_crozet; Type: TABLE; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

CREATE TABLE sites_crozet (
    nom_site character varying(100) NOT NULL,
    toponyme_site character varying(100),
    toponyme_type character varying(100),
    demande_pour_acces boolean,
    statut_protection character varying(20),
    latitude integer,
    longitude integer,
    the_geom public.geometry(Point,32739)
);


ALTER TABLE demande_manipulation_especes.sites_crozet OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 17772)
-- Name: sites_kerguelen; Type: TABLE; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

CREATE TABLE sites_kerguelen (
    nom_site character varying(100) NOT NULL,
    toponyme_site character varying(100),
    toponyme_type character varying(100),
    demande_pour_acces boolean,
    statut_protection character varying(20),
    latitude integer,
    longitude integer,
    the_geom public.geometry(Point,32742)
);


ALTER TABLE demande_manipulation_especes.sites_kerguelen OWNER TO postgres;

--
-- TOC entry 3156 (class 2604 OID 17806)
-- Name: numero_demande; Type: DEFAULT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY demande ALTER COLUMN numero_demande SET DEFAULT nextval('demande_numero_demande_seq'::regclass);


--
-- TOC entry 3157 (class 2604 OID 17822)
-- Name: pk_espece_demande; Type: DEFAULT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY espece_demande ALTER COLUMN pk_espece_demande SET DEFAULT nextval('espece_demande_pk_espece_demande_seq'::regclass);


--
-- TOC entry 3175 (class 2606 OID 17842)
-- Name: autorisation_demande_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autorisation_demande
    ADD CONSTRAINT autorisation_demande_pkey PRIMARY KEY (fk_numero_demande);


--
-- TOC entry 3171 (class 2606 OID 17811)
-- Name: demande_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY demande
    ADD CONSTRAINT demande_pkey PRIMARY KEY (numero_demande);


--
-- TOC entry 3159 (class 2606 OID 17758)
-- Name: demandeur_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY demandeur
    ADD CONSTRAINT demandeur_pkey PRIMARY KEY (nom);


--
-- TOC entry 3173 (class 2606 OID 17824)
-- Name: espece_demande_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY espece_demande
    ADD CONSTRAINT espece_demande_pkey PRIMARY KEY (pk_espece_demande);


--
-- TOC entry 3169 (class 2606 OID 17800)
-- Name: especes_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY especes
    ADD CONSTRAINT especes_pkey PRIMARY KEY (nom_commun);


--
-- TOC entry 3161 (class 2606 OID 17766)
-- Name: programme_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programme
    ADD CONSTRAINT programme_pkey PRIMARY KEY (numero);


--
-- TOC entry 3167 (class 2606 OID 17795)
-- Name: sites_amsterdam_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sites_amsterdam
    ADD CONSTRAINT sites_amsterdam_pkey PRIMARY KEY (nom_site);


--
-- TOC entry 3165 (class 2606 OID 17787)
-- Name: sites_crozet_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sites_crozet
    ADD CONSTRAINT sites_crozet_pkey PRIMARY KEY (nom_site);


--
-- TOC entry 3163 (class 2606 OID 17779)
-- Name: sites_kerguelen_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sites_kerguelen
    ADD CONSTRAINT sites_kerguelen_pkey PRIMARY KEY (nom_site);


--
-- TOC entry 3180 (class 2606 OID 17843)
-- Name: autorisation_demande_fk_numero_demande_fkey; Type: FK CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY autorisation_demande
    ADD CONSTRAINT autorisation_demande_fk_numero_demande_fkey FOREIGN KEY (fk_numero_demande) REFERENCES demande(numero_demande) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3177 (class 2606 OID 17812)
-- Name: demande_fk_programme_fkey; Type: FK CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY demande
    ADD CONSTRAINT demande_fk_programme_fkey FOREIGN KEY (fk_programme) REFERENCES programme(numero) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3178 (class 2606 OID 17830)
-- Name: espece_demande_fk_espece_manipulee_fkey; Type: FK CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY espece_demande
    ADD CONSTRAINT espece_demande_fk_espece_manipulee_fkey FOREIGN KEY (fk_espece_manipulee) REFERENCES especes(nom_commun) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3179 (class 2606 OID 17825)
-- Name: espece_demande_fk_numero_demande_fkey; Type: FK CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY espece_demande
    ADD CONSTRAINT espece_demande_fk_numero_demande_fkey FOREIGN KEY (fk_numero_demande) REFERENCES demande(numero_demande) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3176 (class 2606 OID 17767)
-- Name: programme_fk_responsable_fkey; Type: FK CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY programme
    ADD CONSTRAINT programme_fk_responsable_fkey FOREIGN KEY (fk_responsable) REFERENCES demandeur(nom) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2015-03-20 15:07:41 RET

--
-- PostgreSQL database dump complete
--

