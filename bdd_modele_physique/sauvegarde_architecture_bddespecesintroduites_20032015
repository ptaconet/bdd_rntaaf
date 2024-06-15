--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-03-20 15:07:12 RET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 15 (class 2615 OID 30309)
-- Name: bdd_especes_introduites_faune; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bdd_especes_introduites_faune;


ALTER SCHEMA bdd_especes_introduites_faune OWNER TO postgres;

--
-- TOC entry 12 (class 2615 OID 17894)
-- Name: donnees_carto; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA donnees_carto;


ALTER SCHEMA donnees_carto OWNER TO postgres;

SET search_path = bdd_especes_introduites_faune, pg_catalog;

--
-- TOC entry 988 (class 1255 OID 30310)
-- Name: calcul_position_pt_depart(); Type: FUNCTION; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE FUNCTION calcul_position_pt_depart() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
NEW.position_pt_depart=ST_SetSRID(ST_MakePoint(NEW.lon_debut,NEW.lat_debut),4326);
RETURN NEW;
    END;

$$;


ALTER FUNCTION bdd_especes_introduites_faune.calcul_position_pt_depart() OWNER TO postgres;

--
-- TOC entry 989 (class 1255 OID 30311)
-- Name: calcul_position_pt_fin(); Type: FUNCTION; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE FUNCTION calcul_position_pt_fin() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
NEW.position_pt_fin=ST_SetSRID(ST_MakePoint(NEW.lon_fin,NEW.lat_fin),4326);
RETURN NEW;
    END;

$$;


ALTER FUNCTION bdd_especes_introduites_faune.calcul_position_pt_fin() OWNER TO postgres;

--
-- TOC entry 947 (class 1255 OID 30312)
-- Name: calcul_the_geom(); Type: FUNCTION; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE FUNCTION calcul_the_geom() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
NEW.the_geom=ST_SetSRID(ST_MakePoint(NEW.longitude,NEW.latitude),4326);
RETURN NEW;
    END;

$$;


ALTER FUNCTION bdd_especes_introduites_faune.calcul_the_geom() OWNER TO postgres;

--
-- TOC entry 948 (class 1255 OID 30313)
-- Name: calcul_the_geom_piege_ligne(); Type: FUNCTION; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE FUNCTION calcul_the_geom_piege_ligne() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN	
	 NEW.the_geom=ST_MakeLine(ST_SetSRID(ST_MakePoint(NEW.lon_debut,NEW.lat_debut),4326),ST_SetSRID(ST_MakePoint(NEW.lon_fin,NEW.lat_fin),4326));
RETURN NEW;
    END;

$$;


ALTER FUNCTION bdd_especes_introduites_faune.calcul_the_geom_piege_ligne() OWNER TO postgres;

--
-- TOC entry 949 (class 1255 OID 30314)
-- Name: trigg_pk_inventaire_piege_pose(); Type: FUNCTION; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE FUNCTION trigg_pk_inventaire_piege_pose() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_inventaire_piege_pose=(NEW.fk_code_manipe||'_'||NEW.num_piege||'_'||NEW.statut_piege);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION bdd_especes_introduites_faune.trigg_pk_inventaire_piege_pose() OWNER TO postgres;

--
-- TOC entry 950 (class 1255 OID 30315)
-- Name: trigg_pk_inventaire_piege_releve(); Type: FUNCTION; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE FUNCTION trigg_pk_inventaire_piege_releve() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_inventaire_piege_releve=(NEW.fk_inventaire_piege_pose||'_'||NEW.numero_passage||'_'||NEW.numero_releve);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION bdd_especes_introduites_faune.trigg_pk_inventaire_piege_releve() OWNER TO postgres;

--
-- TOC entry 951 (class 1255 OID 30316)
-- Name: trigg_pk_obsopportuniste_donnees_presenceabsence(); Type: FUNCTION; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE FUNCTION trigg_pk_obsopportuniste_donnees_presenceabsence() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_obsopportuniste_donnees_presenceabsence=(NEW.numero_observation||'_'||NEW.fk_espece||'_'||NEW.fk_site);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION bdd_especes_introduites_faune.trigg_pk_obsopportuniste_donnees_presenceabsence() OWNER TO postgres;

--
-- TOC entry 952 (class 1255 OID 30317)
-- Name: trigg_pk_obsopportuniste_donnees_terrain(); Type: FUNCTION; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE FUNCTION trigg_pk_obsopportuniste_donnees_terrain() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_obsopportuniste_donnees_terrain=(NEW.fk_obsopportuniste_donnees_presenceabsence||'_'||NEW.numero_indice);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION bdd_especes_introduites_faune.trigg_pk_obsopportuniste_donnees_terrain() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 350 (class 1259 OID 30318)
-- Name: inventaire_piege_ligne_coordonnees; Type: TABLE; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

CREATE TABLE inventaire_piege_ligne_coordonnees (
    fk_inventaire_piege_pose character varying(20) NOT NULL,
    lat_debut real,
    lon_debut real,
    lat_fin real,
    lon_fin real,
    nb_pieges smallint,
    position_pt_depart public.geometry(Point,4326),
    position_pt_fin public.geometry(Point,4326),
    the_geom public.geometry(LineString,4326)
);


ALTER TABLE bdd_especes_introduites_faune.inventaire_piege_ligne_coordonnees OWNER TO postgres;

--
-- TOC entry 351 (class 1259 OID 30324)
-- Name: inventaire_piege_ponctuel_coordonnees; Type: TABLE; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

CREATE TABLE inventaire_piege_ponctuel_coordonnees (
    fk_inventaire_piege_pose character varying(20) NOT NULL,
    latitude real,
    longitude real,
    the_geom public.geometry(Point,4326)
);


ALTER TABLE bdd_especes_introduites_faune.inventaire_piege_ponctuel_coordonnees OWNER TO postgres;

--
-- TOC entry 352 (class 1259 OID 30330)
-- Name: inventaire_piege_pose; Type: TABLE; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

CREATE TABLE inventaire_piege_pose (
    pk_inventaire_piege_pose character varying(20) NOT NULL,
    fk_code_manipe character varying(12),
    num_piege integer,
    statut_piege character(1),
    type_piege character varying(25),
    appat character varying(50),
    altitude real,
    habitat character varying(50),
    remarques text
);


ALTER TABLE bdd_especes_introduites_faune.inventaire_piege_pose OWNER TO postgres;

--
-- TOC entry 353 (class 1259 OID 30336)
-- Name: inventaire_piege_releve; Type: TABLE; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

CREATE TABLE inventaire_piege_releve (
    pk_inventaire_piege_releve character varying(20) NOT NULL,
    fk_code_manipe character varying(12),
    fk_inventaire_piege_pose character varying(20),
    numero_passage smallint,
    numero_releve smallint,
    absence_type_absence character varying(10),
    absence_nb_pieges smallint,
    presence_fk_espece character varying(50),
    presence_nb_captures smallint,
    presence_nb_echappes smallint,
    remarques text
);


ALTER TABLE bdd_especes_introduites_faune.inventaire_piege_releve OWNER TO postgres;

--
-- TOC entry 354 (class 1259 OID 30342)
-- Name: obsopportuniste_donnees_presenceabsence; Type: TABLE; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

CREATE TABLE obsopportuniste_donnees_presenceabsence (
    pk_obsopportuniste_donnees_presenceabsence character varying(100) NOT NULL,
    numero_observation integer NOT NULL,
    fk_espece character varying(50),
    fk_site character varying(100),
    programme character varying(30),
    etat_observation character varying(30),
    date_observation date,
    date_saisie_dans_bd date,
    numero_insertion smallint
);


ALTER TABLE bdd_especes_introduites_faune.obsopportuniste_donnees_presenceabsence OWNER TO postgres;

--
-- TOC entry 355 (class 1259 OID 30345)
-- Name: obsopportuniste_donnees_presenceabsence_numero_observation_seq; Type: SEQUENCE; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE SEQUENCE obsopportuniste_donnees_presenceabsence_numero_observation_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bdd_especes_introduites_faune.obsopportuniste_donnees_presenceabsence_numero_observation_seq OWNER TO postgres;

--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 355
-- Name: obsopportuniste_donnees_presenceabsence_numero_observation_seq; Type: SEQUENCE OWNED BY; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER SEQUENCE obsopportuniste_donnees_presenceabsence_numero_observation_seq OWNED BY obsopportuniste_donnees_presenceabsence.numero_observation;


--
-- TOC entry 356 (class 1259 OID 30347)
-- Name: obsopportuniste_donnees_terrain; Type: TABLE; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

CREATE TABLE obsopportuniste_donnees_terrain (
    pk_obsopportuniste_donnees_terrain character varying(100) NOT NULL,
    fk_obsopportuniste_donnees_presenceabsence character varying(100),
    observateur character varying(50),
    id_pt_gps character varying(20),
    origine_coordonnees character varying(30),
    latitude real,
    longitude real,
    the_geom public.geometry(Point,4326),
    remarques text,
    nature_observation character varying(20),
    indice_presence character varying(130),
    indice_recent_ancien character varying(20),
    nb_adultes smallint,
    nb_jeunes smallint,
    nb_indetermines smallint,
    numero_indice smallint
);


ALTER TABLE bdd_especes_introduites_faune.obsopportuniste_donnees_terrain OWNER TO postgres;

--
-- TOC entry 357 (class 1259 OID 30353)
-- Name: tb_especes_introduites; Type: TABLE; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_especes_introduites (
    pk_espece_vernaculaire character varying(50) NOT NULL,
    nom_scientifique character varying(30)
);


ALTER TABLE bdd_especes_introduites_faune.tb_especes_introduites OWNER TO postgres;

SET search_path = donnees_carto, pg_catalog;

--
-- TOC entry 337 (class 1259 OID 29916)
-- Name: toponymie_kerguelen; Type: TABLE; Schema: donnees_carto; Owner: postgres; Tablespace: 
--

CREATE TABLE toponymie_kerguelen (
    pk_nom_site character varying(100) NOT NULL,
    toponyme_site character varying(100),
    toponyme_type character varying(100),
    latitude_utm42s numeric(10,0),
    longitude_utm42s numeric(10,0),
    the_geom_point public.geometry(Point,32742),
    the_geom_polygon public.geometry(MultiPolygon,32742),
    source character varying(50)
);


ALTER TABLE donnees_carto.toponymie_kerguelen OWNER TO postgres;

SET search_path = bdd_especes_introduites_faune, pg_catalog;

--
-- TOC entry 358 (class 1259 OID 30356)
-- Name: vue_donnees_terrain; Type: VIEW; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE VIEW vue_donnees_terrain AS
 SELECT row_number() OVER (ORDER BY vue_donnees_terrain.date_observation) AS cle_primaire,
    vue_donnees_terrain.fk_espece,
    vue_donnees_terrain.pk_nom_site,
    vue_donnees_terrain.programme,
    vue_donnees_terrain.date_observation,
    vue_donnees_terrain.observateur,
    vue_donnees_terrain.origine_coordonnees,
    vue_donnees_terrain.latitude,
    vue_donnees_terrain.longitude,
    vue_donnees_terrain.the_geom,
    vue_donnees_terrain.remarques,
    vue_donnees_terrain.nature_observation,
    vue_donnees_terrain.indice_presence,
    vue_donnees_terrain.indice_recent_ancien,
    vue_donnees_terrain.nb_adultes,
    vue_donnees_terrain.nb_jeunes,
    vue_donnees_terrain.nb_indetermines
   FROM ( SELECT obsopportuniste_donnees_presenceabsence.fk_espece,
            toponymie_kerguelen.pk_nom_site,
            obsopportuniste_donnees_presenceabsence.programme,
            obsopportuniste_donnees_presenceabsence.date_observation,
            obsopportuniste_donnees_terrain.observateur,
            obsopportuniste_donnees_terrain.origine_coordonnees,
            obsopportuniste_donnees_terrain.latitude,
            obsopportuniste_donnees_terrain.longitude,
            obsopportuniste_donnees_terrain.the_geom,
            obsopportuniste_donnees_terrain.remarques,
            obsopportuniste_donnees_terrain.nature_observation,
            obsopportuniste_donnees_terrain.indice_presence,
            obsopportuniste_donnees_terrain.indice_recent_ancien,
            obsopportuniste_donnees_terrain.nb_adultes,
            obsopportuniste_donnees_terrain.nb_jeunes,
            obsopportuniste_donnees_terrain.nb_indetermines
           FROM ((obsopportuniste_donnees_terrain
             LEFT JOIN obsopportuniste_donnees_presenceabsence ON (((obsopportuniste_donnees_presenceabsence.pk_obsopportuniste_donnees_presenceabsence)::text = (obsopportuniste_donnees_terrain.fk_obsopportuniste_donnees_presenceabsence)::text)))
             LEFT JOIN donnees_carto.toponymie_kerguelen ON (((toponymie_kerguelen.pk_nom_site)::text = (obsopportuniste_donnees_presenceabsence.fk_site)::text)))) vue_donnees_terrain;


ALTER TABLE bdd_especes_introduites_faune.vue_donnees_terrain OWNER TO postgres;

--
-- TOC entry 360 (class 1259 OID 30443)
-- Name: vue_inventaire_piege; Type: VIEW; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE VIEW vue_inventaire_piege AS
 SELECT row_number() OVER (ORDER BY vue_inventaire_piege.num_piege, vue_inventaire_piege.numero_passage) AS cle_primaire,
    vue_inventaire_piege.pk_inventaire_piege_pose,
    vue_inventaire_piege.num_piege,
    vue_inventaire_piege.district,
    vue_inventaire_piege.fk_site,
    vue_inventaire_piege.saison,
    vue_inventaire_piege.statut_piege,
    vue_inventaire_piege.type_piege,
    vue_inventaire_piege.appat,
    vue_inventaire_piege.altitude,
    vue_inventaire_piege.habitat,
    vue_inventaire_piege.numero_passage,
    vue_inventaire_piege.lat_debut,
    vue_inventaire_piege.lon_debut,
    vue_inventaire_piege.lat_fin,
    vue_inventaire_piege.lon_fin,
    vue_inventaire_piege.latitude,
    vue_inventaire_piege.longitude,
    vue_inventaire_piege.nb_pieges,
    vue_inventaire_piege.date_pose,
    vue_inventaire_piege.date_releve,
    vue_inventaire_piege.numero_releve,
    vue_inventaire_piege.absence_type_absence,
    vue_inventaire_piege.absence_nb_pieges,
    vue_inventaire_piege.presence_fk_espece,
    vue_inventaire_piege.presence_nb_captures,
    vue_inventaire_piege.presence_nb_echappes,
    vue_inventaire_piege.remarques,
    vue_inventaire_piege.visibilite,
    vue_inventaire_piege.vent,
    vue_inventaire_piege.couverture_nuageuse,
    vue_inventaire_piege.precipitations,
    vue_inventaire_piege.couverture_neigeuse_au_sol,
    vue_inventaire_piege.lune,
    vue_inventaire_piege.the_geom_ligne,
    vue_inventaire_piege.the_geom_ponctuel
   FROM ( SELECT inventaire_piege_pose.pk_inventaire_piege_pose,
            inventaire_piege_pose.num_piege,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.saison,
            inventaire_piege_pose.statut_piege,
            inventaire_piege_pose.type_piege,
            inventaire_piege_pose.appat,
            inventaire_piege_pose.altitude,
            inventaire_piege_pose.habitat,
            0 AS numero_passage,
            inventaire_piege_ligne_coordonnees.lat_debut,
            inventaire_piege_ligne_coordonnees.lon_debut,
            inventaire_piege_ligne_coordonnees.lat_fin,
            inventaire_piege_ligne_coordonnees.lon_fin,
            inventaire_piege_ponctuel_coordonnees.latitude,
            inventaire_piege_ponctuel_coordonnees.longitude,
            inventaire_piege_ligne_coordonnees.nb_pieges,
            tb_manipe_metadonnees.date_manipe AS date_pose,
            NULL::date AS date_releve,
            NULL::smallint AS numero_releve,
            NULL::character varying(10) AS absence_type_absence,
            NULL::smallint AS absence_nb_pieges,
            NULL::character varying(10) AS presence_fk_espece,
            NULL::smallint AS presence_nb_captures,
            NULL::smallint AS presence_nb_echappes,
            NULL::text AS remarques,
            tb_meteo.visibilite,
            tb_meteo.vent,
            tb_meteo.couverture_nuageuse,
            tb_meteo.precipitations,
            tb_meteo.couverture_neigeuse_au_sol,
            tb_meteo.lune,
            inventaire_piege_ligne_coordonnees.the_geom AS the_geom_ligne,
            inventaire_piege_ponctuel_coordonnees.the_geom AS the_geom_ponctuel
           FROM ((((inventaire_piege_pose
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (inventaire_piege_pose.fk_code_manipe)::text)))
             LEFT JOIN ornithologie.tb_meteo ON (((tb_meteo.pk_tb_meteo)::text = (tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text)))
             LEFT JOIN inventaire_piege_ligne_coordonnees ON (((inventaire_piege_ligne_coordonnees.fk_inventaire_piege_pose)::text = (inventaire_piege_pose.pk_inventaire_piege_pose)::text)))
             LEFT JOIN inventaire_piege_ponctuel_coordonnees ON (((inventaire_piege_ponctuel_coordonnees.fk_inventaire_piege_pose)::text = (inventaire_piege_pose.pk_inventaire_piege_pose)::text)))
        UNION
         SELECT inventaire_piege_pose.pk_inventaire_piege_pose,
            inventaire_piege_pose.num_piege,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.saison,
            inventaire_piege_pose.statut_piege,
            inventaire_piege_pose.type_piege,
            inventaire_piege_pose.appat,
            inventaire_piege_pose.altitude,
            inventaire_piege_pose.habitat,
            inventaire_piege_releve.numero_passage,
            inventaire_piege_ligne_coordonnees.lat_debut,
            inventaire_piege_ligne_coordonnees.lon_debut,
            inventaire_piege_ligne_coordonnees.lat_fin,
            inventaire_piege_ligne_coordonnees.lon_fin,
            NULL::real AS latitude,
            NULL::real AS longitude,
            inventaire_piege_ligne_coordonnees.nb_pieges,
            NULL::date AS date_pose,
            tb_manipe_metadonnees.date_manipe AS date_releve,
            inventaire_piege_releve.numero_releve,
            inventaire_piege_releve.absence_type_absence,
            inventaire_piege_releve.absence_nb_pieges,
            inventaire_piege_releve.presence_fk_espece,
            inventaire_piege_releve.presence_nb_captures,
            inventaire_piege_releve.presence_nb_echappes,
            inventaire_piege_releve.remarques,
            tb_meteo.visibilite,
            tb_meteo.vent,
            tb_meteo.couverture_nuageuse,
            tb_meteo.precipitations,
            tb_meteo.couverture_neigeuse_au_sol,
            tb_meteo.lune,
            NULL::public.geometry AS the_geom_ligne,
            NULL::public.geometry AS the_geom_ponctuel
           FROM ((((inventaire_piege_releve
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (inventaire_piege_releve.fk_code_manipe)::text)))
             LEFT JOIN inventaire_piege_pose ON (((inventaire_piege_pose.pk_inventaire_piege_pose)::text = (inventaire_piege_releve.fk_inventaire_piege_pose)::text)))
             LEFT JOIN ornithologie.tb_meteo ON (((tb_meteo.pk_tb_meteo)::text = (tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text)))
             LEFT JOIN inventaire_piege_ligne_coordonnees ON (((inventaire_piege_ligne_coordonnees.fk_inventaire_piege_pose)::text = (inventaire_piege_pose.pk_inventaire_piege_pose)::text)))) vue_inventaire_piege;


ALTER TABLE bdd_especes_introduites_faune.vue_inventaire_piege OWNER TO postgres;

--
-- TOC entry 359 (class 1259 OID 30361)
-- Name: vue_presence_iles_especes; Type: VIEW; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE VIEW vue_presence_iles_especes AS
 SELECT row_number() OVER (ORDER BY vue_presence_iles_especes.date_observation) AS cle_primaire,
    vue_presence_iles_especes.fk_espece,
    vue_presence_iles_especes.pk_nom_site,
    vue_presence_iles_especes.programme,
    vue_presence_iles_especes.date_observation,
    vue_presence_iles_especes.etat_observation,
    vue_presence_iles_especes.protocole,
    vue_presence_iles_especes.the_geom_polygon
   FROM ( SELECT obsopportuniste_donnees_presenceabsence.fk_espece,
            toponymie_kerguelen.pk_nom_site,
            obsopportuniste_donnees_presenceabsence.programme,
            obsopportuniste_donnees_presenceabsence.date_observation,
            obsopportuniste_donnees_presenceabsence.etat_observation,
            'observations_opportunistes'::text AS protocole,
            toponymie_kerguelen.the_geom_polygon
           FROM (obsopportuniste_donnees_presenceabsence
             LEFT JOIN donnees_carto.toponymie_kerguelen ON (((toponymie_kerguelen.pk_nom_site)::text = (obsopportuniste_donnees_presenceabsence.fk_site)::text)))
        UNION
         SELECT inventaire_piege_releve.presence_fk_espece AS fk_espece,
            tb_manipe_metadonnees.fk_site AS pk_nom_site,
            'RN'::character varying(30) AS programme,
            tb_manipe_metadonnees.date_manipe AS date_observation,
            'presente'::character varying(30) AS etat_observation,
            'inventaire'::text AS protocole,
            toponymie_kerguelen.the_geom_polygon
           FROM ((inventaire_piege_releve
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((inventaire_piege_releve.fk_code_manipe)::text = (tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text)))
             LEFT JOIN donnees_carto.toponymie_kerguelen ON (((toponymie_kerguelen.pk_nom_site)::text = (tb_manipe_metadonnees.fk_site)::text)))
          WHERE (inventaire_piege_releve.presence_fk_espece IS NOT NULL)) vue_presence_iles_especes;


ALTER TABLE bdd_especes_introduites_faune.vue_presence_iles_especes OWNER TO postgres;

SET search_path = donnees_carto, pg_catalog;

--
-- TOC entry 336 (class 1259 OID 29887)
-- Name: contours_districts; Type: TABLE; Schema: donnees_carto; Owner: postgres; Tablespace: 
--

CREATE TABLE contours_districts (
    gid integer NOT NULL,
    nom character varying(100),
    district character varying(3),
    the_geom public.geometry(MultiPolygon,4326)
);


ALTER TABLE donnees_carto.contours_districts OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 17897)
-- Name: contours_kerguelen; Type: TABLE; Schema: donnees_carto; Owner: postgres; Tablespace: 
--

CREATE TABLE contours_kerguelen (
    gid integer NOT NULL,
    name character varying(80),
    the_geom public.geometry(MultiPolygon,32742)
);


ALTER TABLE donnees_carto.contours_kerguelen OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 17895)
-- Name: contours_kerguelen_gid_seq; Type: SEQUENCE; Schema: donnees_carto; Owner: postgres
--

CREATE SEQUENCE contours_kerguelen_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE donnees_carto.contours_kerguelen_gid_seq OWNER TO postgres;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 276
-- Name: contours_kerguelen_gid_seq; Type: SEQUENCE OWNED BY; Schema: donnees_carto; Owner: postgres
--

ALTER SEQUENCE contours_kerguelen_gid_seq OWNED BY contours_kerguelen.gid;


--
-- TOC entry 279 (class 1259 OID 17908)
-- Name: kerguelen_lacs; Type: TABLE; Schema: donnees_carto; Owner: postgres; Tablespace: 
--

CREATE TABLE kerguelen_lacs (
    gid integer NOT NULL,
    area numeric,
    perimeter numeric,
    the_geom public.geometry(MultiPolygonZM,32742)
);


ALTER TABLE donnees_carto.kerguelen_lacs OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 17906)
-- Name: kerguelen_lacs_gid_seq; Type: SEQUENCE; Schema: donnees_carto; Owner: postgres
--

CREATE SEQUENCE kerguelen_lacs_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE donnees_carto.kerguelen_lacs_gid_seq OWNER TO postgres;

--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 278
-- Name: kerguelen_lacs_gid_seq; Type: SEQUENCE OWNED BY; Schema: donnees_carto; Owner: postgres
--

ALTER SEQUENCE kerguelen_lacs_gid_seq OWNED BY kerguelen_lacs.gid;


SET search_path = bdd_especes_introduites_faune, pg_catalog;

--
-- TOC entry 3163 (class 2604 OID 30366)
-- Name: numero_observation; Type: DEFAULT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY obsopportuniste_donnees_presenceabsence ALTER COLUMN numero_observation SET DEFAULT nextval('obsopportuniste_donnees_presenceabsence_numero_observation_seq'::regclass);


SET search_path = donnees_carto, pg_catalog;

--
-- TOC entry 3161 (class 2604 OID 17900)
-- Name: gid; Type: DEFAULT; Schema: donnees_carto; Owner: postgres
--

ALTER TABLE ONLY contours_kerguelen ALTER COLUMN gid SET DEFAULT nextval('contours_kerguelen_gid_seq'::regclass);


--
-- TOC entry 3162 (class 2604 OID 17911)
-- Name: gid; Type: DEFAULT; Schema: donnees_carto; Owner: postgres
--

ALTER TABLE ONLY kerguelen_lacs ALTER COLUMN gid SET DEFAULT nextval('kerguelen_lacs_gid_seq'::regclass);


SET search_path = bdd_especes_introduites_faune, pg_catalog;

--
-- TOC entry 3171 (class 2606 OID 30368)
-- Name: inventaire_piege_ligne_coordonnees_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inventaire_piege_ligne_coordonnees
    ADD CONSTRAINT inventaire_piege_ligne_coordonnees_pkey PRIMARY KEY (fk_inventaire_piege_pose);


--
-- TOC entry 3173 (class 2606 OID 30370)
-- Name: inventaire_piege_ponctuel_coordonnees_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inventaire_piege_ponctuel_coordonnees
    ADD CONSTRAINT inventaire_piege_ponctuel_coordonnees_pkey PRIMARY KEY (fk_inventaire_piege_pose);


--
-- TOC entry 3175 (class 2606 OID 30372)
-- Name: inventaire_piege_pose_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inventaire_piege_pose
    ADD CONSTRAINT inventaire_piege_pose_pkey PRIMARY KEY (pk_inventaire_piege_pose);


--
-- TOC entry 3177 (class 2606 OID 30374)
-- Name: inventaire_piege_releve_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inventaire_piege_releve
    ADD CONSTRAINT inventaire_piege_releve_pkey PRIMARY KEY (pk_inventaire_piege_releve);


--
-- TOC entry 3179 (class 2606 OID 30376)
-- Name: obsopportuniste_donnees_presenceabsence_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY obsopportuniste_donnees_presenceabsence
    ADD CONSTRAINT obsopportuniste_donnees_presenceabsence_pkey PRIMARY KEY (pk_obsopportuniste_donnees_presenceabsence);


--
-- TOC entry 3181 (class 2606 OID 30378)
-- Name: obsopportuniste_donnees_terrain_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY obsopportuniste_donnees_terrain
    ADD CONSTRAINT obsopportuniste_donnees_terrain_pkey PRIMARY KEY (pk_obsopportuniste_donnees_terrain);


--
-- TOC entry 3183 (class 2606 OID 30380)
-- Name: tb_especes_introduites_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_especes_introduites
    ADD CONSTRAINT tb_especes_introduites_pkey PRIMARY KEY (pk_espece_vernaculaire);


SET search_path = donnees_carto, pg_catalog;

--
-- TOC entry 3165 (class 2606 OID 17905)
-- Name: contours_kerguelen_pkey; Type: CONSTRAINT; Schema: donnees_carto; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contours_kerguelen
    ADD CONSTRAINT contours_kerguelen_pkey PRIMARY KEY (gid);


--
-- TOC entry 3167 (class 2606 OID 17916)
-- Name: kerguelen_lacs_pkey; Type: CONSTRAINT; Schema: donnees_carto; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kerguelen_lacs
    ADD CONSTRAINT kerguelen_lacs_pkey PRIMARY KEY (gid);


--
-- TOC entry 3169 (class 2606 OID 29923)
-- Name: toponymie_kerguelen_pkey; Type: CONSTRAINT; Schema: donnees_carto; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY toponymie_kerguelen
    ADD CONSTRAINT toponymie_kerguelen_pkey PRIMARY KEY (pk_nom_site);


SET search_path = bdd_especes_introduites_faune, pg_catalog;

--
-- TOC entry 3193 (class 2620 OID 30381)
-- Name: calcul_position_pt_depart; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER calcul_position_pt_depart BEFORE INSERT OR UPDATE ON inventaire_piege_ligne_coordonnees FOR EACH ROW EXECUTE PROCEDURE calcul_position_pt_depart();


--
-- TOC entry 3194 (class 2620 OID 30382)
-- Name: calcul_position_pt_fin; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER calcul_position_pt_fin BEFORE INSERT OR UPDATE ON inventaire_piege_ligne_coordonnees FOR EACH ROW EXECUTE PROCEDURE calcul_position_pt_fin();


--
-- TOC entry 3200 (class 2620 OID 30383)
-- Name: calcul_the_geom; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER calcul_the_geom BEFORE INSERT OR UPDATE ON obsopportuniste_donnees_terrain FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3196 (class 2620 OID 30384)
-- Name: calcul_the_geom; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER calcul_the_geom BEFORE INSERT OR UPDATE ON inventaire_piege_ponctuel_coordonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3195 (class 2620 OID 30385)
-- Name: calcul_the_geom_piege_ligne; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_piege_ligne BEFORE INSERT OR UPDATE ON inventaire_piege_ligne_coordonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom_piege_ligne();


--
-- TOC entry 3197 (class 2620 OID 30386)
-- Name: trigg_pk_inventaire_piege_pose; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER trigg_pk_inventaire_piege_pose BEFORE INSERT OR UPDATE ON inventaire_piege_pose FOR EACH ROW EXECUTE PROCEDURE trigg_pk_inventaire_piege_pose();


--
-- TOC entry 3198 (class 2620 OID 30387)
-- Name: trigg_pk_inventaire_piege_releve; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER trigg_pk_inventaire_piege_releve BEFORE INSERT OR UPDATE ON inventaire_piege_releve FOR EACH ROW EXECUTE PROCEDURE trigg_pk_inventaire_piege_releve();


--
-- TOC entry 3199 (class 2620 OID 30388)
-- Name: trigg_pk_obsopportuniste_donnees_presenceabsence; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER trigg_pk_obsopportuniste_donnees_presenceabsence BEFORE INSERT OR UPDATE ON obsopportuniste_donnees_presenceabsence FOR EACH ROW EXECUTE PROCEDURE trigg_pk_obsopportuniste_donnees_presenceabsence();


--
-- TOC entry 3201 (class 2620 OID 30389)
-- Name: trigg_pk_obsopportuniste_donnees_terrain; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER trigg_pk_obsopportuniste_donnees_terrain BEFORE INSERT OR UPDATE ON obsopportuniste_donnees_terrain FOR EACH ROW EXECUTE PROCEDURE trigg_pk_obsopportuniste_donnees_terrain();


--
-- TOC entry 3184 (class 2606 OID 30390)
-- Name: inventaire_piege_ligne_coordonnee_fk_inventaire_piege_pose_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY inventaire_piege_ligne_coordonnees
    ADD CONSTRAINT inventaire_piege_ligne_coordonnee_fk_inventaire_piege_pose_fkey FOREIGN KEY (fk_inventaire_piege_pose) REFERENCES inventaire_piege_pose(pk_inventaire_piege_pose) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3185 (class 2606 OID 30395)
-- Name: inventaire_piege_ponctuel_coordon_fk_inventaire_piege_pose_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY inventaire_piege_ponctuel_coordonnees
    ADD CONSTRAINT inventaire_piege_ponctuel_coordon_fk_inventaire_piege_pose_fkey FOREIGN KEY (fk_inventaire_piege_pose) REFERENCES inventaire_piege_pose(pk_inventaire_piege_pose) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3186 (class 2606 OID 30400)
-- Name: inventaire_piege_pose_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY inventaire_piege_pose
    ADD CONSTRAINT inventaire_piege_pose_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES ornithologie.tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3189 (class 2606 OID 30405)
-- Name: inventaire_piege_releve_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY inventaire_piege_releve
    ADD CONSTRAINT inventaire_piege_releve_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES ornithologie.tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3188 (class 2606 OID 30410)
-- Name: inventaire_piege_releve_fk_inventaire_piege_pose_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY inventaire_piege_releve
    ADD CONSTRAINT inventaire_piege_releve_fk_inventaire_piege_pose_fkey FOREIGN KEY (fk_inventaire_piege_pose) REFERENCES inventaire_piege_pose(pk_inventaire_piege_pose) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3187 (class 2606 OID 30415)
-- Name: inventaire_piege_releve_presence_fk_espece_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY inventaire_piege_releve
    ADD CONSTRAINT inventaire_piege_releve_presence_fk_espece_fkey FOREIGN KEY (presence_fk_espece) REFERENCES tb_especes_introduites(pk_espece_vernaculaire) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3191 (class 2606 OID 30420)
-- Name: obsopportuniste_donnees_presenceabsence_fk_espece_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY obsopportuniste_donnees_presenceabsence
    ADD CONSTRAINT obsopportuniste_donnees_presenceabsence_fk_espece_fkey FOREIGN KEY (fk_espece) REFERENCES tb_especes_introduites(pk_espece_vernaculaire) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3190 (class 2606 OID 30425)
-- Name: obsopportuniste_donnees_presenceabsence_fk_site_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY obsopportuniste_donnees_presenceabsence
    ADD CONSTRAINT obsopportuniste_donnees_presenceabsence_fk_site_fkey FOREIGN KEY (fk_site) REFERENCES donnees_carto.toponymie_kerguelen(pk_nom_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3192 (class 2606 OID 30430)
-- Name: obsopportuniste_donnees_terra_fk_obsopportuniste_donnees_p_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY obsopportuniste_donnees_terrain
    ADD CONSTRAINT obsopportuniste_donnees_terra_fk_obsopportuniste_donnees_p_fkey FOREIGN KEY (fk_obsopportuniste_donnees_presenceabsence) REFERENCES obsopportuniste_donnees_presenceabsence(pk_obsopportuniste_donnees_presenceabsence) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 12
-- Name: donnees_carto; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA donnees_carto FROM PUBLIC;
REVOKE ALL ON SCHEMA donnees_carto FROM postgres;
GRANT ALL ON SCHEMA donnees_carto TO postgres;
GRANT USAGE ON SCHEMA donnees_carto TO bddrntaaf_visualisation;


SET search_path = donnees_carto, pg_catalog;

--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 277
-- Name: contours_kerguelen; Type: ACL; Schema: donnees_carto; Owner: postgres
--

REVOKE ALL ON TABLE contours_kerguelen FROM PUBLIC;
REVOKE ALL ON TABLE contours_kerguelen FROM postgres;
GRANT ALL ON TABLE contours_kerguelen TO postgres;
GRANT SELECT ON TABLE contours_kerguelen TO bddrntaaf_visualisation;


--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 279
-- Name: kerguelen_lacs; Type: ACL; Schema: donnees_carto; Owner: postgres
--

REVOKE ALL ON TABLE kerguelen_lacs FROM PUBLIC;
REVOKE ALL ON TABLE kerguelen_lacs FROM postgres;
GRANT ALL ON TABLE kerguelen_lacs TO postgres;
GRANT SELECT ON TABLE kerguelen_lacs TO bddrntaaf_visualisation;


-- Completed on 2015-03-20 15:07:12 RET

--
-- PostgreSQL database dump complete
--

