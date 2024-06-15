--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-03-20 15:05:44 RET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 11 (class 2615 OID 17849)
-- Name: phylica_amsterdam; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA phylica_amsterdam;


ALTER SCHEMA phylica_amsterdam OWNER TO postgres;

SET search_path = phylica_amsterdam, pg_catalog;

--
-- TOC entry 945 (class 1255 OID 17873)
-- Name: calcul_pk_suivi_croissance(); Type: FUNCTION; Schema: phylica_amsterdam; Owner: postgres
--

CREATE FUNCTION calcul_pk_suivi_croissance() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_suivi_croissance=(NEW.fk_numero_plant||'_'||NEW.date_observation);
        RETURN  NEW;
    END;

$$;


ALTER FUNCTION phylica_amsterdam.calcul_pk_suivi_croissance() OWNER TO postgres;

--
-- TOC entry 946 (class 1255 OID 17871)
-- Name: calcul_the_geom(); Type: FUNCTION; Schema: phylica_amsterdam; Owner: postgres
--

CREATE FUNCTION calcul_the_geom() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.the_geom=ST_transform(ST_SetSRID(ST_MakePoint(NEW.longitude :: double precision,NEW.latitude :: double precision),4326),32743);
        RETURN  NEW;
    END;

$$;


ALTER FUNCTION phylica_amsterdam.calcul_the_geom() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 275 (class 1259 OID 17878)
-- Name: contours_ams; Type: TABLE; Schema: phylica_amsterdam; Owner: postgres; Tablespace: 
--

CREATE TABLE contours_ams (
    gid integer NOT NULL,
    name character varying(20),
    the_geom public.geometry(MultiLineString,32743)
);


ALTER TABLE phylica_amsterdam.contours_ams OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 17876)
-- Name: contours_ams_gid_seq; Type: SEQUENCE; Schema: phylica_amsterdam; Owner: postgres
--

CREATE SEQUENCE contours_ams_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phylica_amsterdam.contours_ams_gid_seq OWNER TO postgres;

--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 274
-- Name: contours_ams_gid_seq; Type: SEQUENCE OWNED BY; Schema: phylica_amsterdam; Owner: postgres
--

ALTER SEQUENCE contours_ams_gid_seq OWNED BY contours_ams.gid;


--
-- TOC entry 272 (class 1259 OID 17850)
-- Name: identite; Type: TABLE; Schema: phylica_amsterdam; Owner: postgres; Tablespace: 
--

CREATE TABLE identite (
    numero_plant character(8) NOT NULL,
    date_plantation date,
    auteur_plantation character varying(50),
    site_secteur character varying(50),
    age_plant smallint,
    longitude real,
    latitude real,
    degagement_lors_de_plantation character varying(30),
    hauteur_max_lors_de_plantation_cm real,
    etat_sanitaire character varying(100),
    type_de_contenant character varying(100),
    suivi_croissance boolean,
    vivant boolean,
    date_observation_mort date,
    paillage boolean,
    altitude smallint,
    zone_pedo character varying(100),
    distance_a_mer_plane smallint,
    distance_a_mer_reelle smallint,
    commentaires text,
    the_geom public.geometry(Point,32743)
);


ALTER TABLE phylica_amsterdam.identite OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 17858)
-- Name: suivi_croissance; Type: TABLE; Schema: phylica_amsterdam; Owner: postgres; Tablespace: 
--

CREATE TABLE suivi_croissance (
    pk_suivi_croissance character varying(20) NOT NULL,
    fk_numero_plant character(8),
    date_observation date,
    observateur character varying(50),
    hauteur_maximum_cm real,
    hauteur_vegetation_sous_arbre_cm real,
    traces_floraisons_ou_fructifications boolean,
    desherbage_realise boolean,
    depart_especes_invasives boolean,
    commentaires text,
    mort boolean,
    non_trouve boolean
);


ALTER TABLE phylica_amsterdam.suivi_croissance OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 27458)
-- Name: croissance_vue; Type: VIEW; Schema: phylica_amsterdam; Owner: postgres
--

CREATE VIEW croissance_vue AS
 SELECT row_number() OVER (ORDER BY croissance_vue.numero_plant, croissance_vue.date_observation) AS cle_primaire,
    croissance_vue.numero_plant,
    croissance_vue.site_secteur,
    croissance_vue.date_observation,
    croissance_vue.hauteur,
    croissance_vue.nbjours_depuis_plantation,
    croissance_vue.croissance_depuis_plantation,
    croissance_vue.taux_croissance_cm_mois,
    croissance_vue.the_geom
   FROM ( SELECT identite.numero_plant,
            identite.site_secteur,
            identite.date_plantation AS date_observation,
            identite.hauteur_max_lors_de_plantation_cm AS hauteur,
            0 AS nbjours_depuis_plantation,
            0 AS croissance_depuis_plantation,
            0 AS taux_croissance_cm_mois,
            identite.the_geom
           FROM identite
        UNION
         SELECT suivi_croissance.fk_numero_plant AS numero_plant,
            identite.site_secteur,
            suivi_croissance.date_observation,
            suivi_croissance.hauteur_maximum_cm AS hauteur,
            (suivi_croissance.date_observation - identite.date_plantation) AS nbjours_depuis_plantation,
            (suivi_croissance.hauteur_maximum_cm - identite.hauteur_max_lors_de_plantation_cm) AS croissance_depuis_plantation,
            round((((suivi_croissance.hauteur_maximum_cm * (30)::double precision) / ((suivi_croissance.date_observation - identite.date_plantation))::double precision))::numeric, 2) AS taux_croissance_cm_mois,
            identite.the_geom
           FROM suivi_croissance,
            identite
          WHERE (suivi_croissance.fk_numero_plant = identite.numero_plant)
  ORDER BY 1, 2) croissance_vue;


ALTER TABLE phylica_amsterdam.croissance_vue OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 27449)
-- Name: phylica_historique; Type: TABLE; Schema: phylica_amsterdam; Owner: postgres; Tablespace: 
--

CREATE TABLE phylica_historique (
    id_0 integer NOT NULL,
    geom public.geometry(MultiPolygon,32743),
    nombre integer,
    annee_plan integer,
    source character varying(100),
    originel character varying(3)
);


ALTER TABLE phylica_amsterdam.phylica_historique OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 27447)
-- Name: phylica_historique_id_0_seq; Type: SEQUENCE; Schema: phylica_amsterdam; Owner: postgres
--

CREATE SEQUENCE phylica_historique_id_0_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phylica_amsterdam.phylica_historique_id_0_seq OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 290
-- Name: phylica_historique_id_0_seq; Type: SEQUENCE OWNED BY; Schema: phylica_amsterdam; Owner: postgres
--

ALTER SEQUENCE phylica_historique_id_0_seq OWNED BY phylica_historique.id_0;


--
-- TOC entry 286 (class 1259 OID 27424)
-- Name: secteurs_geom; Type: VIEW; Schema: phylica_amsterdam; Owner: postgres
--

CREATE VIEW secteurs_geom AS
 SELECT identite.site_secteur,
    public.st_makeenvelope(min(public.st_x(identite.the_geom)), min(public.st_y(identite.the_geom)), max(public.st_x(identite.the_geom)), max(public.st_y(identite.the_geom))) AS st_makeenvelope
   FROM identite
  GROUP BY identite.site_secteur;


ALTER TABLE phylica_amsterdam.secteurs_geom OWNER TO postgres;

--
-- TOC entry 3153 (class 2604 OID 17881)
-- Name: gid; Type: DEFAULT; Schema: phylica_amsterdam; Owner: postgres
--

ALTER TABLE ONLY contours_ams ALTER COLUMN gid SET DEFAULT nextval('contours_ams_gid_seq'::regclass);


--
-- TOC entry 3154 (class 2604 OID 27452)
-- Name: id_0; Type: DEFAULT; Schema: phylica_amsterdam; Owner: postgres
--

ALTER TABLE ONLY phylica_historique ALTER COLUMN id_0 SET DEFAULT nextval('phylica_historique_id_0_seq'::regclass);


--
-- TOC entry 3160 (class 2606 OID 17886)
-- Name: contours_ams_pkey; Type: CONSTRAINT; Schema: phylica_amsterdam; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contours_ams
    ADD CONSTRAINT contours_ams_pkey PRIMARY KEY (gid);


--
-- TOC entry 3156 (class 2606 OID 17857)
-- Name: identite_pkey; Type: CONSTRAINT; Schema: phylica_amsterdam; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY identite
    ADD CONSTRAINT identite_pkey PRIMARY KEY (numero_plant);


--
-- TOC entry 3162 (class 2606 OID 27454)
-- Name: phylica_historique_pkey; Type: CONSTRAINT; Schema: phylica_amsterdam; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY phylica_historique
    ADD CONSTRAINT phylica_historique_pkey PRIMARY KEY (id_0);


--
-- TOC entry 3158 (class 2606 OID 17865)
-- Name: suivi_croissance_pkey; Type: CONSTRAINT; Schema: phylica_amsterdam; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY suivi_croissance
    ADD CONSTRAINT suivi_croissance_pkey PRIMARY KEY (pk_suivi_croissance);


--
-- TOC entry 3165 (class 2620 OID 17874)
-- Name: calcul_pk_suivi_croissance; Type: TRIGGER; Schema: phylica_amsterdam; Owner: postgres
--

CREATE TRIGGER calcul_pk_suivi_croissance BEFORE INSERT OR UPDATE ON suivi_croissance FOR EACH ROW EXECUTE PROCEDURE calcul_pk_suivi_croissance();


--
-- TOC entry 3164 (class 2620 OID 17872)
-- Name: calcul_the_geom_identite; Type: TRIGGER; Schema: phylica_amsterdam; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_identite BEFORE INSERT OR UPDATE ON identite FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3163 (class 2606 OID 17866)
-- Name: suivi_croissance_fk_numero_plant_fkey; Type: FK CONSTRAINT; Schema: phylica_amsterdam; Owner: postgres
--

ALTER TABLE ONLY suivi_croissance
    ADD CONSTRAINT suivi_croissance_fk_numero_plant_fkey FOREIGN KEY (fk_numero_plant) REFERENCES identite(numero_plant) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2015-03-20 15:05:44 RET

--
-- PostgreSQL database dump complete
--

