--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-03-20 15:03:24 RET

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
-- TOC entry 10 (class 2615 OID 17753)
-- Name: demande_manipulation_especes; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA demande_manipulation_especes;


ALTER SCHEMA demande_manipulation_especes OWNER TO postgres;

--
-- TOC entry 12 (class 2615 OID 17894)
-- Name: donnees_carto; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA donnees_carto;


ALTER SCHEMA donnees_carto OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 17126)
-- Name: frequentations_autorisations_ams; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA frequentations_autorisations_ams;


ALTER SCHEMA frequentations_autorisations_ams OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 17127)
-- Name: frequentations_autorisations_cro; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA frequentations_autorisations_cro;


ALTER SCHEMA frequentations_autorisations_cro OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 17128)
-- Name: frequentations_autorisations_ker; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA frequentations_autorisations_ker;


ALTER SCHEMA frequentations_autorisations_ker OWNER TO postgres;

--
-- TOC entry 13 (class 2615 OID 28730)
-- Name: ornithologie; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ornithologie;


ALTER SCHEMA ornithologie OWNER TO postgres;

--
-- TOC entry 11 (class 2615 OID 17849)
-- Name: phylica_amsterdam; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA phylica_amsterdam;


ALTER SCHEMA phylica_amsterdam OWNER TO postgres;

--
-- TOC entry 14 (class 2615 OID 30007)
-- Name: vues_ornithologie; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA vues_ornithologie;


ALTER SCHEMA vues_ornithologie OWNER TO postgres;

--
-- TOC entry 363 (class 3079 OID 11797)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 4071 (class 0 OID 0)
-- Dependencies: 363
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 1341 (class 0 OID 0)
-- Name: box2d; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box2d;


--
-- TOC entry 400 (class 1255 OID 16422)
-- Name: box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_in(cstring) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX2D_in';


ALTER FUNCTION public.box2d_in(cstring) OWNER TO postgres;

--
-- TOC entry 401 (class 1255 OID 16423)
-- Name: box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_out(box2d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX2D_out';


ALTER FUNCTION public.box2d_out(box2d) OWNER TO postgres;

--
-- TOC entry 1340 (class 1247 OID 16421)
-- Name: box2d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box2d (
    INTERNALLENGTH = 65,
    INPUT = box2d_in,
    OUTPUT = box2d_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.box2d OWNER TO postgres;

--
-- TOC entry 1345 (class 0 OID 0)
-- Name: box2df; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box2df;


--
-- TOC entry 402 (class 1255 OID 16426)
-- Name: box2df_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2df_in(cstring) RETURNS box2df
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'box2df_in';


ALTER FUNCTION public.box2df_in(cstring) OWNER TO postgres;

--
-- TOC entry 403 (class 1255 OID 16427)
-- Name: box2df_out(box2df); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2df_out(box2df) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'box2df_out';


ALTER FUNCTION public.box2df_out(box2df) OWNER TO postgres;

--
-- TOC entry 1344 (class 1247 OID 16425)
-- Name: box2df; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box2df (
    INTERNALLENGTH = 16,
    INPUT = box2df_in,
    OUTPUT = box2df_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.box2df OWNER TO postgres;

--
-- TOC entry 1337 (class 0 OID 0)
-- Name: box3d; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box3d;


--
-- TOC entry 398 (class 1255 OID 16418)
-- Name: box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d_in(cstring) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX3D_in';


ALTER FUNCTION public.box3d_in(cstring) OWNER TO postgres;

--
-- TOC entry 399 (class 1255 OID 16419)
-- Name: box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d_out(box3d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX3D_out';


ALTER FUNCTION public.box3d_out(box3d) OWNER TO postgres;

--
-- TOC entry 1336 (class 1247 OID 16417)
-- Name: box3d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box3d (
    INTERNALLENGTH = 52,
    INPUT = box3d_in,
    OUTPUT = box3d_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.box3d OWNER TO postgres;

--
-- TOC entry 1375 (class 0 OID 0)
-- Name: geography; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geography;


--
-- TOC entry 818 (class 1255 OID 16949)
-- Name: geography_analyze(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_analyze(internal) RETURNS boolean
    LANGUAGE c STRICT
    AS '$libdir/postgis-2.1', 'gserialized_analyze_nd';


ALTER FUNCTION public.geography_analyze(internal) OWNER TO postgres;

--
-- TOC entry 814 (class 1255 OID 16945)
-- Name: geography_in(cstring, oid, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_in(cstring, oid, integer) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_in';


ALTER FUNCTION public.geography_in(cstring, oid, integer) OWNER TO postgres;

--
-- TOC entry 815 (class 1255 OID 16946)
-- Name: geography_out(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_out(geography) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_out';


ALTER FUNCTION public.geography_out(geography) OWNER TO postgres;

--
-- TOC entry 816 (class 1255 OID 16947)
-- Name: geography_recv(internal, oid, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_recv(internal, oid, integer) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_recv';


ALTER FUNCTION public.geography_recv(internal, oid, integer) OWNER TO postgres;

--
-- TOC entry 817 (class 1255 OID 16948)
-- Name: geography_send(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_send(geography) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_send';


ALTER FUNCTION public.geography_send(geography) OWNER TO postgres;

--
-- TOC entry 812 (class 1255 OID 16942)
-- Name: geography_typmod_in(cstring[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_typmod_in(cstring[]) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_typmod_in';


ALTER FUNCTION public.geography_typmod_in(cstring[]) OWNER TO postgres;

--
-- TOC entry 813 (class 1255 OID 16943)
-- Name: geography_typmod_out(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_typmod_out(integer) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'postgis_typmod_out';


ALTER FUNCTION public.geography_typmod_out(integer) OWNER TO postgres;

--
-- TOC entry 1374 (class 1247 OID 16944)
-- Name: geography; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geography (
    INTERNALLENGTH = variable,
    INPUT = geography_in,
    OUTPUT = geography_out,
    RECEIVE = geography_recv,
    SEND = geography_send,
    TYPMOD_IN = geography_typmod_in,
    TYPMOD_OUT = geography_typmod_out,
    ANALYZE = geography_analyze,
    DELIMITER = ':',
    ALIGNMENT = double,
    STORAGE = main
);


ALTER TYPE public.geography OWNER TO postgres;

--
-- TOC entry 1333 (class 0 OID 0)
-- Name: geometry; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geometry;


--
-- TOC entry 386 (class 1255 OID 16395)
-- Name: geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_analyze(internal) RETURNS boolean
    LANGUAGE c STRICT
    AS '$libdir/postgis-2.1', 'gserialized_analyze_nd';


ALTER FUNCTION public.geometry_analyze(internal) OWNER TO postgres;

--
-- TOC entry 382 (class 1255 OID 16391)
-- Name: geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_in(cstring) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_in';


ALTER FUNCTION public.geometry_in(cstring) OWNER TO postgres;

--
-- TOC entry 383 (class 1255 OID 16392)
-- Name: geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_out(geometry) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_out';


ALTER FUNCTION public.geometry_out(geometry) OWNER TO postgres;

--
-- TOC entry 387 (class 1255 OID 16396)
-- Name: geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_recv(internal) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_recv';


ALTER FUNCTION public.geometry_recv(internal) OWNER TO postgres;

--
-- TOC entry 388 (class 1255 OID 16397)
-- Name: geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_send(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_send';


ALTER FUNCTION public.geometry_send(geometry) OWNER TO postgres;

--
-- TOC entry 384 (class 1255 OID 16393)
-- Name: geometry_typmod_in(cstring[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_typmod_in(cstring[]) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geometry_typmod_in';


ALTER FUNCTION public.geometry_typmod_in(cstring[]) OWNER TO postgres;

--
-- TOC entry 385 (class 1255 OID 16394)
-- Name: geometry_typmod_out(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_typmod_out(integer) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'postgis_typmod_out';


ALTER FUNCTION public.geometry_typmod_out(integer) OWNER TO postgres;

--
-- TOC entry 1332 (class 1247 OID 16390)
-- Name: geometry; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geometry (
    INTERNALLENGTH = variable,
    INPUT = geometry_in,
    OUTPUT = geometry_out,
    RECEIVE = geometry_recv,
    SEND = geometry_send,
    TYPMOD_IN = geometry_typmod_in,
    TYPMOD_OUT = geometry_typmod_out,
    ANALYZE = geometry_analyze,
    DELIMITER = ':',
    ALIGNMENT = double,
    STORAGE = main
);


ALTER TYPE public.geometry OWNER TO postgres;

--
-- TOC entry 1352 (class 1247 OID 16647)
-- Name: geometry_dump; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geometry_dump AS (
	path integer[],
	geom geometry
);


ALTER TYPE public.geometry_dump OWNER TO postgres;

--
-- TOC entry 1349 (class 0 OID 0)
-- Name: gidx; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gidx;


--
-- TOC entry 404 (class 1255 OID 16430)
-- Name: gidx_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gidx_in(cstring) RETURNS gidx
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gidx_in';


ALTER FUNCTION public.gidx_in(cstring) OWNER TO postgres;

--
-- TOC entry 405 (class 1255 OID 16431)
-- Name: gidx_out(gidx); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gidx_out(gidx) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gidx_out';


ALTER FUNCTION public.gidx_out(gidx) OWNER TO postgres;

--
-- TOC entry 1348 (class 1247 OID 16429)
-- Name: gidx; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gidx (
    INTERNALLENGTH = variable,
    INPUT = gidx_in,
    OUTPUT = gidx_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.gidx OWNER TO postgres;

--
-- TOC entry 1371 (class 0 OID 0)
-- Name: pgis_abs; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE pgis_abs;


--
-- TOC entry 651 (class 1255 OID 16775)
-- Name: pgis_abs_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_abs_in(cstring) RETURNS pgis_abs
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'pgis_abs_in';


ALTER FUNCTION public.pgis_abs_in(cstring) OWNER TO postgres;

--
-- TOC entry 652 (class 1255 OID 16776)
-- Name: pgis_abs_out(pgis_abs); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_abs_out(pgis_abs) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'pgis_abs_out';


ALTER FUNCTION public.pgis_abs_out(pgis_abs) OWNER TO postgres;

--
-- TOC entry 1370 (class 1247 OID 16774)
-- Name: pgis_abs; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE pgis_abs (
    INTERNALLENGTH = 8,
    INPUT = pgis_abs_in,
    OUTPUT = pgis_abs_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.pgis_abs OWNER TO postgres;

--
-- TOC entry 1329 (class 0 OID 0)
-- Name: spheroid; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE spheroid;


--
-- TOC entry 380 (class 1255 OID 16387)
-- Name: spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spheroid_in(cstring) RETURNS spheroid
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ellipsoid_in';


ALTER FUNCTION public.spheroid_in(cstring) OWNER TO postgres;

--
-- TOC entry 381 (class 1255 OID 16388)
-- Name: spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spheroid_out(spheroid) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ellipsoid_out';


ALTER FUNCTION public.spheroid_out(spheroid) OWNER TO postgres;

--
-- TOC entry 1328 (class 1247 OID 16386)
-- Name: spheroid; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE spheroid (
    INTERNALLENGTH = 65,
    INPUT = spheroid_in,
    OUTPUT = spheroid_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.spheroid OWNER TO postgres;

--
-- TOC entry 1367 (class 1247 OID 16745)
-- Name: valid_detail; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE valid_detail AS (
	valid boolean,
	reason character varying,
	location geometry
);


ALTER TYPE public.valid_detail OWNER TO postgres;

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

SET search_path = frequentations_autorisations_ams, pg_catalog;

--
-- TOC entry 940 (class 1255 OID 17129)
-- Name: calcul_code_equipier(); Type: FUNCTION; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE FUNCTION calcul_code_equipier() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$ BEGIN
    IF (select EXISTS(select code_equipier FROM frequentations_autorisations_ams.equipiers WHERE equipiers.code_equipier=(NEW.nom||' '||NEW.prenom))=false)
       THEN NEW.code_equipier=NEW.nom||' '||NEW.prenom;
        RETURN NEW;
    ELSE NEW.code_equipier=NEW.nom||' '||NEW.prenom||'_'||NEW.numero; 
    RETURN NEW;
    END IF;
    RETURN NULL;
    END;
$$;


ALTER FUNCTION frequentations_autorisations_ams.calcul_code_equipier() OWNER TO postgres;

--
-- TOC entry 955 (class 1255 OID 17130)
-- Name: calcul_nbjours_presence(); Type: FUNCTION; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE FUNCTION calcul_nbjours_presence() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
IF (NEW.date_fin-NEW.date_debut<>0 AND NEW.zone_presence<>5)
       THEN NEW.nbjours_presence=NEW.date_fin-NEW.date_debut;
        RETURN NEW;
-- pour les falaises d'entrecasteaux, on ne compte pas le jour d'arrivée ni le jour de départ
ELSIF  (NEW.date_fin-NEW.date_debut<>0 AND NEW.zone_presence=5)
       THEN NEW.nbjours_presence=NEW.date_fin-NEW.date_debut-1;
        RETURN NEW;
ELSE NEW.nbjours_presence=1;
RETURN NEW;
END IF;
RETURN NULL;
    END;

$$;


ALTER FUNCTION frequentations_autorisations_ams.calcul_nbjours_presence() OWNER TO postgres;

SET search_path = frequentations_autorisations_cro, pg_catalog;

--
-- TOC entry 941 (class 1255 OID 17131)
-- Name: calcul_code_equipier(); Type: FUNCTION; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE FUNCTION calcul_code_equipier() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
    IF (select EXISTS(select code_equipier FROM frequentations_autorisations_cro.equipiers WHERE equipiers.code_equipier=(NEW.nom||' '||NEW.prenom))=false)
       THEN NEW.code_equipier=NEW.nom||' '||NEW.prenom;
        RETURN NEW;
    ELSE NEW.code_equipier=NEW.nom||' '||NEW.prenom||'_'||NEW.numero; 
    RETURN NEW;
    END IF;
    RETURN NULL;
    END;

$$;


ALTER FUNCTION frequentations_autorisations_cro.calcul_code_equipier() OWNER TO postgres;

--
-- TOC entry 942 (class 1255 OID 17132)
-- Name: calcul_nbjours_presence(); Type: FUNCTION; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE FUNCTION calcul_nbjours_presence() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
IF (NEW.date_fin-NEW.date_debut<>0)
       THEN NEW.nbjours_presence=NEW.date_fin-NEW.date_debut;
        RETURN NEW;
ELSE NEW.nbjours_presence=1;
RETURN NEW;
END IF;
RETURN NULL;
    END;

$$;


ALTER FUNCTION frequentations_autorisations_cro.calcul_nbjours_presence() OWNER TO postgres;

SET search_path = frequentations_autorisations_ker, pg_catalog;

--
-- TOC entry 943 (class 1255 OID 17133)
-- Name: calcul_code_equipier(); Type: FUNCTION; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE FUNCTION calcul_code_equipier() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$ BEGIN
    IF (select EXISTS(select code_equipier FROM frequentations_autorisations_ker.equipiers WHERE equipiers.code_equipier=(NEW.nom||' '||NEW.prenom))=false)
       THEN NEW.code_equipier=NEW.nom||' '||NEW.prenom;
        RETURN NEW;
    ELSE NEW.code_equipier=NEW.nom||' '||NEW.prenom||'_'||NEW.numero; 
    RETURN NEW;
    END IF;
    RETURN NULL;
    END;

$$;


ALTER FUNCTION frequentations_autorisations_ker.calcul_code_equipier() OWNER TO postgres;

--
-- TOC entry 944 (class 1255 OID 17134)
-- Name: calcul_nbjours_presence(); Type: FUNCTION; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE FUNCTION calcul_nbjours_presence() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
IF (NEW.date_fin-NEW.date_debut<>0)
       THEN NEW.nbjours_presence=NEW.date_fin-NEW.date_debut;
        RETURN NEW;
ELSE NEW.nbjours_presence=1;
RETURN NEW;
END IF;
RETURN NULL;
    END;

$$;


ALTER FUNCTION frequentations_autorisations_ker.calcul_nbjours_presence() OWNER TO postgres;

SET search_path = ornithologie, pg_catalog;

--
-- TOC entry 957 (class 1255 OID 28731)
-- Name: calcul_date_saisie_dans_bd(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_date_saisie_dans_bd() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.date_saisie_dans_bd=current_date;
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_date_saisie_dans_bd() OWNER TO postgres;

--
-- TOC entry 958 (class 1255 OID 28732)
-- Name: calcul_longueur_theorique_transect(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_longueur_theorique_transect() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.longueur_theorique_transect=ST_Length(NEW.the_geom);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_longueur_theorique_transect() OWNER TO postgres;

--
-- TOC entry 959 (class 1255 OID 28733)
-- Name: calcul_moyenne_cmtg_oiseaux_marins_adistance(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_moyenne_cmtg_oiseaux_marins_adistance() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
	
	
IF (NEW.comptage_4_adistance IS NULL) AND (NEW.comptage_3_adistance IS NULL) AND (NEW.comptage_2_adistance IS NULL) AND (NEW.comptage_1_adistance IS NOT NULL)
THEN NEW.moyenne_comptages_adistance=NEW.comptage_1_adistance;
RETURN NEW;
ELSIF (NEW.comptage_4_adistance IS NULL) AND (NEW.comptage_3_adistance IS NULL) AND (NEW.comptage_2_adistance IS NOT NULL) AND (NEW.comptage_1_adistance IS NOT NULL)
THEN NEW.moyenne_comptages_adistance=round((((NEW.comptage_1_adistance+NEW.comptage_2_adistance)::numeric(7,2)/2::numeric(1,0))),1);
RETURN NEW;
ELSIF (NEW.comptage_4_adistance IS NULL) AND (NEW.comptage_3_adistance IS NOT NULL) AND (NEW.comptage_2_adistance IS NOT NULL) AND (NEW.comptage_1_adistance IS NOT NULL)
THEN NEW.moyenne_comptages_adistance=round((((NEW.comptage_1_adistance+NEW.comptage_2_adistance+NEW.comptage_3_adistance)::numeric(7,2)/3::numeric(1,0))),1);
RETURN NEW;
ELSE NEW.moyenne_comptages_adistance=round((((NEW.comptage_1_adistance+NEW.comptage_2_adistance+NEW.comptage_3_adistance+NEW.comptage_4_adistance)::numeric(7,2)/4::numeric(1,0))),1);
RETURN NEW;
END IF;
RETURN NULL;
END;

$$;


ALTER FUNCTION ornithologie.calcul_moyenne_cmtg_oiseaux_marins_adistance() OWNER TO postgres;

--
-- TOC entry 960 (class 1255 OID 28734)
-- Name: calcul_moyenne_cmtg_oiseaux_marins_envol(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_moyenne_cmtg_oiseaux_marins_envol() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
	
	
IF (NEW.comptage_4_envol IS NULL) AND (NEW.comptage_3_envol IS NULL) AND (NEW.comptage_2_envol IS NULL) AND (NEW.comptage_1_envol IS NOT NULL)
THEN NEW.moyenne_comptages_envol=NEW.comptage_1_envol;
RETURN NEW;
ELSIF (NEW.comptage_4_envol IS NULL) AND (NEW.comptage_3_envol IS NULL) AND (NEW.comptage_2_envol IS NOT NULL) AND (NEW.comptage_1_envol IS NOT NULL)
THEN NEW.moyenne_comptages_envol=round((((NEW.comptage_1_envol+NEW.comptage_2_envol)::numeric(7,2)/2::numeric(1,0))),1);
RETURN NEW;
ELSIF (NEW.comptage_4_envol IS NULL) AND (NEW.comptage_3_envol IS NOT NULL) AND (NEW.comptage_2_envol IS NOT NULL) AND (NEW.comptage_1_envol IS NOT NULL)
THEN NEW.moyenne_comptages_envol=round((((NEW.comptage_1_envol+NEW.comptage_2_envol+NEW.comptage_3_envol)::numeric(7,2)/3::numeric(1,0))),1);
RETURN NEW;
ELSE NEW.moyenne_comptages_envol=round((((NEW.comptage_1_envol+NEW.comptage_2_envol+NEW.comptage_3_envol+NEW.comptage_4_envol)::numeric(7,2)/4::numeric(1,0))),1);
RETURN NEW;
END IF;
RETURN NULL;
END;

$$;


ALTER FUNCTION ornithologie.calcul_moyenne_cmtg_oiseaux_marins_envol() OWNER TO postgres;

--
-- TOC entry 961 (class 1255 OID 28735)
-- Name: calcul_moyenne_comptages(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_moyenne_comptages() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
	
	
IF (NEW.comptage_4 IS NULL) AND (NEW.comptage_3 IS NULL) AND (NEW.comptage_2 IS NULL) AND (NEW.comptage_1 IS NOT NULL)
THEN NEW.moyenne_comptages=NEW.comptage_1;
RETURN NEW;
ELSIF (NEW.comptage_4 IS NULL) AND (NEW.comptage_3 IS NULL) AND (NEW.comptage_2 IS NOT NULL) AND (NEW.comptage_1 IS NOT NULL)
THEN NEW.moyenne_comptages=round((((NEW.comptage_1+NEW.comptage_2)::numeric(7,2)/2::numeric(1,0))),1);
RETURN NEW;
ELSIF (NEW.comptage_4 IS NULL) AND (NEW.comptage_3 IS NOT NULL) AND (NEW.comptage_2 IS NOT NULL) AND (NEW.comptage_1 IS NOT NULL)
THEN NEW.moyenne_comptages=round((((NEW.comptage_1+NEW.comptage_2+NEW.comptage_3)::numeric(7,2)/3::numeric(1,0))),1);
RETURN NEW;
ELSE NEW.moyenne_comptages=round((((NEW.comptage_1+NEW.comptage_2+NEW.comptage_3+NEW.comptage_4)::numeric(7,2)/4::numeric(1,0))),1);
RETURN NEW;
END IF;
RETURN NULL;
END;

$$;


ALTER FUNCTION ornithologie.calcul_moyenne_comptages() OWNER TO postgres;

--
-- TOC entry 962 (class 1255 OID 28736)
-- Name: calcul_pk_cmtg_grandalbatros(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_cmtg_grandalbatros() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_cmtg_grandalbatros=(NEW.fk_code_leve_gps||'_'||NEW.numero_nid);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_cmtg_grandalbatros() OWNER TO postgres;

--
-- TOC entry 963 (class 1255 OID 28737)
-- Name: calcul_pk_cmtg_indiff_metadonnees(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_cmtg_indiff_metadonnees() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_cmtg_indiff_metadonnees=(NEW.fk_code_leve_gps||'_'||NEW.numero_comptage);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_cmtg_indiff_metadonnees() OWNER TO postgres;

--
-- TOC entry 964 (class 1255 OID 28738)
-- Name: calcul_pk_cmtg_indiff_minmax(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_cmtg_indiff_minmax() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_cmtg_indiff_minmax=(NEW.fk_code_metadonnees_comptage||'_'||NEW.numero_comptage_minmax);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_cmtg_indiff_minmax() OWNER TO postgres;

--
-- TOC entry 965 (class 1255 OID 28739)
-- Name: calcul_pk_cmtg_indiff_nids_oeufs_poussins(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_cmtg_indiff_nids_oeufs_poussins() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_cmtg_indiff_nids_oeufs_poussins=(NEW.fk_code_metadonnees_comptage||'_'||NEW.numero_comptage_nids_oeufs_poussins);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_cmtg_indiff_nids_oeufs_poussins() OWNER TO postgres;

--
-- TOC entry 966 (class 1255 OID 28740)
-- Name: calcul_pk_cmtg_indiff_precis(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_cmtg_indiff_precis() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_cmtg_indiff_precis=(NEW.fk_code_metadonnees_comptage||'_'||NEW.numero_comptage_precis);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_cmtg_indiff_precis() OWNER TO postgres;

--
-- TOC entry 967 (class 1255 OID 28741)
-- Name: calcul_pk_cmtg_mam_marins(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_cmtg_mam_marins() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_cmtg_mam_marins=(NEW.fk_cmtg_mam_marins_metadonnees||'_'||NEW.type_effectif);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_cmtg_mam_marins() OWNER TO postgres;

--
-- TOC entry 968 (class 1255 OID 28742)
-- Name: calcul_pk_cmtg_mam_marins_metadonnees(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_cmtg_mam_marins_metadonnees() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_cmtg_mam_marins_metadonnees=(NEW.fk_code_manipe||'_'||NEW.numero_comptage);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_cmtg_mam_marins_metadonnees() OWNER TO postgres;

--
-- TOC entry 969 (class 1255 OID 28743)
-- Name: calcul_pk_cmtg_oiseaux_marins(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_cmtg_oiseaux_marins() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_cmtg_oiseaux_marins=(NEW.fk_code_manipe||'_'||NEW.fk_cmtg_oiseaux_marins_colonies_metadonnees||'_'||NEW.numero_passage||'_'||NEW.type_effectif);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_cmtg_oiseaux_marins() OWNER TO postgres;

--
-- TOC entry 970 (class 1255 OID 28744)
-- Name: calcul_pk_cmtg_oiseaux_marins_colonies_metadonnees(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_cmtg_oiseaux_marins_colonies_metadonnees() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
		NEW.pk_cmtg_oiseaux_marins_colonies_metadonnees=(NEW.numero_colonie||'_'||NEW.site||'_'||NEW.fk_espece_vernaculaire||'_'||NEW.id_pt_gps||'_'||to_char(NEW.date_leve,'YYYY'));
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_cmtg_oiseaux_marins_colonies_metadonnees() OWNER TO postgres;

--
-- TOC entry 971 (class 1255 OID 28745)
-- Name: calcul_pk_demos_bilan_repro(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_demos_bilan_repro() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_demos_bilan_repro=(NEW.fk_piquet||'_'||NEW.saison);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_demos_bilan_repro() OWNER TO postgres;

--
-- TOC entry 972 (class 1255 OID 28746)
-- Name: calcul_pk_demos_comptage(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_demos_comptage() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_demos_comptage=(NEW.fk_code_manipe||'_'||NEW.fk_piquet||'_'||NEW.numero_passage);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_demos_comptage() OWNER TO postgres;

--
-- TOC entry 973 (class 1255 OID 28747)
-- Name: calcul_pk_demos_indices_occup(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_demos_indices_occup() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_demos_indices_occup=(NEW.fk_piquet||'_'||to_char(NEW.date_passage,'DDMMYYYY'));
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_demos_indices_occup() OWNER TO postgres;

--
-- TOC entry 974 (class 1255 OID 28748)
-- Name: calcul_pk_pc_permanent(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_pc_permanent() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_pc_permanent=(NEW.fk_code_manipe||'_'||NEW.fk_code_piquet||'_'||NEW.numero_terrier);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_pc_permanent() OWNER TO postgres;

--
-- TOC entry 975 (class 1255 OID 28749)
-- Name: calcul_pk_pc_permanent_changement_vegetation(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_pc_permanent_changement_vegetation() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_pc_permanent_changement_vegetation=(NEW.fk_numero_piquet||'_maj'||to_char(NEW.date_mise_a_jour_vegetation,'DDMMYY'));
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_pc_permanent_changement_vegetation() OWNER TO postgres;

--
-- TOC entry 976 (class 1255 OID 28750)
-- Name: calcul_pk_pc_permanent_metadonnees(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_pc_permanent_metadonnees() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_pc_permanent_metadonnees=(NEW.district||'_'||NEW.site||'_'||NEW.numero_piquet);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_pc_permanent_metadonnees() OWNER TO postgres;

--
-- TOC entry 977 (class 1255 OID 28751)
-- Name: calcul_pk_pc_surtransect(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_pc_surtransect() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_pc_surtransect=(NEW.fk_code_leve_gps||'_'||NEW.numero_terrier);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_pc_surtransect() OWNER TO postgres;

--
-- TOC entry 953 (class 1255 OID 30471)
-- Name: calcul_pk_repise_bague(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_repise_bague() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_reprise_bague=(NEW.fk_code_leve_gps||'_'||NEW.num_cmtg);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_repise_bague() OWNER TO postgres;

--
-- TOC entry 978 (class 1255 OID 28752)
-- Name: calcul_pk_srep_colonies_coordonnees(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_srep_colonies_coordonnees() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
	    NEW.pk_srep_colonies_coordonnees=(NEW.fk_srep_colonies_metadonnees||'_'||to_char(NEW.date_leve,'MM')||to_char(NEW.date_leve,'YYYY'));
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_srep_colonies_coordonnees() OWNER TO postgres;

--
-- TOC entry 979 (class 1255 OID 28753)
-- Name: calcul_pk_srep_colonies_metadonnees(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_srep_colonies_metadonnees() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
		NEW.pk_srep_colonies_metadonnees=(NEW.numero_colonie||'_'||NEW.site||'_'||NEW.fk_espece_vernaculaire||'_'||to_char(NEW.date_premier_leve,'YYYY'));
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_srep_colonies_metadonnees() OWNER TO postgres;

--
-- TOC entry 980 (class 1255 OID 28754)
-- Name: calcul_pk_srep_comptage(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_srep_comptage() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_srep_comptage=(NEW.fk_code_manipe||'_'||NEW.fk_srep_colonies_metadonnees||'_'||NEW.numero_passage||'_'||NEW.type_effectif);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_srep_comptage() OWNER TO postgres;

--
-- TOC entry 981 (class 1255 OID 28755)
-- Name: calcul_pk_tb_leve_gps_metadonnees(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_tb_leve_gps_metadonnees() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_tb_leve_gps_metadonnees=(NEW.fk_code_manipe||'_'||NEW.num_leve_gps);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_tb_leve_gps_metadonnees() OWNER TO postgres;

--
-- TOC entry 982 (class 1255 OID 28756)
-- Name: calcul_pk_tb_observateurs_leves_gps(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_tb_observateurs_leves_gps() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_tb_observateurs_leves_gps=(NEW.numero_observateur||'_'||NEW.fk_code_leve_gps);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_tb_observateurs_leves_gps() OWNER TO postgres;

--
-- TOC entry 983 (class 1255 OID 28757)
-- Name: calcul_pk_trsc_especes_epigees(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_trsc_especes_epigees() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_trsc_especes_epigees=(NEW.fk_code_leve_gps||'_'||NEW.numero_observation);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_trsc_especes_epigees() OWNER TO postgres;

--
-- TOC entry 984 (class 1255 OID 28758)
-- Name: calcul_pk_trsc_especes_hypogees(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_trsc_especes_hypogees() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_trsc_especes_hypogees=(NEW.fk_code_leve_gps||'_'||NEW.numero_terrier);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_trsc_especes_hypogees() OWNER TO postgres;

--
-- TOC entry 985 (class 1255 OID 28759)
-- Name: calcul_pk_trsc_transect_parcours(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_pk_trsc_transect_parcours() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_trsc_transect_parcours=(NEW.fk_code_manipe||'_'||NEW.fk_numero_transect);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_pk_trsc_transect_parcours() OWNER TO postgres;

--
-- TOC entry 986 (class 1255 OID 28760)
-- Name: calcul_position_pt_depart_cmtg_mam_marins(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_position_pt_depart_cmtg_mam_marins() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.position_pt_depart=ST_transform(ST_SetSRID(ST_MakePoint(NEW.long_depart,NEW.lat_depart),4326),32742);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_position_pt_depart_cmtg_mam_marins() OWNER TO postgres;

--
-- TOC entry 987 (class 1255 OID 28761)
-- Name: calcul_position_pt_fin_cmtg_mam_marins(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_position_pt_fin_cmtg_mam_marins() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.position_pt_fin=ST_transform(ST_SetSRID(ST_MakePoint(NEW.long_fin,NEW.lat_fin),4326),32742);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_position_pt_fin_cmtg_mam_marins() OWNER TO postgres;

--
-- TOC entry 990 (class 1255 OID 28762)
-- Name: calcul_somme_effectif_trsc_especes_epigees(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_somme_effectif_trsc_especes_epigees() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
	
	
IF (NEW.canards_effectif_male IS NULL) AND (NEW.canards_effectif_femelle IS NULL) AND (NEW.canards_effectif_indetermine IS NULL)
THEN NEW.somme_effectif=NULL;
RETURN NEW;
ELSIF (NEW.canards_effectif_male IS NULL) AND (NEW.canards_effectif_femelle IS NULL) AND (NEW.canards_effectif_indetermine IS NOT NULL)
THEN NEW.somme_effectif=NEW.canards_effectif_indetermine;
RETURN NEW;
ELSIF (NEW.canards_effectif_male IS NULL) AND (NEW.canards_effectif_femelle IS NOT NULL) AND (NEW.canards_effectif_indetermine IS NULL)
THEN NEW.somme_effectif=NEW.canards_effectif_femelle;
RETURN NEW;
ELSIF (NEW.canards_effectif_male IS NOT NULL) AND (NEW.canards_effectif_femelle IS NULL) AND (NEW.canards_effectif_indetermine IS NULL)
THEN NEW.somme_effectif=NEW.canards_effectif_male;
RETURN NEW;
ELSIF (NEW.canards_effectif_male IS NOT NULL) AND (NEW.canards_effectif_femelle IS NOT NULL) AND (NEW.canards_effectif_indetermine IS NULL)
THEN NEW.somme_effectif=NEW.canards_effectif_male+NEW.canards_effectif_femelle;
RETURN NEW;
ELSIF (NEW.canards_effectif_male IS NOT NULL) AND (NEW.canards_effectif_femelle IS NULL) AND (NEW.canards_effectif_indetermine IS NOT NULL)
THEN NEW.somme_effectif=NEW.canards_effectif_male+NEW.canards_effectif_indetermine;
RETURN NEW;
ELSIF (NEW.canards_effectif_male IS NULL) AND (NEW.canards_effectif_femelle IS NOT NULL) AND (NEW.canards_effectif_indetermine IS NOT NULL)
THEN NEW.somme_effectif=NEW.canards_effectif_femelle+NEW.canards_effectif_indetermine;
RETURN NEW;
ELSIF (NEW.canards_effectif_male IS NOT NULL) AND (NEW.canards_effectif_femelle IS NOT NULL) AND (NEW.canards_effectif_indetermine IS NOT NULL)
THEN NEW.somme_effectif=NEW.canards_effectif_male + NEW.canards_effectif_femelle+NEW.canards_effectif_indetermine;
RETURN NEW;

END IF;
RETURN NULL;
END;

$$;


ALTER FUNCTION ornithologie.calcul_somme_effectif_trsc_especes_epigees() OWNER TO postgres;

--
-- TOC entry 991 (class 1255 OID 28763)
-- Name: calcul_the_geom(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_the_geom() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.the_geom=ST_transform(ST_SetSRID(ST_MakePoint(NEW.longitude,NEW.latitude),4326),32742);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_the_geom() OWNER TO postgres;

--
-- TOC entry 992 (class 1255 OID 28764)
-- Name: calcul_the_geom_cmtg_mam_marins_metadonnees(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_the_geom_cmtg_mam_marins_metadonnees() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.the_geom=ST_MakeLine(ST_transform(ST_SetSRID(ST_MakePoint(NEW.long_depart,NEW.lat_depart),4326),32742),ST_transform(ST_SetSRID(ST_MakePoint(NEW.long_fin,NEW.lat_fin),4326),32742));
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_the_geom_cmtg_mam_marins_metadonnees() OWNER TO postgres;

--
-- TOC entry 954 (class 1255 OID 28765)
-- Name: calcul_the_geom_tb_leve_gps_metadonnees(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION calcul_the_geom_tb_leve_gps_metadonnees() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.the_geom=ST_transform(ST_SetSRID(ST_MakePoint(NEW.longitude,NEW.latitude),4326),32742);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.calcul_the_geom_tb_leve_gps_metadonnees() OWNER TO postgres;

--
-- TOC entry 993 (class 1255 OID 28766)
-- Name: trigg_pk_tb_manipe_metadonnees(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION trigg_pk_tb_manipe_metadonnees() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_tb_manipe_metadonnees=(NEW.num_manipe||NEW.district||to_char(current_timestamp,'HH24MISS'));
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.trigg_pk_tb_manipe_metadonnees() OWNER TO postgres;

--
-- TOC entry 994 (class 1255 OID 28767)
-- Name: trigg_pk_tb_observateur(); Type: FUNCTION; Schema: ornithologie; Owner: postgres
--

CREATE FUNCTION trigg_pk_tb_observateur() RETURNS trigger
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    BEGIN
        NEW.pk_tb_observateur=(left(NEW.prenom,3)||NEW.nom);
        RETURN NEW;
    END;

$$;


ALTER FUNCTION ornithologie.trigg_pk_tb_observateur() OWNER TO postgres;

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

SET search_path = public, pg_catalog;

--
-- TOC entry 379 (class 1255 OID 16385)
-- Name: _postgis_deprecate(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _postgis_deprecate(oldname text, newname text, version text) RETURNS void
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
  curver_text text;
BEGIN
  --
  -- Raises a NOTICE if it was deprecated in this version,
  -- a WARNING if in a previous version (only up to minor version checked)
  --
    curver_text := '2.1.3';
    IF split_part(curver_text,'.',1)::int > split_part(version,'.',1)::int OR
       ( split_part(curver_text,'.',1) = split_part(version,'.',1) AND
         split_part(curver_text,'.',2) != split_part(version,'.',2) )
    THEN
      RAISE WARNING '% signature was deprecated in %. Please use %', oldname, version, newname;
    ELSE
      RAISE DEBUG '% signature was deprecated in %. Please use %', oldname, version, newname;
    END IF;
END;
$$;


ALTER FUNCTION public._postgis_deprecate(oldname text, newname text, version text) OWNER TO postgres;

--
-- TOC entry 421 (class 1255 OID 16461)
-- Name: _postgis_join_selectivity(regclass, text, regclass, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _postgis_join_selectivity(regclass, text, regclass, text, text DEFAULT '2'::text) RETURNS double precision
    LANGUAGE c STRICT
    AS '$libdir/postgis-2.1', '_postgis_gserialized_joinsel';


ALTER FUNCTION public._postgis_join_selectivity(regclass, text, regclass, text, text) OWNER TO postgres;

--
-- TOC entry 420 (class 1255 OID 16460)
-- Name: _postgis_selectivity(regclass, text, geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _postgis_selectivity(tbl regclass, att_name text, geom geometry, mode text DEFAULT '2'::text) RETURNS double precision
    LANGUAGE c STRICT
    AS '$libdir/postgis-2.1', '_postgis_gserialized_sel';


ALTER FUNCTION public._postgis_selectivity(tbl regclass, att_name text, geom geometry, mode text) OWNER TO postgres;

--
-- TOC entry 422 (class 1255 OID 16462)
-- Name: _postgis_stats(regclass, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _postgis_stats(tbl regclass, att_name text, text DEFAULT '2'::text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/postgis-2.1', '_postgis_gserialized_stats';


ALTER FUNCTION public._postgis_stats(tbl regclass, att_name text, text) OWNER TO postgres;

--
-- TOC entry 918 (class 1255 OID 17091)
-- Name: _st_3ddfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'LWGEOM_dfullywithin3d';


ALTER FUNCTION public._st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- TOC entry 916 (class 1255 OID 17089)
-- Name: _st_3ddwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_3ddwithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'LWGEOM_dwithin3d';


ALTER FUNCTION public._st_3ddwithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- TOC entry 920 (class 1255 OID 17093)
-- Name: _st_3dintersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_3dintersects(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'intersects3d';


ALTER FUNCTION public._st_3dintersects(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 857 (class 1255 OID 17022)
-- Name: _st_asgeojson(integer, geography, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_asgeojson(integer, geography, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_as_geojson';


ALTER FUNCTION public._st_asgeojson(integer, geography, integer, integer) OWNER TO postgres;

--
-- TOC entry 708 (class 1255 OID 16838)
-- Name: _st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_asgeojson(integer, geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_asGeoJson';


ALTER FUNCTION public._st_asgeojson(integer, geometry, integer, integer) OWNER TO postgres;

--
-- TOC entry 848 (class 1255 OID 17014)
-- Name: _st_asgml(integer, geography, integer, integer, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_asgml(integer, geography, integer, integer, text, text) RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'geography_as_gml';


ALTER FUNCTION public._st_asgml(integer, geography, integer, integer, text, text) OWNER TO postgres;

--
-- TOC entry 702 (class 1255 OID 16832)
-- Name: _st_asgml(integer, geometry, integer, integer, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_asgml(integer, geometry, integer, integer, text, text) RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'LWGEOM_asGML';


ALTER FUNCTION public._st_asgml(integer, geometry, integer, integer, text, text) OWNER TO postgres;

--
-- TOC entry 853 (class 1255 OID 17018)
-- Name: _st_askml(integer, geography, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_askml(integer, geography, integer, text) RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'geography_as_kml';


ALTER FUNCTION public._st_askml(integer, geography, integer, text) OWNER TO postgres;

--
-- TOC entry 705 (class 1255 OID 16835)
-- Name: _st_askml(integer, geometry, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_askml(integer, geometry, integer, text) RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'LWGEOM_asKML';


ALTER FUNCTION public._st_askml(integer, geometry, integer, text) OWNER TO postgres;

--
-- TOC entry 938 (class 1255 OID 17114)
-- Name: _st_asx3d(integer, geometry, integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_asx3d(integer, geometry, integer, integer, text) RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'LWGEOM_asX3D';


ALTER FUNCTION public._st_asx3d(integer, geometry, integer, integer, text) OWNER TO postgres;

--
-- TOC entry 893 (class 1255 OID 17059)
-- Name: _st_bestsrid(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_bestsrid(geography) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_BestSRID($1,$1)$_$;


ALTER FUNCTION public._st_bestsrid(geography) OWNER TO postgres;

--
-- TOC entry 892 (class 1255 OID 17058)
-- Name: _st_bestsrid(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_bestsrid(geography, geography) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_bestsrid';


ALTER FUNCTION public._st_bestsrid(geography, geography) OWNER TO postgres;

--
-- TOC entry 618 (class 1255 OID 16734)
-- Name: _st_buffer(geometry, double precision, cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_buffer(geometry, double precision, cstring) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'buffer';


ALTER FUNCTION public._st_buffer(geometry, double precision, cstring) OWNER TO postgres;

--
-- TOC entry 936 (class 1255 OID 17111)
-- Name: _st_concavehull(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_concavehull(param_inputgeom geometry) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
	DECLARE     
	vexhull GEOMETRY;
	var_resultgeom geometry;
	var_inputgeom geometry;
	vexring GEOMETRY;
	cavering GEOMETRY;
	cavept geometry[];
	seglength double precision;
	var_tempgeom geometry;
	scale_factor integer := 1;
	i integer;
	
	BEGIN

		-- First compute the ConvexHull of the geometry
		vexhull := ST_ConvexHull(param_inputgeom);
		var_inputgeom := param_inputgeom;
		--A point really has no concave hull
		IF ST_GeometryType(vexhull) = 'ST_Point' OR ST_GeometryType(vexHull) = 'ST_LineString' THEN
			RETURN vexhull;
		END IF;

		-- convert the hull perimeter to a linestring so we can manipulate individual points
		vexring := CASE WHEN ST_GeometryType(vexhull) = 'ST_LineString' THEN vexhull ELSE ST_ExteriorRing(vexhull) END;
		IF abs(ST_X(ST_PointN(vexring,1))) < 1 THEN --scale the geometry to prevent stupid precision errors - not sure it works so make low for now
			scale_factor := 100;
			vexring := ST_Scale(vexring, scale_factor,scale_factor);
			var_inputgeom := ST_Scale(var_inputgeom, scale_factor, scale_factor);
			--RAISE NOTICE 'Scaling';
		END IF;
		seglength := ST_Length(vexring)/least(ST_NPoints(vexring)*2,1000) ;

		vexring := ST_Segmentize(vexring, seglength);
		-- find the point on the original geom that is closest to each point of the convex hull and make a new linestring out of it.
		cavering := ST_Collect(
			ARRAY(

				SELECT 
					ST_ClosestPoint(var_inputgeom, pt ) As the_geom
					FROM (
						SELECT  ST_PointN(vexring, n ) As pt, n
							FROM 
							generate_series(1, ST_NPoints(vexring) ) As n
						) As pt
				
				)
			)
		; 
		

		var_resultgeom := ST_MakeLine(geom) 
			FROM ST_Dump(cavering) As foo;

		IF ST_IsSimple(var_resultgeom) THEN
			var_resultgeom := ST_MakePolygon(var_resultgeom);
			--RAISE NOTICE 'is Simple: %', var_resultgeom;
		ELSE 
			--RAISE NOTICE 'is not Simple: %', var_resultgeom;
			var_resultgeom := ST_ConvexHull(var_resultgeom);
		END IF;
		
		IF scale_factor > 1 THEN -- scale the result back
			var_resultgeom := ST_Scale(var_resultgeom, 1/scale_factor, 1/scale_factor);
		END IF;
		RETURN var_resultgeom;
	
	END;
$$;


ALTER FUNCTION public._st_concavehull(param_inputgeom geometry) OWNER TO postgres;

--
-- TOC entry 672 (class 1255 OID 16802)
-- Name: _st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_contains(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'contains';


ALTER FUNCTION public._st_contains(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 678 (class 1255 OID 16808)
-- Name: _st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_containsproperly(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'containsproperly';


ALTER FUNCTION public._st_containsproperly(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 674 (class 1255 OID 16804)
-- Name: _st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_coveredby(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'coveredby';


ALTER FUNCTION public._st_coveredby(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 676 (class 1255 OID 16806)
-- Name: _st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_covers(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'covers';


ALTER FUNCTION public._st_covers(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 884 (class 1255 OID 17050)
-- Name: _st_covers(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_covers(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'geography_covers';


ALTER FUNCTION public._st_covers(geography, geography) OWNER TO postgres;

--
-- TOC entry 670 (class 1255 OID 16800)
-- Name: _st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_crosses(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'crosses';


ALTER FUNCTION public._st_crosses(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 794 (class 1255 OID 16924)
-- Name: _st_dfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_dfullywithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_dfullywithin';


ALTER FUNCTION public._st_dfullywithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- TOC entry 861 (class 1255 OID 17026)
-- Name: _st_distance(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_distance(geography, geography, double precision, boolean) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'geography_distance';


ALTER FUNCTION public._st_distance(geography, geography, double precision, boolean) OWNER TO postgres;

--
-- TOC entry 874 (class 1255 OID 17039)
-- Name: _st_distancetree(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_distancetree(geography, geography) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_DistanceTree($1, $2, 0.0, true)$_$;


ALTER FUNCTION public._st_distancetree(geography, geography) OWNER TO postgres;

--
-- TOC entry 873 (class 1255 OID 17038)
-- Name: _st_distancetree(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_distancetree(geography, geography, double precision, boolean) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'geography_distance_tree';


ALTER FUNCTION public._st_distancetree(geography, geography, double precision, boolean) OWNER TO postgres;

--
-- TOC entry 872 (class 1255 OID 17037)
-- Name: _st_distanceuncached(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_distanceuncached(geography, geography) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_DistanceUnCached($1, $2, 0.0, true)$_$;


ALTER FUNCTION public._st_distanceuncached(geography, geography) OWNER TO postgres;

--
-- TOC entry 871 (class 1255 OID 17036)
-- Name: _st_distanceuncached(geography, geography, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_distanceuncached(geography, geography, boolean) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_DistanceUnCached($1, $2, 0.0, $3)$_$;


ALTER FUNCTION public._st_distanceuncached(geography, geography, boolean) OWNER TO postgres;

--
-- TOC entry 870 (class 1255 OID 17035)
-- Name: _st_distanceuncached(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_distanceuncached(geography, geography, double precision, boolean) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'geography_distance_uncached';


ALTER FUNCTION public._st_distanceuncached(geography, geography, double precision, boolean) OWNER TO postgres;

--
-- TOC entry 558 (class 1255 OID 16650)
-- Name: _st_dumppoints(geometry, integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_dumppoints(the_geom geometry, cur_path integer[]) RETURNS SETOF geometry_dump
    LANGUAGE plpgsql
    AS $$
DECLARE
  tmp geometry_dump;
  tmp2 geometry_dump;
  nb_points integer;
  nb_geom integer;
  i integer;
  j integer;
  g geometry;
  
BEGIN
  
  -- RAISE DEBUG '%,%', cur_path, ST_GeometryType(the_geom);

  -- Special case collections : iterate and return the DumpPoints of the geometries

  IF (ST_IsCollection(the_geom)) THEN
 
    i = 1;
    FOR tmp2 IN SELECT (ST_Dump(the_geom)).* LOOP

      FOR tmp IN SELECT * FROM _ST_DumpPoints(tmp2.geom, cur_path || tmp2.path) LOOP
	    RETURN NEXT tmp;
      END LOOP;
      i = i + 1;
      
    END LOOP;

    RETURN;
  END IF;
  

  -- Special case (POLYGON) : return the points of the rings of a polygon
  IF (ST_GeometryType(the_geom) = 'ST_Polygon') THEN

    FOR tmp IN SELECT * FROM _ST_DumpPoints(ST_ExteriorRing(the_geom), cur_path || ARRAY[1]) LOOP
      RETURN NEXT tmp;
    END LOOP;
    
    j := ST_NumInteriorRings(the_geom);
    FOR i IN 1..j LOOP
        FOR tmp IN SELECT * FROM _ST_DumpPoints(ST_InteriorRingN(the_geom, i), cur_path || ARRAY[i+1]) LOOP
          RETURN NEXT tmp;
        END LOOP;
    END LOOP;
    
    RETURN;
  END IF;

  -- Special case (TRIANGLE) : return the points of the external rings of a TRIANGLE
  IF (ST_GeometryType(the_geom) = 'ST_Triangle') THEN

    FOR tmp IN SELECT * FROM _ST_DumpPoints(ST_ExteriorRing(the_geom), cur_path || ARRAY[1]) LOOP
      RETURN NEXT tmp;
    END LOOP;
    
    RETURN;
  END IF;

    
  -- Special case (POINT) : return the point
  IF (ST_GeometryType(the_geom) = 'ST_Point') THEN

    tmp.path = cur_path || ARRAY[1];
    tmp.geom = the_geom;

    RETURN NEXT tmp;
    RETURN;

  END IF;


  -- Use ST_NumPoints rather than ST_NPoints to have a NULL value if the_geom isn't
  -- a LINESTRING, CIRCULARSTRING.
  SELECT ST_NumPoints(the_geom) INTO nb_points;

  -- This should never happen
  IF (nb_points IS NULL) THEN
    RAISE EXCEPTION 'Unexpected error while dumping geometry %', ST_AsText(the_geom);
  END IF;

  FOR i IN 1..nb_points LOOP
    tmp.path = cur_path || ARRAY[i];
    tmp.geom := ST_PointN(the_geom, i);
    RETURN NEXT tmp;
  END LOOP;
   
END
$$;


ALTER FUNCTION public._st_dumppoints(the_geom geometry, cur_path integer[]) OWNER TO postgres;

--
-- TOC entry 666 (class 1255 OID 16796)
-- Name: _st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_dwithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'LWGEOM_dwithin';


ALTER FUNCTION public._st_dwithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- TOC entry 862 (class 1255 OID 17027)
-- Name: _st_dwithin(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_dwithin(geography, geography, double precision, boolean) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'geography_dwithin';


ALTER FUNCTION public._st_dwithin(geography, geography, double precision, boolean) OWNER TO postgres;

--
-- TOC entry 850 (class 1255 OID 17041)
-- Name: _st_dwithinuncached(geography, geography, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_dwithinuncached(geography, geography, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && _ST_Expand($2,$3) AND $2 && _ST_Expand($1,$3) AND _ST_DWithinUnCached($1, $2, $3, true)$_$;


ALTER FUNCTION public._st_dwithinuncached(geography, geography, double precision) OWNER TO postgres;

--
-- TOC entry 875 (class 1255 OID 17040)
-- Name: _st_dwithinuncached(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_dwithinuncached(geography, geography, double precision, boolean) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'geography_dwithin_uncached';


ALTER FUNCTION public._st_dwithinuncached(geography, geography, double precision, boolean) OWNER TO postgres;

--
-- TOC entry 690 (class 1255 OID 16820)
-- Name: _st_equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_equals(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'ST_Equals';


ALTER FUNCTION public._st_equals(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 866 (class 1255 OID 17031)
-- Name: _st_expand(geography, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_expand(geography, double precision) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_expand';


ALTER FUNCTION public._st_expand(geography, double precision) OWNER TO postgres;

--
-- TOC entry 693 (class 1255 OID 16823)
-- Name: _st_geomfromgml(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_geomfromgml(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'geom_from_gml';


ALTER FUNCTION public._st_geomfromgml(text, integer) OWNER TO postgres;

--
-- TOC entry 668 (class 1255 OID 16798)
-- Name: _st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_intersects(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'intersects';


ALTER FUNCTION public._st_intersects(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 623 (class 1255 OID 16739)
-- Name: _st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_linecrossingdirection(geom1 geometry, geom2 geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'ST_LineCrossingDirection';


ALTER FUNCTION public._st_linecrossingdirection(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 792 (class 1255 OID 16922)
-- Name: _st_longestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_longestline(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_longestline2d';


ALTER FUNCTION public._st_longestline(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 788 (class 1255 OID 16918)
-- Name: _st_maxdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_maxdistance(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_maxdistance2d_linestring';


ALTER FUNCTION public._st_maxdistance(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 927 (class 1255 OID 17100)
-- Name: _st_orderingequals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_orderingequals(geometrya geometry, geometryb geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'LWGEOM_same';


ALTER FUNCTION public._st_orderingequals(geometrya geometry, geometryb geometry) OWNER TO postgres;

--
-- TOC entry 680 (class 1255 OID 16810)
-- Name: _st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_overlaps(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'overlaps';


ALTER FUNCTION public._st_overlaps(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 883 (class 1255 OID 17049)
-- Name: _st_pointoutside(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_pointoutside(geography) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_point_outside';


ALTER FUNCTION public._st_pointoutside(geography) OWNER TO postgres;

--
-- TOC entry 664 (class 1255 OID 16794)
-- Name: _st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_touches(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'touches';


ALTER FUNCTION public._st_touches(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 681 (class 1255 OID 16811)
-- Name: _st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_within(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT _ST_Contains($2,$1)$_$;


ALTER FUNCTION public._st_within(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 804 (class 1255 OID 16934)
-- Name: addauth(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addauth(text) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$ 
DECLARE
	lockid alias for $1;
	okay boolean;
	myrec record;
BEGIN
	-- check to see if table exists
	--  if not, CREATE TEMP TABLE mylock (transid xid, lockcode text)
	okay := 'f';
	FOR myrec IN SELECT * FROM pg_class WHERE relname = 'temp_lock_have_table' LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		CREATE TEMP TABLE temp_lock_have_table (transid xid, lockcode text);
			-- this will only work from pgsql7.4 up
			-- ON COMMIT DELETE ROWS;
	END IF;

	--  INSERT INTO mylock VALUES ( $1)
--	EXECUTE 'INSERT INTO temp_lock_have_table VALUES ( '||
--		quote_literal(getTransactionID()) || ',' ||
--		quote_literal(lockid) ||')';

	INSERT INTO temp_lock_have_table VALUES (getTransactionID(), lockid);

	RETURN true::boolean;
END;
$_$;


ALTER FUNCTION public.addauth(text) OWNER TO postgres;

--
-- TOC entry 564 (class 1255 OID 16667)
-- Name: addgeometrycolumn(character varying, character varying, integer, character varying, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addgeometrycolumn(table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean DEFAULT true) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('','',$1,$2,$3,$4,$5, $6) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION public.addgeometrycolumn(table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean) OWNER TO postgres;

--
-- TOC entry 563 (class 1255 OID 16666)
-- Name: addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean DEFAULT true) RETURNS text
    LANGUAGE plpgsql STABLE STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('',$1,$2,$3,$4,$5,$6,$7) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION public.addgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean) OWNER TO postgres;

--
-- TOC entry 562 (class 1255 OID 16664)
-- Name: addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer, new_type character varying, new_dim integer, use_typmod boolean DEFAULT true) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
	rec RECORD;
	sr varchar;
	real_schema name;
	sql text;
	new_srid integer;

BEGIN

	-- Verify geometry type
	IF (postgis_type_name(new_type,new_dim) IS NULL )
	THEN
		RAISE EXCEPTION 'Invalid type name "%(%)" - valid ones are:
	POINT, MULTIPOINT,
	LINESTRING, MULTILINESTRING,
	POLYGON, MULTIPOLYGON,
	CIRCULARSTRING, COMPOUNDCURVE, MULTICURVE,
	CURVEPOLYGON, MULTISURFACE,
	GEOMETRY, GEOMETRYCOLLECTION,
	POINTM, MULTIPOINTM,
	LINESTRINGM, MULTILINESTRINGM,
	POLYGONM, MULTIPOLYGONM,
	CIRCULARSTRINGM, COMPOUNDCURVEM, MULTICURVEM
	CURVEPOLYGONM, MULTISURFACEM, TRIANGLE, TRIANGLEM,
	POLYHEDRALSURFACE, POLYHEDRALSURFACEM, TIN, TINM
	or GEOMETRYCOLLECTIONM', new_type, new_dim;
		RETURN 'fail';
	END IF;


	-- Verify dimension
	IF ( (new_dim >4) OR (new_dim <2) ) THEN
		RAISE EXCEPTION 'invalid dimension';
		RETURN 'fail';
	END IF;

	IF ( (new_type LIKE '%M') AND (new_dim!=3) ) THEN
		RAISE EXCEPTION 'TypeM needs 3 dimensions';
		RETURN 'fail';
	END IF;


	-- Verify SRID
	IF ( new_srid_in > 0 ) THEN
		IF new_srid_in > 998999 THEN
			RAISE EXCEPTION 'AddGeometryColumn() - SRID must be <= %', 998999;
		END IF;
		new_srid := new_srid_in;
		SELECT SRID INTO sr FROM spatial_ref_sys WHERE SRID = new_srid;
		IF NOT FOUND THEN
			RAISE EXCEPTION 'AddGeometryColumn() - invalid SRID';
			RETURN 'fail';
		END IF;
	ELSE
		new_srid := ST_SRID('POINT EMPTY'::geometry);
		IF ( new_srid_in != new_srid ) THEN
			RAISE NOTICE 'SRID value % converted to the officially unknown SRID value %', new_srid_in, new_srid;
		END IF;
	END IF;


	-- Verify schema
	IF ( schema_name IS NOT NULL AND schema_name != '' ) THEN
		sql := 'SELECT nspname FROM pg_namespace ' ||
			'WHERE text(nspname) = ' || quote_literal(schema_name) ||
			'LIMIT 1';
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Schema % is not a valid schemaname', quote_literal(schema_name);
			RETURN 'fail';
		END IF;
	END IF;

	IF ( real_schema IS NULL ) THEN
		RAISE DEBUG 'Detecting schema';
		sql := 'SELECT n.nspname AS schemaname ' ||
			'FROM pg_catalog.pg_class c ' ||
			  'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace ' ||
			'WHERE c.relkind = ' || quote_literal('r') ||
			' AND n.nspname NOT IN (' || quote_literal('pg_catalog') || ', ' || quote_literal('pg_toast') || ')' ||
			' AND pg_catalog.pg_table_is_visible(c.oid)' ||
			' AND c.relname = ' || quote_literal(table_name);
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Table % does not occur in the search_path', quote_literal(table_name);
			RETURN 'fail';
		END IF;
	END IF;


	-- Add geometry column to table
	IF use_typmod THEN
	     sql := 'ALTER TABLE ' ||
            quote_ident(real_schema) || '.' || quote_ident(table_name)
            || ' ADD COLUMN ' || quote_ident(column_name) ||
            ' geometry(' || postgis_type_name(new_type, new_dim) || ', ' || new_srid::text || ')';
        RAISE DEBUG '%', sql;
	ELSE
        sql := 'ALTER TABLE ' ||
            quote_ident(real_schema) || '.' || quote_ident(table_name)
            || ' ADD COLUMN ' || quote_ident(column_name) ||
            ' geometry ';
        RAISE DEBUG '%', sql;
    END IF;
	EXECUTE sql;

	IF NOT use_typmod THEN
        -- Add table CHECKs
        sql := 'ALTER TABLE ' ||
            quote_ident(real_schema) || '.' || quote_ident(table_name)
            || ' ADD CONSTRAINT '
            || quote_ident('enforce_srid_' || column_name)
            || ' CHECK (st_srid(' || quote_ident(column_name) ||
            ') = ' || new_srid::text || ')' ;
        RAISE DEBUG '%', sql;
        EXECUTE sql;
    
        sql := 'ALTER TABLE ' ||
            quote_ident(real_schema) || '.' || quote_ident(table_name)
            || ' ADD CONSTRAINT '
            || quote_ident('enforce_dims_' || column_name)
            || ' CHECK (st_ndims(' || quote_ident(column_name) ||
            ') = ' || new_dim::text || ')' ;
        RAISE DEBUG '%', sql;
        EXECUTE sql;
    
        IF ( NOT (new_type = 'GEOMETRY')) THEN
            sql := 'ALTER TABLE ' ||
                quote_ident(real_schema) || '.' || quote_ident(table_name) || ' ADD CONSTRAINT ' ||
                quote_ident('enforce_geotype_' || column_name) ||
                ' CHECK (GeometryType(' ||
                quote_ident(column_name) || ')=' ||
                quote_literal(new_type) || ' OR (' ||
                quote_ident(column_name) || ') is null)';
            RAISE DEBUG '%', sql;
            EXECUTE sql;
        END IF;
    END IF;

	RETURN
		real_schema || '.' ||
		table_name || '.' || column_name ||
		' SRID:' || new_srid::text ||
		' TYPE:' || new_type ||
		' DIMS:' || new_dim::text || ' ';
END;
$$;


ALTER FUNCTION public.addgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer, new_type character varying, new_dim integer, use_typmod boolean) OWNER TO postgres;

--
-- TOC entry 573 (class 1255 OID 16697)
-- Name: box(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box(box3d) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX3D_to_BOX';


ALTER FUNCTION public.box(box3d) OWNER TO postgres;

--
-- TOC entry 595 (class 1255 OID 16694)
-- Name: box(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box(geometry) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_to_BOX';


ALTER FUNCTION public.box(geometry) OWNER TO postgres;

--
-- TOC entry 571 (class 1255 OID 16695)
-- Name: box2d(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d(box3d) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX3D_to_BOX2D';


ALTER FUNCTION public.box2d(box3d) OWNER TO postgres;

--
-- TOC entry 593 (class 1255 OID 16692)
-- Name: box2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_to_BOX2D';


ALTER FUNCTION public.box2d(geometry) OWNER TO postgres;

--
-- TOC entry 572 (class 1255 OID 16696)
-- Name: box3d(box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d(box2d) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX2D_to_BOX3D';


ALTER FUNCTION public.box3d(box2d) OWNER TO postgres;

--
-- TOC entry 594 (class 1255 OID 16693)
-- Name: box3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d(geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_to_BOX3D';


ALTER FUNCTION public.box3d(geometry) OWNER TO postgres;

--
-- TOC entry 364 (class 1255 OID 16699)
-- Name: box3dtobox(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3dtobox(box3d) RETURNS box
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT box($1)$_$;


ALTER FUNCTION public.box3dtobox(box3d) OWNER TO postgres;

--
-- TOC entry 821 (class 1255 OID 16954)
-- Name: bytea(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION bytea(geography) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_to_bytea';


ALTER FUNCTION public.bytea(geography) OWNER TO postgres;

--
-- TOC entry 600 (class 1255 OID 16704)
-- Name: bytea(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION bytea(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_to_bytea';


ALTER FUNCTION public.bytea(geometry) OWNER TO postgres;

--
-- TOC entry 806 (class 1255 OID 16936)
-- Name: checkauth(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION checkauth(text, text) RETURNS integer
    LANGUAGE sql
    AS $_$ SELECT CheckAuth('', $1, $2) $_$;


ALTER FUNCTION public.checkauth(text, text) OWNER TO postgres;

--
-- TOC entry 805 (class 1255 OID 16935)
-- Name: checkauth(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION checkauth(text, text, text) RETURNS integer
    LANGUAGE plpgsql
    AS $_$ 
DECLARE
	schema text;
BEGIN
	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	if ( $1 != '' ) THEN
		schema = $1;
	ELSE
		SELECT current_schema() into schema;
	END IF;

	-- TODO: check for an already existing trigger ?

	EXECUTE 'CREATE TRIGGER check_auth BEFORE UPDATE OR DELETE ON ' 
		|| quote_ident(schema) || '.' || quote_ident($2)
		||' FOR EACH ROW EXECUTE PROCEDURE CheckAuthTrigger('
		|| quote_literal($3) || ')';

	RETURN 0;
END;
$_$;


ALTER FUNCTION public.checkauth(text, text, text) OWNER TO postgres;

--
-- TOC entry 807 (class 1255 OID 16937)
-- Name: checkauthtrigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION checkauthtrigger() RETURNS trigger
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'check_authorization';


ALTER FUNCTION public.checkauthtrigger() OWNER TO postgres;

--
-- TOC entry 811 (class 1255 OID 16941)
-- Name: disablelongtransactions(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION disablelongtransactions() RETURNS text
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	rec RECORD;

BEGIN

	--
	-- Drop all triggers applied by CheckAuth()
	--
	FOR rec IN
		SELECT c.relname, t.tgname, t.tgargs FROM pg_trigger t, pg_class c, pg_proc p
		WHERE p.proname = 'checkauthtrigger' and t.tgfoid = p.oid and t.tgrelid = c.oid
	LOOP
		EXECUTE 'DROP TRIGGER ' || quote_ident(rec.tgname) ||
			' ON ' || quote_ident(rec.relname);
	END LOOP;

	--
	-- Drop the authorization_table table
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table' LOOP
		DROP TABLE authorization_table;
	END LOOP;

	--
	-- Drop the authorized_tables view
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables' LOOP
		DROP VIEW authorized_tables;
	END LOOP;

	RETURN 'Long transactions support disabled';
END;
$$;


ALTER FUNCTION public.disablelongtransactions() OWNER TO postgres;

--
-- TOC entry 567 (class 1255 OID 16670)
-- Name: dropgeometrycolumn(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrycolumn(table_name character varying, column_name character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('','',$1,$2) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION public.dropgeometrycolumn(table_name character varying, column_name character varying) OWNER TO postgres;

--
-- TOC entry 566 (class 1255 OID 16669)
-- Name: dropgeometrycolumn(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION public.dropgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying) OWNER TO postgres;

--
-- TOC entry 565 (class 1255 OID 16668)
-- Name: dropgeometrycolumn(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
	myrec RECORD;
	okay boolean;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = false;

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := true;
		END LOOP;

		IF ( okay <>  true ) THEN
			RAISE NOTICE 'Invalid schema name - using current_schema()';
			SELECT current_schema() into real_schema;
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT current_schema() into real_schema;
	END IF;

	-- Find out if the column is in the geometry_columns table
	okay = false;
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := true;
	END LOOP;
	IF (okay <> true) THEN
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN false;
	END IF;

	-- Remove table column
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' ||
		quote_ident(table_name) || ' DROP COLUMN ' ||
		quote_ident(column_name);

	RETURN real_schema || '.' || table_name || '.' || column_name ||' effectively removed.';

END;
$$;


ALTER FUNCTION public.dropgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying) OWNER TO postgres;

--
-- TOC entry 570 (class 1255 OID 16673)
-- Name: dropgeometrytable(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrytable(table_name character varying) RETURNS text
    LANGUAGE sql STRICT
    AS $_$ SELECT DropGeometryTable('','',$1) $_$;


ALTER FUNCTION public.dropgeometrytable(table_name character varying) OWNER TO postgres;

--
-- TOC entry 569 (class 1255 OID 16672)
-- Name: dropgeometrytable(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrytable(schema_name character varying, table_name character varying) RETURNS text
    LANGUAGE sql STRICT
    AS $_$ SELECT DropGeometryTable('',$1,$2) $_$;


ALTER FUNCTION public.dropgeometrytable(schema_name character varying, table_name character varying) OWNER TO postgres;

--
-- TOC entry 568 (class 1255 OID 16671)
-- Name: dropgeometrytable(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrytable(catalog_name character varying, schema_name character varying, table_name character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
	real_schema name;

BEGIN

	IF ( schema_name = '' ) THEN
		SELECT current_schema() into real_schema;
	ELSE
		real_schema = schema_name;
	END IF;

	-- TODO: Should we warn if table doesn't exist probably instead just saying dropped
	-- Remove table
	EXECUTE 'DROP TABLE IF EXISTS '
		|| quote_ident(real_schema) || '.' ||
		quote_ident(table_name) || ' RESTRICT';

	RETURN
		real_schema || '.' ||
		table_name ||' dropped.';

END;
$$;


ALTER FUNCTION public.dropgeometrytable(catalog_name character varying, schema_name character varying, table_name character varying) OWNER TO postgres;

--
-- TOC entry 809 (class 1255 OID 16939)
-- Name: enablelongtransactions(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION enablelongtransactions() RETURNS text
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	"query" text;
	exists bool;
	rec RECORD;

BEGIN

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists
	THEN
		"query" = 'CREATE TABLE authorization_table (
			toid oid, -- table oid
			rid text, -- row id
			expires timestamp,
			authid text
		)';
		EXECUTE "query";
	END IF;

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists THEN
		"query" = 'CREATE VIEW authorized_tables AS ' ||
			'SELECT ' ||
			'n.nspname as schema, ' ||
			'c.relname as table, trim(' ||
			quote_literal(chr(92) || '000') ||
			' from t.tgargs) as id_column ' ||
			'FROM pg_trigger t, pg_class c, pg_proc p ' ||
			', pg_namespace n ' ||
			'WHERE p.proname = ' || quote_literal('checkauthtrigger') ||
			' AND c.relnamespace = n.oid' ||
			' AND t.tgfoid = p.oid and t.tgrelid = c.oid';
		EXECUTE "query";
	END IF;

	RETURN 'Long transactions support enabled';
END;
$$;


ALTER FUNCTION public.enablelongtransactions() OWNER TO postgres;

--
-- TOC entry 692 (class 1255 OID 16822)
-- Name: equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION equals(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_Equals';


ALTER FUNCTION public.equals(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 578 (class 1255 OID 16677)
-- Name: find_srid(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION find_srid(character varying, character varying, character varying) RETURNS integer
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	schem text;
	tabl text;
	sr int4;
BEGIN
	IF $1 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - schema is NULL!';
	END IF;
	IF $2 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - table name is NULL!';
	END IF;
	IF $3 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - column name is NULL!';
	END IF;
	schem = $1;
	tabl = $2;
-- if the table contains a . and the schema is empty
-- split the table into a schema and a table
-- otherwise drop through to default behavior
	IF ( schem = '' and tabl LIKE '%.%' ) THEN
	 schem = substr(tabl,1,strpos(tabl,'.')-1);
	 tabl = substr(tabl,length(schem)+2);
	ELSE
	 schem = schem || '%';
	END IF;

	select SRID into sr from geometry_columns where f_table_schema like schem and f_table_name = tabl and f_geometry_column = $3;
	IF NOT FOUND THEN
	   RAISE EXCEPTION 'find_srid() - couldnt find the corresponding SRID - is the geometry registered in the GEOMETRY_COLUMNS table?  Is there an uppercase/lowercase missmatch?';
	END IF;
	return sr;
END;
$_$;


ALTER FUNCTION public.find_srid(character varying, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 820 (class 1255 OID 16953)
-- Name: geography(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography(bytea) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_from_bytea';


ALTER FUNCTION public.geography(bytea) OWNER TO postgres;

--
-- TOC entry 830 (class 1255 OID 16970)
-- Name: geography(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography(geometry) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_from_geometry';


ALTER FUNCTION public.geography(geometry) OWNER TO postgres;

--
-- TOC entry 819 (class 1255 OID 16951)
-- Name: geography(geography, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography(geography, integer, boolean) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_enforce_typmod';


ALTER FUNCTION public.geography(geography, integer, boolean) OWNER TO postgres;

--
-- TOC entry 845 (class 1255 OID 16998)
-- Name: geography_cmp(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_cmp(geography, geography) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_cmp';


ALTER FUNCTION public.geography_cmp(geography, geography) OWNER TO postgres;

--
-- TOC entry 844 (class 1255 OID 16997)
-- Name: geography_eq(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_eq(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_eq';


ALTER FUNCTION public.geography_eq(geography, geography) OWNER TO postgres;

--
-- TOC entry 843 (class 1255 OID 16996)
-- Name: geography_ge(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_ge(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_ge';


ALTER FUNCTION public.geography_ge(geography, geography) OWNER TO postgres;

--
-- TOC entry 833 (class 1255 OID 16975)
-- Name: geography_gist_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_compress(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_compress';


ALTER FUNCTION public.geography_gist_compress(internal) OWNER TO postgres;

--
-- TOC entry 832 (class 1255 OID 16974)
-- Name: geography_gist_consistent(internal, geography, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_consistent(internal, geography, integer) RETURNS boolean
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_consistent';


ALTER FUNCTION public.geography_gist_consistent(internal, geography, integer) OWNER TO postgres;

--
-- TOC entry 838 (class 1255 OID 16980)
-- Name: geography_gist_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_decompress(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_decompress';


ALTER FUNCTION public.geography_gist_decompress(internal) OWNER TO postgres;

--
-- TOC entry 834 (class 1255 OID 16976)
-- Name: geography_gist_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_penalty(internal, internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_penalty';


ALTER FUNCTION public.geography_gist_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 835 (class 1255 OID 16977)
-- Name: geography_gist_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_picksplit(internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_picksplit';


ALTER FUNCTION public.geography_gist_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 837 (class 1255 OID 16979)
-- Name: geography_gist_same(box2d, box2d, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_same(box2d, box2d, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_same';


ALTER FUNCTION public.geography_gist_same(box2d, box2d, internal) OWNER TO postgres;

--
-- TOC entry 836 (class 1255 OID 16978)
-- Name: geography_gist_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gist_union(bytea, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_union';


ALTER FUNCTION public.geography_gist_union(bytea, internal) OWNER TO postgres;

--
-- TOC entry 842 (class 1255 OID 16995)
-- Name: geography_gt(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_gt(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_gt';


ALTER FUNCTION public.geography_gt(geography, geography) OWNER TO postgres;

--
-- TOC entry 841 (class 1255 OID 16994)
-- Name: geography_le(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_le(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_le';


ALTER FUNCTION public.geography_le(geography, geography) OWNER TO postgres;

--
-- TOC entry 840 (class 1255 OID 16993)
-- Name: geography_lt(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_lt(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_lt';


ALTER FUNCTION public.geography_lt(geography, geography) OWNER TO postgres;

--
-- TOC entry 839 (class 1255 OID 16981)
-- Name: geography_overlaps(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geography_overlaps(geography, geography) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_overlaps';


ALTER FUNCTION public.geography_overlaps(geography, geography) OWNER TO postgres;

--
-- TOC entry 599 (class 1255 OID 16703)
-- Name: geometry(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_from_bytea';


ALTER FUNCTION public.geometry(bytea) OWNER TO postgres;

--
-- TOC entry 392 (class 1255 OID 16403)
-- Name: geometry(path); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(path) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'path_to_geometry';


ALTER FUNCTION public.geometry(path) OWNER TO postgres;

--
-- TOC entry 390 (class 1255 OID 16401)
-- Name: geometry(point); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(point) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'point_to_geometry';


ALTER FUNCTION public.geometry(point) OWNER TO postgres;

--
-- TOC entry 394 (class 1255 OID 16405)
-- Name: geometry(polygon); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(polygon) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'polygon_to_geometry';


ALTER FUNCTION public.geometry(polygon) OWNER TO postgres;

--
-- TOC entry 596 (class 1255 OID 16700)
-- Name: geometry(box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(box2d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX2D_to_LWGEOM';


ALTER FUNCTION public.geometry(box2d) OWNER TO postgres;

--
-- TOC entry 597 (class 1255 OID 16701)
-- Name: geometry(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(box3d) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX3D_to_LWGEOM';


ALTER FUNCTION public.geometry(box3d) OWNER TO postgres;

--
-- TOC entry 831 (class 1255 OID 16972)
-- Name: geometry(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(geography) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geometry_from_geography';


ALTER FUNCTION public.geometry(geography) OWNER TO postgres;

--
-- TOC entry 598 (class 1255 OID 16702)
-- Name: geometry(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'parse_WKT_lwgeom';


ALTER FUNCTION public.geometry(text) OWNER TO postgres;

--
-- TOC entry 389 (class 1255 OID 16399)
-- Name: geometry(geometry, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(geometry, integer, boolean) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geometry_enforce_typmod';


ALTER FUNCTION public.geometry(geometry, integer, boolean) OWNER TO postgres;

--
-- TOC entry 440 (class 1255 OID 16494)
-- Name: geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_above(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_above_2d';


ALTER FUNCTION public.geometry_above(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 435 (class 1255 OID 16485)
-- Name: geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_below(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_below_2d';


ALTER FUNCTION public.geometry_below(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 411 (class 1255 OID 16438)
-- Name: geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_cmp(geom1 geometry, geom2 geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'lwgeom_cmp';


ALTER FUNCTION public.geometry_cmp(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 431 (class 1255 OID 16475)
-- Name: geometry_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_contains(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_contains_2d';


ALTER FUNCTION public.geometry_contains(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 430 (class 1255 OID 16472)
-- Name: geometry_distance_box(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_distance_box(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_distance_box_2d';


ALTER FUNCTION public.geometry_distance_box(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 429 (class 1255 OID 16471)
-- Name: geometry_distance_centroid(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_distance_centroid(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_distance_centroid_2d';


ALTER FUNCTION public.geometry_distance_centroid(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 410 (class 1255 OID 16437)
-- Name: geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_eq(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'lwgeom_eq';


ALTER FUNCTION public.geometry_eq(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 409 (class 1255 OID 16436)
-- Name: geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_ge(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'lwgeom_ge';


ALTER FUNCTION public.geometry_ge(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 414 (class 1255 OID 16454)
-- Name: geometry_gist_compress_2d(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_compress_2d(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_compress_2d';


ALTER FUNCTION public.geometry_gist_compress_2d(internal) OWNER TO postgres;

--
-- TOC entry 442 (class 1255 OID 16520)
-- Name: geometry_gist_compress_nd(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_compress_nd(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_compress';


ALTER FUNCTION public.geometry_gist_compress_nd(internal) OWNER TO postgres;

--
-- TOC entry 413 (class 1255 OID 16453)
-- Name: geometry_gist_consistent_2d(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_consistent_2d(internal, geometry, integer) RETURNS boolean
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_consistent_2d';


ALTER FUNCTION public.geometry_gist_consistent_2d(internal, geometry, integer) OWNER TO postgres;

--
-- TOC entry 441 (class 1255 OID 16519)
-- Name: geometry_gist_consistent_nd(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_consistent_nd(internal, geometry, integer) RETURNS boolean
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_consistent';


ALTER FUNCTION public.geometry_gist_consistent_nd(internal, geometry, integer) OWNER TO postgres;

--
-- TOC entry 419 (class 1255 OID 16459)
-- Name: geometry_gist_decompress_2d(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_decompress_2d(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_decompress_2d';


ALTER FUNCTION public.geometry_gist_decompress_2d(internal) OWNER TO postgres;

--
-- TOC entry 447 (class 1255 OID 16525)
-- Name: geometry_gist_decompress_nd(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_decompress_nd(internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_decompress';


ALTER FUNCTION public.geometry_gist_decompress_nd(internal) OWNER TO postgres;

--
-- TOC entry 412 (class 1255 OID 16452)
-- Name: geometry_gist_distance_2d(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_distance_2d(internal, geometry, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_distance_2d';


ALTER FUNCTION public.geometry_gist_distance_2d(internal, geometry, integer) OWNER TO postgres;

--
-- TOC entry 415 (class 1255 OID 16455)
-- Name: geometry_gist_penalty_2d(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_penalty_2d(internal, internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_penalty_2d';


ALTER FUNCTION public.geometry_gist_penalty_2d(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 443 (class 1255 OID 16521)
-- Name: geometry_gist_penalty_nd(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_penalty_nd(internal, internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_penalty';


ALTER FUNCTION public.geometry_gist_penalty_nd(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 416 (class 1255 OID 16456)
-- Name: geometry_gist_picksplit_2d(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_picksplit_2d(internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_picksplit_2d';


ALTER FUNCTION public.geometry_gist_picksplit_2d(internal, internal) OWNER TO postgres;

--
-- TOC entry 444 (class 1255 OID 16522)
-- Name: geometry_gist_picksplit_nd(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_picksplit_nd(internal, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_picksplit';


ALTER FUNCTION public.geometry_gist_picksplit_nd(internal, internal) OWNER TO postgres;

--
-- TOC entry 418 (class 1255 OID 16458)
-- Name: geometry_gist_same_2d(geometry, geometry, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_same_2d(geom1 geometry, geom2 geometry, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_same_2d';


ALTER FUNCTION public.geometry_gist_same_2d(geom1 geometry, geom2 geometry, internal) OWNER TO postgres;

--
-- TOC entry 446 (class 1255 OID 16524)
-- Name: geometry_gist_same_nd(geometry, geometry, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_same_nd(geometry, geometry, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_same';


ALTER FUNCTION public.geometry_gist_same_nd(geometry, geometry, internal) OWNER TO postgres;

--
-- TOC entry 417 (class 1255 OID 16457)
-- Name: geometry_gist_union_2d(bytea, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_union_2d(bytea, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_union_2d';


ALTER FUNCTION public.geometry_gist_union_2d(bytea, internal) OWNER TO postgres;

--
-- TOC entry 445 (class 1255 OID 16523)
-- Name: geometry_gist_union_nd(bytea, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gist_union_nd(bytea, internal) RETURNS internal
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_union';


ALTER FUNCTION public.geometry_gist_union_nd(bytea, internal) OWNER TO postgres;

--
-- TOC entry 408 (class 1255 OID 16435)
-- Name: geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gt(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'lwgeom_gt';


ALTER FUNCTION public.geometry_gt(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 407 (class 1255 OID 16434)
-- Name: geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_le(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'lwgeom_le';


ALTER FUNCTION public.geometry_le(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 433 (class 1255 OID 16479)
-- Name: geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_left(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_left_2d';


ALTER FUNCTION public.geometry_left(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 406 (class 1255 OID 16433)
-- Name: geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_lt(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'lwgeom_lt';


ALTER FUNCTION public.geometry_lt(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 439 (class 1255 OID 16493)
-- Name: geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overabove(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_overabove_2d';


ALTER FUNCTION public.geometry_overabove(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 436 (class 1255 OID 16488)
-- Name: geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overbelow(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_overbelow_2d';


ALTER FUNCTION public.geometry_overbelow(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 427 (class 1255 OID 16467)
-- Name: geometry_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overlaps(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_overlaps_2d';


ALTER FUNCTION public.geometry_overlaps(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 448 (class 1255 OID 16526)
-- Name: geometry_overlaps_nd(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overlaps_nd(geometry, geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_overlaps';


ALTER FUNCTION public.geometry_overlaps_nd(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 434 (class 1255 OID 16482)
-- Name: geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overleft(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_overleft_2d';


ALTER FUNCTION public.geometry_overleft(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 437 (class 1255 OID 16491)
-- Name: geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overright(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_overright_2d';


ALTER FUNCTION public.geometry_overright(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 438 (class 1255 OID 16492)
-- Name: geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_right(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_right_2d';


ALTER FUNCTION public.geometry_right(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 428 (class 1255 OID 16469)
-- Name: geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_same(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_same_2d';


ALTER FUNCTION public.geometry_same(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 432 (class 1255 OID 16476)
-- Name: geometry_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_within(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'gserialized_within_2d';


ALTER FUNCTION public.geometry_within(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 902 (class 1255 OID 17068)
-- Name: geometrytype(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometrytype(geography) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_getTYPE';


ALTER FUNCTION public.geometrytype(geography) OWNER TO postgres;

--
-- TOC entry 724 (class 1255 OID 16853)
-- Name: geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometrytype(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_getTYPE';


ALTER FUNCTION public.geometrytype(geometry) OWNER TO postgres;

--
-- TOC entry 533 (class 1255 OID 16622)
-- Name: geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromewkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOMFromWKB';


ALTER FUNCTION public.geomfromewkb(bytea) OWNER TO postgres;

--
-- TOC entry 535 (class 1255 OID 16624)
-- Name: geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromewkt(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'parse_WKT_lwgeom';


ALTER FUNCTION public.geomfromewkt(text) OWNER TO postgres;

--
-- TOC entry 579 (class 1255 OID 16678)
-- Name: get_proj4_from_srid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION get_proj4_from_srid(integer) RETURNS text
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
BEGIN
	RETURN proj4text::text FROM spatial_ref_sys WHERE srid= $1;
END;
$_$;


ALTER FUNCTION public.get_proj4_from_srid(integer) OWNER TO postgres;

--
-- TOC entry 808 (class 1255 OID 16938)
-- Name: gettransactionid(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gettransactionid() RETURNS xid
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'getTransactionID';


ALTER FUNCTION public.gettransactionid() OWNER TO postgres;

--
-- TOC entry 425 (class 1255 OID 16465)
-- Name: gserialized_gist_joinsel_2d(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gserialized_gist_joinsel_2d(internal, oid, internal, smallint) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_joinsel_2d';


ALTER FUNCTION public.gserialized_gist_joinsel_2d(internal, oid, internal, smallint) OWNER TO postgres;

--
-- TOC entry 426 (class 1255 OID 16466)
-- Name: gserialized_gist_joinsel_nd(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gserialized_gist_joinsel_nd(internal, oid, internal, smallint) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_joinsel_nd';


ALTER FUNCTION public.gserialized_gist_joinsel_nd(internal, oid, internal, smallint) OWNER TO postgres;

--
-- TOC entry 423 (class 1255 OID 16463)
-- Name: gserialized_gist_sel_2d(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gserialized_gist_sel_2d(internal, oid, internal, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_sel_2d';


ALTER FUNCTION public.gserialized_gist_sel_2d(internal, oid, internal, integer) OWNER TO postgres;

--
-- TOC entry 424 (class 1255 OID 16464)
-- Name: gserialized_gist_sel_nd(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gserialized_gist_sel_nd(internal, oid, internal, integer) RETURNS double precision
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'gserialized_gist_sel_nd';


ALTER FUNCTION public.gserialized_gist_sel_nd(internal, oid, internal, integer) OWNER TO postgres;

--
-- TOC entry 802 (class 1255 OID 16932)
-- Name: lockrow(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lockrow(text, text, text) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, now()::timestamp+'1:00'); $_$;


ALTER FUNCTION public.lockrow(text, text, text) OWNER TO postgres;

--
-- TOC entry 801 (class 1255 OID 16931)
-- Name: lockrow(text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lockrow(text, text, text, text) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow($1, $2, $3, $4, now()::timestamp+'1:00'); $_$;


ALTER FUNCTION public.lockrow(text, text, text, text) OWNER TO postgres;

--
-- TOC entry 803 (class 1255 OID 16933)
-- Name: lockrow(text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lockrow(text, text, text, timestamp without time zone) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, $4); $_$;


ALTER FUNCTION public.lockrow(text, text, text, timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 800 (class 1255 OID 16930)
-- Name: lockrow(text, text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lockrow(text, text, text, text, timestamp without time zone) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $_$ 
DECLARE
	myschema alias for $1;
	mytable alias for $2;
	myrid   alias for $3;
	authid alias for $4;
	expires alias for $5;
	ret int;
	mytoid oid;
	myrec RECORD;
	
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table WHERE expires < now()'; 

	SELECT c.oid INTO mytoid FROM pg_class c, pg_namespace n
		WHERE c.relname = mytable
		AND c.relnamespace = n.oid
		AND n.nspname = myschema;

	-- RAISE NOTICE 'toid: %', mytoid;

	FOR myrec IN SELECT * FROM authorization_table WHERE 
		toid = mytoid AND rid = myrid
	LOOP
		IF myrec.authid != authid THEN
			RETURN 0;
		ELSE
			RETURN 1;
		END IF;
	END LOOP;

	EXECUTE 'INSERT INTO authorization_table VALUES ('||
		quote_literal(mytoid::text)||','||quote_literal(myrid)||
		','||quote_literal(expires::text)||
		','||quote_literal(authid) ||')';

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$;


ALTER FUNCTION public.lockrow(text, text, text, text, timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 810 (class 1255 OID 16940)
-- Name: longtransactionsenabled(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION longtransactionsenabled() RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	rec RECORD;
BEGIN
	FOR rec IN SELECT oid FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		return 't';
	END LOOP;
	return 'f';
END;
$$;


ALTER FUNCTION public.longtransactionsenabled() OWNER TO postgres;

--
-- TOC entry 393 (class 1255 OID 16404)
-- Name: path(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION path(geometry) RETURNS path
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geometry_to_path';


ALTER FUNCTION public.path(geometry) OWNER TO postgres;

--
-- TOC entry 654 (class 1255 OID 16779)
-- Name: pgis_geometry_accum_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_geometry_accum_finalfn(pgis_abs) RETURNS geometry[]
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'pgis_geometry_accum_finalfn';


ALTER FUNCTION public.pgis_geometry_accum_finalfn(pgis_abs) OWNER TO postgres;

--
-- TOC entry 653 (class 1255 OID 16778)
-- Name: pgis_geometry_accum_transfn(pgis_abs, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_geometry_accum_transfn(pgis_abs, geometry) RETURNS pgis_abs
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'pgis_geometry_accum_transfn';


ALTER FUNCTION public.pgis_geometry_accum_transfn(pgis_abs, geometry) OWNER TO postgres;

--
-- TOC entry 656 (class 1255 OID 16781)
-- Name: pgis_geometry_collect_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_geometry_collect_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'pgis_geometry_collect_finalfn';


ALTER FUNCTION public.pgis_geometry_collect_finalfn(pgis_abs) OWNER TO postgres;

--
-- TOC entry 658 (class 1255 OID 16783)
-- Name: pgis_geometry_makeline_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_geometry_makeline_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'pgis_geometry_makeline_finalfn';


ALTER FUNCTION public.pgis_geometry_makeline_finalfn(pgis_abs) OWNER TO postgres;

--
-- TOC entry 657 (class 1255 OID 16782)
-- Name: pgis_geometry_polygonize_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_geometry_polygonize_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'pgis_geometry_polygonize_finalfn';


ALTER FUNCTION public.pgis_geometry_polygonize_finalfn(pgis_abs) OWNER TO postgres;

--
-- TOC entry 655 (class 1255 OID 16780)
-- Name: pgis_geometry_union_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgis_geometry_union_finalfn(pgis_abs) RETURNS geometry
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'pgis_geometry_union_finalfn';


ALTER FUNCTION public.pgis_geometry_union_finalfn(pgis_abs) OWNER TO postgres;

--
-- TOC entry 391 (class 1255 OID 16402)
-- Name: point(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION point(geometry) RETURNS point
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geometry_to_point';


ALTER FUNCTION public.point(geometry) OWNER TO postgres;

--
-- TOC entry 395 (class 1255 OID 16406)
-- Name: polygon(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polygon(geometry) RETURNS polygon
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geometry_to_polygon';


ALTER FUNCTION public.polygon(geometry) OWNER TO postgres;

--
-- TOC entry 560 (class 1255 OID 16661)
-- Name: populate_geometry_columns(boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION populate_geometry_columns(use_typmod boolean DEFAULT true) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
	inserted    integer;
	oldcount    integer;
	probed      integer;
	stale       integer;
	gcs         RECORD;
	gc          RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;

BEGIN
	SELECT count(*) INTO oldcount FROM geometry_columns;
	inserted := 0;

	-- Count the number of geometry columns in all tables and views
	SELECT count(DISTINCT c.oid) INTO probed
	FROM pg_class c,
		 pg_attribute a,
		 pg_type t,
		 pg_namespace n
	WHERE (c.relkind = 'r' OR c.relkind = 'v')
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%' AND c.relname != 'raster_columns' ;

	-- Iterate through all non-dropped geometry columns
	RAISE DEBUG 'Processing Tables.....';

	FOR gcs IN
	SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind = 'r'
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%' AND c.relname != 'raster_columns' 
	LOOP

		inserted := inserted + populate_geometry_columns(gcs.oid, use_typmod);
	END LOOP;

	IF oldcount > inserted THEN
	    stale = oldcount-inserted;
	ELSE
	    stale = 0;
	END IF;

	RETURN 'probed:' ||probed|| ' inserted:'||inserted;
END

$$;


ALTER FUNCTION public.populate_geometry_columns(use_typmod boolean) OWNER TO postgres;

--
-- TOC entry 561 (class 1255 OID 16662)
-- Name: populate_geometry_columns(oid, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION populate_geometry_columns(tbl_oid oid, use_typmod boolean DEFAULT true) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
	gcs         RECORD;
	gc          RECORD;
	gc_old      RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;
	inserted    integer;
	constraint_successful boolean := false;

BEGIN
	inserted := 0;

	-- Iterate through all geometry columns in this table
	FOR gcs IN
	SELECT n.nspname, c.relname, a.attname
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind = 'r'
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%'
		AND c.oid = tbl_oid
	LOOP

        RAISE DEBUG 'Processing column %.%.%', gcs.nspname, gcs.relname, gcs.attname;
    
        gc_is_valid := true;
        -- Find the srid, coord_dimension, and type of current geometry
        -- in geometry_columns -- which is now a view
        
        SELECT type, srid, coord_dimension INTO gc_old 
            FROM geometry_columns 
            WHERE f_table_schema = gcs.nspname AND f_table_name = gcs.relname AND f_geometry_column = gcs.attname; 
            
        IF upper(gc_old.type) = 'GEOMETRY' THEN
        -- This is an unconstrained geometry we need to do something
        -- We need to figure out what to set the type by inspecting the data
            EXECUTE 'SELECT st_srid(' || quote_ident(gcs.attname) || ') As srid, GeometryType(' || quote_ident(gcs.attname) || ') As type, ST_NDims(' || quote_ident(gcs.attname) || ') As dims ' ||
                     ' FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || 
                     ' WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1;'
                INTO gc;
            IF gc IS NULL THEN -- there is no data so we can not determine geometry type
            	RAISE WARNING 'No data in table %.%, so no information to determine geometry type and srid', gcs.nspname, gcs.relname;
            	RETURN 0;
            END IF;
            gsrid := gc.srid; gtype := gc.type; gndims := gc.dims;
            	
            IF use_typmod THEN
                BEGIN
                    EXECUTE 'ALTER TABLE ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' ALTER COLUMN ' || quote_ident(gcs.attname) || 
                        ' TYPE geometry(' || postgis_type_name(gtype, gndims, true) || ', ' || gsrid::text  || ') ';
                    inserted := inserted + 1;
                EXCEPTION
                        WHEN invalid_parameter_value OR feature_not_supported THEN
                        RAISE WARNING 'Could not convert ''%'' in ''%.%'' to use typmod with srid %, type %: %', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), gsrid, postgis_type_name(gtype, gndims, true), SQLERRM;
                            gc_is_valid := false;
                END;
                
            ELSE
                -- Try to apply srid check to column
            	constraint_successful = false;
                IF (gsrid > 0 AND postgis_constraint_srid(gcs.nspname, gcs.relname,gcs.attname) IS NULL ) THEN
                    BEGIN
                        EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || 
                                 ' ADD CONSTRAINT ' || quote_ident('enforce_srid_' || gcs.attname) || 
                                 ' CHECK (st_srid(' || quote_ident(gcs.attname) || ') = ' || gsrid || ')';
                        constraint_successful := true;
                    EXCEPTION
                        WHEN check_violation THEN
                            RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (st_srid(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gsrid;
                            gc_is_valid := false;
                    END;
                END IF;
                
                -- Try to apply ndims check to column
                IF (gndims IS NOT NULL AND postgis_constraint_dims(gcs.nspname, gcs.relname,gcs.attname) IS NULL ) THEN
                    BEGIN
                        EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
                                 ADD CONSTRAINT ' || quote_ident('enforce_dims_' || gcs.attname) || '
                                 CHECK (st_ndims(' || quote_ident(gcs.attname) || ') = '||gndims||')';
                        constraint_successful := true;
                    EXCEPTION
                        WHEN check_violation THEN
                            RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (st_ndims(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gndims;
                            gc_is_valid := false;
                    END;
                END IF;
    
                -- Try to apply geometrytype check to column
                IF (gtype IS NOT NULL AND postgis_constraint_type(gcs.nspname, gcs.relname,gcs.attname) IS NULL ) THEN
                    BEGIN
                        EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
                        ADD CONSTRAINT ' || quote_ident('enforce_geotype_' || gcs.attname) || '
                        CHECK ((geometrytype(' || quote_ident(gcs.attname) || ') = ' || quote_literal(gtype) || ') OR (' || quote_ident(gcs.attname) || ' IS NULL))';
                        constraint_successful := true;
                    EXCEPTION
                        WHEN check_violation THEN
                            -- No geometry check can be applied. This column contains a number of geometry types.
                            RAISE WARNING 'Could not add geometry type check (%) to table column: %.%.%', gtype, quote_ident(gcs.nspname),quote_ident(gcs.relname),quote_ident(gcs.attname);
                    END;
                END IF;
                 --only count if we were successful in applying at least one constraint
                IF constraint_successful THEN
                	inserted := inserted + 1;
                END IF;
            END IF;	        
	    END IF;

	END LOOP;

	RETURN inserted;
END

$$;


ALTER FUNCTION public.populate_geometry_columns(tbl_oid oid, use_typmod boolean) OWNER TO postgres;

--
-- TOC entry 479 (class 1255 OID 16568)
-- Name: postgis_addbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_addbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_addBBOX';


ALTER FUNCTION public.postgis_addbbox(geometry) OWNER TO postgres;

--
-- TOC entry 537 (class 1255 OID 16626)
-- Name: postgis_cache_bbox(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_cache_bbox() RETURNS trigger
    LANGUAGE c
    AS '$libdir/postgis-2.1', 'cache_bbox';


ALTER FUNCTION public.postgis_cache_bbox() OWNER TO postgres;

--
-- TOC entry 909 (class 1255 OID 17074)
-- Name: postgis_constraint_dims(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_constraint_dims(geomschema text, geomtable text, geomcolumn text) RETURNS integer
    LANGUAGE sql STABLE STRICT
    AS $_$
SELECT  replace(split_part(s.consrc, ' = ', 2), ')', '')::integer
		 FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
		 WHERE n.nspname = $1
		 AND c.relname = $2
		 AND a.attname = $3
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%ndims(% = %';
$_$;


ALTER FUNCTION public.postgis_constraint_dims(geomschema text, geomtable text, geomcolumn text) OWNER TO postgres;

--
-- TOC entry 908 (class 1255 OID 17073)
-- Name: postgis_constraint_srid(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_constraint_srid(geomschema text, geomtable text, geomcolumn text) RETURNS integer
    LANGUAGE sql STABLE STRICT
    AS $_$
SELECT replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', '')::integer
		 FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
		 WHERE n.nspname = $1
		 AND c.relname = $2
		 AND a.attname = $3
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%srid(% = %';
$_$;


ALTER FUNCTION public.postgis_constraint_srid(geomschema text, geomtable text, geomcolumn text) OWNER TO postgres;

--
-- TOC entry 910 (class 1255 OID 17075)
-- Name: postgis_constraint_type(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_constraint_type(geomschema text, geomtable text, geomcolumn text) RETURNS character varying
    LANGUAGE sql STABLE STRICT
    AS $_$
SELECT  replace(split_part(s.consrc, '''', 2), ')', '')::varchar		
		 FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
		 WHERE n.nspname = $1
		 AND c.relname = $2
		 AND a.attname = $3
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%geometrytype(% = %';
$_$;


ALTER FUNCTION public.postgis_constraint_type(geomschema text, geomtable text, geomcolumn text) OWNER TO postgres;

--
-- TOC entry 480 (class 1255 OID 16569)
-- Name: postgis_dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_dropbbox(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_dropBBOX';


ALTER FUNCTION public.postgis_dropbbox(geometry) OWNER TO postgres;

--
-- TOC entry 592 (class 1255 OID 16691)
-- Name: postgis_full_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_full_version() RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
	libver text;
	svnver text;
	projver text;
	geosver text;
	sfcgalver text;
	cgalver text;
	gdalver text;
	libxmlver text;
	dbproc text;
	relproc text;
	fullver text;
	rast_lib_ver text;
	rast_scr_ver text;
	topo_scr_ver text;
	json_lib_ver text;
BEGIN
	SELECT postgis_lib_version() INTO libver;
	SELECT postgis_proj_version() INTO projver;
	SELECT postgis_geos_version() INTO geosver;
	SELECT postgis_libjson_version() INTO json_lib_ver;
	BEGIN
		SELECT postgis_gdal_version() INTO gdalver;
	EXCEPTION
		WHEN undefined_function THEN
			gdalver := NULL;
			RAISE NOTICE 'Function postgis_gdal_version() not found.  Is raster support enabled and rtpostgis.sql installed?';
	END;
	BEGIN
		SELECT postgis_sfcgal_version() INTO sfcgalver;
	EXCEPTION
		WHEN undefined_function THEN
			sfcgalver := NULL;
	END;
	SELECT postgis_libxml_version() INTO libxmlver;
	SELECT postgis_scripts_installed() INTO dbproc;
	SELECT postgis_scripts_released() INTO relproc;
	select postgis_svn_version() INTO svnver;
	BEGIN
		SELECT topology.postgis_topology_scripts_installed() INTO topo_scr_ver;
	EXCEPTION
		WHEN undefined_function OR invalid_schema_name THEN
			topo_scr_ver := NULL;
			RAISE NOTICE 'Function postgis_topology_scripts_installed() not found. Is topology support enabled and topology.sql installed?';
		WHEN insufficient_privilege THEN
			RAISE NOTICE 'Topology support cannot be inspected. Is current user granted USAGE on schema "topology" ?';
		WHEN OTHERS THEN
			RAISE NOTICE 'Function postgis_topology_scripts_installed() could not be called: % (%)', SQLERRM, SQLSTATE;
	END;

	BEGIN
		SELECT postgis_raster_scripts_installed() INTO rast_scr_ver;
	EXCEPTION
		WHEN undefined_function THEN
			rast_scr_ver := NULL;
			RAISE NOTICE 'Function postgis_raster_scripts_installed() not found. Is raster support enabled and rtpostgis.sql installed?';
	END;

	BEGIN
		SELECT postgis_raster_lib_version() INTO rast_lib_ver;
	EXCEPTION
		WHEN undefined_function THEN
			rast_lib_ver := NULL;
			RAISE NOTICE 'Function postgis_raster_lib_version() not found. Is raster support enabled and rtpostgis.sql installed?';
	END;

	fullver = 'POSTGIS="' || libver;

	IF  svnver IS NOT NULL THEN
		fullver = fullver || ' r' || svnver;
	END IF;

	fullver = fullver || '"';

	IF  geosver IS NOT NULL THEN
		fullver = fullver || ' GEOS="' || geosver || '"';
	END IF;

	IF  sfcgalver IS NOT NULL THEN
		fullver = fullver || ' SFCGAL="' || sfcgalver || '"';
	END IF;

	IF  projver IS NOT NULL THEN
		fullver = fullver || ' PROJ="' || projver || '"';
	END IF;

	IF  gdalver IS NOT NULL THEN
		fullver = fullver || ' GDAL="' || gdalver || '"';
	END IF;

	IF  libxmlver IS NOT NULL THEN
		fullver = fullver || ' LIBXML="' || libxmlver || '"';
	END IF;

	IF json_lib_ver IS NOT NULL THEN
		fullver = fullver || ' LIBJSON="' || json_lib_ver || '"';
	END IF;

	-- fullver = fullver || ' DBPROC="' || dbproc || '"';
	-- fullver = fullver || ' RELPROC="' || relproc || '"';

	IF dbproc != relproc THEN
		fullver = fullver || ' (core procs from "' || dbproc || '" need upgrade)';
	END IF;

	IF topo_scr_ver IS NOT NULL THEN
		fullver = fullver || ' TOPOLOGY';
		IF topo_scr_ver != relproc THEN
			fullver = fullver || ' (topology procs from "' || topo_scr_ver || '" need upgrade)';
		END IF;
	END IF;

	IF rast_lib_ver IS NOT NULL THEN
		fullver = fullver || ' RASTER';
		IF rast_lib_ver != relproc THEN
			fullver = fullver || ' (raster lib from "' || rast_lib_ver || '" need upgrade)';
		END IF;
	END IF;

	IF rast_scr_ver IS NOT NULL AND rast_scr_ver != relproc THEN
		fullver = fullver || ' (raster procs from "' || rast_scr_ver || '" need upgrade)';
	END IF;

	RETURN fullver;
END
$$;


ALTER FUNCTION public.postgis_full_version() OWNER TO postgres;

--
-- TOC entry 587 (class 1255 OID 16686)
-- Name: postgis_geos_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_geos_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'postgis_geos_version';


ALTER FUNCTION public.postgis_geos_version() OWNER TO postgres;

--
-- TOC entry 470 (class 1255 OID 16559)
-- Name: postgis_getbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_getbbox(geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_to_BOX2D';


ALTER FUNCTION public.postgis_getbbox(geometry) OWNER TO postgres;

--
-- TOC entry 481 (class 1255 OID 16570)
-- Name: postgis_hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_hasbbox(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_hasBBOX';


ALTER FUNCTION public.postgis_hasbbox(geometry) OWNER TO postgres;

--
-- TOC entry 591 (class 1255 OID 16690)
-- Name: postgis_lib_build_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_lib_build_date() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'postgis_lib_build_date';


ALTER FUNCTION public.postgis_lib_build_date() OWNER TO postgres;

--
-- TOC entry 585 (class 1255 OID 16684)
-- Name: postgis_lib_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_lib_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'postgis_lib_version';


ALTER FUNCTION public.postgis_lib_version() OWNER TO postgres;

--
-- TOC entry 700 (class 1255 OID 16830)
-- Name: postgis_libjson_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_libjson_version() RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'postgis_libjson_version';


ALTER FUNCTION public.postgis_libjson_version() OWNER TO postgres;

--
-- TOC entry 589 (class 1255 OID 16688)
-- Name: postgis_libxml_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_libxml_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'postgis_libxml_version';


ALTER FUNCTION public.postgis_libxml_version() OWNER TO postgres;

--
-- TOC entry 523 (class 1255 OID 16612)
-- Name: postgis_noop(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_noop(geometry) RETURNS geometry
    LANGUAGE c STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_noop';


ALTER FUNCTION public.postgis_noop(geometry) OWNER TO postgres;

--
-- TOC entry 583 (class 1255 OID 16682)
-- Name: postgis_proj_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_proj_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'postgis_proj_version';


ALTER FUNCTION public.postgis_proj_version() OWNER TO postgres;

--
-- TOC entry 590 (class 1255 OID 16689)
-- Name: postgis_scripts_build_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_scripts_build_date() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$SELECT '2014-06-16 12:28:00'::text AS version$$;


ALTER FUNCTION public.postgis_scripts_build_date() OWNER TO postgres;

--
-- TOC entry 584 (class 1255 OID 16683)
-- Name: postgis_scripts_installed(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_scripts_installed() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$ SELECT '2.1.3'::text || ' r' || 12547::text AS version $$;


ALTER FUNCTION public.postgis_scripts_installed() OWNER TO postgres;

--
-- TOC entry 586 (class 1255 OID 16685)
-- Name: postgis_scripts_released(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_scripts_released() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'postgis_scripts_released';


ALTER FUNCTION public.postgis_scripts_released() OWNER TO postgres;

--
-- TOC entry 588 (class 1255 OID 16687)
-- Name: postgis_svn_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_svn_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'postgis_svn_version';


ALTER FUNCTION public.postgis_svn_version() OWNER TO postgres;

--
-- TOC entry 580 (class 1255 OID 16679)
-- Name: postgis_transform_geometry(geometry, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_transform_geometry(geometry, text, text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'transform_geom';


ALTER FUNCTION public.postgis_transform_geometry(geometry, text, text, integer) OWNER TO postgres;

--
-- TOC entry 907 (class 1255 OID 17072)
-- Name: postgis_type_name(character varying, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_type_name(geomname character varying, coord_dimension integer, use_new_name boolean DEFAULT true) RETURNS character varying
    LANGUAGE sql IMMUTABLE STRICT COST 200
    AS $_$
 SELECT CASE WHEN $3 THEN new_name ELSE old_name END As geomname
 	FROM 
 	( VALUES
 		 ('GEOMETRY', 'Geometry', 2) ,
 		 	('GEOMETRY', 'GeometryZ', 3) ,
 		 	('GEOMETRY', 'GeometryZM', 4) ,
			('GEOMETRYCOLLECTION', 'GeometryCollection', 2) ,
			('GEOMETRYCOLLECTION', 'GeometryCollectionZ', 3) ,
			('GEOMETRYCOLLECTIONM', 'GeometryCollectionM', 3) ,
			('GEOMETRYCOLLECTION', 'GeometryCollectionZM', 4) ,
			
			('POINT', 'Point',2) ,
			('POINTM','PointM',3) ,
			('POINT', 'PointZ',3) ,
			('POINT', 'PointZM',4) ,
			
			('MULTIPOINT','MultiPoint',2) ,
			('MULTIPOINT','MultiPointZ',3) ,
			('MULTIPOINTM','MultiPointM',3) ,
			('MULTIPOINT','MultiPointZM',4) ,
			
			('POLYGON', 'Polygon',2) ,
			('POLYGON', 'PolygonZ',3) ,
			('POLYGONM', 'PolygonM',3) ,
			('POLYGON', 'PolygonZM',4) ,
			
			('MULTIPOLYGON', 'MultiPolygon',2) ,
			('MULTIPOLYGON', 'MultiPolygonZ',3) ,
			('MULTIPOLYGONM', 'MultiPolygonM',3) ,
			('MULTIPOLYGON', 'MultiPolygonZM',4) ,
			
			('MULTILINESTRING', 'MultiLineString',2) ,
			('MULTILINESTRING', 'MultiLineStringZ',3) ,
			('MULTILINESTRINGM', 'MultiLineStringM',3) ,
			('MULTILINESTRING', 'MultiLineStringZM',4) ,
			
			('LINESTRING', 'LineString',2) ,
			('LINESTRING', 'LineStringZ',3) ,
			('LINESTRINGM', 'LineStringM',3) ,
			('LINESTRING', 'LineStringZM',4) ,
			
			('CIRCULARSTRING', 'CircularString',2) ,
			('CIRCULARSTRING', 'CircularStringZ',3) ,
			('CIRCULARSTRINGM', 'CircularStringM',3) ,
			('CIRCULARSTRING', 'CircularStringZM',4) ,
			
			('COMPOUNDCURVE', 'CompoundCurve',2) ,
			('COMPOUNDCURVE', 'CompoundCurveZ',3) ,
			('COMPOUNDCURVEM', 'CompoundCurveM',3) ,
			('COMPOUNDCURVE', 'CompoundCurveZM',4) ,
			
			('CURVEPOLYGON', 'CurvePolygon',2) ,
			('CURVEPOLYGON', 'CurvePolygonZ',3) ,
			('CURVEPOLYGONM', 'CurvePolygonM',3) ,
			('CURVEPOLYGON', 'CurvePolygonZM',4) ,
			
			('MULTICURVE', 'MultiCurve',2 ) ,
			('MULTICURVE', 'MultiCurveZ',3 ) ,
			('MULTICURVEM', 'MultiCurveM',3 ) ,
			('MULTICURVE', 'MultiCurveZM',4 ) ,
			
			('MULTISURFACE', 'MultiSurface', 2) ,
			('MULTISURFACE', 'MultiSurfaceZ', 3) ,
			('MULTISURFACEM', 'MultiSurfaceM', 3) ,
			('MULTISURFACE', 'MultiSurfaceZM', 4) ,
			
			('POLYHEDRALSURFACE', 'PolyhedralSurface',2) ,
			('POLYHEDRALSURFACE', 'PolyhedralSurfaceZ',3) ,
			('POLYHEDRALSURFACEM', 'PolyhedralSurfaceM',3) ,
			('POLYHEDRALSURFACE', 'PolyhedralSurfaceZM',4) ,
			
			('TRIANGLE', 'Triangle',2) ,
			('TRIANGLE', 'TriangleZ',3) ,
			('TRIANGLEM', 'TriangleM',3) ,
			('TRIANGLE', 'TriangleZM',4) ,

			('TIN', 'Tin', 2),
			('TIN', 'TinZ', 3),
			('TIN', 'TinM', 3),
			('TIN', 'TinZM', 4) )
			 As g(old_name, new_name, coord_dimension)
		WHERE (upper(old_name) = upper($1) OR upper(new_name) = upper($1))
			AND coord_dimension = $2;
$_$;


ALTER FUNCTION public.postgis_type_name(geomname character varying, coord_dimension integer, use_new_name boolean) OWNER TO postgres;

--
-- TOC entry 827 (class 1255 OID 16962)
-- Name: postgis_typmod_dims(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_typmod_dims(integer) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'postgis_typmod_dims';


ALTER FUNCTION public.postgis_typmod_dims(integer) OWNER TO postgres;

--
-- TOC entry 828 (class 1255 OID 16963)
-- Name: postgis_typmod_srid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_typmod_srid(integer) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'postgis_typmod_srid';


ALTER FUNCTION public.postgis_typmod_srid(integer) OWNER TO postgres;

--
-- TOC entry 829 (class 1255 OID 16964)
-- Name: postgis_typmod_type(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_typmod_type(integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'postgis_typmod_type';


ALTER FUNCTION public.postgis_typmod_type(integer) OWNER TO postgres;

--
-- TOC entry 582 (class 1255 OID 16681)
-- Name: postgis_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_version() RETURNS text
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'postgis_version';


ALTER FUNCTION public.postgis_version() OWNER TO postgres;

--
-- TOC entry 956 (class 1255 OID 28609)
-- Name: soundex(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION soundex(input text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE STRICT COST 500
    AS $$
DECLARE
  soundex text = '';
  char text;
  symbol text;
  last_symbol text = '';
  pos int = 1;
BEGIN
  WHILE length(soundex) < 4 LOOP
    char = upper(substr(input, pos, 1));
    pos = pos + 1;
    CASE char
    WHEN '' THEN
      -- End of input string
      IF soundex = '' THEN
        RETURN '';
      ELSE
        RETURN rpad(soundex, 4, '0');
      END IF;
    WHEN 'B', 'F', 'P', 'V' THEN
      symbol = '1';
    WHEN 'C', 'G', 'J', 'K', 'Q', 'S', 'X', 'Z' THEN
      symbol = '2';
    WHEN 'D', 'T' THEN
      symbol = '3';
    WHEN 'L' THEN
      symbol = '4';
    WHEN 'M', 'N' THEN
      symbol = '5';
    WHEN 'R' THEN
      symbol = '6';
    ELSE
      -- Not a consonant; no output, but next similar consonant will be re-recorded
      symbol = '';
    END CASE;

    IF soundex = '' THEN
      -- First character; only accept strictly English ASCII characters
      IF char ~>=~ 'A' AND char ~<=~ 'Z' THEN
        soundex = char;
        last_symbol = symbol;
      END IF;
    ELSIF last_symbol != symbol THEN
      soundex = soundex || symbol;
      last_symbol = symbol;
    END IF;
  END LOOP;

  RETURN soundex;
END;
$$;


ALTER FUNCTION public.soundex(input text) OWNER TO postgres;

--
-- TOC entry 913 (class 1255 OID 17086)
-- Name: st_3dclosestpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dclosestpoint(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'LWGEOM_closestpoint3d';


ALTER FUNCTION public.st_3dclosestpoint(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 919 (class 1255 OID 17092)
-- Name: st_3ddfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_3DDFullyWithin($1, $2, $3)$_$;


ALTER FUNCTION public.st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- TOC entry 911 (class 1255 OID 17084)
-- Name: st_3ddistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3ddistance(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'distance3d';


ALTER FUNCTION public.st_3ddistance(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 917 (class 1255 OID 17090)
-- Name: st_3ddwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3ddwithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_3DDWithin($1, $2, $3)$_$;


ALTER FUNCTION public.st_3ddwithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- TOC entry 921 (class 1255 OID 17094)
-- Name: st_3dintersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dintersects(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_3DIntersects($1, $2)$_$;


ALTER FUNCTION public.st_3dintersects(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 486 (class 1255 OID 16575)
-- Name: st_3dlength(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dlength(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_length_linestring';


ALTER FUNCTION public.st_3dlength(geometry) OWNER TO postgres;

--
-- TOC entry 489 (class 1255 OID 16578)
-- Name: st_3dlength_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dlength_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'LWGEOM_length_ellipsoid_linestring';


ALTER FUNCTION public.st_3dlength_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- TOC entry 915 (class 1255 OID 17088)
-- Name: st_3dlongestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dlongestline(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'LWGEOM_longestline3d';


ALTER FUNCTION public.st_3dlongestline(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 542 (class 1255 OID 16631)
-- Name: st_3dmakebox(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dmakebox(geom1 geometry, geom2 geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX3D_construct';


ALTER FUNCTION public.st_3dmakebox(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 912 (class 1255 OID 17085)
-- Name: st_3dmaxdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dmaxdistance(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'LWGEOM_maxdistance3d';


ALTER FUNCTION public.st_3dmaxdistance(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 492 (class 1255 OID 16581)
-- Name: st_3dperimeter(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dperimeter(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_perimeter_poly';


ALTER FUNCTION public.st_3dperimeter(geometry) OWNER TO postgres;

--
-- TOC entry 914 (class 1255 OID 17087)
-- Name: st_3dshortestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_3dshortestline(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'LWGEOM_shortestline3d';


ALTER FUNCTION public.st_3dshortestline(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 615 (class 1255 OID 16731)
-- Name: st_addmeasure(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_addmeasure(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_AddMeasure';


ALTER FUNCTION public.st_addmeasure(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 546 (class 1255 OID 16635)
-- Name: st_addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_addpoint(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_addpoint';


ALTER FUNCTION public.st_addpoint(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 547 (class 1255 OID 16636)
-- Name: st_addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_addpoint(geom1 geometry, geom2 geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_addpoint';


ALTER FUNCTION public.st_addpoint(geom1 geometry, geom2 geometry, integer) OWNER TO postgres;

--
-- TOC entry 450 (class 1255 OID 16539)
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;


ALTER FUNCTION public.st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 449 (class 1255 OID 16538)
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_affine';


ALTER FUNCTION public.st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 496 (class 1255 OID 16585)
-- Name: st_area(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_area(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'area';


ALTER FUNCTION public.st_area(geometry) OWNER TO postgres;

--
-- TOC entry 877 (class 1255 OID 17043)
-- Name: st_area(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_area(text) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Area($1::geometry);  $_$;


ALTER FUNCTION public.st_area(text) OWNER TO postgres;

--
-- TOC entry 876 (class 1255 OID 17042)
-- Name: st_area(geography, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_area(geog geography, use_spheroid boolean DEFAULT true) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'geography_area';


ALTER FUNCTION public.st_area(geog geography, use_spheroid boolean) OWNER TO postgres;

--
-- TOC entry 495 (class 1255 OID 16584)
-- Name: st_area2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_area2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_area_polygon';


ALTER FUNCTION public.st_area2d(geometry) OWNER TO postgres;

--
-- TOC entry 898 (class 1255 OID 17064)
-- Name: st_asbinary(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asbinary(geography) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_asBinary';


ALTER FUNCTION public.st_asbinary(geography) OWNER TO postgres;

--
-- TOC entry 736 (class 1255 OID 16865)
-- Name: st_asbinary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asbinary(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_asBinary';


ALTER FUNCTION public.st_asbinary(geometry) OWNER TO postgres;

--
-- TOC entry 899 (class 1255 OID 17065)
-- Name: st_asbinary(geography, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asbinary(geography, text) RETURNS bytea
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsBinary($1::geometry, $2);  $_$;


ALTER FUNCTION public.st_asbinary(geography, text) OWNER TO postgres;

--
-- TOC entry 735 (class 1255 OID 16864)
-- Name: st_asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asbinary(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_asBinary';


ALTER FUNCTION public.st_asbinary(geometry, text) OWNER TO postgres;

--
-- TOC entry 527 (class 1255 OID 16616)
-- Name: st_asewkb(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asewkb(geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'WKBFromLWGEOM';


ALTER FUNCTION public.st_asewkb(geometry) OWNER TO postgres;

--
-- TOC entry 530 (class 1255 OID 16619)
-- Name: st_asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asewkb(geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'WKBFromLWGEOM';


ALTER FUNCTION public.st_asewkb(geometry, text) OWNER TO postgres;

--
-- TOC entry 900 (class 1255 OID 17066)
-- Name: st_asewkt(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asewkt(geography) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_asEWKT';


ALTER FUNCTION public.st_asewkt(geography) OWNER TO postgres;

--
-- TOC entry 526 (class 1255 OID 16615)
-- Name: st_asewkt(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asewkt(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_asEWKT';


ALTER FUNCTION public.st_asewkt(geometry) OWNER TO postgres;

--
-- TOC entry 901 (class 1255 OID 17067)
-- Name: st_asewkt(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asewkt(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsEWKT($1::geometry);  $_$;


ALTER FUNCTION public.st_asewkt(text) OWNER TO postgres;

--
-- TOC entry 858 (class 1255 OID 17023)
-- Name: st_asgeojson(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgeojson(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGeoJson(1, $1::geometry,15,0);  $_$;


ALTER FUNCTION public.st_asgeojson(text) OWNER TO postgres;

--
-- TOC entry 859 (class 1255 OID 17024)
-- Name: st_asgeojson(geography, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgeojson(geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGeoJson(1, $1, $2, $3); $_$;


ALTER FUNCTION public.st_asgeojson(geog geography, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- TOC entry 709 (class 1255 OID 16839)
-- Name: st_asgeojson(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgeojson(geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGeoJson(1, $1, $2, $3); $_$;


ALTER FUNCTION public.st_asgeojson(geom geometry, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- TOC entry 860 (class 1255 OID 17025)
-- Name: st_asgeojson(integer, geography, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgeojson(gj_version integer, geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGeoJson($1, $2, $3, $4); $_$;


ALTER FUNCTION public.st_asgeojson(gj_version integer, geog geography, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- TOC entry 711 (class 1255 OID 16840)
-- Name: st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgeojson(gj_version integer, geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGeoJson($1, $2, $3, $4); $_$;


ALTER FUNCTION public.st_asgeojson(gj_version integer, geom geometry, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- TOC entry 849 (class 1255 OID 17015)
-- Name: st_asgml(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgml(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGML(2,$1::geometry,15,0, NULL, NULL);  $_$;


ALTER FUNCTION public.st_asgml(text) OWNER TO postgres;

--
-- TOC entry 851 (class 1255 OID 17016)
-- Name: st_asgml(geography, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgml(geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, $3, null, null)$_$;


ALTER FUNCTION public.st_asgml(geog geography, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- TOC entry 703 (class 1255 OID 16833)
-- Name: st_asgml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgml(geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsGML(2, $1, $2, $3, null, null); $_$;


ALTER FUNCTION public.st_asgml(geom geometry, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- TOC entry 852 (class 1255 OID 17017)
-- Name: st_asgml(integer, geography, integer, integer, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgml(version integer, geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0, nprefix text DEFAULT NULL::text, id text DEFAULT NULL::text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT _ST_AsGML($1, $2, $3, $4, $5, $6);$_$;


ALTER FUNCTION public.st_asgml(version integer, geog geography, maxdecimaldigits integer, options integer, nprefix text, id text) OWNER TO postgres;

--
-- TOC entry 704 (class 1255 OID 16834)
-- Name: st_asgml(integer, geometry, integer, integer, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgml(version integer, geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0, nprefix text DEFAULT NULL::text, id text DEFAULT NULL::text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT _ST_AsGML($1, $2, $3, $4, $5, $6); $_$;


ALTER FUNCTION public.st_asgml(version integer, geom geometry, maxdecimaldigits integer, options integer, nprefix text, id text) OWNER TO postgres;

--
-- TOC entry 528 (class 1255 OID 16617)
-- Name: st_ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ashexewkb(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_asHEXEWKB';


ALTER FUNCTION public.st_ashexewkb(geometry) OWNER TO postgres;

--
-- TOC entry 529 (class 1255 OID 16618)
-- Name: st_ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ashexewkb(geometry, text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_asHEXEWKB';


ALTER FUNCTION public.st_ashexewkb(geometry, text) OWNER TO postgres;

--
-- TOC entry 855 (class 1255 OID 17020)
-- Name: st_askml(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_askml(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsKML(2, $1::geometry, 15, null);  $_$;


ALTER FUNCTION public.st_askml(text) OWNER TO postgres;

--
-- TOC entry 854 (class 1255 OID 17019)
-- Name: st_askml(geography, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_askml(geog geography, maxdecimaldigits integer DEFAULT 15) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, $1, $2, null)$_$;


ALTER FUNCTION public.st_askml(geog geography, maxdecimaldigits integer) OWNER TO postgres;

--
-- TOC entry 706 (class 1255 OID 16836)
-- Name: st_askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_askml(geom geometry, maxdecimaldigits integer DEFAULT 15) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_AsKML(2, ST_Transform($1,4326), $2, null); $_$;


ALTER FUNCTION public.st_askml(geom geometry, maxdecimaldigits integer) OWNER TO postgres;

--
-- TOC entry 856 (class 1255 OID 17021)
-- Name: st_askml(integer, geography, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_askml(version integer, geog geography, maxdecimaldigits integer DEFAULT 15, nprefix text DEFAULT NULL::text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT _ST_AsKML($1, $2, $3, $4)$_$;


ALTER FUNCTION public.st_askml(version integer, geog geography, maxdecimaldigits integer, nprefix text) OWNER TO postgres;

--
-- TOC entry 707 (class 1255 OID 16837)
-- Name: st_askml(integer, geometry, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_askml(version integer, geom geometry, maxdecimaldigits integer DEFAULT 15, nprefix text DEFAULT NULL::text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT _ST_AsKML($1, ST_Transform($2,4326), $3, $4); $_$;


ALTER FUNCTION public.st_askml(version integer, geom geometry, maxdecimaldigits integer, nprefix text) OWNER TO postgres;

--
-- TOC entry 532 (class 1255 OID 16621)
-- Name: st_aslatlontext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_aslatlontext(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsLatLonText($1, '') $_$;


ALTER FUNCTION public.st_aslatlontext(geometry) OWNER TO postgres;

--
-- TOC entry 531 (class 1255 OID 16620)
-- Name: st_aslatlontext(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_aslatlontext(geometry, text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_to_latlon';


ALTER FUNCTION public.st_aslatlontext(geometry, text) OWNER TO postgres;

--
-- TOC entry 847 (class 1255 OID 17013)
-- Name: st_assvg(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_assvg(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsSVG($1::geometry,0,15);  $_$;


ALTER FUNCTION public.st_assvg(text) OWNER TO postgres;

--
-- TOC entry 846 (class 1255 OID 17012)
-- Name: st_assvg(geography, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_assvg(geog geography, rel integer DEFAULT 0, maxdecimaldigits integer DEFAULT 15) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_as_svg';


ALTER FUNCTION public.st_assvg(geog geography, rel integer, maxdecimaldigits integer) OWNER TO postgres;

--
-- TOC entry 701 (class 1255 OID 16831)
-- Name: st_assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_assvg(geom geometry, rel integer DEFAULT 0, maxdecimaldigits integer DEFAULT 15) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_asSVG';


ALTER FUNCTION public.st_assvg(geom geometry, rel integer, maxdecimaldigits integer) OWNER TO postgres;

--
-- TOC entry 822 (class 1255 OID 16957)
-- Name: st_astext(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_astext(geography) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_asText';


ALTER FUNCTION public.st_astext(geography) OWNER TO postgres;

--
-- TOC entry 737 (class 1255 OID 16866)
-- Name: st_astext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_astext(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_asText';


ALTER FUNCTION public.st_astext(geometry) OWNER TO postgres;

--
-- TOC entry 823 (class 1255 OID 16958)
-- Name: st_astext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_astext(text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsText($1::geometry);  $_$;


ALTER FUNCTION public.st_astext(text) OWNER TO postgres;

--
-- TOC entry 939 (class 1255 OID 17115)
-- Name: st_asx3d(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asx3d(geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT _ST_AsX3D(3,$1,$2,$3,'');$_$;


ALTER FUNCTION public.st_asx3d(geom geometry, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- TOC entry 881 (class 1255 OID 17047)
-- Name: st_azimuth(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_azimuth(geog1 geography, geog2 geography) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'geography_azimuth';


ALTER FUNCTION public.st_azimuth(geog1 geography, geog2 geography) OWNER TO postgres;

--
-- TOC entry 500 (class 1255 OID 16589)
-- Name: st_azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_azimuth(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_azimuth';


ALTER FUNCTION public.st_azimuth(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 798 (class 1255 OID 16928)
-- Name: st_bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bdmpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := ST_Multi(ST_BuildArea(mline));

	RETURN geom;
END;
$_$;


ALTER FUNCTION public.st_bdmpolyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 797 (class 1255 OID 16927)
-- Name: st_bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bdpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := ST_BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$;


ALTER FUNCTION public.st_bdpolyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 634 (class 1255 OID 16753)
-- Name: st_boundary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_boundary(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'boundary';


ALTER FUNCTION public.st_boundary(geometry) OWNER TO postgres;

--
-- TOC entry 713 (class 1255 OID 16842)
-- Name: st_box2dfromgeohash(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2dfromgeohash(text, integer DEFAULT NULL::integer) RETURNS box2d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'box2d_from_geohash';


ALTER FUNCTION public.st_box2dfromgeohash(text, integer) OWNER TO postgres;

--
-- TOC entry 894 (class 1255 OID 17060)
-- Name: st_buffer(geography, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buffer(geography, double precision) RETURNS geography
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT geography(ST_Transform(ST_Buffer(ST_Transform(geometry($1), _ST_BestSRID($1)), $2), 4326))$_$;


ALTER FUNCTION public.st_buffer(geography, double precision) OWNER TO postgres;

--
-- TOC entry 617 (class 1255 OID 16733)
-- Name: st_buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buffer(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'buffer';


ALTER FUNCTION public.st_buffer(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 895 (class 1255 OID 17061)
-- Name: st_buffer(text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buffer(text, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Buffer($1::geometry, $2);  $_$;


ALTER FUNCTION public.st_buffer(text, double precision) OWNER TO postgres;

--
-- TOC entry 619 (class 1255 OID 16735)
-- Name: st_buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buffer(geometry, double precision, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_Buffer($1, $2,
		CAST('quad_segs='||CAST($3 AS text) as cstring))
	   $_$;


ALTER FUNCTION public.st_buffer(geometry, double precision, integer) OWNER TO postgres;

--
-- TOC entry 620 (class 1255 OID 16736)
-- Name: st_buffer(geometry, double precision, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buffer(geometry, double precision, text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _ST_Buffer($1, $2,
		CAST( regexp_replace($3, '^[0123456789]+$',
			'quad_segs='||$3) AS cstring)
		)
	   $_$;


ALTER FUNCTION public.st_buffer(geometry, double precision, text) OWNER TO postgres;

--
-- TOC entry 553 (class 1255 OID 16642)
-- Name: st_buildarea(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buildarea(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'ST_BuildArea';


ALTER FUNCTION public.st_buildarea(geometry) OWNER TO postgres;

--
-- TOC entry 685 (class 1255 OID 16815)
-- Name: st_centroid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_centroid(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'centroid';


ALTER FUNCTION public.st_centroid(geometry) OWNER TO postgres;

--
-- TOC entry 641 (class 1255 OID 16760)
-- Name: st_cleangeometry(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_cleangeometry(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'ST_CleanGeometry';


ALTER FUNCTION public.st_cleangeometry(geometry) OWNER TO postgres;

--
-- TOC entry 790 (class 1255 OID 16920)
-- Name: st_closestpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_closestpoint(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_closestpoint';


ALTER FUNCTION public.st_closestpoint(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 650 (class 1255 OID 16772)
-- Name: st_collect(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_collect(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_collect_garray';


ALTER FUNCTION public.st_collect(geometry[]) OWNER TO postgres;

--
-- TOC entry 649 (class 1255 OID 16770)
-- Name: st_collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_collect(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'LWGEOM_collect';


ALTER FUNCTION public.st_collect(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 513 (class 1255 OID 16602)
-- Name: st_collectionextract(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_collectionextract(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_CollectionExtract';


ALTER FUNCTION public.st_collectionextract(geometry, integer) OWNER TO postgres;

--
-- TOC entry 514 (class 1255 OID 16603)
-- Name: st_collectionhomogenize(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_collectionhomogenize(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_CollectionHomogenize';


ALTER FUNCTION public.st_collectionhomogenize(geometry) OWNER TO postgres;

--
-- TOC entry 472 (class 1255 OID 16561)
-- Name: st_combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_combine_bbox(box2d, geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'BOX2D_combine';


ALTER FUNCTION public.st_combine_bbox(box2d, geometry) OWNER TO postgres;

--
-- TOC entry 648 (class 1255 OID 16767)
-- Name: st_combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_combine_bbox(box3d, geometry) RETURNS box3d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'BOX3D_combine';


ALTER FUNCTION public.st_combine_bbox(box3d, geometry) OWNER TO postgres;

--
-- TOC entry 937 (class 1255 OID 17112)
-- Name: st_concavehull(geometry, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_concavehull(param_geom geometry, param_pctconvex double precision, param_allow_holes boolean DEFAULT false) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
	DECLARE
		var_convhull geometry := ST_ConvexHull(param_geom);
		var_param_geom geometry := param_geom;
		var_initarea float := ST_Area(var_convhull);
		var_newarea float := var_initarea;
		var_div integer := 6; 
		var_tempgeom geometry;
		var_tempgeom2 geometry;
		var_cent geometry;
		var_geoms geometry[4]; 
		var_enline geometry;
		var_resultgeom geometry;
		var_atempgeoms geometry[];
		var_buf float := 1; 
	BEGIN
		-- We start with convex hull as our base
		var_resultgeom := var_convhull;
		
		IF param_pctconvex = 1 THEN
			return var_resultgeom;
		ELSIF ST_GeometryType(var_param_geom) = 'ST_Polygon' THEN -- it is as concave as it is going to get
			IF param_allow_holes THEN -- leave the holes
				RETURN var_param_geom;
			ELSE -- remove the holes
				var_resultgeom := ST_MakePolygon(ST_ExteriorRing(var_param_geom));
				RETURN var_resultgeom;
			END IF;
		END IF;
		IF ST_Dimension(var_resultgeom) > 1 AND param_pctconvex BETWEEN 0 and 0.98 THEN
		-- get linestring that forms envelope of geometry
			var_enline := ST_Boundary(ST_Envelope(var_param_geom));
			var_buf := ST_Length(var_enline)/1000.0;
			IF ST_GeometryType(var_param_geom) = 'ST_MultiPoint' AND ST_NumGeometries(var_param_geom) BETWEEN 4 and 200 THEN
			-- we make polygons out of points since they are easier to cave in. 
			-- Note we limit to between 4 and 200 points because this process is slow and gets quadratically slow
				var_buf := sqrt(ST_Area(var_convhull)*0.8/(ST_NumGeometries(var_param_geom)*ST_NumGeometries(var_param_geom)));
				var_atempgeoms := ARRAY(SELECT geom FROM ST_DumpPoints(var_param_geom));
				-- 5 and 10 and just fudge factors
				var_tempgeom := ST_Union(ARRAY(SELECT geom
						FROM (
						-- fuse near neighbors together
						SELECT DISTINCT ON (i) i,  ST_Distance(var_atempgeoms[i],var_atempgeoms[j]), ST_Buffer(ST_MakeLine(var_atempgeoms[i], var_atempgeoms[j]) , var_buf*5, 'quad_segs=3') As geom
								FROM generate_series(1,array_upper(var_atempgeoms, 1)) As i
									INNER JOIN generate_series(1,array_upper(var_atempgeoms, 1)) As j 
										ON (
								 NOT ST_Intersects(var_atempgeoms[i],var_atempgeoms[j])
									AND ST_DWithin(var_atempgeoms[i],var_atempgeoms[j], var_buf*10)
									)
								UNION ALL
						-- catch the ones with no near neighbors
								SELECT i, 0, ST_Buffer(var_atempgeoms[i] , var_buf*10, 'quad_segs=3') As geom
								FROM generate_series(1,array_upper(var_atempgeoms, 1)) As i
									LEFT JOIN generate_series(ceiling(array_upper(var_atempgeoms,1)/2)::integer,array_upper(var_atempgeoms, 1)) As j 
										ON (
								 NOT ST_Intersects(var_atempgeoms[i],var_atempgeoms[j])
									AND ST_DWithin(var_atempgeoms[i],var_atempgeoms[j], var_buf*10) 
									)
									WHERE j IS NULL
								ORDER BY 1, 2
							) As foo	) );
				IF ST_IsValid(var_tempgeom) AND ST_GeometryType(var_tempgeom) = 'ST_Polygon' THEN
					var_tempgeom := ST_ForceSFS(ST_Intersection(var_tempgeom, var_convhull));
					IF param_allow_holes THEN
						var_param_geom := var_tempgeom;
					ELSE
						var_param_geom := ST_MakePolygon(ST_ExteriorRing(var_tempgeom));
					END IF;
					return var_param_geom;
				ELSIF ST_IsValid(var_tempgeom) THEN
					var_param_geom := ST_ForceSFS(ST_Intersection(var_tempgeom, var_convhull));	
				END IF;
			END IF;

			IF ST_GeometryType(var_param_geom) = 'ST_Polygon' THEN
				IF NOT param_allow_holes THEN
					var_param_geom := ST_MakePolygon(ST_ExteriorRing(var_param_geom));
				END IF;
				return var_param_geom;
			END IF;
            var_cent := ST_Centroid(var_param_geom);
            IF (ST_XMax(var_enline) - ST_XMin(var_enline) ) > var_buf AND (ST_YMax(var_enline) - ST_YMin(var_enline) ) > var_buf THEN
                    IF ST_Dwithin(ST_Centroid(var_convhull) , ST_Centroid(ST_Envelope(var_param_geom)), var_buf/2) THEN
                -- If the geometric dimension is > 1 and the object is symettric (cutting at centroid will not work -- offset a bit)
                        var_cent := ST_Translate(var_cent, (ST_XMax(var_enline) - ST_XMin(var_enline))/1000,  (ST_YMAX(var_enline) - ST_YMin(var_enline))/1000);
                    ELSE
                        -- uses closest point on geometry to centroid. I can't explain why we are doing this
                        var_cent := ST_ClosestPoint(var_param_geom,var_cent);
                    END IF;
                    IF ST_DWithin(var_cent, var_enline,var_buf) THEN
                        var_cent := ST_centroid(ST_Envelope(var_param_geom));
                    END IF;
                    -- break envelope into 4 triangles about the centroid of the geometry and returned the clipped geometry in each quadrant
                    FOR i in 1 .. 4 LOOP
                       var_geoms[i] := ST_MakePolygon(ST_MakeLine(ARRAY[ST_PointN(var_enline,i), ST_PointN(var_enline,i+1), var_cent, ST_PointN(var_enline,i)]));
                       var_geoms[i] := ST_ForceSFS(ST_Intersection(var_param_geom, ST_Buffer(var_geoms[i],var_buf)));
                       IF ST_IsValid(var_geoms[i]) THEN 
                            
                       ELSE
                            var_geoms[i] := ST_BuildArea(ST_MakeLine(ARRAY[ST_PointN(var_enline,i), ST_PointN(var_enline,i+1), var_cent, ST_PointN(var_enline,i)]));
                       END IF; 
                    END LOOP;
                    var_tempgeom := ST_Union(ARRAY[ST_ConvexHull(var_geoms[1]), ST_ConvexHull(var_geoms[2]) , ST_ConvexHull(var_geoms[3]), ST_ConvexHull(var_geoms[4])]); 
                    --RAISE NOTICE 'Curr vex % ', ST_AsText(var_tempgeom);
                    IF ST_Area(var_tempgeom) <= var_newarea AND ST_IsValid(var_tempgeom)  THEN --AND ST_GeometryType(var_tempgeom) ILIKE '%Polygon'
                        
                        var_tempgeom := ST_Buffer(ST_ConcaveHull(var_geoms[1],least(param_pctconvex + param_pctconvex/var_div),true),var_buf, 'quad_segs=2');
                        FOR i IN 1 .. 4 LOOP
                            var_geoms[i] := ST_Buffer(ST_ConcaveHull(var_geoms[i],least(param_pctconvex + param_pctconvex/var_div),true), var_buf, 'quad_segs=2');
                            IF ST_IsValid(var_geoms[i]) Then
                                var_tempgeom := ST_Union(var_tempgeom, var_geoms[i]);
                            ELSE
                                RAISE NOTICE 'Not valid % %', i, ST_AsText(var_tempgeom);
                                var_tempgeom := ST_Union(var_tempgeom, ST_ConvexHull(var_geoms[i]));
                            END IF; 
                        END LOOP;

                        --RAISE NOTICE 'Curr concave % ', ST_AsText(var_tempgeom);
                        IF ST_IsValid(var_tempgeom) THEN
                            var_resultgeom := var_tempgeom;
                        END IF;
                        var_newarea := ST_Area(var_resultgeom);
                    ELSIF ST_IsValid(var_tempgeom) THEN
                        var_resultgeom := var_tempgeom;
                    END IF;

                    IF ST_NumGeometries(var_resultgeom) > 1  THEN
                        var_tempgeom := _ST_ConcaveHull(var_resultgeom);
                        IF ST_IsValid(var_tempgeom) AND ST_GeometryType(var_tempgeom) ILIKE 'ST_Polygon' THEN
                            var_resultgeom := var_tempgeom;
                        ELSE
                            var_resultgeom := ST_Buffer(var_tempgeom,var_buf, 'quad_segs=2');
                        END IF;
                    END IF;
                    IF param_allow_holes = false THEN 
                    -- only keep exterior ring since we do not want holes
                        var_resultgeom := ST_MakePolygon(ST_ExteriorRing(var_resultgeom));
                    END IF;
                ELSE
                    var_resultgeom := ST_Buffer(var_resultgeom,var_buf);
                END IF;
                var_resultgeom := ST_ForceSFS(ST_Intersection(var_resultgeom, ST_ConvexHull(var_param_geom)));
            ELSE
                -- dimensions are too small to cut
                var_resultgeom := _ST_ConcaveHull(var_param_geom);
            END IF;
            RETURN var_resultgeom;
	END;
$$;


ALTER FUNCTION public.st_concavehull(param_geom geometry, param_pctconvex double precision, param_allow_holes boolean) OWNER TO postgres;

--
-- TOC entry 673 (class 1255 OID 16803)
-- Name: st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_contains(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Contains($1,$2)$_$;


ALTER FUNCTION public.st_contains(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 679 (class 1255 OID 16809)
-- Name: st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_containsproperly(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_ContainsProperly($1,$2)$_$;


ALTER FUNCTION public.st_containsproperly(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 622 (class 1255 OID 16738)
-- Name: st_convexhull(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_convexhull(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'convexhull';


ALTER FUNCTION public.st_convexhull(geometry) OWNER TO postgres;

--
-- TOC entry 922 (class 1255 OID 17095)
-- Name: st_coorddim(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_coorddim(geometry geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_ndims';


ALTER FUNCTION public.st_coorddim(geometry geometry) OWNER TO postgres;

--
-- TOC entry 675 (class 1255 OID 16805)
-- Name: st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_coveredby(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_CoveredBy($1,$2)$_$;


ALTER FUNCTION public.st_coveredby(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 887 (class 1255 OID 17053)
-- Name: st_coveredby(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_coveredby(geography, geography) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Covers($2, $1)$_$;


ALTER FUNCTION public.st_coveredby(geography, geography) OWNER TO postgres;

--
-- TOC entry 888 (class 1255 OID 17054)
-- Name: st_coveredby(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_coveredby(text, text) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT ST_CoveredBy($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION public.st_coveredby(text, text) OWNER TO postgres;

--
-- TOC entry 677 (class 1255 OID 16807)
-- Name: st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_covers(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Covers($1,$2)$_$;


ALTER FUNCTION public.st_covers(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 885 (class 1255 OID 17051)
-- Name: st_covers(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_covers(geography, geography) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Covers($1, $2)$_$;


ALTER FUNCTION public.st_covers(geography, geography) OWNER TO postgres;

--
-- TOC entry 886 (class 1255 OID 17052)
-- Name: st_covers(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_covers(text, text) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT ST_Covers($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION public.st_covers(text, text) OWNER TO postgres;

--
-- TOC entry 671 (class 1255 OID 16801)
-- Name: st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_crosses(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Crosses($1,$2)$_$;


ALTER FUNCTION public.st_crosses(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 924 (class 1255 OID 17097)
-- Name: st_curvetoline(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_curvetoline(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_CurveToLine($1, 32)$_$;


ALTER FUNCTION public.st_curvetoline(geometry) OWNER TO postgres;

--
-- TOC entry 923 (class 1255 OID 17096)
-- Name: st_curvetoline(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_curvetoline(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_curve_segmentize';


ALTER FUNCTION public.st_curvetoline(geometry, integer) OWNER TO postgres;

--
-- TOC entry 647 (class 1255 OID 16766)
-- Name: st_delaunaytriangles(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_delaunaytriangles(g1 geometry, tolerance double precision DEFAULT 0.0, flags integer DEFAULT 0) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'ST_DelaunayTriangles';


ALTER FUNCTION public.st_delaunaytriangles(g1 geometry, tolerance double precision, flags integer) OWNER TO postgres;

--
-- TOC entry 795 (class 1255 OID 16925)
-- Name: st_dfullywithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dfullywithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DFullyWithin(ST_ConvexHull($1), ST_ConvexHull($2), $3)$_$;


ALTER FUNCTION public.st_dfullywithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- TOC entry 633 (class 1255 OID 16752)
-- Name: st_difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_difference(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'difference';


ALTER FUNCTION public.st_difference(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 719 (class 1255 OID 16848)
-- Name: st_dimension(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dimension(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_dimension';


ALTER FUNCTION public.st_dimension(geometry) OWNER TO postgres;

--
-- TOC entry 663 (class 1255 OID 16793)
-- Name: st_disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_disjoint(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'disjoint';


ALTER FUNCTION public.st_disjoint(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 498 (class 1255 OID 16587)
-- Name: st_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'distance';


ALTER FUNCTION public.st_distance(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 864 (class 1255 OID 17029)
-- Name: st_distance(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance(geography, geography) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_Distance($1, $2, 0.0, true)$_$;


ALTER FUNCTION public.st_distance(geography, geography) OWNER TO postgres;

--
-- TOC entry 865 (class 1255 OID 17030)
-- Name: st_distance(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance(text, text) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Distance($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION public.st_distance(text, text) OWNER TO postgres;

--
-- TOC entry 863 (class 1255 OID 17028)
-- Name: st_distance(geography, geography, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance(geography, geography, boolean) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_Distance($1, $2, 0.0, $3)$_$;


ALTER FUNCTION public.st_distance(geography, geography, boolean) OWNER TO postgres;

--
-- TOC entry 905 (class 1255 OID 17071)
-- Name: st_distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance_sphere(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT COST 300
    AS $_$
	select st_distance(geography($1),geography($2),false)
	$_$;


ALTER FUNCTION public.st_distance_sphere(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 497 (class 1255 OID 16586)
-- Name: st_distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance_spheroid(geom1 geometry, geom2 geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'LWGEOM_distance_ellipsoid';


ALTER FUNCTION public.st_distance_spheroid(geom1 geometry, geom2 geometry, spheroid) OWNER TO postgres;

--
-- TOC entry 556 (class 1255 OID 16648)
-- Name: st_dump(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dump(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_dump';


ALTER FUNCTION public.st_dump(geometry) OWNER TO postgres;

--
-- TOC entry 559 (class 1255 OID 16651)
-- Name: st_dumppoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dumppoints(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_dumppoints';


ALTER FUNCTION public.st_dumppoints(geometry) OWNER TO postgres;

--
-- TOC entry 557 (class 1255 OID 16649)
-- Name: st_dumprings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dumprings(geometry) RETURNS SETOF geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_dump_rings';


ALTER FUNCTION public.st_dumprings(geometry) OWNER TO postgres;

--
-- TOC entry 667 (class 1255 OID 16797)
-- Name: st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dwithin(geom1 geometry, geom2 geometry, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3)$_$;


ALTER FUNCTION public.st_dwithin(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- TOC entry 868 (class 1255 OID 17033)
-- Name: st_dwithin(geography, geography, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dwithin(geography, geography, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && _ST_Expand($2,$3) AND $2 && _ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3, true)$_$;


ALTER FUNCTION public.st_dwithin(geography, geography, double precision) OWNER TO postgres;

--
-- TOC entry 869 (class 1255 OID 17034)
-- Name: st_dwithin(text, text, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dwithin(text, text, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT ST_DWithin($1::geometry, $2::geometry, $3);  $_$;


ALTER FUNCTION public.st_dwithin(text, text, double precision) OWNER TO postgres;

--
-- TOC entry 867 (class 1255 OID 17032)
-- Name: st_dwithin(geography, geography, double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dwithin(geography, geography, double precision, boolean) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && _ST_Expand($2,$3) AND $2 && _ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3, $4)$_$;


ALTER FUNCTION public.st_dwithin(geography, geography, double precision, boolean) OWNER TO postgres;

--
-- TOC entry 730 (class 1255 OID 16859)
-- Name: st_endpoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_endpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_endpoint_linestring';


ALTER FUNCTION public.st_endpoint(geometry) OWNER TO postgres;

--
-- TOC entry 520 (class 1255 OID 16609)
-- Name: st_envelope(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_envelope(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_envelope';


ALTER FUNCTION public.st_envelope(geometry) OWNER TO postgres;

--
-- TOC entry 691 (class 1255 OID 16821)
-- Name: st_equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_equals(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 ~= $2 AND _ST_Equals($1,$2)$_$;


ALTER FUNCTION public.st_equals(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 476 (class 1255 OID 16565)
-- Name: st_estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_estimated_extent(text, text) RETURNS box2d
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _postgis_deprecate('ST_Estimated_Extent', 'ST_EstimatedExtent', '2.1.0');
    -- We use security invoker instead of security definer 
    -- to prevent malicious injection of a same named different function
    -- that would be run under elevated permissions
    SELECT ST_EstimatedExtent($1, $2);
  $_$;


ALTER FUNCTION public.st_estimated_extent(text, text) OWNER TO postgres;

--
-- TOC entry 474 (class 1255 OID 16563)
-- Name: st_estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_estimated_extent(text, text, text) RETURNS box2d
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _postgis_deprecate('ST_Estimated_Extent', 'ST_EstimatedExtent', '2.1.0');
    -- We use security invoker instead of security definer 
    -- to prevent malicious injection of a different same named function
    SELECT ST_EstimatedExtent($1, $2, $3);
  $_$;


ALTER FUNCTION public.st_estimated_extent(text, text, text) OWNER TO postgres;

--
-- TOC entry 475 (class 1255 OID 16564)
-- Name: st_estimatedextent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_estimatedextent(text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-2.1', 'gserialized_estimated_extent';


ALTER FUNCTION public.st_estimatedextent(text, text) OWNER TO postgres;

--
-- TOC entry 473 (class 1255 OID 16562)
-- Name: st_estimatedextent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_estimatedextent(text, text, text) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-2.1', 'gserialized_estimated_extent';


ALTER FUNCTION public.st_estimatedextent(text, text, text) OWNER TO postgres;

--
-- TOC entry 469 (class 1255 OID 16558)
-- Name: st_expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_expand(box2d, double precision) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX2D_expand';


ALTER FUNCTION public.st_expand(box2d, double precision) OWNER TO postgres;

--
-- TOC entry 518 (class 1255 OID 16607)
-- Name: st_expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_expand(box3d, double precision) RETURNS box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX3D_expand';


ALTER FUNCTION public.st_expand(box3d, double precision) OWNER TO postgres;

--
-- TOC entry 519 (class 1255 OID 16608)
-- Name: st_expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_expand(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_expand';


ALTER FUNCTION public.st_expand(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 720 (class 1255 OID 16849)
-- Name: st_exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_exteriorring(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_exteriorring_polygon';


ALTER FUNCTION public.st_exteriorring(geometry) OWNER TO postgres;

--
-- TOC entry 478 (class 1255 OID 16567)
-- Name: st_find_extent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_find_extent(text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT ST_Extent("' || columnname || '") As extent FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


ALTER FUNCTION public.st_find_extent(text, text) OWNER TO postgres;

--
-- TOC entry 477 (class 1255 OID 16566)
-- Name: st_find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_find_extent(text, text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT ST_Extent("' || columnname || '") As extent FROM "' || schemaname || '"."' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


ALTER FUNCTION public.st_find_extent(text, text, text) OWNER TO postgres;

--
-- TOC entry 796 (class 1255 OID 16926)
-- Name: st_flipcoordinates(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_flipcoordinates(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_FlipCoordinates';


ALTER FUNCTION public.st_flipcoordinates(geometry) OWNER TO postgres;

--
-- TOC entry 501 (class 1255 OID 16590)
-- Name: st_force2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force2d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_force_2d';


ALTER FUNCTION public.st_force2d(geometry) OWNER TO postgres;

--
-- TOC entry 505 (class 1255 OID 16594)
-- Name: st_force3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force3d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_force_3dz';


ALTER FUNCTION public.st_force3d(geometry) OWNER TO postgres;

--
-- TOC entry 507 (class 1255 OID 16596)
-- Name: st_force3dm(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force3dm(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_force_3dm';


ALTER FUNCTION public.st_force3dm(geometry) OWNER TO postgres;

--
-- TOC entry 503 (class 1255 OID 16592)
-- Name: st_force3dz(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force3dz(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_force_3dz';


ALTER FUNCTION public.st_force3dz(geometry) OWNER TO postgres;

--
-- TOC entry 509 (class 1255 OID 16598)
-- Name: st_force4d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force4d(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_force_4d';


ALTER FUNCTION public.st_force4d(geometry) OWNER TO postgres;

--
-- TOC entry 502 (class 1255 OID 16591)
-- Name: st_force_2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_2d(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _postgis_deprecate('ST_Force_2d', 'ST_Force2D', '2.1.0');
    SELECT ST_Force2D($1);
  $_$;


ALTER FUNCTION public.st_force_2d(geometry) OWNER TO postgres;

--
-- TOC entry 506 (class 1255 OID 16595)
-- Name: st_force_3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_3d(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _postgis_deprecate('ST_Force_3d', 'ST_Force3D', '2.1.0');
    SELECT ST_Force3D($1);
  $_$;


ALTER FUNCTION public.st_force_3d(geometry) OWNER TO postgres;

--
-- TOC entry 508 (class 1255 OID 16597)
-- Name: st_force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_3dm(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _postgis_deprecate('ST_Force_3dm', 'ST_Force3DM', '2.1.0');
    SELECT ST_Force3DM($1);
  $_$;


ALTER FUNCTION public.st_force_3dm(geometry) OWNER TO postgres;

--
-- TOC entry 504 (class 1255 OID 16593)
-- Name: st_force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_3dz(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _postgis_deprecate('ST_Force_3dz', 'ST_Force3DZ', '2.1.0');
    SELECT ST_Force3DZ($1);
  $_$;


ALTER FUNCTION public.st_force_3dz(geometry) OWNER TO postgres;

--
-- TOC entry 510 (class 1255 OID 16599)
-- Name: st_force_4d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_4d(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _postgis_deprecate('ST_Force_4d', 'ST_Force4D', '2.1.0');
    SELECT ST_Force4D($1);
  $_$;


ALTER FUNCTION public.st_force_4d(geometry) OWNER TO postgres;

--
-- TOC entry 512 (class 1255 OID 16601)
-- Name: st_force_collection(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_collection(geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _postgis_deprecate('ST_Force_Collection', 'ST_ForceCollection', '2.1.0');
    SELECT ST_ForceCollection($1);
  $_$;


ALTER FUNCTION public.st_force_collection(geometry) OWNER TO postgres;

--
-- TOC entry 511 (class 1255 OID 16600)
-- Name: st_forcecollection(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_forcecollection(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_force_collection';


ALTER FUNCTION public.st_forcecollection(geometry) OWNER TO postgres;

--
-- TOC entry 522 (class 1255 OID 16611)
-- Name: st_forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_forcerhr(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_force_clockwise_poly';


ALTER FUNCTION public.st_forcerhr(geometry) OWNER TO postgres;

--
-- TOC entry 516 (class 1255 OID 16605)
-- Name: st_forcesfs(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_forcesfs(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_force_sfs';


ALTER FUNCTION public.st_forcesfs(geometry) OWNER TO postgres;

--
-- TOC entry 517 (class 1255 OID 16606)
-- Name: st_forcesfs(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_forcesfs(geometry, version text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_force_sfs';


ALTER FUNCTION public.st_forcesfs(geometry, version text) OWNER TO postgres;

--
-- TOC entry 825 (class 1255 OID 16960)
-- Name: st_geogfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geogfromtext(text) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_from_text';


ALTER FUNCTION public.st_geogfromtext(text) OWNER TO postgres;

--
-- TOC entry 826 (class 1255 OID 16961)
-- Name: st_geogfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geogfromwkb(bytea) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_from_binary';


ALTER FUNCTION public.st_geogfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 824 (class 1255 OID 16959)
-- Name: st_geographyfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geographyfromtext(text) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geography_from_text';


ALTER FUNCTION public.st_geographyfromtext(text) OWNER TO postgres;

--
-- TOC entry 904 (class 1255 OID 17070)
-- Name: st_geohash(geography, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geohash(geog geography, maxchars integer DEFAULT 0) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_GeoHash';


ALTER FUNCTION public.st_geohash(geog geography, maxchars integer) OWNER TO postgres;

--
-- TOC entry 712 (class 1255 OID 16841)
-- Name: st_geohash(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geohash(geom geometry, maxchars integer DEFAULT 0) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_GeoHash';


ALTER FUNCTION public.st_geohash(geom geometry, maxchars integer) OWNER TO postgres;

--
-- TOC entry 762 (class 1255 OID 16892)
-- Name: st_geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomcollfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_geomcollfromtext(text) OWNER TO postgres;

--
-- TOC entry 761 (class 1255 OID 16891)
-- Name: st_geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomcollfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_geomcollfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 787 (class 1255 OID 16917)
-- Name: st_geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomcollfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_geomcollfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 786 (class 1255 OID 16916)
-- Name: st_geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomcollfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_geomcollfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 738 (class 1255 OID 16867)
-- Name: st_geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometryfromtext(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_from_text';


ALTER FUNCTION public.st_geometryfromtext(text) OWNER TO postgres;

--
-- TOC entry 739 (class 1255 OID 16868)
-- Name: st_geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometryfromtext(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_from_text';


ALTER FUNCTION public.st_geometryfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 718 (class 1255 OID 16847)
-- Name: st_geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometryn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_geometryn_collection';


ALTER FUNCTION public.st_geometryn(geometry, integer) OWNER TO postgres;

--
-- TOC entry 725 (class 1255 OID 16854)
-- Name: st_geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometrytype(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geometry_geometrytype';


ALTER FUNCTION public.st_geometrytype(geometry) OWNER TO postgres;

--
-- TOC entry 534 (class 1255 OID 16623)
-- Name: st_geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromewkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOMFromWKB';


ALTER FUNCTION public.st_geomfromewkb(bytea) OWNER TO postgres;

--
-- TOC entry 536 (class 1255 OID 16625)
-- Name: st_geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromewkt(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'parse_WKT_lwgeom';


ALTER FUNCTION public.st_geomfromewkt(text) OWNER TO postgres;

--
-- TOC entry 715 (class 1255 OID 16844)
-- Name: st_geomfromgeohash(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromgeohash(text, integer DEFAULT NULL::integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT CAST(ST_Box2dFromGeoHash($1, $2) AS geometry); $_$;


ALTER FUNCTION public.st_geomfromgeohash(text, integer) OWNER TO postgres;

--
-- TOC entry 699 (class 1255 OID 16829)
-- Name: st_geomfromgeojson(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromgeojson(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geom_from_geojson';


ALTER FUNCTION public.st_geomfromgeojson(text) OWNER TO postgres;

--
-- TOC entry 695 (class 1255 OID 16825)
-- Name: st_geomfromgml(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromgml(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_GeomFromGML($1, 0)$_$;


ALTER FUNCTION public.st_geomfromgml(text) OWNER TO postgres;

--
-- TOC entry 694 (class 1255 OID 16824)
-- Name: st_geomfromgml(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromgml(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geom_from_gml';


ALTER FUNCTION public.st_geomfromgml(text, integer) OWNER TO postgres;

--
-- TOC entry 698 (class 1255 OID 16828)
-- Name: st_geomfromkml(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromkml(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geom_from_kml';


ALTER FUNCTION public.st_geomfromkml(text) OWNER TO postgres;

--
-- TOC entry 740 (class 1255 OID 16869)
-- Name: st_geomfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromtext(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_from_text';


ALTER FUNCTION public.st_geomfromtext(text) OWNER TO postgres;

--
-- TOC entry 741 (class 1255 OID 16870)
-- Name: st_geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromtext(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_from_text';


ALTER FUNCTION public.st_geomfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 763 (class 1255 OID 16893)
-- Name: st_geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromwkb(bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_from_WKB';


ALTER FUNCTION public.st_geomfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 764 (class 1255 OID 16894)
-- Name: st_geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SetSRID(ST_GeomFromWKB($1), $2)$_$;


ALTER FUNCTION public.st_geomfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 696 (class 1255 OID 16826)
-- Name: st_gmltosql(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_gmltosql(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_GeomFromGML($1, 0)$_$;


ALTER FUNCTION public.st_gmltosql(text) OWNER TO postgres;

--
-- TOC entry 697 (class 1255 OID 16827)
-- Name: st_gmltosql(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_gmltosql(text, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geom_from_gml';


ALTER FUNCTION public.st_gmltosql(text, integer) OWNER TO postgres;

--
-- TOC entry 925 (class 1255 OID 17098)
-- Name: st_hasarc(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_hasarc(geometry geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_has_arc';


ALTER FUNCTION public.st_hasarc(geometry geometry) OWNER TO postgres;

--
-- TOC entry 631 (class 1255 OID 16750)
-- Name: st_hausdorffdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_hausdorffdistance(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'hausdorffdistance';


ALTER FUNCTION public.st_hausdorffdistance(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 632 (class 1255 OID 16751)
-- Name: st_hausdorffdistance(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_hausdorffdistance(geom1 geometry, geom2 geometry, double precision) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'hausdorffdistancedensify';


ALTER FUNCTION public.st_hausdorffdistance(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- TOC entry 723 (class 1255 OID 16852)
-- Name: st_interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_interiorringn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_interiorringn_polygon';


ALTER FUNCTION public.st_interiorringn(geometry, integer) OWNER TO postgres;

--
-- TOC entry 934 (class 1255 OID 17108)
-- Name: st_interpolatepoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_interpolatepoint(line geometry, point geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_InterpolatePoint';


ALTER FUNCTION public.st_interpolatepoint(line geometry, point geometry) OWNER TO postgres;

--
-- TOC entry 616 (class 1255 OID 16732)
-- Name: st_intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'intersection';


ALTER FUNCTION public.st_intersection(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 896 (class 1255 OID 17062)
-- Name: st_intersection(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(geography, geography) RETURNS geography
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT geography(ST_Transform(ST_Intersection(ST_Transform(geometry($1), _ST_BestSRID($1, $2)), ST_Transform(geometry($2), _ST_BestSRID($1, $2))), 4326))$_$;


ALTER FUNCTION public.st_intersection(geography, geography) OWNER TO postgres;

--
-- TOC entry 897 (class 1255 OID 17063)
-- Name: st_intersection(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(text, text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Intersection($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION public.st_intersection(text, text) OWNER TO postgres;

--
-- TOC entry 669 (class 1255 OID 16799)
-- Name: st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersects(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Intersects($1,$2)$_$;


ALTER FUNCTION public.st_intersects(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 890 (class 1255 OID 17056)
-- Name: st_intersects(geography, geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersects(geography, geography) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Distance($1, $2, 0.0, false) < 0.00001$_$;


ALTER FUNCTION public.st_intersects(geography, geography) OWNER TO postgres;

--
-- TOC entry 891 (class 1255 OID 17057)
-- Name: st_intersects(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersects(text, text) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT ST_Intersects($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION public.st_intersects(text, text) OWNER TO postgres;

--
-- TOC entry 731 (class 1255 OID 16860)
-- Name: st_isclosed(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isclosed(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_isclosed';


ALTER FUNCTION public.st_isclosed(geometry) OWNER TO postgres;

--
-- TOC entry 689 (class 1255 OID 16819)
-- Name: st_iscollection(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_iscollection(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_IsCollection';


ALTER FUNCTION public.st_iscollection(geometry) OWNER TO postgres;

--
-- TOC entry 732 (class 1255 OID 16861)
-- Name: st_isempty(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isempty(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_isempty';


ALTER FUNCTION public.st_isempty(geometry) OWNER TO postgres;

--
-- TOC entry 686 (class 1255 OID 16816)
-- Name: st_isring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isring(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'isring';


ALTER FUNCTION public.st_isring(geometry) OWNER TO postgres;

--
-- TOC entry 688 (class 1255 OID 16818)
-- Name: st_issimple(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_issimple(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'issimple';


ALTER FUNCTION public.st_issimple(geometry) OWNER TO postgres;

--
-- TOC entry 684 (class 1255 OID 16814)
-- Name: st_isvalid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isvalid(geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'isvalid';


ALTER FUNCTION public.st_isvalid(geometry) OWNER TO postgres;

--
-- TOC entry 630 (class 1255 OID 16749)
-- Name: st_isvalid(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isvalid(geometry, integer) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT (ST_isValidDetail($1, $2)).valid$_$;


ALTER FUNCTION public.st_isvalid(geometry, integer) OWNER TO postgres;

--
-- TOC entry 627 (class 1255 OID 16746)
-- Name: st_isvaliddetail(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isvaliddetail(geometry) RETURNS valid_detail
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'isvaliddetail';


ALTER FUNCTION public.st_isvaliddetail(geometry) OWNER TO postgres;

--
-- TOC entry 628 (class 1255 OID 16747)
-- Name: st_isvaliddetail(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isvaliddetail(geometry, integer) RETURNS valid_detail
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'isvaliddetail';


ALTER FUNCTION public.st_isvaliddetail(geometry, integer) OWNER TO postgres;

--
-- TOC entry 626 (class 1255 OID 16742)
-- Name: st_isvalidreason(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isvalidreason(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'isvalidreason';


ALTER FUNCTION public.st_isvalidreason(geometry) OWNER TO postgres;

--
-- TOC entry 629 (class 1255 OID 16748)
-- Name: st_isvalidreason(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isvalidreason(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT CASE WHEN valid THEN 'Valid Geometry' ELSE reason END FROM (
	SELECT (ST_isValidDetail($1, $2)).*
) foo
	$_$;


ALTER FUNCTION public.st_isvalidreason(geometry, integer) OWNER TO postgres;

--
-- TOC entry 488 (class 1255 OID 16577)
-- Name: st_length(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_length2d_linestring';


ALTER FUNCTION public.st_length(geometry) OWNER TO postgres;

--
-- TOC entry 879 (class 1255 OID 17045)
-- Name: st_length(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length(text) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_Length($1::geometry);  $_$;


ALTER FUNCTION public.st_length(text) OWNER TO postgres;

--
-- TOC entry 878 (class 1255 OID 17044)
-- Name: st_length(geography, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length(geog geography, use_spheroid boolean DEFAULT true) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'geography_length';


ALTER FUNCTION public.st_length(geog geography, use_spheroid boolean) OWNER TO postgres;

--
-- TOC entry 487 (class 1255 OID 16576)
-- Name: st_length2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_length2d_linestring';


ALTER FUNCTION public.st_length2d(geometry) OWNER TO postgres;

--
-- TOC entry 491 (class 1255 OID 16580)
-- Name: st_length2d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length2d_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'LWGEOM_length2d_ellipsoid';


ALTER FUNCTION public.st_length2d_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- TOC entry 490 (class 1255 OID 16579)
-- Name: st_length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length_spheroid(geometry, spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'LWGEOM_length_ellipsoid_linestring';


ALTER FUNCTION public.st_length_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- TOC entry 608 (class 1255 OID 16724)
-- Name: st_line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_line_interpolate_point(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _postgis_deprecate('ST_Line_Interpolate_Point', 'ST_LineInterpolatePoint', '2.1.0');
    SELECT ST_LineInterpolatePoint($1, $2);
  $_$;


ALTER FUNCTION public.st_line_interpolate_point(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 612 (class 1255 OID 16728)
-- Name: st_line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_line_locate_point(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _postgis_deprecate('ST_Line_Locate_Point', 'ST_LineLocatePoint', '2.1.0');
     SELECT ST_LineLocatePoint($1, $2);
  $_$;


ALTER FUNCTION public.st_line_locate_point(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 610 (class 1255 OID 16726)
-- Name: st_line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_line_substring(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT _postgis_deprecate('ST_Line_Substring', 'ST_LineSubstring', '2.1.0');
     SELECT ST_LineSubstring($1, $2, $3);
  $_$;


ALTER FUNCTION public.st_line_substring(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 624 (class 1255 OID 16740)
-- Name: st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linecrossingdirection(geom1 geometry, geom2 geometry) RETURNS integer
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT CASE WHEN NOT $1 && $2 THEN 0 ELSE _ST_LineCrossingDirection($1,$2) END $_$;


ALTER FUNCTION public.st_linecrossingdirection(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 544 (class 1255 OID 16633)
-- Name: st_linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefrommultipoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_line_from_mpoint';


ALTER FUNCTION public.st_linefrommultipoint(geometry) OWNER TO postgres;

--
-- TOC entry 744 (class 1255 OID 16874)
-- Name: st_linefromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'LINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_linefromtext(text) OWNER TO postgres;

--
-- TOC entry 745 (class 1255 OID 16875)
-- Name: st_linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_linefromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 768 (class 1255 OID 16898)
-- Name: st_linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_linefromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 767 (class 1255 OID 16897)
-- Name: st_linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_linefromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 607 (class 1255 OID 16723)
-- Name: st_lineinterpolatepoint(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_lineinterpolatepoint(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_line_interpolate_point';


ALTER FUNCTION public.st_lineinterpolatepoint(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 611 (class 1255 OID 16727)
-- Name: st_linelocatepoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linelocatepoint(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_line_locate_point';


ALTER FUNCTION public.st_linelocatepoint(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 555 (class 1255 OID 16644)
-- Name: st_linemerge(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linemerge(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'linemerge';


ALTER FUNCTION public.st_linemerge(geometry) OWNER TO postgres;

--
-- TOC entry 770 (class 1255 OID 16900)
-- Name: st_linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linestringfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_linestringfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 769 (class 1255 OID 16899)
-- Name: st_linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linestringfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_linestringfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 609 (class 1255 OID 16725)
-- Name: st_linesubstring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linesubstring(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_line_substring';


ALTER FUNCTION public.st_linesubstring(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 926 (class 1255 OID 17099)
-- Name: st_linetocurve(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linetocurve(geometry geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_line_desegmentize';


ALTER FUNCTION public.st_linetocurve(geometry geometry) OWNER TO postgres;

--
-- TOC entry 614 (class 1255 OID 16730)
-- Name: st_locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_locate_along_measure(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_locate_between_measures($1, $2, $2) $_$;


ALTER FUNCTION public.st_locate_along_measure(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 613 (class 1255 OID 16729)
-- Name: st_locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_locate_between_m';


ALTER FUNCTION public.st_locate_between_measures(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 932 (class 1255 OID 17106)
-- Name: st_locatealong(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_locatealong(geometry geometry, measure double precision, leftrightoffset double precision DEFAULT 0.0) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_LocateAlong';


ALTER FUNCTION public.st_locatealong(geometry geometry, measure double precision, leftrightoffset double precision) OWNER TO postgres;

--
-- TOC entry 931 (class 1255 OID 17105)
-- Name: st_locatebetween(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_locatebetween(geometry geometry, frommeasure double precision, tomeasure double precision, leftrightoffset double precision DEFAULT 0.0) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_LocateBetween';


ALTER FUNCTION public.st_locatebetween(geometry geometry, frommeasure double precision, tomeasure double precision, leftrightoffset double precision) OWNER TO postgres;

--
-- TOC entry 933 (class 1255 OID 17107)
-- Name: st_locatebetweenelevations(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_locatebetweenelevations(geometry geometry, fromelevation double precision, toelevation double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_LocateBetweenElevations';


ALTER FUNCTION public.st_locatebetweenelevations(geometry geometry, fromelevation double precision, toelevation double precision) OWNER TO postgres;

--
-- TOC entry 793 (class 1255 OID 16923)
-- Name: st_longestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_longestline(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_LongestLine(ST_ConvexHull($1), ST_ConvexHull($2))$_$;


ALTER FUNCTION public.st_longestline(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 397 (class 1255 OID 16416)
-- Name: st_m(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_m(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_m_point';


ALTER FUNCTION public.st_m(geometry) OWNER TO postgres;

--
-- TOC entry 471 (class 1255 OID 16560)
-- Name: st_makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makebox2d(geom1 geometry, geom2 geometry) RETURNS box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX2D_construct';


ALTER FUNCTION public.st_makebox2d(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 550 (class 1255 OID 16639)
-- Name: st_makeenvelope(double precision, double precision, double precision, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makeenvelope(double precision, double precision, double precision, double precision, integer DEFAULT 0) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_MakeEnvelope';


ALTER FUNCTION public.st_makeenvelope(double precision, double precision, double precision, double precision, integer) OWNER TO postgres;

--
-- TOC entry 543 (class 1255 OID 16632)
-- Name: st_makeline(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makeline(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_makeline_garray';


ALTER FUNCTION public.st_makeline(geometry[]) OWNER TO postgres;

--
-- TOC entry 545 (class 1255 OID 16634)
-- Name: st_makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makeline(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_makeline';


ALTER FUNCTION public.st_makeline(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 538 (class 1255 OID 16627)
-- Name: st_makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepoint(double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_makepoint';


ALTER FUNCTION public.st_makepoint(double precision, double precision) OWNER TO postgres;

--
-- TOC entry 539 (class 1255 OID 16628)
-- Name: st_makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_makepoint';


ALTER FUNCTION public.st_makepoint(double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 540 (class 1255 OID 16629)
-- Name: st_makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_makepoint';


ALTER FUNCTION public.st_makepoint(double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 541 (class 1255 OID 16630)
-- Name: st_makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepointm(double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_makepoint3dm';


ALTER FUNCTION public.st_makepointm(double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 552 (class 1255 OID 16641)
-- Name: st_makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepolygon(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_makepoly';


ALTER FUNCTION public.st_makepolygon(geometry) OWNER TO postgres;

--
-- TOC entry 551 (class 1255 OID 16640)
-- Name: st_makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepolygon(geometry, geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_makepoly';


ALTER FUNCTION public.st_makepolygon(geometry, geometry[]) OWNER TO postgres;

--
-- TOC entry 640 (class 1255 OID 16759)
-- Name: st_makevalid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makevalid(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'ST_MakeValid';


ALTER FUNCTION public.st_makevalid(geometry) OWNER TO postgres;

--
-- TOC entry 789 (class 1255 OID 16919)
-- Name: st_maxdistance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_maxdistance(geom1 geometry, geom2 geometry) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_MaxDistance(ST_ConvexHull($1), ST_ConvexHull($2))$_$;


ALTER FUNCTION public.st_maxdistance(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 482 (class 1255 OID 16571)
-- Name: st_mem_size(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mem_size(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_mem_size';


ALTER FUNCTION public.st_mem_size(geometry) OWNER TO postgres;

--
-- TOC entry 935 (class 1255 OID 17109)
-- Name: st_minimumboundingcircle(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer DEFAULT 48) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
	DECLARE
	hull GEOMETRY;
	ring GEOMETRY;
	center GEOMETRY;
	radius DOUBLE PRECISION;
	dist DOUBLE PRECISION;
	d DOUBLE PRECISION;
	idx1 integer;
	idx2 integer;
	l1 GEOMETRY;
	l2 GEOMETRY;
	p1 GEOMETRY;
	p2 GEOMETRY;
	a1 DOUBLE PRECISION;
	a2 DOUBLE PRECISION;


	BEGIN

	-- First compute the ConvexHull of the geometry
	hull = ST_ConvexHull(inputgeom);
	--A point really has no MBC
	IF ST_GeometryType(hull) = 'ST_Point' THEN
		RETURN hull;
	END IF;
	-- convert the hull perimeter to a linestring so we can manipulate individual points
	--If its already a linestring force it to a closed linestring
	ring = CASE WHEN ST_GeometryType(hull) = 'ST_LineString' THEN ST_AddPoint(hull, ST_StartPoint(hull)) ELSE ST_ExteriorRing(hull) END;

	dist = 0;
	-- Brute Force - check every pair
	FOR i in 1 .. (ST_NumPoints(ring)-2)
		LOOP
			FOR j in i .. (ST_NumPoints(ring)-1)
				LOOP
				d = ST_Distance(ST_PointN(ring,i),ST_PointN(ring,j));
				-- Check the distance and update if larger
				IF (d > dist) THEN
					dist = d;
					idx1 = i;
					idx2 = j;
				END IF;
			END LOOP;
		END LOOP;

	-- We now have the diameter of the convex hull.  The following line returns it if desired.
	-- RETURN ST_MakeLine(ST_PointN(ring,idx1),ST_PointN(ring,idx2));

	-- Now for the Minimum Bounding Circle.  Since we know the two points furthest from each
	-- other, the MBC must go through those two points. Start with those points as a diameter of a circle.

	-- The radius is half the distance between them and the center is midway between them
	radius = ST_Distance(ST_PointN(ring,idx1),ST_PointN(ring,idx2)) / 2.0;
	center = ST_LineInterpolatePoint(ST_MakeLine(ST_PointN(ring,idx1),ST_PointN(ring,idx2)),0.5);

	-- Loop through each vertex and check if the distance from the center to the point
	-- is greater than the current radius.
	FOR k in 1 .. (ST_NumPoints(ring)-1)
		LOOP
		IF(k <> idx1 and k <> idx2) THEN
			dist = ST_Distance(center,ST_PointN(ring,k));
			IF (dist > radius) THEN
				-- We have to expand the circle.  The new circle must pass trhough
				-- three points - the two original diameters and this point.

				-- Draw a line from the first diameter to this point
				l1 = ST_Makeline(ST_PointN(ring,idx1),ST_PointN(ring,k));
				-- Compute the midpoint
				p1 = ST_LineInterpolatePoint(l1,0.5);
				-- Rotate the line 90 degrees around the midpoint (perpendicular bisector)
				l1 = ST_Rotate(l1,pi()/2,p1);
				--  Compute the azimuth of the bisector
				a1 = ST_Azimuth(ST_PointN(l1,1),ST_PointN(l1,2));
				--  Extend the line in each direction the new computed distance to insure they will intersect
				l1 = ST_AddPoint(l1,ST_Makepoint(ST_X(ST_PointN(l1,2))+sin(a1)*dist,ST_Y(ST_PointN(l1,2))+cos(a1)*dist),-1);
				l1 = ST_AddPoint(l1,ST_Makepoint(ST_X(ST_PointN(l1,1))-sin(a1)*dist,ST_Y(ST_PointN(l1,1))-cos(a1)*dist),0);

				-- Repeat for the line from the point to the other diameter point
				l2 = ST_Makeline(ST_PointN(ring,idx2),ST_PointN(ring,k));
				p2 = ST_LineInterpolatePoint(l2,0.5);
				l2 = ST_Rotate(l2,pi()/2,p2);
				a2 = ST_Azimuth(ST_PointN(l2,1),ST_PointN(l2,2));
				l2 = ST_AddPoint(l2,ST_Makepoint(ST_X(ST_PointN(l2,2))+sin(a2)*dist,ST_Y(ST_PointN(l2,2))+cos(a2)*dist),-1);
				l2 = ST_AddPoint(l2,ST_Makepoint(ST_X(ST_PointN(l2,1))-sin(a2)*dist,ST_Y(ST_PointN(l2,1))-cos(a2)*dist),0);

				-- The new center is the intersection of the two bisectors
				center = ST_Intersection(l1,l2);
				-- The new radius is the distance to any of the three points
				radius = ST_Distance(center,ST_PointN(ring,idx1));
			END IF;
		END IF;
		END LOOP;
	--DONE!!  Return the MBC via the buffer command
	RETURN ST_Buffer(center,radius,segs_per_quarter);

	END;
$$;


ALTER FUNCTION public.st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer) OWNER TO postgres;

--
-- TOC entry 751 (class 1255 OID 16881)
-- Name: st_mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mlinefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mlinefromtext(text) OWNER TO postgres;

--
-- TOC entry 750 (class 1255 OID 16880)
-- Name: st_mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mlinefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mlinefromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 781 (class 1255 OID 16911)
-- Name: st_mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mlinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mlinefromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 780 (class 1255 OID 16910)
-- Name: st_mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mlinefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mlinefromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 755 (class 1255 OID 16885)
-- Name: st_mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpointfromtext(text) OWNER TO postgres;

--
-- TOC entry 754 (class 1255 OID 16884)
-- Name: st_mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTIPOINT'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpointfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 776 (class 1255 OID 16906)
-- Name: st_mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpointfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 775 (class 1255 OID 16905)
-- Name: st_mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpointfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 758 (class 1255 OID 16888)
-- Name: st_mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpolyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpolyfromtext(text) OWNER TO postgres;

--
-- TOC entry 757 (class 1255 OID 16887)
-- Name: st_mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpolyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 783 (class 1255 OID 16913)
-- Name: st_mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpolyfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 782 (class 1255 OID 16912)
-- Name: st_mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_mpolyfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 515 (class 1255 OID 16604)
-- Name: st_multi(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multi(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_force_multi';


ALTER FUNCTION public.st_multi(geometry) OWNER TO postgres;

--
-- TOC entry 779 (class 1255 OID 16909)
-- Name: st_multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multilinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_multilinefromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 752 (class 1255 OID 16882)
-- Name: st_multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multilinestringfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1)$_$;


ALTER FUNCTION public.st_multilinestringfromtext(text) OWNER TO postgres;

--
-- TOC entry 753 (class 1255 OID 16883)
-- Name: st_multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multilinestringfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1, $2)$_$;


ALTER FUNCTION public.st_multilinestringfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 756 (class 1255 OID 16886)
-- Name: st_multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MPointFromText($1)$_$;


ALTER FUNCTION public.st_multipointfromtext(text) OWNER TO postgres;

--
-- TOC entry 778 (class 1255 OID 16908)
-- Name: st_multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_multipointfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 777 (class 1255 OID 16907)
-- Name: st_multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_multipointfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 785 (class 1255 OID 16915)
-- Name: st_multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_multipolyfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 784 (class 1255 OID 16914)
-- Name: st_multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_multipolyfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 760 (class 1255 OID 16890)
-- Name: st_multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipolygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MPolyFromText($1)$_$;


ALTER FUNCTION public.st_multipolygonfromtext(text) OWNER TO postgres;

--
-- TOC entry 759 (class 1255 OID 16889)
-- Name: st_multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipolygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MPolyFromText($1, $2)$_$;


ALTER FUNCTION public.st_multipolygonfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 525 (class 1255 OID 16614)
-- Name: st_ndims(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ndims(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_ndims';


ALTER FUNCTION public.st_ndims(geometry) OWNER TO postgres;

--
-- TOC entry 646 (class 1255 OID 16765)
-- Name: st_node(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_node(g geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'ST_Node';


ALTER FUNCTION public.st_node(g geometry) OWNER TO postgres;

--
-- TOC entry 484 (class 1255 OID 16573)
-- Name: st_npoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_npoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_npoints';


ALTER FUNCTION public.st_npoints(geometry) OWNER TO postgres;

--
-- TOC entry 485 (class 1255 OID 16574)
-- Name: st_nrings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_nrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_nrings';


ALTER FUNCTION public.st_nrings(geometry) OWNER TO postgres;

--
-- TOC entry 717 (class 1255 OID 16846)
-- Name: st_numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numgeometries(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_numgeometries_collection';


ALTER FUNCTION public.st_numgeometries(geometry) OWNER TO postgres;

--
-- TOC entry 722 (class 1255 OID 16851)
-- Name: st_numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numinteriorring(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_numinteriorrings_polygon';


ALTER FUNCTION public.st_numinteriorring(geometry) OWNER TO postgres;

--
-- TOC entry 721 (class 1255 OID 16850)
-- Name: st_numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numinteriorrings(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_numinteriorrings_polygon';


ALTER FUNCTION public.st_numinteriorrings(geometry) OWNER TO postgres;

--
-- TOC entry 727 (class 1255 OID 16856)
-- Name: st_numpatches(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numpatches(geometry) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN ST_GeometryType($1) = 'ST_PolyhedralSurface'
	THEN ST_NumGeometries($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_numpatches(geometry) OWNER TO postgres;

--
-- TOC entry 716 (class 1255 OID 16845)
-- Name: st_numpoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numpoints(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_numpoints_linestring';


ALTER FUNCTION public.st_numpoints(geometry) OWNER TO postgres;

--
-- TOC entry 621 (class 1255 OID 16737)
-- Name: st_offsetcurve(geometry, double precision, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_offsetcurve(line geometry, distance double precision, params text DEFAULT ''::text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'ST_OffsetCurve';


ALTER FUNCTION public.st_offsetcurve(line geometry, distance double precision, params text) OWNER TO postgres;

--
-- TOC entry 928 (class 1255 OID 17101)
-- Name: st_orderingequals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_orderingequals(geometrya geometry, geometryb geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT $1 ~= $2 AND _ST_OrderingEquals($1, $2)
	$_$;


ALTER FUNCTION public.st_orderingequals(geometrya geometry, geometryb geometry) OWNER TO postgres;

--
-- TOC entry 683 (class 1255 OID 16813)
-- Name: st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_overlaps(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Overlaps($1,$2)$_$;


ALTER FUNCTION public.st_overlaps(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 728 (class 1255 OID 16857)
-- Name: st_patchn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_patchn(geometry, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN ST_GeometryType($1) = 'ST_PolyhedralSurface'
	THEN ST_GeometryN($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_patchn(geometry, integer) OWNER TO postgres;

--
-- TOC entry 494 (class 1255 OID 16583)
-- Name: st_perimeter(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_perimeter(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_perimeter2d_poly';


ALTER FUNCTION public.st_perimeter(geometry) OWNER TO postgres;

--
-- TOC entry 882 (class 1255 OID 17048)
-- Name: st_perimeter(geography, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_perimeter(geog geography, use_spheroid boolean DEFAULT true) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'geography_perimeter';


ALTER FUNCTION public.st_perimeter(geog geography, use_spheroid boolean) OWNER TO postgres;

--
-- TOC entry 493 (class 1255 OID 16582)
-- Name: st_perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_perimeter2d(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_perimeter2d_poly';


ALTER FUNCTION public.st_perimeter2d(geometry) OWNER TO postgres;

--
-- TOC entry 929 (class 1255 OID 17102)
-- Name: st_point(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_point(double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_makepoint';


ALTER FUNCTION public.st_point(double precision, double precision) OWNER TO postgres;

--
-- TOC entry 499 (class 1255 OID 16588)
-- Name: st_point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_inside_circle_point';


ALTER FUNCTION public.st_point_inside_circle(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 714 (class 1255 OID 16843)
-- Name: st_pointfromgeohash(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointfromgeohash(text, integer DEFAULT NULL::integer) RETURNS geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-2.1', 'point_from_geohash';


ALTER FUNCTION public.st_pointfromgeohash(text, integer) OWNER TO postgres;

--
-- TOC entry 710 (class 1255 OID 16872)
-- Name: st_pointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_pointfromtext(text) OWNER TO postgres;

--
-- TOC entry 743 (class 1255 OID 16873)
-- Name: st_pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POINT'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_pointfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 766 (class 1255 OID 16896)
-- Name: st_pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_pointfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 765 (class 1255 OID 16895)
-- Name: st_pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_pointfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 726 (class 1255 OID 16855)
-- Name: st_pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointn(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_pointn_linestring';


ALTER FUNCTION public.st_pointn(geometry, integer) OWNER TO postgres;

--
-- TOC entry 687 (class 1255 OID 16817)
-- Name: st_pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointonsurface(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'pointonsurface';


ALTER FUNCTION public.st_pointonsurface(geometry) OWNER TO postgres;

--
-- TOC entry 746 (class 1255 OID 16876)
-- Name: st_polyfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_polyfromtext(text) OWNER TO postgres;

--
-- TOC entry 747 (class 1255 OID 16877)
-- Name: st_polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POLYGON'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_polyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 772 (class 1255 OID 16902)
-- Name: st_polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_polyfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 771 (class 1255 OID 16901)
-- Name: st_polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_polyfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 906 (class 1255 OID 17103)
-- Name: st_polygon(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygon(geometry, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT ST_SetSRID(ST_MakePolygon($1), $2)
	$_$;


ALTER FUNCTION public.st_polygon(geometry, integer) OWNER TO postgres;

--
-- TOC entry 749 (class 1255 OID 16879)
-- Name: st_polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_PolyFromText($1)$_$;


ALTER FUNCTION public.st_polygonfromtext(text) OWNER TO postgres;

--
-- TOC entry 748 (class 1255 OID 16878)
-- Name: st_polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_PolyFromText($1, $2)$_$;


ALTER FUNCTION public.st_polygonfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 774 (class 1255 OID 16904)
-- Name: st_polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_polygonfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 773 (class 1255 OID 16903)
-- Name: st_polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.st_polygonfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 554 (class 1255 OID 16643)
-- Name: st_polygonize(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonize(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'polygonize_garray';


ALTER FUNCTION public.st_polygonize(geometry[]) OWNER TO postgres;

--
-- TOC entry 880 (class 1255 OID 17046)
-- Name: st_project(geography, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_project(geog geography, distance double precision, azimuth double precision) RETURNS geography
    LANGUAGE c IMMUTABLE COST 100
    AS '$libdir/postgis-2.1', 'geography_project';


ALTER FUNCTION public.st_project(geog geography, distance double precision, azimuth double precision) OWNER TO postgres;

--
-- TOC entry 660 (class 1255 OID 16790)
-- Name: st_relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_relate(geom1 geometry, geom2 geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'relate_full';


ALTER FUNCTION public.st_relate(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 661 (class 1255 OID 16791)
-- Name: st_relate(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_relate(geom1 geometry, geom2 geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'relate_full';


ALTER FUNCTION public.st_relate(geom1 geometry, geom2 geometry, integer) OWNER TO postgres;

--
-- TOC entry 662 (class 1255 OID 16792)
-- Name: st_relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_relate(geom1 geometry, geom2 geometry, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'relate_pattern';


ALTER FUNCTION public.st_relate(geom1 geometry, geom2 geometry, text) OWNER TO postgres;

--
-- TOC entry 645 (class 1255 OID 16764)
-- Name: st_relatematch(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_relatematch(text, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'ST_RelateMatch';


ALTER FUNCTION public.st_relatematch(text, text) OWNER TO postgres;

--
-- TOC entry 548 (class 1255 OID 16637)
-- Name: st_removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_removepoint(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_removepoint';


ALTER FUNCTION public.st_removepoint(geometry, integer) OWNER TO postgres;

--
-- TOC entry 639 (class 1255 OID 16758)
-- Name: st_removerepeatedpoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_removerepeatedpoints(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'ST_RemoveRepeatedPoints';


ALTER FUNCTION public.st_removerepeatedpoints(geometry) OWNER TO postgres;

--
-- TOC entry 521 (class 1255 OID 16610)
-- Name: st_reverse(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_reverse(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_reverse';


ALTER FUNCTION public.st_reverse(geometry) OWNER TO postgres;

--
-- TOC entry 451 (class 1255 OID 16540)
-- Name: st_rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotate(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;


ALTER FUNCTION public.st_rotate(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 453 (class 1255 OID 16542)
-- Name: st_rotate(geometry, double precision, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotate(geometry, double precision, geometry) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  cos($2), -sin($2), 0,  sin($2),  cos($2), 0, 0, 0, 1, ST_X($3) - cos($2) * ST_X($3) + sin($2) * ST_Y($3), ST_Y($3) - sin($2) * ST_X($3) - cos($2) * ST_Y($3), 0)$_$;


ALTER FUNCTION public.st_rotate(geometry, double precision, geometry) OWNER TO postgres;

--
-- TOC entry 452 (class 1255 OID 16541)
-- Name: st_rotate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotate(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  cos($2), -sin($2), 0,  sin($2),  cos($2), 0, 0, 0, 1,	$3 - cos($2) * $3 + sin($2) * $4, $4 - sin($2) * $3 - cos($2) * $4, 0)$_$;


ALTER FUNCTION public.st_rotate(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 455 (class 1255 OID 16544)
-- Name: st_rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotatex(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;


ALTER FUNCTION public.st_rotatex(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 456 (class 1255 OID 16545)
-- Name: st_rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotatey(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;


ALTER FUNCTION public.st_rotatey(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 454 (class 1255 OID 16543)
-- Name: st_rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotatez(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Rotate($1, $2)$_$;


ALTER FUNCTION public.st_rotatez(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 460 (class 1255 OID 16549)
-- Name: st_scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_scale(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Scale($1, $2, $3, 1)$_$;


ALTER FUNCTION public.st_scale(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 459 (class 1255 OID 16548)
-- Name: st_scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_scale(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;


ALTER FUNCTION public.st_scale(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 889 (class 1255 OID 17055)
-- Name: st_segmentize(geography, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_segmentize(geog geography, max_segment_length double precision) RETURNS geography
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'geography_segmentize';


ALTER FUNCTION public.st_segmentize(geog geography, max_segment_length double precision) OWNER TO postgres;

--
-- TOC entry 606 (class 1255 OID 16722)
-- Name: st_segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_segmentize(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_segmentize2d';


ALTER FUNCTION public.st_segmentize(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 549 (class 1255 OID 16638)
-- Name: st_setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setpoint(geometry, integer, geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_setpoint_linestring';


ALTER FUNCTION public.st_setpoint(geometry, integer, geometry) OWNER TO postgres;

--
-- TOC entry 734 (class 1255 OID 16863)
-- Name: st_setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setsrid(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_set_srid';


ALTER FUNCTION public.st_setsrid(geometry, integer) OWNER TO postgres;

--
-- TOC entry 643 (class 1255 OID 16762)
-- Name: st_sharedpaths(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_sharedpaths(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'ST_SharedPaths';


ALTER FUNCTION public.st_sharedpaths(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 462 (class 1255 OID 16551)
-- Name: st_shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_shift_longitude(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_longitude_shift';


ALTER FUNCTION public.st_shift_longitude(geometry) OWNER TO postgres;

--
-- TOC entry 791 (class 1255 OID 16921)
-- Name: st_shortestline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_shortestline(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_shortestline2d';


ALTER FUNCTION public.st_shortestline(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 601 (class 1255 OID 16717)
-- Name: st_simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_simplify(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_simplify2d';


ALTER FUNCTION public.st_simplify(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 625 (class 1255 OID 16741)
-- Name: st_simplifypreservetopology(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_simplifypreservetopology(geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'topologypreservesimplify';


ALTER FUNCTION public.st_simplifypreservetopology(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 644 (class 1255 OID 16763)
-- Name: st_snap(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snap(geom1 geometry, geom2 geometry, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'ST_Snap';


ALTER FUNCTION public.st_snap(geom1 geometry, geom2 geometry, double precision) OWNER TO postgres;

--
-- TOC entry 604 (class 1255 OID 16720)
-- Name: st_snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $2)$_$;


ALTER FUNCTION public.st_snaptogrid(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 603 (class 1255 OID 16719)
-- Name: st_snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $3)$_$;


ALTER FUNCTION public.st_snaptogrid(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 602 (class 1255 OID 16718)
-- Name: st_snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_snaptogrid';


ALTER FUNCTION public.st_snaptogrid(geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 605 (class 1255 OID 16721)
-- Name: st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(geom1 geometry, geom2 geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_snaptogrid_pointoff';


ALTER FUNCTION public.st_snaptogrid(geom1 geometry, geom2 geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 642 (class 1255 OID 16761)
-- Name: st_split(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_split(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-2.1', 'ST_Split';


ALTER FUNCTION public.st_split(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 733 (class 1255 OID 16862)
-- Name: st_srid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_srid(geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_get_srid';


ALTER FUNCTION public.st_srid(geometry) OWNER TO postgres;

--
-- TOC entry 729 (class 1255 OID 16858)
-- Name: st_startpoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_startpoint(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_startpoint_linestring';


ALTER FUNCTION public.st_startpoint(geometry) OWNER TO postgres;

--
-- TOC entry 903 (class 1255 OID 17069)
-- Name: st_summary(geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_summary(geography) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_summary';


ALTER FUNCTION public.st_summary(geography) OWNER TO postgres;

--
-- TOC entry 483 (class 1255 OID 16572)
-- Name: st_summary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_summary(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_summary';


ALTER FUNCTION public.st_summary(geometry) OWNER TO postgres;

--
-- TOC entry 635 (class 1255 OID 16754)
-- Name: st_symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_symdifference(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'symdifference';


ALTER FUNCTION public.st_symdifference(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 636 (class 1255 OID 16755)
-- Name: st_symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_symmetricdifference(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'symdifference';


ALTER FUNCTION public.st_symmetricdifference(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 665 (class 1255 OID 16795)
-- Name: st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_touches(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Touches($1,$2)$_$;


ALTER FUNCTION public.st_touches(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 581 (class 1255 OID 16680)
-- Name: st_transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_transform(geometry, integer) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'transform';


ALTER FUNCTION public.st_transform(geometry, integer) OWNER TO postgres;

--
-- TOC entry 458 (class 1255 OID 16547)
-- Name: st_translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_translate(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Translate($1, $2, $3, 0)$_$;


ALTER FUNCTION public.st_translate(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 457 (class 1255 OID 16546)
-- Name: st_translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_translate(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;


ALTER FUNCTION public.st_translate(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 461 (class 1255 OID 16550)
-- Name: st_transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Affine($1,  $4, 0, 0,  0, $5, 0,
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;


ALTER FUNCTION public.st_transscale(geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 638 (class 1255 OID 16757)
-- Name: st_unaryunion(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_unaryunion(geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'ST_UnaryUnion';


ALTER FUNCTION public.st_unaryunion(geometry) OWNER TO postgres;

--
-- TOC entry 659 (class 1255 OID 16785)
-- Name: st_union(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_union(geometry[]) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'pgis_union_geometry_array';


ALTER FUNCTION public.st_union(geometry[]) OWNER TO postgres;

--
-- TOC entry 637 (class 1255 OID 16756)
-- Name: st_union(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_union(geom1 geometry, geom2 geometry) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'geomunion';


ALTER FUNCTION public.st_union(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 682 (class 1255 OID 16812)
-- Name: st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_within(geom1 geometry, geom2 geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Contains($2,$1)$_$;


ALTER FUNCTION public.st_within(geom1 geometry, geom2 geometry) OWNER TO postgres;

--
-- TOC entry 930 (class 1255 OID 17104)
-- Name: st_wkbtosql(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_wkbtosql(wkb bytea) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_from_WKB';


ALTER FUNCTION public.st_wkbtosql(wkb bytea) OWNER TO postgres;

--
-- TOC entry 742 (class 1255 OID 16871)
-- Name: st_wkttosql(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_wkttosql(text) RETURNS geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_from_text';


ALTER FUNCTION public.st_wkttosql(text) OWNER TO postgres;

--
-- TOC entry 396 (class 1255 OID 16413)
-- Name: st_x(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_x(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_x_point';


ALTER FUNCTION public.st_x(geometry) OWNER TO postgres;

--
-- TOC entry 466 (class 1255 OID 16555)
-- Name: st_xmax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_xmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX3D_xmax';


ALTER FUNCTION public.st_xmax(box3d) OWNER TO postgres;

--
-- TOC entry 463 (class 1255 OID 16552)
-- Name: st_xmin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_xmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX3D_xmin';


ALTER FUNCTION public.st_xmin(box3d) OWNER TO postgres;

--
-- TOC entry 371 (class 1255 OID 16414)
-- Name: st_y(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_y(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_y_point';


ALTER FUNCTION public.st_y(geometry) OWNER TO postgres;

--
-- TOC entry 467 (class 1255 OID 16556)
-- Name: st_ymax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ymax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX3D_ymax';


ALTER FUNCTION public.st_ymax(box3d) OWNER TO postgres;

--
-- TOC entry 464 (class 1255 OID 16553)
-- Name: st_ymin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ymin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX3D_ymin';


ALTER FUNCTION public.st_ymin(box3d) OWNER TO postgres;

--
-- TOC entry 372 (class 1255 OID 16415)
-- Name: st_z(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_z(geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_z_point';


ALTER FUNCTION public.st_z(geometry) OWNER TO postgres;

--
-- TOC entry 468 (class 1255 OID 16557)
-- Name: st_zmax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_zmax(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX3D_zmax';


ALTER FUNCTION public.st_zmax(box3d) OWNER TO postgres;

--
-- TOC entry 524 (class 1255 OID 16613)
-- Name: st_zmflag(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_zmflag(geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_zmflag';


ALTER FUNCTION public.st_zmflag(geometry) OWNER TO postgres;

--
-- TOC entry 465 (class 1255 OID 16554)
-- Name: st_zmin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_zmin(box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'BOX3D_zmin';


ALTER FUNCTION public.st_zmin(box3d) OWNER TO postgres;

--
-- TOC entry 574 (class 1255 OID 16698)
-- Name: text(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', 'LWGEOM_to_text';


ALTER FUNCTION public.text(geometry) OWNER TO postgres;

--
-- TOC entry 799 (class 1255 OID 16929)
-- Name: unlockrows(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION unlockrows(text) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $_$ 
DECLARE
	ret int;
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table where authid = ' ||
		quote_literal($1);

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$;


ALTER FUNCTION public.unlockrows(text) OWNER TO postgres;

--
-- TOC entry 577 (class 1255 OID 16676)
-- Name: updategeometrysrid(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('','',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION public.updategeometrysrid(character varying, character varying, integer) OWNER TO postgres;

--
-- TOC entry 576 (class 1255 OID 16675)
-- Name: updategeometrysrid(character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, character varying, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('',$1,$2,$3,$4) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION public.updategeometrysrid(character varying, character varying, character varying, integer) OWNER TO postgres;

--
-- TOC entry 575 (class 1255 OID 16674)
-- Name: updategeometrysrid(character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updategeometrysrid(catalogn_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
	myrec RECORD;
	okay boolean;
	cname varchar;
	real_schema name;
	unknown_srid integer;
	new_srid integer := new_srid_in;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = false;

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := true;
		END LOOP;

		IF ( okay <> true ) THEN
			RAISE EXCEPTION 'Invalid schema name';
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT INTO real_schema current_schema()::text;
	END IF;

	-- Ensure that column_name is in geometry_columns
	okay = false;
	FOR myrec IN SELECT type, coord_dimension FROM geometry_columns WHERE f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := true;
	END LOOP;
	IF (NOT okay) THEN
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN false;
	END IF;

	-- Ensure that new_srid is valid
	IF ( new_srid > 0 ) THEN
		IF ( SELECT count(*) = 0 from spatial_ref_sys where srid = new_srid ) THEN
			RAISE EXCEPTION 'invalid SRID: % not found in spatial_ref_sys', new_srid;
			RETURN false;
		END IF;
	ELSE
		unknown_srid := ST_SRID('POINT EMPTY'::geometry);
		IF ( new_srid != unknown_srid ) THEN
			new_srid := unknown_srid;
			RAISE NOTICE 'SRID value % converted to the officially unknown SRID value %', new_srid_in, new_srid;
		END IF;
	END IF;

	IF postgis_constraint_srid(schema_name, table_name, column_name) IS NOT NULL THEN 
	-- srid was enforced with constraints before, keep it that way.
        -- Make up constraint name
        cname = 'enforce_srid_'  || column_name;
    
        -- Drop enforce_srid constraint
        EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
            '.' || quote_ident(table_name) ||
            ' DROP constraint ' || quote_ident(cname);
    
        -- Update geometries SRID
        EXECUTE 'UPDATE ' || quote_ident(real_schema) ||
            '.' || quote_ident(table_name) ||
            ' SET ' || quote_ident(column_name) ||
            ' = ST_SetSRID(' || quote_ident(column_name) ||
            ', ' || new_srid::text || ')';
            
        -- Reset enforce_srid constraint
        EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
            '.' || quote_ident(table_name) ||
            ' ADD constraint ' || quote_ident(cname) ||
            ' CHECK (st_srid(' || quote_ident(column_name) ||
            ') = ' || new_srid::text || ')';
    ELSE 
        -- We will use typmod to enforce if no srid constraints
        -- We are using postgis_type_name to lookup the new name 
        -- (in case Paul changes his mind and flips geometry_columns to return old upper case name) 
        EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' || quote_ident(table_name) || 
        ' ALTER COLUMN ' || quote_ident(column_name) || ' TYPE  geometry(' || postgis_type_name(myrec.type, myrec.coord_dimension, true) || ', ' || new_srid::text || ') USING ST_SetSRID(' || quote_ident(column_name) || ',' || new_srid::text || ');' ;
    END IF;

	RETURN real_schema || '.' || table_name || '.' || column_name ||' SRID changed to ' || new_srid::text;

END;
$$;


ALTER FUNCTION public.updategeometrysrid(catalogn_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer) OWNER TO postgres;

--
-- TOC entry 1902 (class 1255 OID 16769)
-- Name: st_3dextent(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_3dextent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d
);


ALTER AGGREGATE public.st_3dextent(geometry) OWNER TO postgres;

--
-- TOC entry 1905 (class 1255 OID 16784)
-- Name: st_accum(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_accum(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_accum_finalfn
);


ALTER AGGREGATE public.st_accum(geometry) OWNER TO postgres;

--
-- TOC entry 1907 (class 1255 OID 16787)
-- Name: st_collect(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_collect(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_collect_finalfn
);


ALTER AGGREGATE public.st_collect(geometry) OWNER TO postgres;

--
-- TOC entry 1901 (class 1255 OID 16768)
-- Name: st_extent(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_extent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d,
    FINALFUNC = public.box2d
);


ALTER AGGREGATE public.st_extent(geometry) OWNER TO postgres;

--
-- TOC entry 1909 (class 1255 OID 16789)
-- Name: st_makeline(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_makeline(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_makeline_finalfn
);


ALTER AGGREGATE public.st_makeline(geometry) OWNER TO postgres;

--
-- TOC entry 1903 (class 1255 OID 16771)
-- Name: st_memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_memcollect(geometry) (
    SFUNC = public.st_collect,
    STYPE = geometry
);


ALTER AGGREGATE public.st_memcollect(geometry) OWNER TO postgres;

--
-- TOC entry 1904 (class 1255 OID 16773)
-- Name: st_memunion(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_memunion(geometry) (
    SFUNC = public.st_union,
    STYPE = geometry
);


ALTER AGGREGATE public.st_memunion(geometry) OWNER TO postgres;

--
-- TOC entry 1908 (class 1255 OID 16788)
-- Name: st_polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_polygonize(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_polygonize_finalfn
);


ALTER AGGREGATE public.st_polygonize(geometry) OWNER TO postgres;

--
-- TOC entry 1906 (class 1255 OID 16786)
-- Name: st_union(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_union(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_union_finalfn
);


ALTER AGGREGATE public.st_union(geometry) OWNER TO postgres;

--
-- TOC entry 2649 (class 2617 OID 16468)
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = geometry_overlaps,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &&,
    RESTRICT = gserialized_gist_sel_2d,
    JOIN = gserialized_gist_joinsel_2d
);


ALTER OPERATOR public.&& (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2664 (class 2617 OID 16982)
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = geography_overlaps,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = &&,
    RESTRICT = gserialized_gist_sel_nd,
    JOIN = gserialized_gist_joinsel_nd
);


ALTER OPERATOR public.&& (geography, geography) OWNER TO postgres;

--
-- TOC entry 2663 (class 2617 OID 16527)
-- Name: &&&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &&& (
    PROCEDURE = geometry_overlaps_nd,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &&&,
    RESTRICT = gserialized_gist_sel_nd,
    JOIN = gserialized_gist_joinsel_nd
);


ALTER OPERATOR public.&&& (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2656 (class 2617 OID 16484)
-- Name: &<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &< (
    PROCEDURE = geometry_overleft,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&< (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2658 (class 2617 OID 16490)
-- Name: &<|; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &<| (
    PROCEDURE = geometry_overbelow,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |&>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&<| (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2659 (class 2617 OID 16483)
-- Name: &>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &> (
    PROCEDURE = geometry_overright,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&> (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2644 (class 2617 OID 16441)
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = geometry_lt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2665 (class 2617 OID 17001)
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = geography_lt,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (geography, geography) OWNER TO postgres;

--
-- TOC entry 2652 (class 2617 OID 16474)
-- Name: <#>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <#> (
    PROCEDURE = geometry_distance_box,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <#>
);


ALTER OPERATOR public.<#> (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2651 (class 2617 OID 16473)
-- Name: <->; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <-> (
    PROCEDURE = geometry_distance_centroid,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <->
);


ALTER OPERATOR public.<-> (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2655 (class 2617 OID 16481)
-- Name: <<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR << (
    PROCEDURE = geometry_left,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.<< (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2657 (class 2617 OID 16487)
-- Name: <<|; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <<| (
    PROCEDURE = geometry_below,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |>>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.<<| (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2645 (class 2617 OID 16442)
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = geometry_le,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2666 (class 2617 OID 17002)
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = geography_le,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (geography, geography) OWNER TO postgres;

--
-- TOC entry 2646 (class 2617 OID 16443)
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = geometry_eq,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = =,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.= (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2667 (class 2617 OID 17003)
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = geography_eq,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = =,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.= (geography, geography) OWNER TO postgres;

--
-- TOC entry 2648 (class 2617 OID 16439)
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = geometry_gt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2669 (class 2617 OID 16999)
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = geography_gt,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (geography, geography) OWNER TO postgres;

--
-- TOC entry 2647 (class 2617 OID 16440)
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = geometry_ge,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2668 (class 2617 OID 17000)
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = geography_ge,
    LEFTARG = geography,
    RIGHTARG = geography,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (geography, geography) OWNER TO postgres;

--
-- TOC entry 2660 (class 2617 OID 16480)
-- Name: >>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >> (
    PROCEDURE = geometry_right,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.>> (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2653 (class 2617 OID 16478)
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = geometry_within,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2661 (class 2617 OID 16489)
-- Name: |&>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR |&> (
    PROCEDURE = geometry_overabove,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.|&> (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2662 (class 2617 OID 16486)
-- Name: |>>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR |>> (
    PROCEDURE = geometry_above,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.|>> (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2654 (class 2617 OID 16477)
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = geometry_contains,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2650 (class 2617 OID 16470)
-- Name: ~=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~= (
    PROCEDURE = geometry_same,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~= (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 2794 (class 2616 OID 17005)
-- Name: btree_geography_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS btree_geography_ops
    DEFAULT FOR TYPE geography USING btree AS
    OPERATOR 1 <(geography,geography) ,
    OPERATOR 2 <=(geography,geography) ,
    OPERATOR 3 =(geography,geography) ,
    OPERATOR 4 >=(geography,geography) ,
    OPERATOR 5 >(geography,geography) ,
    FUNCTION 1 (geography, geography) geography_cmp(geography,geography);


ALTER OPERATOR CLASS public.btree_geography_ops USING btree OWNER TO postgres;

--
-- TOC entry 2790 (class 2616 OID 16445)
-- Name: btree_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS btree_geometry_ops
    DEFAULT FOR TYPE geometry USING btree AS
    OPERATOR 1 <(geometry,geometry) ,
    OPERATOR 2 <=(geometry,geometry) ,
    OPERATOR 3 =(geometry,geometry) ,
    OPERATOR 4 >=(geometry,geometry) ,
    OPERATOR 5 >(geometry,geometry) ,
    FUNCTION 1 (geometry, geometry) geometry_cmp(geometry,geometry);


ALTER OPERATOR CLASS public.btree_geometry_ops USING btree OWNER TO postgres;

--
-- TOC entry 2793 (class 2616 OID 16984)
-- Name: gist_geography_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_geography_ops
    DEFAULT FOR TYPE geography USING gist AS
    STORAGE gidx ,
    OPERATOR 3 &&(geography,geography) ,
    FUNCTION 1 (geography, geography) geography_gist_consistent(internal,geography,integer) ,
    FUNCTION 2 (geography, geography) geography_gist_union(bytea,internal) ,
    FUNCTION 3 (geography, geography) geography_gist_compress(internal) ,
    FUNCTION 4 (geography, geography) geography_gist_decompress(internal) ,
    FUNCTION 5 (geography, geography) geography_gist_penalty(internal,internal,internal) ,
    FUNCTION 6 (geography, geography) geography_gist_picksplit(internal,internal) ,
    FUNCTION 7 (geography, geography) geography_gist_same(box2d,box2d,internal);


ALTER OPERATOR CLASS public.gist_geography_ops USING gist OWNER TO postgres;

--
-- TOC entry 2791 (class 2616 OID 16496)
-- Name: gist_geometry_ops_2d; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_geometry_ops_2d
    DEFAULT FOR TYPE geometry USING gist AS
    STORAGE box2df ,
    OPERATOR 1 <<(geometry,geometry) ,
    OPERATOR 2 &<(geometry,geometry) ,
    OPERATOR 3 &&(geometry,geometry) ,
    OPERATOR 4 &>(geometry,geometry) ,
    OPERATOR 5 >>(geometry,geometry) ,
    OPERATOR 6 ~=(geometry,geometry) ,
    OPERATOR 7 ~(geometry,geometry) ,
    OPERATOR 8 @(geometry,geometry) ,
    OPERATOR 9 &<|(geometry,geometry) ,
    OPERATOR 10 <<|(geometry,geometry) ,
    OPERATOR 11 |>>(geometry,geometry) ,
    OPERATOR 12 |&>(geometry,geometry) ,
    OPERATOR 13 <->(geometry,geometry) FOR ORDER BY pg_catalog.float_ops ,
    OPERATOR 14 <#>(geometry,geometry) FOR ORDER BY pg_catalog.float_ops ,
    FUNCTION 1 (geometry, geometry) geometry_gist_consistent_2d(internal,geometry,integer) ,
    FUNCTION 2 (geometry, geometry) geometry_gist_union_2d(bytea,internal) ,
    FUNCTION 3 (geometry, geometry) geometry_gist_compress_2d(internal) ,
    FUNCTION 4 (geometry, geometry) geometry_gist_decompress_2d(internal) ,
    FUNCTION 5 (geometry, geometry) geometry_gist_penalty_2d(internal,internal,internal) ,
    FUNCTION 6 (geometry, geometry) geometry_gist_picksplit_2d(internal,internal) ,
    FUNCTION 7 (geometry, geometry) geometry_gist_same_2d(geometry,geometry,internal) ,
    FUNCTION 8 (geometry, geometry) geometry_gist_distance_2d(internal,geometry,integer);


ALTER OPERATOR CLASS public.gist_geometry_ops_2d USING gist OWNER TO postgres;

--
-- TOC entry 2792 (class 2616 OID 16529)
-- Name: gist_geometry_ops_nd; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_geometry_ops_nd
    FOR TYPE geometry USING gist AS
    STORAGE gidx ,
    OPERATOR 3 &&&(geometry,geometry) ,
    FUNCTION 1 (geometry, geometry) geometry_gist_consistent_nd(internal,geometry,integer) ,
    FUNCTION 2 (geometry, geometry) geometry_gist_union_nd(bytea,internal) ,
    FUNCTION 3 (geometry, geometry) geometry_gist_compress_nd(internal) ,
    FUNCTION 4 (geometry, geometry) geometry_gist_decompress_nd(internal) ,
    FUNCTION 5 (geometry, geometry) geometry_gist_penalty_nd(internal,internal,internal) ,
    FUNCTION 6 (geometry, geometry) geometry_gist_picksplit_nd(internal,internal) ,
    FUNCTION 7 (geometry, geometry) geometry_gist_same_nd(geometry,geometry,internal);


ALTER OPERATOR CLASS public.gist_geometry_ops_nd USING gist OWNER TO postgres;

SET search_path = pg_catalog;

--
-- TOC entry 3312 (class 2605 OID 16709)
-- Name: CAST (public.box2d AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box2d AS public.box3d) WITH FUNCTION public.box3d(public.box2d) AS IMPLICIT;


--
-- TOC entry 3311 (class 2605 OID 16710)
-- Name: CAST (public.box2d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box2d AS public.geometry) WITH FUNCTION public.geometry(public.box2d) AS IMPLICIT;


--
-- TOC entry 3308 (class 2605 OID 16711)
-- Name: CAST (public.box3d AS box); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box3d AS box) WITH FUNCTION public.box(public.box3d) AS IMPLICIT;


--
-- TOC entry 3310 (class 2605 OID 16708)
-- Name: CAST (public.box3d AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box3d AS public.box2d) WITH FUNCTION public.box2d(public.box3d) AS IMPLICIT;


--
-- TOC entry 3309 (class 2605 OID 16712)
-- Name: CAST (public.box3d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box3d AS public.geometry) WITH FUNCTION public.geometry(public.box3d) AS IMPLICIT;


--
-- TOC entry 3101 (class 2605 OID 16955)
-- Name: CAST (bytea AS public.geography); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (bytea AS public.geography) WITH FUNCTION public.geography(bytea) AS IMPLICIT;


--
-- TOC entry 3100 (class 2605 OID 16715)
-- Name: CAST (bytea AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (bytea AS public.geometry) WITH FUNCTION public.geometry(bytea) AS IMPLICIT;


--
-- TOC entry 3313 (class 2605 OID 16956)
-- Name: CAST (public.geography AS bytea); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geography AS bytea) WITH FUNCTION public.bytea(public.geography) AS IMPLICIT;


--
-- TOC entry 3315 (class 2605 OID 16952)
-- Name: CAST (public.geography AS public.geography); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geography AS public.geography) WITH FUNCTION public.geography(public.geography, integer, boolean) AS IMPLICIT;


--
-- TOC entry 3314 (class 2605 OID 16973)
-- Name: CAST (public.geography AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geography AS public.geometry) WITH FUNCTION public.geometry(public.geography);


--
-- TOC entry 3302 (class 2605 OID 16707)
-- Name: CAST (public.geometry AS box); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS box) WITH FUNCTION public.box(public.geometry) AS ASSIGNMENT;


--
-- TOC entry 3306 (class 2605 OID 16705)
-- Name: CAST (public.geometry AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS public.box2d) WITH FUNCTION public.box2d(public.geometry) AS IMPLICIT;


--
-- TOC entry 3305 (class 2605 OID 16706)
-- Name: CAST (public.geometry AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS public.box3d) WITH FUNCTION public.box3d(public.geometry) AS IMPLICIT;


--
-- TOC entry 3298 (class 2605 OID 16716)
-- Name: CAST (public.geometry AS bytea); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS bytea) WITH FUNCTION public.bytea(public.geometry) AS IMPLICIT;


--
-- TOC entry 3307 (class 2605 OID 16971)
-- Name: CAST (public.geometry AS public.geography); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS public.geography) WITH FUNCTION public.geography(public.geometry) AS IMPLICIT;


--
-- TOC entry 3304 (class 2605 OID 16400)
-- Name: CAST (public.geometry AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS public.geometry) WITH FUNCTION public.geometry(public.geometry, integer, boolean) AS IMPLICIT;


--
-- TOC entry 3301 (class 2605 OID 16409)
-- Name: CAST (public.geometry AS path); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS path) WITH FUNCTION public.path(public.geometry);


--
-- TOC entry 3300 (class 2605 OID 16407)
-- Name: CAST (public.geometry AS point); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS point) WITH FUNCTION public.point(public.geometry);


--
-- TOC entry 3303 (class 2605 OID 16411)
-- Name: CAST (public.geometry AS polygon); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS polygon) WITH FUNCTION public.polygon(public.geometry);


--
-- TOC entry 3299 (class 2605 OID 16714)
-- Name: CAST (public.geometry AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS text) WITH FUNCTION public.text(public.geometry) AS IMPLICIT;


--
-- TOC entry 3188 (class 2605 OID 16410)
-- Name: CAST (path AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (path AS public.geometry) WITH FUNCTION public.geometry(path);


--
-- TOC entry 3184 (class 2605 OID 16408)
-- Name: CAST (point AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (point AS public.geometry) WITH FUNCTION public.geometry(point);


--
-- TOC entry 3197 (class 2605 OID 16412)
-- Name: CAST (polygon AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (polygon AS public.geometry) WITH FUNCTION public.geometry(polygon);


--
-- TOC entry 3169 (class 2605 OID 16713)
-- Name: CAST (text AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.geometry) WITH FUNCTION public.geometry(text) AS IMPLICIT;


SET search_path = bdd_especes_introduites_faune, pg_catalog;

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
-- TOC entry 4072 (class 0 OID 0)
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

SET search_path = ornithologie, pg_catalog;

--
-- TOC entry 320 (class 1259 OID 28899)
-- Name: tb_manipe_metadonnees; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_manipe_metadonnees (
    num_manipe bigint,
    pk_tb_manipe_metadonnees character varying(12) NOT NULL,
    date_manipe date,
    district character varying(20),
    fk_zone_geo smallint,
    date_saisie_dans_bd date,
    fk_site character varying(100),
    fk_protocole character varying(40),
    heure_debut time without time zone,
    heure_fin time without time zone,
    remarques_manipe text,
    saison character varying(10),
    saisisseur_donnee character varying(25),
    ordi_saisie_donnee character varying(40),
    fk_site_arrivee character varying(100),
    CONSTRAINT tb_manipe_metadonnees_district_check CHECK ((((((district)::text = 'K'::text) OR ((district)::text = 'C'::text)) OR ((district)::text = 'A'::text)) OR ((district)::text = 'P'::text)))
);


ALTER TABLE ornithologie.tb_manipe_metadonnees OWNER TO postgres;

--
-- TOC entry 321 (class 1259 OID 28906)
-- Name: tb_meteo; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_meteo (
    pk_tb_meteo character varying(12) NOT NULL,
    visibilite character varying(30),
    vent character varying(30),
    couverture_nuageuse character varying(30),
    precipitations character varying(30),
    couverture_neigeuse_au_sol character varying(20),
    lune real
);


ALTER TABLE ornithologie.tb_meteo OWNER TO postgres;

SET search_path = bdd_especes_introduites_faune, pg_catalog;

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

SET search_path = demande_manipulation_especes, pg_catalog;

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
-- TOC entry 4075 (class 0 OID 0)
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
-- TOC entry 4076 (class 0 OID 0)
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
-- TOC entry 4078 (class 0 OID 0)
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
-- TOC entry 4080 (class 0 OID 0)
-- Dependencies: 278
-- Name: kerguelen_lacs_gid_seq; Type: SEQUENCE OWNED BY; Schema: donnees_carto; Owner: postgres
--

ALTER SEQUENCE kerguelen_lacs_gid_seq OWNED BY kerguelen_lacs.gid;


SET search_path = frequentations_autorisations_ams, pg_catalog;

--
-- TOC entry 184 (class 1259 OID 17135)
-- Name: autorisations; Type: TABLE; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

CREATE TABLE autorisations (
    programme character varying(30) NOT NULL,
    district character varying(10),
    site smallint NOT NULL,
    nbjours_autorises_1314 smallint,
    nbacces_autorises_1314 smallint,
    nbparticipants_autorises_1314 smallint,
    nbjours_autorises_1415 smallint,
    nbacces_autorises_1415 smallint,
    nbparticipants_autorises_1415 smallint
);


ALTER TABLE frequentations_autorisations_ams.autorisations OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 17138)
-- Name: debarquements_embarquements; Type: TABLE; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

CREATE TABLE debarquements_embarquements (
    pk_debarquements_embarquements integer NOT NULL,
    navire character varying(50),
    date_arrivee date,
    date_depart date,
    nb_pers_debarquant smallint,
    district character varying(5)
);


ALTER TABLE frequentations_autorisations_ams.debarquements_embarquements OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 17141)
-- Name: debarquements_embarquements_pk_debarquements_embarquements_seq; Type: SEQUENCE; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE SEQUENCE debarquements_embarquements_pk_debarquements_embarquements_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_ams.debarquements_embarquements_pk_debarquements_embarquements_seq OWNER TO postgres;

--
-- TOC entry 4081 (class 0 OID 0)
-- Dependencies: 186
-- Name: debarquements_embarquements_pk_debarquements_embarquements_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER SEQUENCE debarquements_embarquements_pk_debarquements_embarquements_seq OWNED BY debarquements_embarquements.pk_debarquements_embarquements;


--
-- TOC entry 187 (class 1259 OID 17143)
-- Name: enregistrement_modifications_sorties; Type: TABLE; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

CREATE TABLE enregistrement_modifications_sorties (
    code_sortie integer,
    date_modification timestamp without time zone
);


ALTER TABLE frequentations_autorisations_ams.enregistrement_modifications_sorties OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 17146)
-- Name: equipier_sortie; Type: TABLE; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

CREATE TABLE equipier_sortie (
    code_equipier_sortie integer NOT NULL,
    code_sortie integer,
    equipier character varying(50),
    statut character varying(20),
    programme character varying(30),
    sortie_terminee boolean
);


ALTER TABLE frequentations_autorisations_ams.equipier_sortie OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 17149)
-- Name: equipier_sortie_code_equipier_sortie_seq; Type: SEQUENCE; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE SEQUENCE equipier_sortie_code_equipier_sortie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_ams.equipier_sortie_code_equipier_sortie_seq OWNER TO postgres;

--
-- TOC entry 4082 (class 0 OID 0)
-- Dependencies: 189
-- Name: equipier_sortie_code_equipier_sortie_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER SEQUENCE equipier_sortie_code_equipier_sortie_seq OWNED BY equipier_sortie.code_equipier_sortie;


--
-- TOC entry 190 (class 1259 OID 17151)
-- Name: equipiers; Type: TABLE; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

CREATE TABLE equipiers (
    code_equipier character varying(50) NOT NULL,
    nom character varying(30),
    prenom character varying(30),
    numero integer NOT NULL,
    district character varying(50),
    organisme character varying(50),
    fonction_programme character varying(50),
    date_arrivee date,
    date_depart date,
    navire_arrivee character varying(50),
    navire_depart character varying(50),
    nbjours_presence_sur_district smallint
);


ALTER TABLE frequentations_autorisations_ams.equipiers OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 17154)
-- Name: equipiers_numero_seq; Type: SEQUENCE; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE SEQUENCE equipiers_numero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_ams.equipiers_numero_seq OWNER TO postgres;

--
-- TOC entry 4083 (class 0 OID 0)
-- Dependencies: 191
-- Name: equipiers_numero_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER SEQUENCE equipiers_numero_seq OWNED BY equipiers.numero;


--
-- TOC entry 192 (class 1259 OID 17156)
-- Name: nb_sorties_par_programme; Type: VIEW; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE VIEW nb_sorties_par_programme AS
 SELECT foo.programme,
    count(foo.programme) AS nb_sortie
   FROM ( SELECT DISTINCT equipier_sortie.programme,
            equipier_sortie.code_sortie
           FROM equipier_sortie
          GROUP BY equipier_sortie.programme, equipier_sortie.code_sortie) foo
  GROUP BY foo.programme;


ALTER TABLE frequentations_autorisations_ams.nb_sorties_par_programme OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 17160)
-- Name: presence; Type: TABLE; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

CREATE TABLE presence (
    code_presence integer NOT NULL,
    code_equipier_sortie integer,
    zone_presence integer,
    date_debut date,
    date_fin date,
    nbjours_presence smallint,
    numero_etape smallint
);


ALTER TABLE frequentations_autorisations_ams.presence OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17168)
-- Name: zones_sites; Type: TABLE; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

CREATE TABLE zones_sites (
    code_zone_site smallint NOT NULL,
    nom_zone_site character varying(100),
    district character varying(10),
    nature character varying(80),
    statut_protection character varying(40),
    secteur character varying(40),
    the_geom public.geometry(MultiPolygon,32743)
);


ALTER TABLE frequentations_autorisations_ams.zones_sites OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 27408)
-- Name: nbjours_presence_par_programme; Type: VIEW; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE VIEW nbjours_presence_par_programme AS
 SELECT table1.programme,
    table1.zone_presence,
    count(*) AS jours_presence
   FROM ( SELECT DISTINCT (generate_series((presence.date_debut)::timestamp with time zone, (presence.date_fin)::timestamp with time zone, '1 day'::interval))::date AS jours_presence,
            equipier_sortie.programme,
            presence.zone_presence
           FROM presence,
            equipier_sortie,
            zones_sites,
            autorisations
          WHERE ((((((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND (presence.zone_presence <> 1)) AND (presence.date_debut > '2014-11-18'::date)) AND (presence.zone_presence = zones_sites.code_zone_site)) AND ((zones_sites.nature)::text = 'Zones protegees'::text)) AND ((autorisations.programme)::text = (equipier_sortie.programme)::text))) table1
  GROUP BY table1.programme, table1.zone_presence;


ALTER TABLE frequentations_autorisations_ams.nbjours_presence_par_programme OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 17163)
-- Name: presence_code_presence_seq; Type: SEQUENCE; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE SEQUENCE presence_code_presence_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_ams.presence_code_presence_seq OWNER TO postgres;

--
-- TOC entry 4084 (class 0 OID 0)
-- Dependencies: 194
-- Name: presence_code_presence_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER SEQUENCE presence_code_presence_seq OWNED BY presence.code_presence;


--
-- TOC entry 195 (class 1259 OID 17165)
-- Name: programmes; Type: TABLE; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

CREATE TABLE programmes (
    code_programme character varying(30) NOT NULL,
    nom_programme character varying(100),
    autorisations_1314 boolean,
    present_1314 boolean,
    serial_programme smallint,
    autorisations_1415 boolean,
    present_1415 boolean
);


ALTER TABLE frequentations_autorisations_ams.programmes OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 17174)
-- Name: somme_autorisations_acces; Type: VIEW; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE VIEW somme_autorisations_acces AS
 SELECT zones_sites.the_geom,
    sub.site,
    sub.somme_jours_acces,
    sub.somme_nombre_acces
   FROM ( SELECT DISTINCT autorisations.site,
            (sum(autorisations.nbjours_autorises_1314))::smallint AS somme_jours_acces,
            (sum(autorisations.nbacces_autorises_1314))::smallint AS somme_nombre_acces
           FROM autorisations
          GROUP BY autorisations.site) sub,
    zones_sites
  WHERE (zones_sites.code_zone_site = sub.site);


ALTER TABLE frequentations_autorisations_ams.somme_autorisations_acces OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 17178)
-- Name: sortie; Type: TABLE; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

CREATE TABLE sortie (
    code_sortie integer NOT NULL,
    nom_sortie character varying(100),
    date_debut date,
    date_fin date,
    date_saisie date,
    sortie_loisir_travail character(1),
    responsable character varying(50),
    district character varying(10),
    objet text
);


ALTER TABLE frequentations_autorisations_ams.sortie OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 17184)
-- Name: sortie_code_sortie_seq; Type: SEQUENCE; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE SEQUENCE sortie_code_sortie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_ams.sortie_code_sortie_seq OWNER TO postgres;

--
-- TOC entry 4085 (class 0 OID 0)
-- Dependencies: 199
-- Name: sortie_code_sortie_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER SEQUENCE sortie_code_sortie_seq OWNED BY sortie.code_sortie;


--
-- TOC entry 200 (class 1259 OID 17186)
-- Name: stats_presence; Type: VIEW; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE VIEW stats_presence AS
 SELECT DISTINCT foo.zone_presence,
    sum(foo.nbjourshommes_presence) AS nbjourshommes_presence,
    foo.the_geom,
    foo.nom_zone_site,
    foo.nature
   FROM ( SELECT presence.zone_presence,
            zones_sites.the_geom,
            zones_sites.nom_zone_site,
            zones_sites.nature,
                CASE
                    WHEN (presence.date_debut = presence.date_fin) THEN 1
                    WHEN (presence.date_fin IS NULL) THEN 1
                    WHEN ((presence.date_debut >= '2014-11-01'::date) AND (presence.date_fin <= '2014-11-30'::date)) THEN (presence.date_fin - presence.date_debut)
                    WHEN ((presence.date_debut >= '2014-11-01'::date) AND (presence.date_fin >= '2014-11-30'::date)) THEN ('2014-11-30'::date - presence.date_debut)
                    WHEN ((presence.date_debut <= '2014-11-01'::date) AND (presence.date_fin <= '2014-11-30'::date)) THEN (presence.date_fin - '2014-11-01'::date)
                    WHEN ((presence.date_debut <= '2014-11-01'::date) AND (presence.date_fin >= '2014-11-30'::date)) THEN ('2014-11-30'::date - '2014-11-01'::date)
                    ELSE 999
                END AS nbjourshommes_presence
           FROM (presence
             JOIN zones_sites ON ((((zones_sites.code_zone_site = presence.zone_presence) AND "overlaps"((presence.date_debut)::timestamp with time zone, (presence.date_fin)::timestamp with time zone, ('2014-11-01'::date)::timestamp with time zone, ('2014-11-30'::date)::timestamp with time zone)) AND (presence.zone_presence <> 1))))) foo
  GROUP BY foo.zone_presence, foo.the_geom, foo.nom_zone_site, foo.nature;


ALTER TABLE frequentations_autorisations_ams.stats_presence OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 17191)
-- Name: transit; Type: TABLE; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

CREATE TABLE transit (
    code_transit integer NOT NULL,
    code_equipier_sortie integer,
    date_transit date,
    moyen_deplacement character varying(20),
    site_depart integer,
    site_arrivee integer,
    numero_etape smallint
);


ALTER TABLE frequentations_autorisations_ams.transit OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17194)
-- Name: zones_transitees; Type: TABLE; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

CREATE TABLE zones_transitees (
    code_transit integer NOT NULL,
    zone_transitee integer NOT NULL
);


ALTER TABLE frequentations_autorisations_ams.zones_transitees OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 17197)
-- Name: stats_transits; Type: VIEW; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE VIEW stats_transits AS
 SELECT DISTINCT zones_sites.nom_zone_site,
    zones_sites.the_geom,
    count(*) AS nb_transits
   FROM equipier_sortie,
    transit,
    zones_transitees,
    zones_sites
  WHERE (((((transit.date_transit >= '2014-11-01'::date) AND (transit.date_transit <= '2014-11-30'::date)) AND (zones_sites.code_zone_site = zones_transitees.zone_transitee)) AND (zones_transitees.code_transit = transit.code_transit)) AND (transit.code_equipier_sortie = equipier_sortie.code_equipier_sortie))
  GROUP BY zones_sites.nom_zone_site, zones_sites.the_geom;


ALTER TABLE frequentations_autorisations_ams.stats_transits OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 27442)
-- Name: stats_travail_loisir; Type: VIEW; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE VIEW stats_travail_loisir AS
 SELECT row_number() OVER (ORDER BY zones_sites.nom_zone_site) AS cle_primaire,
    zones_sites.nom_zone_site,
    sortie.sortie_loisir_travail,
    sum(presence.nbjours_presence) AS nb_jourshomme,
    count(DISTINCT sortie.code_sortie) AS nb_sorties,
    zones_sites.the_geom
   FROM presence,
    sortie,
    equipier_sortie,
    zones_sites
  WHERE ((((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND (equipier_sortie.code_sortie = sortie.code_sortie)) AND (zones_sites.code_zone_site = presence.zone_presence)) AND (presence.zone_presence <> 1))
  GROUP BY zones_sites.nom_zone_site, sortie.sortie_loisir_travail, zones_sites.the_geom
  ORDER BY zones_sites.nom_zone_site, sortie.sortie_loisir_travail, zones_sites.the_geom;


ALTER TABLE frequentations_autorisations_ams.stats_travail_loisir OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17201)
-- Name: suivi_acces_chaquetransit; Type: VIEW; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE VIEW suivi_acces_chaquetransit AS
 SELECT table1.zone_transitee,
    table1.nb_jours_transit,
    zones_sites.code_zone_site,
    zones_sites.nom_zone_site,
    zones_sites.district,
    zones_sites.nature,
    zones_sites.statut_protection,
    zones_sites.secteur,
    zones_sites.the_geom
   FROM ( SELECT DISTINCT zones_transitees.zone_transitee,
            count(zones_transitees.zone_transitee) AS nb_jours_transit
           FROM zones_transitees
          GROUP BY zones_transitees.zone_transitee) table1,
    zones_sites
  WHERE (table1.zone_transitee = zones_sites.code_zone_site);


ALTER TABLE frequentations_autorisations_ams.suivi_acces_chaquetransit OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17205)
-- Name: suivi_acces_nbjourshommepresence_programmes; Type: VIEW; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE VIEW suivi_acces_nbjourshommepresence_programmes AS
 SELECT DISTINCT table_base.programme,
    table_base.serial_programme,
    sum(table_base.nbjours_presence) AS total_nbjours_presence,
    sum(table_base.nb_acces) AS total_nb_acces
   FROM ( SELECT DISTINCT presence.date_debut,
            equipier_sortie.programme,
            programmes.serial_programme,
            sum(presence.nbjours_presence) AS nbjours_presence,
            1 AS nb_acces
           FROM presence,
            equipier_sortie,
            programmes
          WHERE (((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND ((programmes.code_programme)::text = (equipier_sortie.programme)::text)) AND (presence.zone_presence <> 1))
          GROUP BY presence.date_debut, equipier_sortie.programme, programmes.serial_programme) table_base
  GROUP BY table_base.programme, table_base.serial_programme;


ALTER TABLE frequentations_autorisations_ams.suivi_acces_nbjourshommepresence_programmes OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 27335)
-- Name: suivi_acces_sites_proteges; Type: VIEW; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE VIEW suivi_acces_sites_proteges AS
 SELECT row_number() OVER (ORDER BY autorisations.programme) AS row_number,
    table1.zone_presence,
    zones_sites.nom_zone_site,
    table1.programme,
    table1.total_nbjours_presence,
    table1.total_nb_acces,
    autorisations.nbjours_autorises_1415,
    autorisations.nbacces_autorises_1415,
    autorisations.nbparticipants_autorises_1415,
    zones_sites.the_geom
   FROM ( SELECT DISTINCT table_base.zone_presence,
            table_base.programme,
            sum(table_base.nbjours_presence) AS total_nbjours_presence,
            sum(table_base.nb_acces) AS total_nb_acces
           FROM ( SELECT DISTINCT presence.date_debut,
                    presence.zone_presence,
                    equipier_sortie.programme,
                    sum(presence.nbjours_presence) AS nbjours_presence,
                    1 AS nb_acces
                   FROM presence,
                    equipier_sortie
                  WHERE (((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND ((equipier_sortie.statut)::text = 'travail'::text)) AND (presence.date_debut > '2014-11-23'::date))
                  GROUP BY presence.date_debut, presence.zone_presence, equipier_sortie.programme) table_base
          GROUP BY table_base.zone_presence, table_base.programme) table1,
    autorisations,
    zones_sites
  WHERE (((((autorisations.programme)::text = (table1.programme)::text) AND (autorisations.site = table1.zone_presence)) AND (autorisations.site = zones_sites.code_zone_site)) AND (table1.zone_presence = zones_sites.code_zone_site));


ALTER TABLE frequentations_autorisations_ams.suivi_acces_sites_proteges OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17215)
-- Name: suivi_acces_tousprogrammes_toussites; Type: VIEW; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE VIEW suivi_acces_tousprogrammes_toussites AS
 SELECT DISTINCT table_base.zone_presence,
    table_base.programme,
    table_base.serial_programme,
    table_base.nom_zone_site,
    table_base.secteur,
    sum(table_base.nbjours_presence) AS total_nbjours_presence,
    sum(table_base.nb_acces) AS total_nb_acces
   FROM ( SELECT DISTINCT presence.date_debut,
            presence.zone_presence,
            zones_sites.nom_zone_site,
            zones_sites.secteur,
            equipier_sortie.programme,
            programmes.serial_programme,
            sum(presence.nbjours_presence) AS nbjours_presence,
            1 AS nb_acces
           FROM presence,
            equipier_sortie,
            zones_sites,
            programmes
          WHERE (((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND (presence.zone_presence = zones_sites.code_zone_site)) AND ((programmes.code_programme)::text = (equipier_sortie.programme)::text))
          GROUP BY presence.date_debut, presence.zone_presence, zones_sites.nom_zone_site, zones_sites.secteur, equipier_sortie.programme, programmes.serial_programme) table_base
  GROUP BY table_base.zone_presence, table_base.secteur, table_base.programme, table_base.serial_programme, table_base.nom_zone_site;


ALTER TABLE frequentations_autorisations_ams.suivi_acces_tousprogrammes_toussites OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17220)
-- Name: suivi_nbacces_chaquesite; Type: VIEW; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE VIEW suivi_nbacces_chaquesite AS
 SELECT table1.zone_presence,
    table1.nbacces_total,
    zones_sites.nom_zone_site,
    zones_sites.district,
    zones_sites.nature,
    zones_sites.statut_protection,
    zones_sites.secteur,
    zones_sites.the_geom
   FROM ( SELECT DISTINCT presence.zone_presence,
            count(DISTINCT presence.date_debut) AS nbacces_total
           FROM presence
          GROUP BY presence.zone_presence) table1,
    zones_sites
  WHERE ((table1.zone_presence = zones_sites.code_zone_site) AND (zones_sites.code_zone_site <> 1));


ALTER TABLE frequentations_autorisations_ams.suivi_nbacces_chaquesite OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17224)
-- Name: suivi_nbjourshomme_chaquesite; Type: VIEW; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE VIEW suivi_nbjourshomme_chaquesite AS
 SELECT table2.zone_presence,
    table2.nbjours_total_presence,
    zones_sites.nom_zone_site,
    zones_sites.district,
    zones_sites.nature,
    zones_sites.statut_protection,
    zones_sites.secteur,
    zones_sites.the_geom
   FROM ( SELECT DISTINCT table1.zone_presence,
            sum(table1.total_nbjours_presence) AS nbjours_total_presence
           FROM ( SELECT DISTINCT table_base.zone_presence,
                    table_base.programme,
                    sum(table_base.nbjours_presence) AS total_nbjours_presence
                   FROM ( SELECT DISTINCT presence.date_debut,
                            presence.zone_presence,
                            equipier_sortie.programme,
                            sum(presence.nbjours_presence) AS nbjours_presence
                           FROM presence,
                            equipier_sortie
                          WHERE (presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie)
                          GROUP BY presence.date_debut, presence.zone_presence, equipier_sortie.programme) table_base
                  GROUP BY table_base.zone_presence, table_base.programme) table1
          GROUP BY table1.zone_presence) table2,
    zones_sites
  WHERE ((table2.zone_presence = zones_sites.code_zone_site) AND (zones_sites.code_zone_site <> 1));


ALTER TABLE frequentations_autorisations_ams.suivi_nbjourshomme_chaquesite OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17229)
-- Name: transit_code_transit_seq; Type: SEQUENCE; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE SEQUENCE transit_code_transit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_ams.transit_code_transit_seq OWNER TO postgres;

--
-- TOC entry 4086 (class 0 OID 0)
-- Dependencies: 209
-- Name: transit_code_transit_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER SEQUENCE transit_code_transit_seq OWNED BY transit.code_transit;


SET search_path = frequentations_autorisations_cro, pg_catalog;

--
-- TOC entry 210 (class 1259 OID 17231)
-- Name: autorisations; Type: TABLE; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

CREATE TABLE autorisations (
    programme character varying(30) NOT NULL,
    district character varying(10),
    site smallint NOT NULL,
    nbjours_autorises_1314 smallint,
    nbacces_autorises_1314 smallint,
    nbparticipants_autorises_1314 smallint,
    nbjours_autorises_1415 smallint,
    nbacces_autorises_1415 smallint,
    nbparticipants_autorises_1415 smallint
);


ALTER TABLE frequentations_autorisations_cro.autorisations OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17234)
-- Name: debarquements_embarquements; Type: TABLE; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

CREATE TABLE debarquements_embarquements (
    pk_debarquements_embarquements integer NOT NULL,
    navire character varying(50),
    date_arrivee date,
    date_depart date,
    nb_pers_debarquant smallint,
    district character varying(5)
);


ALTER TABLE frequentations_autorisations_cro.debarquements_embarquements OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17237)
-- Name: debarquements_embarquements_pk_debarquements_embarquements_seq; Type: SEQUENCE; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE SEQUENCE debarquements_embarquements_pk_debarquements_embarquements_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_cro.debarquements_embarquements_pk_debarquements_embarquements_seq OWNER TO postgres;

--
-- TOC entry 4087 (class 0 OID 0)
-- Dependencies: 212
-- Name: debarquements_embarquements_pk_debarquements_embarquements_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER SEQUENCE debarquements_embarquements_pk_debarquements_embarquements_seq OWNED BY debarquements_embarquements.pk_debarquements_embarquements;


--
-- TOC entry 213 (class 1259 OID 17239)
-- Name: enregistrement_modifications_sorties; Type: TABLE; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

CREATE TABLE enregistrement_modifications_sorties (
    code_sortie integer,
    date_modification timestamp without time zone
);


ALTER TABLE frequentations_autorisations_cro.enregistrement_modifications_sorties OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17242)
-- Name: equipier_sortie; Type: TABLE; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

CREATE TABLE equipier_sortie (
    code_equipier_sortie integer NOT NULL,
    code_sortie integer,
    equipier character varying(50),
    statut character varying(20),
    programme character varying(30),
    sortie_terminee boolean
);


ALTER TABLE frequentations_autorisations_cro.equipier_sortie OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17245)
-- Name: equipier_sortie_code_equipier_sortie_seq; Type: SEQUENCE; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE SEQUENCE equipier_sortie_code_equipier_sortie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_cro.equipier_sortie_code_equipier_sortie_seq OWNER TO postgres;

--
-- TOC entry 4088 (class 0 OID 0)
-- Dependencies: 215
-- Name: equipier_sortie_code_equipier_sortie_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER SEQUENCE equipier_sortie_code_equipier_sortie_seq OWNED BY equipier_sortie.code_equipier_sortie;


--
-- TOC entry 216 (class 1259 OID 17247)
-- Name: equipiers; Type: TABLE; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

CREATE TABLE equipiers (
    code_equipier character varying(50) NOT NULL,
    nom character varying(30),
    prenom character varying(30),
    numero integer NOT NULL,
    district character varying(50),
    organisme character varying(50),
    fonction_programme character varying(50),
    date_arrivee date,
    date_depart date,
    navire_arrivee character varying(50),
    navire_depart character varying(50),
    nbjours_presence_sur_district smallint
);


ALTER TABLE frequentations_autorisations_cro.equipiers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17250)
-- Name: equipiers_numero_seq; Type: SEQUENCE; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE SEQUENCE equipiers_numero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_cro.equipiers_numero_seq OWNER TO postgres;

--
-- TOC entry 4089 (class 0 OID 0)
-- Dependencies: 217
-- Name: equipiers_numero_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER SEQUENCE equipiers_numero_seq OWNED BY equipiers.numero;


--
-- TOC entry 218 (class 1259 OID 17252)
-- Name: nb_sorties_par_programme; Type: VIEW; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE VIEW nb_sorties_par_programme AS
 SELECT foo.programme,
    count(foo.programme) AS nb_sortie
   FROM ( SELECT DISTINCT equipier_sortie.programme,
            equipier_sortie.code_sortie
           FROM equipier_sortie
          GROUP BY equipier_sortie.programme, equipier_sortie.code_sortie) foo
  GROUP BY foo.programme;


ALTER TABLE frequentations_autorisations_cro.nb_sorties_par_programme OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17256)
-- Name: presence; Type: TABLE; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

CREATE TABLE presence (
    code_presence integer NOT NULL,
    code_equipier_sortie integer,
    zone_presence integer,
    date_debut date,
    date_fin date,
    nbjours_presence smallint,
    numero_etape smallint
);


ALTER TABLE frequentations_autorisations_cro.presence OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17264)
-- Name: zones_sites; Type: TABLE; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

CREATE TABLE zones_sites (
    code_zone_site smallint NOT NULL,
    nom_zone_site character varying(100),
    district character varying(10),
    nature character varying(80),
    statut_protection character varying(40),
    secteur character varying(40),
    the_geom public.geometry(MultiPolygon,32739)
);


ALTER TABLE frequentations_autorisations_cro.zones_sites OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 27327)
-- Name: nbjours_presence_par_programme; Type: VIEW; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE VIEW nbjours_presence_par_programme AS
 SELECT table1.programme,
    table1.zone_presence,
    count(*) AS jours_presence
   FROM ( SELECT DISTINCT (generate_series((presence.date_debut)::timestamp with time zone, (presence.date_fin)::timestamp with time zone, '1 day'::interval))::date AS jours_presence,
            equipier_sortie.programme,
            presence.zone_presence
           FROM presence,
            equipier_sortie,
            zones_sites,
            autorisations
          WHERE ((((((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND (presence.zone_presence <> 1)) AND (presence.date_debut > '2014-11-18'::date)) AND (presence.zone_presence = zones_sites.code_zone_site)) AND ((zones_sites.nature)::text = 'Zones protegees'::text)) AND ((autorisations.programme)::text = (equipier_sortie.programme)::text))) table1
  GROUP BY table1.programme, table1.zone_presence;


ALTER TABLE frequentations_autorisations_cro.nbjours_presence_par_programme OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17259)
-- Name: presence_code_presence_seq; Type: SEQUENCE; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE SEQUENCE presence_code_presence_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_cro.presence_code_presence_seq OWNER TO postgres;

--
-- TOC entry 4090 (class 0 OID 0)
-- Dependencies: 220
-- Name: presence_code_presence_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER SEQUENCE presence_code_presence_seq OWNED BY presence.code_presence;


--
-- TOC entry 221 (class 1259 OID 17261)
-- Name: programmes; Type: TABLE; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

CREATE TABLE programmes (
    code_programme character varying(30) NOT NULL,
    nom_programme character varying(100),
    autorisations_1314 boolean,
    present_1314 boolean,
    serial_programme smallint,
    autorisations_1415 boolean,
    present_1415 boolean
);


ALTER TABLE frequentations_autorisations_cro.programmes OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17270)
-- Name: somme_autorisations_acces; Type: VIEW; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE VIEW somme_autorisations_acces AS
 SELECT zones_sites.the_geom,
    sub.site,
    sub.somme_jours_acces,
    sub.somme_nombre_acces
   FROM ( SELECT DISTINCT autorisations.site,
            (sum(autorisations.nbjours_autorises_1314))::smallint AS somme_jours_acces,
            (sum(autorisations.nbacces_autorises_1314))::smallint AS somme_nombre_acces
           FROM autorisations
          GROUP BY autorisations.site) sub,
    zones_sites
  WHERE (zones_sites.code_zone_site = sub.site);


ALTER TABLE frequentations_autorisations_cro.somme_autorisations_acces OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17274)
-- Name: sortie; Type: TABLE; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

CREATE TABLE sortie (
    code_sortie integer NOT NULL,
    nom_sortie character varying(100),
    date_debut date,
    date_fin date,
    date_saisie date,
    sortie_loisir_travail character(1),
    responsable character varying(50),
    district character varying(10),
    objet text
);


ALTER TABLE frequentations_autorisations_cro.sortie OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17280)
-- Name: sortie_code_sortie_seq; Type: SEQUENCE; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE SEQUENCE sortie_code_sortie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_cro.sortie_code_sortie_seq OWNER TO postgres;

--
-- TOC entry 4091 (class 0 OID 0)
-- Dependencies: 225
-- Name: sortie_code_sortie_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER SEQUENCE sortie_code_sortie_seq OWNED BY sortie.code_sortie;


--
-- TOC entry 226 (class 1259 OID 17282)
-- Name: stats_presence; Type: VIEW; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE VIEW stats_presence AS
 SELECT DISTINCT foo.zone_presence,
    sum(foo.nbjourshommes_presence) AS nbjourshommes_presence,
    foo.the_geom,
    foo.nom_zone_site,
    foo.nature
   FROM ( SELECT presence.zone_presence,
            zones_sites.the_geom,
            zones_sites.nom_zone_site,
            zones_sites.nature,
                CASE
                    WHEN (presence.date_debut = presence.date_fin) THEN 1
                    WHEN ((presence.date_debut >= '2015-02-01'::date) AND (presence.date_fin <= '2015-02-27'::date)) THEN (presence.date_fin - presence.date_debut)
                    WHEN ((presence.date_debut >= '2015-02-01'::date) AND (presence.date_fin >= '2015-02-27'::date)) THEN ('2015-02-27'::date - presence.date_debut)
                    WHEN ((presence.date_debut <= '2015-02-01'::date) AND (presence.date_fin <= '2015-02-27'::date)) THEN (presence.date_fin - '2015-02-01'::date)
                    WHEN ((presence.date_debut <= '2015-02-01'::date) AND (presence.date_fin >= '2015-02-27'::date)) THEN ('2015-02-27'::date - '2015-02-01'::date)
                    ELSE 999
                END AS nbjourshommes_presence
           FROM (presence
             JOIN zones_sites ON ((((zones_sites.code_zone_site = presence.zone_presence) AND "overlaps"((presence.date_debut)::timestamp with time zone, (presence.date_fin)::timestamp with time zone, ('2015-02-01'::date)::timestamp with time zone, ('2015-02-27'::date)::timestamp with time zone)) AND (presence.zone_presence <> 1))))) foo
  GROUP BY foo.zone_presence, foo.the_geom, foo.nom_zone_site, foo.nature;


ALTER TABLE frequentations_autorisations_cro.stats_presence OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17287)
-- Name: transit; Type: TABLE; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

CREATE TABLE transit (
    code_transit integer NOT NULL,
    code_equipier_sortie integer,
    date_transit date,
    moyen_deplacement character varying(20),
    site_depart integer,
    site_arrivee integer,
    numero_etape smallint
);


ALTER TABLE frequentations_autorisations_cro.transit OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17290)
-- Name: zones_transitees; Type: TABLE; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

CREATE TABLE zones_transitees (
    code_transit integer NOT NULL,
    zone_transitee integer NOT NULL
);


ALTER TABLE frequentations_autorisations_cro.zones_transitees OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17293)
-- Name: stats_transits; Type: VIEW; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE VIEW stats_transits AS
 SELECT DISTINCT zones_sites.nom_zone_site,
    zones_sites.the_geom,
    count(*) AS nb_transits
   FROM equipier_sortie,
    transit,
    zones_transitees,
    zones_sites
  WHERE (((((transit.date_transit >= '2015-02-01'::date) AND (transit.date_transit <= '2015-02-27'::date)) AND (zones_sites.code_zone_site = zones_transitees.zone_transitee)) AND (zones_transitees.code_transit = transit.code_transit)) AND (transit.code_equipier_sortie = equipier_sortie.code_equipier_sortie))
  GROUP BY zones_sites.nom_zone_site, zones_sites.the_geom;


ALTER TABLE frequentations_autorisations_cro.stats_transits OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 27437)
-- Name: stats_travail_loisir; Type: VIEW; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE VIEW stats_travail_loisir AS
 SELECT row_number() OVER (ORDER BY zones_sites.nom_zone_site) AS cle_primaire,
    zones_sites.nom_zone_site,
    sortie.sortie_loisir_travail,
    sum(presence.nbjours_presence) AS nb_jourshomme,
    count(DISTINCT sortie.code_sortie) AS nb_sorties,
    zones_sites.the_geom
   FROM presence,
    sortie,
    equipier_sortie,
    zones_sites
  WHERE ((((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND (equipier_sortie.code_sortie = sortie.code_sortie)) AND (zones_sites.code_zone_site = presence.zone_presence)) AND (presence.zone_presence <> 1))
  GROUP BY zones_sites.nom_zone_site, sortie.sortie_loisir_travail, zones_sites.the_geom
  ORDER BY zones_sites.nom_zone_site, sortie.sortie_loisir_travail, zones_sites.the_geom;


ALTER TABLE frequentations_autorisations_cro.stats_travail_loisir OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17297)
-- Name: suivi_acces_chaquetransit; Type: VIEW; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE VIEW suivi_acces_chaquetransit AS
 SELECT table1.zone_transitee,
    table1.nb_jours_transit,
    zones_sites.code_zone_site,
    zones_sites.nom_zone_site,
    zones_sites.district,
    zones_sites.nature,
    zones_sites.statut_protection,
    zones_sites.secteur,
    zones_sites.the_geom
   FROM ( SELECT DISTINCT zones_transitees.zone_transitee,
            count(zones_transitees.zone_transitee) AS nb_jours_transit
           FROM zones_transitees
          GROUP BY zones_transitees.zone_transitee) table1,
    zones_sites
  WHERE (table1.zone_transitee = zones_sites.code_zone_site);


ALTER TABLE frequentations_autorisations_cro.suivi_acces_chaquetransit OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17301)
-- Name: suivi_acces_nbjourshommepresence_programmes; Type: VIEW; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE VIEW suivi_acces_nbjourshommepresence_programmes AS
 SELECT DISTINCT table_base.programme,
    table_base.serial_programme,
    sum(table_base.nbjours_presence) AS total_nbjours_presence,
    sum(table_base.nb_acces) AS total_nb_acces
   FROM ( SELECT DISTINCT presence.date_debut,
            equipier_sortie.programme,
            programmes.serial_programme,
            sum(presence.nbjours_presence) AS nbjours_presence,
            1 AS nb_acces
           FROM presence,
            equipier_sortie,
            programmes
          WHERE (((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND ((programmes.code_programme)::text = (equipier_sortie.programme)::text)) AND (presence.zone_presence <> 1))
          GROUP BY presence.date_debut, equipier_sortie.programme, programmes.serial_programme) table_base
  GROUP BY table_base.programme, table_base.serial_programme;


ALTER TABLE frequentations_autorisations_cro.suivi_acces_nbjourshommepresence_programmes OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 27291)
-- Name: suivi_acces_sites_proteges; Type: VIEW; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE VIEW suivi_acces_sites_proteges AS
 SELECT row_number() OVER (ORDER BY autorisations.programme) AS row_number,
    table1.zone_presence,
    zones_sites.nom_zone_site,
    table1.programme,
    table1.total_nbjours_presence,
    table1.total_nb_acces,
    autorisations.nbjours_autorises_1415,
    autorisations.nbacces_autorises_1415,
    autorisations.nbparticipants_autorises_1415,
    zones_sites.the_geom
   FROM ( SELECT DISTINCT table_base.zone_presence,
            table_base.programme,
            sum(table_base.nbjours_presence) AS total_nbjours_presence,
            sum(table_base.nb_acces) AS total_nb_acces
           FROM ( SELECT DISTINCT presence.date_debut,
                    presence.zone_presence,
                    equipier_sortie.programme,
                    sum(presence.nbjours_presence) AS nbjours_presence,
                    1 AS nb_acces
                   FROM presence,
                    equipier_sortie
                  WHERE (((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND ((equipier_sortie.statut)::text = 'travail'::text)) AND (presence.date_debut > '2014-11-18'::date))
                  GROUP BY presence.date_debut, presence.zone_presence, equipier_sortie.programme) table_base
          GROUP BY table_base.zone_presence, table_base.programme) table1,
    autorisations,
    zones_sites
  WHERE (((((autorisations.programme)::text = (table1.programme)::text) AND (autorisations.site = table1.zone_presence)) AND (autorisations.site = zones_sites.code_zone_site)) AND (table1.zone_presence = zones_sites.code_zone_site));


ALTER TABLE frequentations_autorisations_cro.suivi_acces_sites_proteges OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17311)
-- Name: suivi_acces_tousprogrammes_toussites; Type: VIEW; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE VIEW suivi_acces_tousprogrammes_toussites AS
 SELECT DISTINCT table_base.zone_presence,
    table_base.programme,
    table_base.serial_programme,
    table_base.nom_zone_site,
    table_base.secteur,
    sum(table_base.nbjours_presence) AS total_nbjours_presence,
    sum(table_base.nb_acces) AS total_nb_acces
   FROM ( SELECT DISTINCT presence.date_debut,
            presence.zone_presence,
            zones_sites.nom_zone_site,
            zones_sites.secteur,
            equipier_sortie.programme,
            programmes.serial_programme,
            sum(presence.nbjours_presence) AS nbjours_presence,
            1 AS nb_acces
           FROM presence,
            equipier_sortie,
            zones_sites,
            programmes
          WHERE (((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND (presence.zone_presence = zones_sites.code_zone_site)) AND ((programmes.code_programme)::text = (equipier_sortie.programme)::text))
          GROUP BY presence.date_debut, presence.zone_presence, zones_sites.nom_zone_site, zones_sites.secteur, equipier_sortie.programme, programmes.serial_programme) table_base
  GROUP BY table_base.zone_presence, table_base.secteur, table_base.programme, table_base.serial_programme, table_base.nom_zone_site;


ALTER TABLE frequentations_autorisations_cro.suivi_acces_tousprogrammes_toussites OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17316)
-- Name: suivi_nbacces_chaquesite; Type: VIEW; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE VIEW suivi_nbacces_chaquesite AS
 SELECT table1.zone_presence,
    table1.nbacces_total,
    zones_sites.nom_zone_site,
    zones_sites.district,
    zones_sites.nature,
    zones_sites.statut_protection,
    zones_sites.secteur,
    zones_sites.the_geom
   FROM ( SELECT DISTINCT presence.zone_presence,
            count(DISTINCT presence.date_debut) AS nbacces_total
           FROM presence
          GROUP BY presence.zone_presence) table1,
    zones_sites
  WHERE ((table1.zone_presence = zones_sites.code_zone_site) AND (zones_sites.code_zone_site <> 1));


ALTER TABLE frequentations_autorisations_cro.suivi_nbacces_chaquesite OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17320)
-- Name: suivi_nbjourshomme_chaquesite; Type: VIEW; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE VIEW suivi_nbjourshomme_chaquesite AS
 SELECT table2.zone_presence,
    table2.nbjours_total_presence,
    zones_sites.nom_zone_site,
    zones_sites.district,
    zones_sites.nature,
    zones_sites.statut_protection,
    zones_sites.secteur,
    zones_sites.the_geom
   FROM ( SELECT DISTINCT table1.zone_presence,
            sum(table1.total_nbjours_presence) AS nbjours_total_presence
           FROM ( SELECT DISTINCT table_base.zone_presence,
                    table_base.programme,
                    sum(table_base.nbjours_presence) AS total_nbjours_presence
                   FROM ( SELECT DISTINCT presence.date_debut,
                            presence.zone_presence,
                            equipier_sortie.programme,
                            sum(presence.nbjours_presence) AS nbjours_presence
                           FROM presence,
                            equipier_sortie
                          WHERE (presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie)
                          GROUP BY presence.date_debut, presence.zone_presence, equipier_sortie.programme) table_base
                  GROUP BY table_base.zone_presence, table_base.programme) table1
          GROUP BY table1.zone_presence) table2,
    zones_sites
  WHERE ((table2.zone_presence = zones_sites.code_zone_site) AND (zones_sites.code_zone_site <> 1));


ALTER TABLE frequentations_autorisations_cro.suivi_nbjourshomme_chaquesite OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17325)
-- Name: transit_code_transit_seq; Type: SEQUENCE; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE SEQUENCE transit_code_transit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_cro.transit_code_transit_seq OWNER TO postgres;

--
-- TOC entry 4092 (class 0 OID 0)
-- Dependencies: 235
-- Name: transit_code_transit_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER SEQUENCE transit_code_transit_seq OWNED BY transit.code_transit;


SET search_path = frequentations_autorisations_ker, pg_catalog;

--
-- TOC entry 236 (class 1259 OID 17327)
-- Name: autorisations; Type: TABLE; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

CREATE TABLE autorisations (
    programme character varying(30) NOT NULL,
    district character varying(10),
    site smallint NOT NULL,
    nbjours_autorises_1314 smallint,
    nbacces_autorises_1314 smallint,
    nbparticipants_autorises_1314 smallint,
    nbjours_autorises_1415 smallint,
    nbacces_autorises_1415 smallint,
    nbparticipants_autorises_1415 smallint
);


ALTER TABLE frequentations_autorisations_ker.autorisations OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17330)
-- Name: debarquements_embarquements; Type: TABLE; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

CREATE TABLE debarquements_embarquements (
    pk_debarquements_embarquements integer NOT NULL,
    navire character varying(50),
    date_arrivee date,
    date_depart date,
    nb_pers_debarquant smallint,
    district character varying(5)
);


ALTER TABLE frequentations_autorisations_ker.debarquements_embarquements OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17333)
-- Name: debarquements_embarquements_pk_debarquements_embarquements_seq; Type: SEQUENCE; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE SEQUENCE debarquements_embarquements_pk_debarquements_embarquements_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_ker.debarquements_embarquements_pk_debarquements_embarquements_seq OWNER TO postgres;

--
-- TOC entry 4093 (class 0 OID 0)
-- Dependencies: 238
-- Name: debarquements_embarquements_pk_debarquements_embarquements_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER SEQUENCE debarquements_embarquements_pk_debarquements_embarquements_seq OWNED BY debarquements_embarquements.pk_debarquements_embarquements;


--
-- TOC entry 239 (class 1259 OID 17335)
-- Name: enregistrement_modifications_sorties; Type: TABLE; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

CREATE TABLE enregistrement_modifications_sorties (
    code_sortie integer,
    date_modification timestamp without time zone
);


ALTER TABLE frequentations_autorisations_ker.enregistrement_modifications_sorties OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17338)
-- Name: equipier_sortie; Type: TABLE; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

CREATE TABLE equipier_sortie (
    code_equipier_sortie integer NOT NULL,
    code_sortie integer,
    equipier character varying(50),
    statut character varying(20),
    programme character varying(30),
    sortie_terminee boolean
);


ALTER TABLE frequentations_autorisations_ker.equipier_sortie OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 17341)
-- Name: equipier_sortie_code_equipier_sortie_seq; Type: SEQUENCE; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE SEQUENCE equipier_sortie_code_equipier_sortie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_ker.equipier_sortie_code_equipier_sortie_seq OWNER TO postgres;

--
-- TOC entry 4094 (class 0 OID 0)
-- Dependencies: 241
-- Name: equipier_sortie_code_equipier_sortie_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER SEQUENCE equipier_sortie_code_equipier_sortie_seq OWNED BY equipier_sortie.code_equipier_sortie;


--
-- TOC entry 242 (class 1259 OID 17343)
-- Name: equipiers; Type: TABLE; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

CREATE TABLE equipiers (
    code_equipier character varying(50) NOT NULL,
    nom character varying(30),
    prenom character varying(30),
    numero integer NOT NULL,
    district character varying(50),
    organisme character varying(50),
    fonction_programme character varying(50),
    date_arrivee date,
    date_depart date,
    navire_arrivee character varying(50),
    navire_depart character varying(50),
    nbjours_presence_sur_district smallint
);


ALTER TABLE frequentations_autorisations_ker.equipiers OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17346)
-- Name: equipiers_numero_seq; Type: SEQUENCE; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE SEQUENCE equipiers_numero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_ker.equipiers_numero_seq OWNER TO postgres;

--
-- TOC entry 4095 (class 0 OID 0)
-- Dependencies: 243
-- Name: equipiers_numero_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER SEQUENCE equipiers_numero_seq OWNED BY equipiers.numero;


--
-- TOC entry 244 (class 1259 OID 17348)
-- Name: nb_sorties_par_programme; Type: VIEW; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE VIEW nb_sorties_par_programme AS
 SELECT foo.programme,
    count(foo.programme) AS nb_sortie
   FROM ( SELECT DISTINCT equipier_sortie.programme,
            equipier_sortie.code_sortie
           FROM equipier_sortie
          GROUP BY equipier_sortie.programme, equipier_sortie.code_sortie) foo
  GROUP BY foo.programme;


ALTER TABLE frequentations_autorisations_ker.nb_sorties_par_programme OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17352)
-- Name: presence; Type: TABLE; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

CREATE TABLE presence (
    code_presence integer NOT NULL,
    code_equipier_sortie integer,
    zone_presence integer,
    date_debut date,
    date_fin date,
    nbjours_presence smallint,
    numero_etape smallint
);


ALTER TABLE frequentations_autorisations_ker.presence OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 17360)
-- Name: zones_sites; Type: TABLE; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

CREATE TABLE zones_sites (
    code_zone_site smallint NOT NULL,
    nom_zone_site character varying(100),
    district character varying(10),
    nature character varying(80),
    statut_protection character varying(40),
    secteur character varying(40),
    the_geom public.geometry(MultiPolygon,32742)
);


ALTER TABLE frequentations_autorisations_ker.zones_sites OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 27318)
-- Name: nbjours_presence_par_programme; Type: VIEW; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE VIEW nbjours_presence_par_programme AS
 SELECT table1.programme,
    table1.zone_presence,
    count(*) AS jours_presence
   FROM ( SELECT DISTINCT (generate_series((presence.date_debut)::timestamp with time zone, (presence.date_fin)::timestamp with time zone, '1 day'::interval))::date AS jours_presence,
            equipier_sortie.programme,
            presence.zone_presence
           FROM presence,
            equipier_sortie,
            zones_sites,
            autorisations
          WHERE ((((((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND (presence.zone_presence <> 1)) AND (presence.date_debut > '2014-11-18'::date)) AND (presence.zone_presence = zones_sites.code_zone_site)) AND ((zones_sites.nature)::text = 'Zones protegees'::text)) AND ((autorisations.programme)::text = (equipier_sortie.programme)::text))) table1
  GROUP BY table1.programme, table1.zone_presence;


ALTER TABLE frequentations_autorisations_ker.nbjours_presence_par_programme OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17355)
-- Name: presence_code_presence_seq; Type: SEQUENCE; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE SEQUENCE presence_code_presence_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_ker.presence_code_presence_seq OWNER TO postgres;

--
-- TOC entry 4096 (class 0 OID 0)
-- Dependencies: 246
-- Name: presence_code_presence_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER SEQUENCE presence_code_presence_seq OWNED BY presence.code_presence;


--
-- TOC entry 247 (class 1259 OID 17357)
-- Name: programmes; Type: TABLE; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

CREATE TABLE programmes (
    code_programme character varying(30) NOT NULL,
    nom_programme character varying(100),
    autorisations_1314 boolean,
    present_1314 boolean,
    serial_programme smallint,
    autorisations_1415 boolean,
    present_1415 boolean
);


ALTER TABLE frequentations_autorisations_ker.programmes OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 17366)
-- Name: somme_autorisations_acces; Type: VIEW; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE VIEW somme_autorisations_acces AS
 SELECT zones_sites.the_geom,
    sub.site,
    sub.somme_jours_acces,
    sub.somme_nombre_acces
   FROM ( SELECT DISTINCT autorisations.site,
            (sum(autorisations.nbjours_autorises_1314))::smallint AS somme_jours_acces,
            (sum(autorisations.nbacces_autorises_1314))::smallint AS somme_nombre_acces
           FROM autorisations
          GROUP BY autorisations.site) sub,
    zones_sites
  WHERE (zones_sites.code_zone_site = sub.site);


ALTER TABLE frequentations_autorisations_ker.somme_autorisations_acces OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 17370)
-- Name: sortie; Type: TABLE; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

CREATE TABLE sortie (
    code_sortie integer NOT NULL,
    nom_sortie character varying(100),
    date_debut date,
    date_fin date,
    date_saisie date,
    sortie_loisir_travail character(1),
    responsable character varying(50),
    district character varying(10),
    objet text
);


ALTER TABLE frequentations_autorisations_ker.sortie OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 17376)
-- Name: sortie_code_sortie_seq; Type: SEQUENCE; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE SEQUENCE sortie_code_sortie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_ker.sortie_code_sortie_seq OWNER TO postgres;

--
-- TOC entry 4097 (class 0 OID 0)
-- Dependencies: 251
-- Name: sortie_code_sortie_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER SEQUENCE sortie_code_sortie_seq OWNED BY sortie.code_sortie;


--
-- TOC entry 252 (class 1259 OID 17378)
-- Name: stats_presence; Type: VIEW; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE VIEW stats_presence AS
 SELECT DISTINCT foo.zone_presence,
    sum(foo.nbjourshommes_presence) AS nbjourshommes_presence,
    foo.the_geom,
    foo.nom_zone_site,
    foo.nature
   FROM ( SELECT presence.zone_presence,
            zones_sites.the_geom,
            zones_sites.nom_zone_site,
            zones_sites.nature,
                CASE
                    WHEN (presence.date_debut = presence.date_fin) THEN 1
                    WHEN ((presence.date_debut >= '2015-02-01'::date) AND (presence.date_fin <= '2015-03-01'::date)) THEN (presence.date_fin - presence.date_debut)
                    WHEN ((presence.date_debut >= '2015-02-01'::date) AND (presence.date_fin >= '2015-03-01'::date)) THEN ('2015-03-01'::date - presence.date_debut)
                    WHEN ((presence.date_debut <= '2015-02-01'::date) AND (presence.date_fin <= '2015-03-01'::date)) THEN (presence.date_fin - '2015-02-01'::date)
                    WHEN ((presence.date_debut <= '2015-02-01'::date) AND (presence.date_fin >= '2015-03-01'::date)) THEN ('2015-03-01'::date - '2015-02-01'::date)
                    ELSE 999
                END AS nbjourshommes_presence
           FROM (presence
             JOIN zones_sites ON ((((zones_sites.code_zone_site = presence.zone_presence) AND "overlaps"((presence.date_debut)::timestamp with time zone, (presence.date_fin)::timestamp with time zone, ('2015-02-01'::date)::timestamp with time zone, ('2015-03-01'::date)::timestamp with time zone)) AND (presence.zone_presence <> 1))))) foo
  GROUP BY foo.zone_presence, foo.the_geom, foo.nom_zone_site, foo.nature;


ALTER TABLE frequentations_autorisations_ker.stats_presence OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 17383)
-- Name: transit; Type: TABLE; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

CREATE TABLE transit (
    code_transit integer NOT NULL,
    code_equipier_sortie integer,
    date_transit date,
    moyen_deplacement character varying(20),
    site_depart integer,
    site_arrivee integer,
    numero_etape smallint
);


ALTER TABLE frequentations_autorisations_ker.transit OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 17386)
-- Name: zones_transitees; Type: TABLE; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

CREATE TABLE zones_transitees (
    code_transit integer NOT NULL,
    zone_transitee integer NOT NULL
);


ALTER TABLE frequentations_autorisations_ker.zones_transitees OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 17389)
-- Name: stats_transits; Type: VIEW; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE VIEW stats_transits AS
 SELECT DISTINCT zones_sites.nom_zone_site,
    zones_sites.the_geom,
    count(*) AS nb_transits
   FROM equipier_sortie,
    transit,
    zones_transitees,
    zones_sites
  WHERE (((((transit.date_transit >= '2015-02-01'::date) AND (transit.date_transit <= '2015-03-01'::date)) AND (zones_sites.code_zone_site = zones_transitees.zone_transitee)) AND (zones_transitees.code_transit = transit.code_transit)) AND (transit.code_equipier_sortie = equipier_sortie.code_equipier_sortie))
  GROUP BY zones_sites.nom_zone_site, zones_sites.the_geom;


ALTER TABLE frequentations_autorisations_ker.stats_transits OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 27432)
-- Name: stats_travail_loisir; Type: VIEW; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE VIEW stats_travail_loisir AS
 SELECT row_number() OVER (ORDER BY zones_sites.nom_zone_site) AS cle_primaire,
    zones_sites.nom_zone_site,
    sortie.sortie_loisir_travail,
    sum(presence.nbjours_presence) AS nb_jourshomme,
    count(DISTINCT sortie.code_sortie) AS nb_sorties,
    zones_sites.the_geom
   FROM presence,
    sortie,
    equipier_sortie,
    zones_sites
  WHERE ((((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND (equipier_sortie.code_sortie = sortie.code_sortie)) AND (zones_sites.code_zone_site = presence.zone_presence)) AND (presence.zone_presence <> 1))
  GROUP BY zones_sites.nom_zone_site, sortie.sortie_loisir_travail, zones_sites.the_geom
  ORDER BY zones_sites.nom_zone_site, sortie.sortie_loisir_travail, zones_sites.the_geom;


ALTER TABLE frequentations_autorisations_ker.stats_travail_loisir OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 17393)
-- Name: suivi_acces_chaquetransit; Type: VIEW; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE VIEW suivi_acces_chaquetransit AS
 SELECT table1.zone_transitee,
    table1.nb_jours_transit,
    zones_sites.code_zone_site,
    zones_sites.nom_zone_site,
    zones_sites.district,
    zones_sites.nature,
    zones_sites.statut_protection,
    zones_sites.secteur,
    zones_sites.the_geom
   FROM ( SELECT DISTINCT zones_transitees.zone_transitee,
            count(zones_transitees.zone_transitee) AS nb_jours_transit
           FROM zones_transitees
          GROUP BY zones_transitees.zone_transitee) table1,
    zones_sites
  WHERE (table1.zone_transitee = zones_sites.code_zone_site);


ALTER TABLE frequentations_autorisations_ker.suivi_acces_chaquetransit OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 17397)
-- Name: suivi_acces_nbjourshommepresence_programmes; Type: VIEW; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE VIEW suivi_acces_nbjourshommepresence_programmes AS
 SELECT DISTINCT table_base.programme,
    table_base.serial_programme,
    sum(table_base.nbjours_presence) AS total_nbjours_presence,
    sum(table_base.nb_acces) AS total_nb_acces
   FROM ( SELECT DISTINCT presence.date_debut,
            equipier_sortie.programme,
            programmes.serial_programme,
            sum(presence.nbjours_presence) AS nbjours_presence,
            1 AS nb_acces
           FROM presence,
            equipier_sortie,
            programmes
          WHERE (((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND ((programmes.code_programme)::text = (equipier_sortie.programme)::text)) AND (presence.zone_presence <> 1))
          GROUP BY presence.date_debut, equipier_sortie.programme, programmes.serial_programme) table_base
  GROUP BY table_base.programme, table_base.serial_programme;


ALTER TABLE frequentations_autorisations_ker.suivi_acces_nbjourshommepresence_programmes OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 27296)
-- Name: suivi_acces_sites_proteges; Type: VIEW; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE VIEW suivi_acces_sites_proteges AS
 SELECT row_number() OVER (ORDER BY autorisations.programme) AS row_number,
    table1.zone_presence,
    zones_sites.nom_zone_site,
    table1.programme,
    table1.total_nbjours_presence,
    table1.total_nb_acces,
    autorisations.nbjours_autorises_1415,
    autorisations.nbacces_autorises_1415,
    autorisations.nbparticipants_autorises_1415,
    zones_sites.the_geom
   FROM ( SELECT DISTINCT table_base.zone_presence,
            table_base.programme,
            sum(table_base.nbjours_presence) AS total_nbjours_presence,
            sum(table_base.nb_acces) AS total_nb_acces
           FROM ( SELECT DISTINCT presence.date_debut,
                    presence.zone_presence,
                    equipier_sortie.programme,
                    sum(presence.nbjours_presence) AS nbjours_presence,
                    1 AS nb_acces
                   FROM presence,
                    equipier_sortie
                  WHERE (((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND ((equipier_sortie.statut)::text = 'travail'::text)) AND (presence.date_debut > '2014-11-18'::date))
                  GROUP BY presence.date_debut, presence.zone_presence, equipier_sortie.programme) table_base
          GROUP BY table_base.zone_presence, table_base.programme) table1,
    autorisations,
    zones_sites
  WHERE (((((autorisations.programme)::text = (table1.programme)::text) AND (autorisations.site = table1.zone_presence)) AND (autorisations.site = zones_sites.code_zone_site)) AND (table1.zone_presence = zones_sites.code_zone_site));


ALTER TABLE frequentations_autorisations_ker.suivi_acces_sites_proteges OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 28722)
-- Name: suivi_acces_tousprogrammes_toussites; Type: VIEW; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE VIEW suivi_acces_tousprogrammes_toussites AS
 SELECT DISTINCT table_base.zone_presence,
    table_base.programme,
    table_base.serial_programme,
    table_base.nom_zone_site,
    table_base.secteur,
    sum(table_base.nbjours_presence) AS total_nbjours_presence,
    sum(table_base.nb_acces) AS total_nb_acces
   FROM ( SELECT DISTINCT presence.date_debut,
            presence.zone_presence,
            zones_sites.nom_zone_site,
            zones_sites.secteur,
            equipier_sortie.programme,
            programmes.serial_programme,
            sum(presence.nbjours_presence) AS nbjours_presence,
            1 AS nb_acces
           FROM presence,
            equipier_sortie,
            zones_sites,
            programmes
          WHERE (((presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie) AND (presence.zone_presence = zones_sites.code_zone_site)) AND ((programmes.code_programme)::text = (equipier_sortie.programme)::text))
          GROUP BY presence.date_debut, presence.zone_presence, zones_sites.nom_zone_site, zones_sites.secteur, equipier_sortie.programme, programmes.serial_programme) table_base
  GROUP BY table_base.zone_presence, table_base.secteur, table_base.programme, table_base.serial_programme, table_base.nom_zone_site;


ALTER TABLE frequentations_autorisations_ker.suivi_acces_tousprogrammes_toussites OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 17412)
-- Name: suivi_nbacces_chaquesite; Type: VIEW; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE VIEW suivi_nbacces_chaquesite AS
 SELECT table1.zone_presence,
    table1.nbacces_total,
    zones_sites.nom_zone_site,
    zones_sites.district,
    zones_sites.nature,
    zones_sites.statut_protection,
    zones_sites.secteur,
    zones_sites.the_geom
   FROM ( SELECT DISTINCT presence.zone_presence,
            count(DISTINCT presence.date_debut) AS nbacces_total
           FROM presence
          GROUP BY presence.zone_presence) table1,
    zones_sites
  WHERE ((table1.zone_presence = zones_sites.code_zone_site) AND (zones_sites.code_zone_site <> 1));


ALTER TABLE frequentations_autorisations_ker.suivi_nbacces_chaquesite OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 17416)
-- Name: suivi_nbjourshomme_chaquesite; Type: VIEW; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE VIEW suivi_nbjourshomme_chaquesite AS
 SELECT table2.zone_presence,
    table2.nbjours_total_presence,
    zones_sites.nom_zone_site,
    zones_sites.district,
    zones_sites.nature,
    zones_sites.statut_protection,
    zones_sites.secteur,
    zones_sites.the_geom
   FROM ( SELECT DISTINCT table1.zone_presence,
            sum(table1.total_nbjours_presence) AS nbjours_total_presence
           FROM ( SELECT DISTINCT table_base.zone_presence,
                    table_base.programme,
                    sum(table_base.nbjours_presence) AS total_nbjours_presence
                   FROM ( SELECT DISTINCT presence.date_debut,
                            presence.zone_presence,
                            equipier_sortie.programme,
                            sum(presence.nbjours_presence) AS nbjours_presence
                           FROM presence,
                            equipier_sortie
                          WHERE (presence.code_equipier_sortie = equipier_sortie.code_equipier_sortie)
                          GROUP BY presence.date_debut, presence.zone_presence, equipier_sortie.programme) table_base
                  GROUP BY table_base.zone_presence, table_base.programme) table1
          GROUP BY table1.zone_presence) table2,
    zones_sites
  WHERE ((table2.zone_presence = zones_sites.code_zone_site) AND (zones_sites.code_zone_site <> 1));


ALTER TABLE frequentations_autorisations_ker.suivi_nbjourshomme_chaquesite OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 17421)
-- Name: transit_code_transit_seq; Type: SEQUENCE; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE SEQUENCE transit_code_transit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frequentations_autorisations_ker.transit_code_transit_seq OWNER TO postgres;

--
-- TOC entry 4098 (class 0 OID 0)
-- Dependencies: 260
-- Name: transit_code_transit_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER SEQUENCE transit_code_transit_seq OWNED BY transit.code_transit;


SET search_path = ornithologie, pg_catalog;

--
-- TOC entry 294 (class 1259 OID 28774)
-- Name: cmtg_indiff_classe; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE cmtg_indiff_classe (
    fk_code_metadonnees_comptage_classe character varying(22) NOT NULL,
    classe character varying(15)
);


ALTER TABLE ornithologie.cmtg_indiff_classe OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 28777)
-- Name: cmtg_indiff_metadonnees; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE cmtg_indiff_metadonnees (
    pk_cmtg_indiff_metadonnees character varying(22) NOT NULL,
    numero_comptage bigint NOT NULL,
    date_correction date,
    fk_code_leve_gps character varying(18),
    fk_code_manipe character varying(12),
    fk_espece_vernaculaire character varying(100),
    type_comptage character varying(15),
    lieu_comptage character(1),
    comptage_jumelle boolean,
    comportements character varying(100),
    contacts_avec_espece character varying(100),
    statut_nidification character varying(100),
    precision_coordonnees integer,
    remarques text,
    contacts_avec_espece_2 character varying(100),
    CONSTRAINT lieu_comptage_constraint CHECK (((lieu_comptage = 'T'::bpchar) OR (lieu_comptage = 'B'::bpchar)))
);


ALTER TABLE ornithologie.cmtg_indiff_metadonnees OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 28785)
-- Name: cmtg_indiff_minmax; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE cmtg_indiff_minmax (
    pk_cmtg_indiff_minmax character varying(25) NOT NULL,
    numero_comptage_minmax integer NOT NULL,
    fk_code_metadonnees_comptage character varying(22),
    type_effectif character varying(40),
    minimum smallint,
    maximum smallint
);


ALTER TABLE ornithologie.cmtg_indiff_minmax OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 28788)
-- Name: cmtg_indiff_minmax_numero_comptage_minmax_seq; Type: SEQUENCE; Schema: ornithologie; Owner: postgres
--

CREATE SEQUENCE cmtg_indiff_minmax_numero_comptage_minmax_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ornithologie.cmtg_indiff_minmax_numero_comptage_minmax_seq OWNER TO postgres;

--
-- TOC entry 4102 (class 0 OID 0)
-- Dependencies: 297
-- Name: cmtg_indiff_minmax_numero_comptage_minmax_seq; Type: SEQUENCE OWNED BY; Schema: ornithologie; Owner: postgres
--

ALTER SEQUENCE cmtg_indiff_minmax_numero_comptage_minmax_seq OWNED BY cmtg_indiff_minmax.numero_comptage_minmax;


--
-- TOC entry 298 (class 1259 OID 28790)
-- Name: cmtg_indiff_nids_oeufs_poussins; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE cmtg_indiff_nids_oeufs_poussins (
    pk_cmtg_indiff_nids_oeufs_poussins character varying(25) NOT NULL,
    numero_comptage_nids_oeufs_poussins integer NOT NULL,
    fk_code_metadonnees_comptage character varying(22),
    numero_nid smallint,
    nb_oeufs smallint,
    nb_poussins smallint
);


ALTER TABLE ornithologie.cmtg_indiff_nids_oeufs_poussins OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 28793)
-- Name: cmtg_indiff_nids_oeufs_poussi_numero_comptage_nids_oeufs_po_seq; Type: SEQUENCE; Schema: ornithologie; Owner: postgres
--

CREATE SEQUENCE cmtg_indiff_nids_oeufs_poussi_numero_comptage_nids_oeufs_po_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ornithologie.cmtg_indiff_nids_oeufs_poussi_numero_comptage_nids_oeufs_po_seq OWNER TO postgres;

--
-- TOC entry 4104 (class 0 OID 0)
-- Dependencies: 299
-- Name: cmtg_indiff_nids_oeufs_poussi_numero_comptage_nids_oeufs_po_seq; Type: SEQUENCE OWNED BY; Schema: ornithologie; Owner: postgres
--

ALTER SEQUENCE cmtg_indiff_nids_oeufs_poussi_numero_comptage_nids_oeufs_po_seq OWNED BY cmtg_indiff_nids_oeufs_poussins.numero_comptage_nids_oeufs_poussins;


--
-- TOC entry 300 (class 1259 OID 28795)
-- Name: cmtg_indiff_precis; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE cmtg_indiff_precis (
    pk_cmtg_indiff_precis character varying(25) NOT NULL,
    numero_comptage_precis integer NOT NULL,
    fk_code_metadonnees_comptage character varying(22),
    type_effectif character varying(40),
    comptage_1 smallint,
    comptage_2 smallint,
    comptage_3 smallint,
    comptage_4 smallint,
    moyenne_comptages numeric
);


ALTER TABLE ornithologie.cmtg_indiff_precis OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 28801)
-- Name: cmtg_indiff_precis_numero_comptage_precis_seq; Type: SEQUENCE; Schema: ornithologie; Owner: postgres
--

CREATE SEQUENCE cmtg_indiff_precis_numero_comptage_precis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ornithologie.cmtg_indiff_precis_numero_comptage_precis_seq OWNER TO postgres;

--
-- TOC entry 4106 (class 0 OID 0)
-- Dependencies: 301
-- Name: cmtg_indiff_precis_numero_comptage_precis_seq; Type: SEQUENCE OWNED BY; Schema: ornithologie; Owner: postgres
--

ALTER SEQUENCE cmtg_indiff_precis_numero_comptage_precis_seq OWNED BY cmtg_indiff_precis.numero_comptage_precis;


--
-- TOC entry 302 (class 1259 OID 28803)
-- Name: cmtg_indiff_territoire; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE cmtg_indiff_territoire (
    fk_code_metadonnees_comptage_territoire character varying(100) NOT NULL,
    nb_territoires smallint
);


ALTER TABLE ornithologie.cmtg_indiff_territoire OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 28806)
-- Name: cmtg_mam_marins; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE cmtg_mam_marins (
    pk_cmtg_mam_marins character varying(50) NOT NULL,
    fk_cmtg_mam_marins_metadonnees character varying(100),
    date_correction date,
    type_effectif character varying(20),
    comptage_1 smallint,
    comptage_2 smallint,
    comptage_3 smallint,
    comptage_4 smallint,
    moyenne_comptages numeric
);


ALTER TABLE ornithologie.cmtg_mam_marins OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 28812)
-- Name: cmtg_mam_marins_metadonnees; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE cmtg_mam_marins_metadonnees (
    pk_cmtg_mam_marins_metadonnees character varying(25) NOT NULL,
    numero_comptage integer NOT NULL,
    fk_code_manipe character varying(25),
    fk_espece_vernaculaire character varying(100),
    lat_depart real,
    long_depart real,
    lat_fin real,
    long_fin real,
    position_pt_depart public.geometry(Point,32742),
    position_pt_fin public.geometry(Point,32742),
    mode_trace_enregistre boolean,
    the_geom public.geometry(LineString,32742),
    remarques text
);


ALTER TABLE ornithologie.cmtg_mam_marins_metadonnees OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 28818)
-- Name: cmtg_oiseaux_marins; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE cmtg_oiseaux_marins (
    pk_cmtg_oiseaux_marins character varying(100) NOT NULL,
    fk_cmtg_oiseaux_marins_colonies_metadonnees character varying(100),
    numero_passage smallint,
    saison character(9),
    fk_code_manipe character varying(12),
    date_correction date,
    type_effectif character varying(40),
    comptage_1_envol smallint,
    comptage_2_envol smallint,
    comptage_3_envol smallint,
    comptage_4_envol smallint,
    moyenne_comptages_envol numeric,
    comptage_a_distance boolean,
    comptage_1_adistance smallint,
    comptage_2_adistance smallint,
    comptage_3_adistance smallint,
    comptage_4_adistance smallint,
    moyenne_comptages_adistance numeric,
    remarques text,
    comptage_en_vol boolean,
    rien_vu_lors_du_passage boolean
);


ALTER TABLE ornithologie.cmtg_oiseaux_marins OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 28824)
-- Name: cmtg_oiseaux_marins_colonies_metadonnees; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE cmtg_oiseaux_marins_colonies_metadonnees (
    pk_cmtg_oiseaux_marins_colonies_metadonnees character varying(100) NOT NULL,
    numero_colonie smallint,
    fk_espece_vernaculaire character varying(100),
    date_leve date,
    district character varying(10),
    fk_zone_geo smallint,
    site character varying(100),
    ile character varying(80),
    id_pt_gps character varying(30),
    latitude real,
    longitude real,
    the_geom public.geometry(Point,32742),
    saison character(9)
);


ALTER TABLE ornithologie.cmtg_oiseaux_marins_colonies_metadonnees OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 28830)
-- Name: demos_bilan_repro; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE demos_bilan_repro (
    pk_demos_bilan_repro character varying(30) NOT NULL,
    fk_piquet character varying(30),
    saison character(9),
    bilan_reproducteur character varying(20)
);


ALTER TABLE ornithologie.demos_bilan_repro OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 28833)
-- Name: demos_comptage; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE demos_comptage (
    pk_demos_comptage character varying(100) NOT NULL,
    numero_comptage integer NOT NULL,
    fk_piquet character varying(30),
    fk_code_manipe character varying(12),
    date_correction date,
    saison character(9),
    numero_passage smallint,
    reponse_a_la_repasse character varying(15),
    presence_dans_terrier character varying(50),
    remarques text
);


ALTER TABLE ornithologie.demos_comptage OWNER TO postgres;

--
-- TOC entry 309 (class 1259 OID 28839)
-- Name: demos_indices_occup; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE demos_indices_occup (
    pk_demos_indices_occup character varying(50) NOT NULL,
    fk_piquet character varying(30),
    date_passage date,
    fk_demos_comptage character varying(100),
    indices_occupation_1 character varying(100),
    indices_occupation_2 character varying(100),
    indices_occupation_3 character varying(100)
);


ALTER TABLE ornithologie.demos_indices_occup OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 28842)
-- Name: demos_terriers_metadonnees; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE demos_terriers_metadonnees (
    pk_demos_terriers_metadonnees character varying(30) NOT NULL,
    numero_piquet smallint,
    ile character varying(80),
    latitude real,
    longitude real,
    the_geom public.geometry(Point,32742),
    date_installation_piquet date,
    fk_espece_vernaculaire character varying(100)
);


ALTER TABLE ornithologie.demos_terriers_metadonnees OWNER TO postgres;

--
-- TOC entry 311 (class 1259 OID 28848)
-- Name: pc_permanent; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE pc_permanent (
    pk_pc_permanent character varying(100) NOT NULL,
    fk_code_piquet character varying(100),
    numero_terrier smallint,
    fk_code_manipe character varying(100),
    date_correction date,
    signe_occupation_1 character varying(100),
    signe_occupation_2 character varying(100),
    signe_occupation_3 character varying(100),
    reponse_a_la_repasse character varying(15),
    verif_occupation_terrier character varying(100),
    fk_espece_vernaculaire character varying(100),
    verif_si_oeuf character varying(100),
    remarques text
);


ALTER TABLE ornithologie.pc_permanent OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 28854)
-- Name: pc_permanent_changement_vegetation; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE pc_permanent_changement_vegetation (
    pk_pc_permanent_changement_vegetation character varying(100) NOT NULL,
    fk_numero_piquet character varying(100),
    date_mise_a_jour_vegetation date,
    vegetation character varying(200),
    maj_remarques_piquet text
);


ALTER TABLE ornithologie.pc_permanent_changement_vegetation OWNER TO postgres;

--
-- TOC entry 313 (class 1259 OID 28860)
-- Name: pc_permanent_metadonnees; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE pc_permanent_metadonnees (
    pk_pc_permanent_metadonnees character varying(100) NOT NULL,
    numero_piquet smallint,
    site character varying(100),
    ile character varying(80),
    district character varying(10),
    fk_zone_geo smallint,
    date_premier_leve date,
    date_dernier_passage date,
    latitude real,
    longitude real,
    the_geom public.geometry(Point,32742),
    pente character varying(15),
    orientation character varying(10),
    remarques text
);


ALTER TABLE ornithologie.pc_permanent_metadonnees OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 28866)
-- Name: pc_surtransect; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE pc_surtransect (
    pk_pc_surtransect character varying(25) NOT NULL,
    fk_code_leve_gps character varying(18),
    fk_code_manipe character varying(12),
    fk_espece_vernaculaire character varying(100),
    date_correction date,
    numero_transect character varying(100),
    distance_au_pt_precedent smallint,
    numero_terrier smallint,
    signe_occupation_1 character varying(100),
    signe_occupation_2 character varying(100),
    signe_occupation_3 character varying(100),
    reponse_a_la_repasse character varying(15),
    verif_occupation_terrier character varying(100),
    verif_si_oeuf character varying(100),
    vegetation character varying(200),
    pente character varying(15),
    orientation character varying(10),
    remarques text,
    absence_obs boolean
);


ALTER TABLE ornithologie.pc_surtransect OWNER TO postgres;

--
-- TOC entry 361 (class 1259 OID 30448)
-- Name: reprise_bague; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE reprise_bague (
    pk_reprise_bague character varying(25) NOT NULL,
    num_cmtg smallint,
    fk_code_manipe character varying(12),
    fk_code_leve_gps character varying(18),
    fk_espece_vernaculaire character varying(100),
    date_correction date,
    statut character varying(20),
    num_bague_metal character varying(20),
    num_bague_darvic character varying(20),
    pays_origine character varying(20),
    remarques text
);


ALTER TABLE ornithologie.reprise_bague OWNER TO postgres;

--
-- TOC entry 315 (class 1259 OID 28872)
-- Name: srep_colonies_coordonnees; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE srep_colonies_coordonnees (
    pk_srep_colonies_coordonnees character varying(100) NOT NULL,
    fk_srep_colonies_metadonnees character varying(50),
    date_leve date,
    latitude real,
    longitude real,
    the_geom public.geometry(Point,32742)
);


ALTER TABLE ornithologie.srep_colonies_coordonnees OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 28878)
-- Name: srep_colonies_metadonnees; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE srep_colonies_metadonnees (
    pk_srep_colonies_metadonnees character varying(50) NOT NULL,
    numero_colonie smallint,
    fk_espece_vernaculaire character varying(100),
    date_premier_leve date,
    district character varying(10),
    fk_zone_geo smallint,
    site character varying(100),
    ile character varying(80),
    date_dernier_leve date,
    latitude real,
    longitude real,
    the_geom public.geometry(Point,32742)
);


ALTER TABLE ornithologie.srep_colonies_metadonnees OWNER TO postgres;

--
-- TOC entry 317 (class 1259 OID 28884)
-- Name: srep_comptage; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE srep_comptage (
    pk_srep_comptage character varying(100) NOT NULL,
    fk_code_manipe character varying(12),
    date_correction date,
    saison character(9),
    fk_srep_colonies_metadonnees character varying(50),
    numero_passage smallint,
    type_effectif character varying(100),
    comptage_1 smallint,
    comptage_2 smallint,
    comptage_3 smallint,
    comptage_4 smallint,
    moyenne_comptages numeric,
    remarques text
);


ALTER TABLE ornithologie.srep_comptage OWNER TO postgres;

--
-- TOC entry 318 (class 1259 OID 28890)
-- Name: tb_espece; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_espece (
    pk_tb_espece character varying(100) NOT NULL,
    nom_latin character varying(100),
    groupe character varying(100),
    cmtg_indiff boolean,
    trsc_especes_epigees boolean,
    trsc_especes_hypogees boolean,
    pc boolean,
    cmtg_mam_marins boolean,
    cmtg_grandalbatros boolean,
    srep boolean,
    demos boolean,
    cmtg_oiseaux_marins boolean
);


ALTER TABLE ornithologie.tb_espece OWNER TO postgres;

--
-- TOC entry 319 (class 1259 OID 28893)
-- Name: tb_leve_gps_metadonnees; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_leve_gps_metadonnees (
    pk_tb_leve_gps_metadonnees character varying(20) NOT NULL,
    num_leve_gps bigint,
    fk_code_manipe character varying(12),
    protocole character varying(40),
    heure_leve time without time zone,
    numero_gps character varying(20),
    id_pt_gps character varying(50),
    latitude real,
    longitude real,
    the_geom public.geometry(Point,32742),
    origine_coordonnees character varying(100),
    remarques text
);


ALTER TABLE ornithologie.tb_leve_gps_metadonnees OWNER TO postgres;

--
-- TOC entry 322 (class 1259 OID 28909)
-- Name: tb_observateur; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_observateur (
    pk_tb_observateur character varying(20) NOT NULL,
    nom character varying(20),
    prenom character varying(20)
);


ALTER TABLE ornithologie.tb_observateur OWNER TO postgres;

--
-- TOC entry 323 (class 1259 OID 28912)
-- Name: tb_observateurs_leves_gps; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_observateurs_leves_gps (
    pk_tb_observateurs_leves_gps character varying(50) NOT NULL,
    numero_observateur integer NOT NULL,
    fk_observateur character varying(20),
    fk_code_leve_gps character varying(18)
);


ALTER TABLE ornithologie.tb_observateurs_leves_gps OWNER TO postgres;

--
-- TOC entry 324 (class 1259 OID 28915)
-- Name: tb_observateurs_leves_gps_numero_observateur_seq; Type: SEQUENCE; Schema: ornithologie; Owner: postgres
--

CREATE SEQUENCE tb_observateurs_leves_gps_numero_observateur_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ornithologie.tb_observateurs_leves_gps_numero_observateur_seq OWNER TO postgres;

--
-- TOC entry 4128 (class 0 OID 0)
-- Dependencies: 324
-- Name: tb_observateurs_leves_gps_numero_observateur_seq; Type: SEQUENCE OWNED BY; Schema: ornithologie; Owner: postgres
--

ALTER SEQUENCE tb_observateurs_leves_gps_numero_observateur_seq OWNED BY tb_observateurs_leves_gps.numero_observateur;


--
-- TOC entry 325 (class 1259 OID 28917)
-- Name: tb_observateurs_manipes; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_observateurs_manipes (
    fk_observateur character varying(20) NOT NULL,
    fk_code_manipe character varying(12) NOT NULL
);


ALTER TABLE ornithologie.tb_observateurs_manipes OWNER TO postgres;

--
-- TOC entry 326 (class 1259 OID 28920)
-- Name: tb_protocoles_metadonnees; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_protocoles_metadonnees (
    pk_tb_protocoles_metadonnees character varying(40) NOT NULL,
    nom_protocole character varying(100)
);


ALTER TABLE ornithologie.tb_protocoles_metadonnees OWNER TO postgres;

--
-- TOC entry 327 (class 1259 OID 28923)
-- Name: tb_traces_gps; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_traces_gps (
    pk_tb_traces_gps integer NOT NULL,
    date_debut_trace timestamp without time zone,
    date_fin_trace timestamp without time zone,
    date_saisie_dans_bd date,
    trace public.geometry(MultiLineString,32742)
);


ALTER TABLE ornithologie.tb_traces_gps OWNER TO postgres;

--
-- TOC entry 328 (class 1259 OID 28929)
-- Name: tb_traces_gps_manipes; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_traces_gps_manipes (
    pk_tb_traces_gps_manipes integer,
    fk_code_manipe character varying(12)
);


ALTER TABLE ornithologie.tb_traces_gps_manipes OWNER TO postgres;

--
-- TOC entry 329 (class 1259 OID 28932)
-- Name: tb_traces_gps_pk_tb_traces_gps_seq; Type: SEQUENCE; Schema: ornithologie; Owner: postgres
--

CREATE SEQUENCE tb_traces_gps_pk_tb_traces_gps_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ornithologie.tb_traces_gps_pk_tb_traces_gps_seq OWNER TO postgres;

--
-- TOC entry 4133 (class 0 OID 0)
-- Dependencies: 329
-- Name: tb_traces_gps_pk_tb_traces_gps_seq; Type: SEQUENCE OWNED BY; Schema: ornithologie; Owner: postgres
--

ALTER SEQUENCE tb_traces_gps_pk_tb_traces_gps_seq OWNED BY tb_traces_gps.pk_tb_traces_gps;


--
-- TOC entry 330 (class 1259 OID 28934)
-- Name: tb_zone_geo; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE tb_zone_geo (
    pk_tb_zone_geo smallint NOT NULL,
    nom_zone character varying(100),
    geom public.geometry(Polygon,32742)
);


ALTER TABLE ornithologie.tb_zone_geo OWNER TO postgres;

--
-- TOC entry 331 (class 1259 OID 28940)
-- Name: trsc_especes_epigees; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE trsc_especes_epigees (
    pk_trsc_especes_epigees character varying(22) NOT NULL,
    fk_trsc_transect_parcours character varying(20),
    fk_code_leve_gps character varying(18),
    fk_code_manipe character varying(12),
    fk_numero_transect smallint,
    fk_espece_vernaculaire character varying(100),
    date_correction date,
    numero_observation smallint,
    vegetation character varying(200),
    distance_angulaire_d real,
    angle_magnetique_telemetre_a1 smallint,
    angle_transect_a2 smallint,
    distance_perpendiculaire_d real,
    activite_comportement character varying(100),
    nb_skuas smallint,
    indice_reproduction character varying(100),
    nombre_oeufs smallint,
    nombre_poussins smallint,
    canards_effectif_male smallint,
    canards_effectif_femelle smallint,
    canards_effectif_indetermine smallint,
    somme_effectif smallint,
    remarques text
);


ALTER TABLE ornithologie.trsc_especes_epigees OWNER TO postgres;

--
-- TOC entry 332 (class 1259 OID 28946)
-- Name: trsc_especes_hypogees; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE trsc_especes_hypogees (
    pk_trsc_especes_hypogees character varying(100) NOT NULL,
    fk_trsc_transect_parcours character varying(20),
    fk_code_leve_gps character varying(18),
    fk_code_manipe character varying(12),
    fk_numero_transect smallint,
    fk_espece_vernaculaire character varying(100),
    date_correction date,
    numero_terrier smallint,
    distance_perpendiculaire_d real,
    signe_occupation_1 character varying(100),
    signe_occupation_2 character varying(100),
    signe_occupation_3 character varying(100),
    reponse_a_la_repasse character varying(15),
    verif_occupation_terrier character varying(100),
    verif_si_oeuf character varying(100),
    vegetation character varying(200),
    remarques text
);


ALTER TABLE ornithologie.trsc_especes_hypogees OWNER TO postgres;

--
-- TOC entry 333 (class 1259 OID 28952)
-- Name: trsc_transect_metadonnees; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE trsc_transect_metadonnees (
    pk_trsc_transect_metadonnees integer NOT NULL,
    nom_transect character varying(100),
    especes_transect character varying(20),
    district character varying(10),
    site character varying(100),
    fk_zone_geo smallint,
    date_premier_parcours date,
    date_saisie_dans_bd date,
    type_transect character varying(15),
    the_geom public.geometry(MultiLineString,32742),
    longueur_theorique_transect real,
    CONSTRAINT trsc_transect_metadonnees_especes_transect_check CHECK ((((especes_transect)::text = 'hypogees'::text) OR ((especes_transect)::text = 'epigees'::text))),
    CONSTRAINT trsc_transect_metadonnees_type_transect_check CHECK ((((((type_transect)::text = 'interieur'::text) OR ((type_transect)::text = 'cotier'::text)) OR ((type_transect)::text = 'transversal'::text)) OR ((type_transect)::text = 'diagonal'::text)))
);


ALTER TABLE ornithologie.trsc_transect_metadonnees OWNER TO postgres;

--
-- TOC entry 334 (class 1259 OID 28960)
-- Name: trsc_transect_metadonnees_pk_trsc_transect_metadonnees_seq; Type: SEQUENCE; Schema: ornithologie; Owner: postgres
--

CREATE SEQUENCE trsc_transect_metadonnees_pk_trsc_transect_metadonnees_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ornithologie.trsc_transect_metadonnees_pk_trsc_transect_metadonnees_seq OWNER TO postgres;

--
-- TOC entry 4138 (class 0 OID 0)
-- Dependencies: 334
-- Name: trsc_transect_metadonnees_pk_trsc_transect_metadonnees_seq; Type: SEQUENCE OWNED BY; Schema: ornithologie; Owner: postgres
--

ALTER SEQUENCE trsc_transect_metadonnees_pk_trsc_transect_metadonnees_seq OWNED BY trsc_transect_metadonnees.pk_trsc_transect_metadonnees;


--
-- TOC entry 335 (class 1259 OID 28962)
-- Name: trsc_transect_parcours; Type: TABLE; Schema: ornithologie; Owner: postgres; Tablespace: 
--

CREATE TABLE trsc_transect_parcours (
    pk_trsc_transect_parcours character varying(20) NOT NULL,
    fk_code_manipe character varying(12),
    date_correction date,
    fk_numero_transect integer,
    numero_parcours integer NOT NULL,
    direction_suivie character varying(10),
    trace_gps_transect public.geometry(MultiLineString,32742),
    longueur_sur_terrain real,
    aucune_obs boolean,
    fk_observateur character varying(20),
    remarques_transect text
);


ALTER TABLE ornithologie.trsc_transect_parcours OWNER TO postgres;

SET search_path = phylica_amsterdam, pg_catalog;

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
-- TOC entry 4140 (class 0 OID 0)
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
-- TOC entry 4141 (class 0 OID 0)
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

SET search_path = public, pg_catalog;

--
-- TOC entry 182 (class 1259 OID 16965)
-- Name: geography_columns; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW geography_columns AS
 SELECT current_database() AS f_table_catalog,
    n.nspname AS f_table_schema,
    c.relname AS f_table_name,
    a.attname AS f_geography_column,
    postgis_typmod_dims(a.atttypmod) AS coord_dimension,
    postgis_typmod_srid(a.atttypmod) AS srid,
    postgis_typmod_type(a.atttypmod) AS type
   FROM pg_class c,
    pg_attribute a,
    pg_type t,
    pg_namespace n
  WHERE (((((((t.typname = 'geography'::name) AND (a.attisdropped = false)) AND (a.atttypid = t.oid)) AND (a.attrelid = c.oid)) AND (c.relnamespace = n.oid)) AND (NOT pg_is_other_temp_schema(c.relnamespace))) AND has_table_privilege(c.oid, 'SELECT'::text));


ALTER TABLE public.geography_columns OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 17076)
-- Name: geometry_columns; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW geometry_columns AS
 SELECT (current_database())::character varying(256) AS f_table_catalog,
    (n.nspname)::character varying(256) AS f_table_schema,
    (c.relname)::character varying(256) AS f_table_name,
    (a.attname)::character varying(256) AS f_geometry_column,
    COALESCE(NULLIF(postgis_typmod_dims(a.atttypmod), 2), postgis_constraint_dims((n.nspname)::text, (c.relname)::text, (a.attname)::text), 2) AS coord_dimension,
    COALESCE(NULLIF(postgis_typmod_srid(a.atttypmod), 0), postgis_constraint_srid((n.nspname)::text, (c.relname)::text, (a.attname)::text), 0) AS srid,
    (replace(replace(COALESCE(NULLIF(upper(postgis_typmod_type(a.atttypmod)), 'GEOMETRY'::text), (postgis_constraint_type((n.nspname)::text, (c.relname)::text, (a.attname)::text))::text, 'GEOMETRY'::text), 'ZM'::text, ''::text), 'Z'::text, ''::text))::character varying(30) AS type
   FROM pg_class c,
    pg_attribute a,
    pg_type t,
    pg_namespace n
  WHERE (((((((((t.typname = 'geometry'::name) AND (a.attisdropped = false)) AND (a.atttypid = t.oid)) AND (a.attrelid = c.oid)) AND (c.relnamespace = n.oid)) AND ((((c.relkind = 'r'::"char") OR (c.relkind = 'v'::"char")) OR (c.relkind = 'm'::"char")) OR (c.relkind = 'f'::"char"))) AND (NOT pg_is_other_temp_schema(c.relnamespace))) AND (NOT ((n.nspname = 'public'::name) AND (c.relname = 'raster_columns'::name)))) AND has_table_privilege(c.oid, 'SELECT'::text));


ALTER TABLE public.geometry_columns OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16652)
-- Name: spatial_ref_sys; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spatial_ref_sys (
    srid integer NOT NULL,
    auth_name character varying(256),
    auth_srid integer,
    srtext character varying(2048),
    proj4text character varying(2048),
    CONSTRAINT spatial_ref_sys_srid_check CHECK (((srid > 0) AND (srid <= 998999)))
);


ALTER TABLE public.spatial_ref_sys OWNER TO postgres;

SET search_path = vues_ornithologie, pg_catalog;

--
-- TOC entry 338 (class 1259 OID 30013)
-- Name: cmtg_indiff_vue; Type: VIEW; Schema: vues_ornithologie; Owner: postgres
--

CREATE VIEW cmtg_indiff_vue AS
 SELECT row_number() OVER (ORDER BY cmtg_indiff_vue.date_manipe) AS cle_primaire,
    cmtg_indiff_vue.pk_tb_manipe_metadonnees,
    cmtg_indiff_vue.district,
    cmtg_indiff_vue.fk_zone_geo,
    cmtg_indiff_vue.fk_site,
    cmtg_indiff_vue.fk_site_arrivee,
    cmtg_indiff_vue.saison,
    cmtg_indiff_vue.date_manipe,
    cmtg_indiff_vue.date_correction,
    cmtg_indiff_vue.date_saisie_dans_bd,
    cmtg_indiff_vue.ordi_saisie_donnee,
    cmtg_indiff_vue.remarques_manipe,
    cmtg_indiff_vue.pk_tb_leve_gps_metadonnees,
    cmtg_indiff_vue.id_pt_gps,
    cmtg_indiff_vue.numero_gps,
    cmtg_indiff_vue.heure_leve,
    cmtg_indiff_vue.latitude,
    cmtg_indiff_vue.longitude,
    cmtg_indiff_vue.the_geom,
    cmtg_indiff_vue.origine_coordonnees,
    cmtg_indiff_vue.remarques_leve_gps,
    cmtg_indiff_vue.pk_cmtg_indiff_metadonnees,
    cmtg_indiff_vue.fk_espece_vernaculaire,
    cmtg_indiff_vue.lieu_comptage,
    cmtg_indiff_vue.comptage_jumelle,
    cmtg_indiff_vue.precision_coordonnees,
    cmtg_indiff_vue.contacts_avec_espece,
    cmtg_indiff_vue.contacts_avec_espece_2,
    cmtg_indiff_vue.comportements,
    cmtg_indiff_vue.type_comptage,
    cmtg_indiff_vue.pk_cmtg_indiff_precis,
    cmtg_indiff_vue.type_effectif_cmtg_precis,
    cmtg_indiff_vue.comptage_1,
    cmtg_indiff_vue.comptage_2,
    cmtg_indiff_vue.comptage_3,
    cmtg_indiff_vue.comptage_4,
    cmtg_indiff_vue.moyenne_comptages,
    cmtg_indiff_vue.pk_cmtg_indiff_nids_oeufs_poussins,
    cmtg_indiff_vue.numero_nid,
    cmtg_indiff_vue.nb_oeufs,
    cmtg_indiff_vue.nb_poussins,
    cmtg_indiff_vue.pk_cmtg_indiff_minmax,
    cmtg_indiff_vue.type_effectif_cmtg_minmax,
    cmtg_indiff_vue.minimum,
    cmtg_indiff_vue.maximum,
    cmtg_indiff_vue.fk_code_metadonnees_comptage_classe,
    cmtg_indiff_vue.classe,
    cmtg_indiff_vue.fk_code_metadonnees_comptage_territoire,
    cmtg_indiff_vue.nb_territoires,
    cmtg_indiff_vue.remarques
   FROM ( SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_zone_geo,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            tb_manipe_metadonnees.saison,
            tb_manipe_metadonnees.date_manipe,
            cmtg_indiff_metadonnees.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees,
            tb_leve_gps_metadonnees.id_pt_gps,
            tb_leve_gps_metadonnees.numero_gps,
            tb_leve_gps_metadonnees.heure_leve,
            tb_leve_gps_metadonnees.latitude,
            tb_leve_gps_metadonnees.longitude,
            tb_leve_gps_metadonnees.the_geom,
            tb_leve_gps_metadonnees.origine_coordonnees,
            tb_leve_gps_metadonnees.remarques AS remarques_leve_gps,
            cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees,
            cmtg_indiff_metadonnees.fk_espece_vernaculaire,
            cmtg_indiff_metadonnees.lieu_comptage,
            cmtg_indiff_metadonnees.comptage_jumelle,
            cmtg_indiff_metadonnees.precision_coordonnees,
            cmtg_indiff_metadonnees.contacts_avec_espece,
            cmtg_indiff_metadonnees.contacts_avec_espece_2,
            cmtg_indiff_metadonnees.comportements,
            cmtg_indiff_metadonnees.type_comptage,
            cmtg_indiff_precis.pk_cmtg_indiff_precis,
            cmtg_indiff_precis.type_effectif AS type_effectif_cmtg_precis,
            cmtg_indiff_precis.comptage_1,
            cmtg_indiff_precis.comptage_2,
            cmtg_indiff_precis.comptage_3,
            cmtg_indiff_precis.comptage_4,
            cmtg_indiff_precis.moyenne_comptages,
            NULL::character varying(25) AS pk_cmtg_indiff_nids_oeufs_poussins,
            NULL::smallint AS numero_nid,
            NULL::smallint AS nb_oeufs,
            NULL::smallint AS nb_poussins,
            NULL::character varying(30) AS pk_cmtg_indiff_minmax,
            NULL::character varying(40) AS type_effectif_cmtg_minmax,
            NULL::smallint AS minimum,
            NULL::smallint AS maximum,
            NULL::character varying(30) AS fk_code_metadonnees_comptage_classe,
            NULL::character varying(15) AS classe,
            NULL::character varying(30) AS fk_code_metadonnees_comptage_territoire,
            NULL::smallint AS nb_territoires,
            cmtg_indiff_metadonnees.remarques
           FROM (((ornithologie.cmtg_indiff_precis
             LEFT JOIN ornithologie.cmtg_indiff_metadonnees ON (((cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees)::text = (cmtg_indiff_precis.fk_code_metadonnees_comptage)::text)))
             LEFT JOIN ornithologie.tb_leve_gps_metadonnees ON (((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (cmtg_indiff_metadonnees.fk_code_leve_gps)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (tb_leve_gps_metadonnees.fk_code_manipe)::text)))
        UNION
         SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_zone_geo,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            tb_manipe_metadonnees.saison,
            tb_manipe_metadonnees.date_manipe,
            cmtg_indiff_metadonnees.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees,
            tb_leve_gps_metadonnees.id_pt_gps,
            tb_leve_gps_metadonnees.numero_gps,
            tb_leve_gps_metadonnees.heure_leve,
            tb_leve_gps_metadonnees.latitude,
            tb_leve_gps_metadonnees.longitude,
            tb_leve_gps_metadonnees.the_geom,
            tb_leve_gps_metadonnees.origine_coordonnees,
            tb_leve_gps_metadonnees.remarques AS remarques_leve_gps,
            cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees,
            cmtg_indiff_metadonnees.fk_espece_vernaculaire,
            cmtg_indiff_metadonnees.lieu_comptage,
            cmtg_indiff_metadonnees.comptage_jumelle,
            cmtg_indiff_metadonnees.precision_coordonnees,
            cmtg_indiff_metadonnees.contacts_avec_espece,
            cmtg_indiff_metadonnees.contacts_avec_espece_2,
            cmtg_indiff_metadonnees.comportements,
            cmtg_indiff_metadonnees.type_comptage,
            NULL::character varying AS pk_cmtg_indiff_precis,
            NULL::character varying AS type_effectif_cmtg_precis,
            NULL::smallint AS comptage_1,
            NULL::smallint AS comptage_2,
            NULL::smallint AS comptage_3,
            NULL::smallint AS comptage_4,
            NULL::numeric AS moyenne_comptages,
            cmtg_indiff_nids_oeufs_poussins.pk_cmtg_indiff_nids_oeufs_poussins,
            cmtg_indiff_nids_oeufs_poussins.numero_nid,
            cmtg_indiff_nids_oeufs_poussins.nb_oeufs,
            cmtg_indiff_nids_oeufs_poussins.nb_poussins,
            NULL::character varying AS pk_cmtg_indiff_minmax,
            NULL::character varying AS type_effectif_cmtg_minmax,
            NULL::smallint AS minimum,
            NULL::smallint AS maximum,
            NULL::character varying AS fk_code_metadonnees_comptage_classe,
            NULL::character varying AS classe,
            NULL::character varying AS fk_code_metadonnees_comptage_territoire,
            NULL::smallint AS nb_territoires,
            cmtg_indiff_metadonnees.remarques
           FROM (((ornithologie.cmtg_indiff_nids_oeufs_poussins
             LEFT JOIN ornithologie.cmtg_indiff_metadonnees ON (((cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees)::text = (cmtg_indiff_nids_oeufs_poussins.fk_code_metadonnees_comptage)::text)))
             LEFT JOIN ornithologie.tb_leve_gps_metadonnees ON (((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (cmtg_indiff_metadonnees.fk_code_leve_gps)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (tb_leve_gps_metadonnees.fk_code_manipe)::text)))
        UNION
         SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_zone_geo,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            tb_manipe_metadonnees.saison,
            tb_manipe_metadonnees.date_manipe,
            cmtg_indiff_metadonnees.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees,
            tb_leve_gps_metadonnees.id_pt_gps,
            tb_leve_gps_metadonnees.numero_gps,
            tb_leve_gps_metadonnees.heure_leve,
            tb_leve_gps_metadonnees.latitude,
            tb_leve_gps_metadonnees.longitude,
            tb_leve_gps_metadonnees.the_geom,
            tb_leve_gps_metadonnees.origine_coordonnees,
            tb_leve_gps_metadonnees.remarques AS remarques_leve_gps,
            cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees,
            cmtg_indiff_metadonnees.fk_espece_vernaculaire,
            cmtg_indiff_metadonnees.lieu_comptage,
            cmtg_indiff_metadonnees.comptage_jumelle,
            cmtg_indiff_metadonnees.precision_coordonnees,
            cmtg_indiff_metadonnees.contacts_avec_espece,
            cmtg_indiff_metadonnees.contacts_avec_espece_2,
            cmtg_indiff_metadonnees.comportements,
            cmtg_indiff_metadonnees.type_comptage,
            NULL::character varying AS pk_cmtg_indiff_precis,
            NULL::character varying AS type_effectif_cmtg_precis,
            NULL::smallint AS comptage_1,
            NULL::smallint AS comptage_2,
            NULL::smallint AS comptage_3,
            NULL::smallint AS comptage_4,
            NULL::numeric AS moyenne_comptages,
            NULL::character varying AS pk_cmtg_indiff_nids_oeufs_poussins,
            NULL::smallint AS numero_nid,
            NULL::smallint AS nb_oeufs,
            NULL::smallint AS nb_poussins,
            cmtg_indiff_minmax.pk_cmtg_indiff_minmax,
            cmtg_indiff_minmax.type_effectif AS type_effectif_cmtg_minmax,
            cmtg_indiff_minmax.minimum,
            cmtg_indiff_minmax.maximum,
            NULL::character varying AS fk_code_metadonnees_comptage_classe,
            NULL::character varying AS classe,
            NULL::character varying AS fk_code_metadonnees_comptage_territoire,
            NULL::smallint AS nb_territoires,
            cmtg_indiff_metadonnees.remarques
           FROM (((ornithologie.cmtg_indiff_minmax
             LEFT JOIN ornithologie.cmtg_indiff_metadonnees ON (((cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees)::text = (cmtg_indiff_minmax.fk_code_metadonnees_comptage)::text)))
             LEFT JOIN ornithologie.tb_leve_gps_metadonnees ON (((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (cmtg_indiff_metadonnees.fk_code_leve_gps)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (tb_leve_gps_metadonnees.fk_code_manipe)::text)))
        UNION
         SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_zone_geo,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            tb_manipe_metadonnees.saison,
            tb_manipe_metadonnees.date_manipe,
            cmtg_indiff_metadonnees.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees,
            tb_leve_gps_metadonnees.id_pt_gps,
            tb_leve_gps_metadonnees.numero_gps,
            tb_leve_gps_metadonnees.heure_leve,
            tb_leve_gps_metadonnees.latitude,
            tb_leve_gps_metadonnees.longitude,
            tb_leve_gps_metadonnees.the_geom,
            tb_leve_gps_metadonnees.origine_coordonnees,
            tb_leve_gps_metadonnees.remarques AS remarques_leve_gps,
            cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees,
            cmtg_indiff_metadonnees.fk_espece_vernaculaire,
            cmtg_indiff_metadonnees.lieu_comptage,
            cmtg_indiff_metadonnees.comptage_jumelle,
            cmtg_indiff_metadonnees.precision_coordonnees,
            cmtg_indiff_metadonnees.contacts_avec_espece,
            cmtg_indiff_metadonnees.contacts_avec_espece_2,
            cmtg_indiff_metadonnees.comportements,
            cmtg_indiff_metadonnees.type_comptage,
            NULL::character varying AS pk_cmtg_indiff_precis,
            NULL::character varying AS type_effectif_cmtg_precis,
            NULL::smallint AS comptage_1,
            NULL::smallint AS comptage_2,
            NULL::smallint AS comptage_3,
            NULL::smallint AS comptage_4,
            NULL::numeric AS moyenne_comptages,
            NULL::character varying AS pk_cmtg_indiff_nids_oeufs_poussins,
            NULL::smallint AS numero_nid,
            NULL::smallint AS nb_oeufs,
            NULL::smallint AS nb_poussins,
            NULL::character varying AS pk_cmtg_indiff_minmax,
            NULL::character varying AS type_effectif_cmtg_minmax,
            NULL::smallint AS minimum,
            NULL::smallint AS maximum,
            cmtg_indiff_classe.fk_code_metadonnees_comptage_classe,
            cmtg_indiff_classe.classe,
            NULL::character varying AS fk_code_metadonnees_comptage_territoire,
            NULL::smallint AS nb_territoires,
            cmtg_indiff_metadonnees.remarques
           FROM (((ornithologie.cmtg_indiff_classe
             LEFT JOIN ornithologie.cmtg_indiff_metadonnees ON (((cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees)::text = (cmtg_indiff_classe.fk_code_metadonnees_comptage_classe)::text)))
             LEFT JOIN ornithologie.tb_leve_gps_metadonnees ON (((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (cmtg_indiff_metadonnees.fk_code_leve_gps)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (tb_leve_gps_metadonnees.fk_code_manipe)::text)))
        UNION
         SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_zone_geo,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            tb_manipe_metadonnees.saison,
            tb_manipe_metadonnees.date_manipe,
            cmtg_indiff_metadonnees.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees,
            tb_leve_gps_metadonnees.id_pt_gps,
            tb_leve_gps_metadonnees.numero_gps,
            tb_leve_gps_metadonnees.heure_leve,
            tb_leve_gps_metadonnees.latitude,
            tb_leve_gps_metadonnees.longitude,
            tb_leve_gps_metadonnees.the_geom,
            tb_leve_gps_metadonnees.origine_coordonnees,
            tb_leve_gps_metadonnees.remarques AS remarques_leve_gps,
            cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees,
            cmtg_indiff_metadonnees.fk_espece_vernaculaire,
            cmtg_indiff_metadonnees.lieu_comptage,
            cmtg_indiff_metadonnees.comptage_jumelle,
            cmtg_indiff_metadonnees.precision_coordonnees,
            cmtg_indiff_metadonnees.contacts_avec_espece,
            cmtg_indiff_metadonnees.contacts_avec_espece_2,
            cmtg_indiff_metadonnees.comportements,
            cmtg_indiff_metadonnees.type_comptage,
            NULL::character varying AS pk_cmtg_indiff_precis,
            NULL::character varying AS type_effectif_cmtg_precis,
            NULL::smallint AS comptage_1,
            NULL::smallint AS comptage_2,
            NULL::smallint AS comptage_3,
            NULL::smallint AS comptage_4,
            NULL::numeric AS moyenne_comptages,
            NULL::character varying AS pk_cmtg_indiff_nids_oeufs_poussins,
            NULL::smallint AS numero_nid,
            NULL::smallint AS nb_oeufs,
            NULL::smallint AS nb_poussins,
            NULL::character varying AS pk_cmtg_indiff_minmax,
            NULL::character varying AS type_effectif_cmtg_minmax,
            NULL::smallint AS minimum,
            NULL::smallint AS maximum,
            NULL::character varying AS fk_code_metadonnees_comptage_classe,
            NULL::character varying AS classe,
            cmtg_indiff_territoire.fk_code_metadonnees_comptage_territoire,
            cmtg_indiff_territoire.nb_territoires,
            cmtg_indiff_metadonnees.remarques
           FROM (((ornithologie.cmtg_indiff_territoire
             LEFT JOIN ornithologie.cmtg_indiff_metadonnees ON (((cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees)::text = (cmtg_indiff_territoire.fk_code_metadonnees_comptage_territoire)::text)))
             LEFT JOIN ornithologie.tb_leve_gps_metadonnees ON (((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (cmtg_indiff_metadonnees.fk_code_leve_gps)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (tb_leve_gps_metadonnees.fk_code_manipe)::text)))
        UNION
         SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_zone_geo,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            tb_manipe_metadonnees.saison,
            tb_manipe_metadonnees.date_manipe,
            cmtg_indiff_metadonnees.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees,
            tb_leve_gps_metadonnees.id_pt_gps,
            tb_leve_gps_metadonnees.numero_gps,
            tb_leve_gps_metadonnees.heure_leve,
            tb_leve_gps_metadonnees.latitude,
            tb_leve_gps_metadonnees.longitude,
            tb_leve_gps_metadonnees.the_geom,
            tb_leve_gps_metadonnees.origine_coordonnees,
            tb_leve_gps_metadonnees.remarques AS remarques_leve_gps,
            cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees,
            cmtg_indiff_metadonnees.fk_espece_vernaculaire,
            cmtg_indiff_metadonnees.lieu_comptage,
            cmtg_indiff_metadonnees.comptage_jumelle,
            cmtg_indiff_metadonnees.precision_coordonnees,
            cmtg_indiff_metadonnees.contacts_avec_espece,
            cmtg_indiff_metadonnees.contacts_avec_espece_2,
            cmtg_indiff_metadonnees.comportements,
            cmtg_indiff_metadonnees.type_comptage,
            NULL::character varying AS pk_cmtg_indiff_precis,
            NULL::character varying AS type_effectif_cmtg_precis,
            NULL::smallint AS comptage_1,
            NULL::smallint AS comptage_2,
            NULL::smallint AS comptage_3,
            NULL::smallint AS comptage_4,
            NULL::numeric AS moyenne_comptages,
            NULL::character varying AS pk_cmtg_indiff_nids_oeufs_poussins,
            NULL::smallint AS numero_nid,
            NULL::smallint AS nb_oeufs,
            NULL::smallint AS nb_poussins,
            NULL::character varying AS pk_cmtg_indiff_minmax,
            NULL::character varying AS type_effectif_cmtg_minmax,
            NULL::smallint AS minimum,
            NULL::smallint AS maximum,
            NULL::character varying AS fk_code_metadonnees_comptage_classe,
            NULL::character varying AS classe,
            NULL::character varying AS fk_code_metadonnees_comptage_territoire,
            NULL::smallint AS nb_territoires,
            cmtg_indiff_metadonnees.remarques
           FROM ((ornithologie.cmtg_indiff_metadonnees
             LEFT JOIN ornithologie.tb_leve_gps_metadonnees ON (((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (cmtg_indiff_metadonnees.fk_code_leve_gps)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (tb_leve_gps_metadonnees.fk_code_manipe)::text)))
          WHERE ((cmtg_indiff_metadonnees.type_comptage)::text = 'presence'::text)) cmtg_indiff_vue;


ALTER TABLE vues_ornithologie.cmtg_indiff_vue OWNER TO postgres;

--
-- TOC entry 339 (class 1259 OID 30018)
-- Name: cmtg_mam_marins_vue; Type: VIEW; Schema: vues_ornithologie; Owner: postgres
--

CREATE VIEW cmtg_mam_marins_vue AS
 SELECT row_number() OVER (ORDER BY cmtg_mam_marins_vue.date_manipe) AS cle_primaire,
    cmtg_mam_marins_vue.position_pt_depart,
    cmtg_mam_marins_vue.position_pt_fin,
    cmtg_mam_marins_vue.pk_tb_manipe_metadonnees,
    cmtg_mam_marins_vue.date_manipe,
    cmtg_mam_marins_vue.saison,
    cmtg_mam_marins_vue.date_correction,
    cmtg_mam_marins_vue.date_saisie_dans_bd,
    cmtg_mam_marins_vue.ordi_saisie_donnee,
    cmtg_mam_marins_vue.remarques_manipe,
    cmtg_mam_marins_vue.district,
    cmtg_mam_marins_vue.fk_site,
    cmtg_mam_marins_vue.fk_site_arrivee,
    cmtg_mam_marins_vue.fk_zone_geo,
    cmtg_mam_marins_vue.pk_cmtg_mam_marins_metadonnees,
    cmtg_mam_marins_vue.fk_espece_vernaculaire,
    cmtg_mam_marins_vue.lat_depart,
    cmtg_mam_marins_vue.long_depart,
    cmtg_mam_marins_vue.lat_fin,
    cmtg_mam_marins_vue.long_fin,
    cmtg_mam_marins_vue.mode_trace_enregistre,
    cmtg_mam_marins_vue.remarques,
    cmtg_mam_marins_vue.pk_cmtg_mam_marins,
    cmtg_mam_marins_vue.type_effectif,
    cmtg_mam_marins_vue.comptage_1,
    cmtg_mam_marins_vue.comptage_2,
    cmtg_mam_marins_vue.comptage_3,
    cmtg_mam_marins_vue.comptage_4,
    cmtg_mam_marins_vue.moyenne_comptages
   FROM ( SELECT cmtg_mam_marins_metadonnees.position_pt_depart,
            cmtg_mam_marins_metadonnees.position_pt_fin,
            tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            tb_manipe_metadonnees.saison,
            cmtg_mam_marins.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            tb_manipe_metadonnees.fk_zone_geo,
            cmtg_mam_marins_metadonnees.pk_cmtg_mam_marins_metadonnees,
            cmtg_mam_marins_metadonnees.fk_espece_vernaculaire,
            cmtg_mam_marins_metadonnees.lat_depart,
            cmtg_mam_marins_metadonnees.long_depart,
            cmtg_mam_marins_metadonnees.lat_fin,
            cmtg_mam_marins_metadonnees.long_fin,
            cmtg_mam_marins_metadonnees.mode_trace_enregistre,
            cmtg_mam_marins_metadonnees.remarques,
            cmtg_mam_marins.pk_cmtg_mam_marins,
            cmtg_mam_marins.type_effectif,
            cmtg_mam_marins.comptage_1,
            cmtg_mam_marins.comptage_2,
            cmtg_mam_marins.comptage_3,
            cmtg_mam_marins.comptage_4,
            cmtg_mam_marins.moyenne_comptages
           FROM ((ornithologie.cmtg_mam_marins
             LEFT JOIN ornithologie.cmtg_mam_marins_metadonnees ON (((cmtg_mam_marins.fk_cmtg_mam_marins_metadonnees)::text = (cmtg_mam_marins_metadonnees.pk_cmtg_mam_marins_metadonnees)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (cmtg_mam_marins_metadonnees.fk_code_manipe)::text)))) cmtg_mam_marins_vue;


ALTER TABLE vues_ornithologie.cmtg_mam_marins_vue OWNER TO postgres;

--
-- TOC entry 340 (class 1259 OID 30023)
-- Name: cmtg_oiseaux_marins_vue; Type: VIEW; Schema: vues_ornithologie; Owner: postgres
--

CREATE VIEW cmtg_oiseaux_marins_vue AS
 SELECT row_number() OVER (ORDER BY cmtg_oiseaux_marins_vue.date_manipe) AS cle_primaire,
    cmtg_oiseaux_marins_vue.pk_tb_manipe_metadonnees,
    cmtg_oiseaux_marins_vue.date_manipe,
    cmtg_oiseaux_marins_vue.date_correction,
    cmtg_oiseaux_marins_vue.date_saisie_dans_bd,
    cmtg_oiseaux_marins_vue.ordi_saisie_donnee,
    cmtg_oiseaux_marins_vue.remarques_manipe,
    cmtg_oiseaux_marins_vue.district,
    cmtg_oiseaux_marins_vue.fk_site,
    cmtg_oiseaux_marins_vue.fk_site_arrivee,
    cmtg_oiseaux_marins_vue.pk_cmtg_oiseaux_marins_colonies_metadonnees,
    cmtg_oiseaux_marins_vue.fk_espece_vernaculaire,
    cmtg_oiseaux_marins_vue.latitude,
    cmtg_oiseaux_marins_vue.longitude,
    cmtg_oiseaux_marins_vue.the_geom,
    cmtg_oiseaux_marins_vue.pk_cmtg_oiseaux_marins,
    cmtg_oiseaux_marins_vue.saison,
    cmtg_oiseaux_marins_vue.numero_passage,
    cmtg_oiseaux_marins_vue.rien_vu_lors_du_passage,
    cmtg_oiseaux_marins_vue.type_effectif,
    cmtg_oiseaux_marins_vue.comptage_en_vol,
    cmtg_oiseaux_marins_vue.comptage_1_envol,
    cmtg_oiseaux_marins_vue.comptage_2_envol,
    cmtg_oiseaux_marins_vue.comptage_3_envol,
    cmtg_oiseaux_marins_vue.comptage_4_envol,
    cmtg_oiseaux_marins_vue.moyenne_comptages_envol,
    cmtg_oiseaux_marins_vue.comptage_a_distance,
    cmtg_oiseaux_marins_vue.comptage_1_adistance,
    cmtg_oiseaux_marins_vue.comptage_2_adistance,
    cmtg_oiseaux_marins_vue.comptage_3_adistance,
    cmtg_oiseaux_marins_vue.comptage_4_adistance,
    cmtg_oiseaux_marins_vue.moyenne_comptages_adistance,
    cmtg_oiseaux_marins_vue.remarques
   FROM ( SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            cmtg_oiseaux_marins.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            cmtg_oiseaux_marins_colonies_metadonnees.pk_cmtg_oiseaux_marins_colonies_metadonnees,
            cmtg_oiseaux_marins_colonies_metadonnees.fk_espece_vernaculaire,
            cmtg_oiseaux_marins_colonies_metadonnees.latitude,
            cmtg_oiseaux_marins_colonies_metadonnees.longitude,
            cmtg_oiseaux_marins_colonies_metadonnees.the_geom,
            cmtg_oiseaux_marins.pk_cmtg_oiseaux_marins,
            cmtg_oiseaux_marins.saison,
            cmtg_oiseaux_marins.numero_passage,
            cmtg_oiseaux_marins.rien_vu_lors_du_passage,
            cmtg_oiseaux_marins.type_effectif,
            cmtg_oiseaux_marins.comptage_en_vol,
            cmtg_oiseaux_marins.comptage_1_envol,
            cmtg_oiseaux_marins.comptage_2_envol,
            cmtg_oiseaux_marins.comptage_3_envol,
            cmtg_oiseaux_marins.comptage_4_envol,
            cmtg_oiseaux_marins.moyenne_comptages_envol,
            cmtg_oiseaux_marins.comptage_a_distance,
            cmtg_oiseaux_marins.comptage_1_adistance,
            cmtg_oiseaux_marins.comptage_2_adistance,
            cmtg_oiseaux_marins.comptage_3_adistance,
            cmtg_oiseaux_marins.comptage_4_adistance,
            cmtg_oiseaux_marins.moyenne_comptages_adistance,
            cmtg_oiseaux_marins.remarques
           FROM ((ornithologie.cmtg_oiseaux_marins
             LEFT JOIN ornithologie.cmtg_oiseaux_marins_colonies_metadonnees ON (((cmtg_oiseaux_marins.fk_cmtg_oiseaux_marins_colonies_metadonnees)::text = (cmtg_oiseaux_marins_colonies_metadonnees.pk_cmtg_oiseaux_marins_colonies_metadonnees)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (cmtg_oiseaux_marins.fk_code_manipe)::text)))) cmtg_oiseaux_marins_vue;


ALTER TABLE vues_ornithologie.cmtg_oiseaux_marins_vue OWNER TO postgres;

--
-- TOC entry 341 (class 1259 OID 30028)
-- Name: demos_vue; Type: VIEW; Schema: vues_ornithologie; Owner: postgres
--

CREATE VIEW demos_vue AS
 SELECT row_number() OVER (ORDER BY demos_vue.date_manipe) AS cle_primaire,
    demos_vue.pk_tb_manipe_metadonnees,
    demos_vue.date_manipe,
    demos_vue.date_correction,
    demos_vue.date_saisie_dans_bd,
    demos_vue.ordi_saisie_donnee,
    demos_vue.remarques_manipe,
    demos_vue.district,
    demos_vue.fk_site,
    demos_vue.fk_site_arrivee,
    demos_vue.pk_demos_terriers_metadonnees,
    demos_vue.fk_espece_vernaculaire,
    demos_vue.numero_piquet,
    demos_vue.latitude,
    demos_vue.longitude,
    demos_vue.the_geom,
    demos_vue.pk_demos_comptage,
    demos_vue.saison,
    demos_vue.numero_passage,
    demos_vue.reponse_a_la_repasse,
    demos_vue.presence_dans_terrier,
    demos_vue.remarques,
    demos_vue.pk_demos_indices_occup,
    demos_vue.indices_occupation_1,
    demos_vue.indices_occupation_2,
    demos_vue.indices_occupation_3
   FROM ( SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            demos_comptage.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            demos_terriers_metadonnees.pk_demos_terriers_metadonnees,
            demos_terriers_metadonnees.fk_espece_vernaculaire,
            demos_terriers_metadonnees.numero_piquet,
            demos_terriers_metadonnees.latitude,
            demos_terriers_metadonnees.longitude,
            demos_terriers_metadonnees.the_geom,
            demos_comptage.pk_demos_comptage,
            demos_comptage.saison,
            demos_comptage.numero_passage,
            demos_comptage.reponse_a_la_repasse,
            demos_comptage.presence_dans_terrier,
            demos_comptage.remarques,
            demos_indices_occup.pk_demos_indices_occup,
            demos_indices_occup.indices_occupation_1,
            demos_indices_occup.indices_occupation_2,
            demos_indices_occup.indices_occupation_3
           FROM (((ornithologie.demos_comptage
             LEFT JOIN ornithologie.demos_indices_occup ON (((demos_comptage.pk_demos_comptage)::text = (demos_indices_occup.fk_demos_comptage)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (demos_comptage.fk_code_manipe)::text)))
             LEFT JOIN ornithologie.demos_terriers_metadonnees ON (((demos_terriers_metadonnees.pk_demos_terriers_metadonnees)::text = (demos_comptage.fk_piquet)::text)))) demos_vue;


ALTER TABLE vues_ornithologie.demos_vue OWNER TO postgres;

--
-- TOC entry 342 (class 1259 OID 30033)
-- Name: observateurs_manipe_vue; Type: VIEW; Schema: vues_ornithologie; Owner: postgres
--

CREATE VIEW observateurs_manipe_vue AS
 SELECT row_number() OVER (ORDER BY observateurs_manipe_vue.date_manipe) AS cle_primaire,
    observateurs_manipe_vue.pk_tb_manipe_metadonnees,
    observateurs_manipe_vue.date_manipe,
    observateurs_manipe_vue.fk_protocole,
    observateurs_manipe_vue.fk_observateur
   FROM ( SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            tb_manipe_metadonnees.fk_protocole,
            tb_observateurs_manipes.fk_observateur
           FROM (ornithologie.tb_observateurs_manipes
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_observateurs_manipes.fk_code_manipe)::text = (tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text)))) observateurs_manipe_vue;


ALTER TABLE vues_ornithologie.observateurs_manipe_vue OWNER TO postgres;

--
-- TOC entry 343 (class 1259 OID 30038)
-- Name: observateurs_pointgps_vue; Type: VIEW; Schema: vues_ornithologie; Owner: postgres
--

CREATE VIEW observateurs_pointgps_vue AS
 SELECT row_number() OVER (ORDER BY observateurs_pointgps_vue.date_manipe) AS cle_primaire,
    observateurs_pointgps_vue.pk_tb_manipe_metadonnees,
    observateurs_pointgps_vue.date_manipe,
    observateurs_pointgps_vue.fk_protocole,
    observateurs_pointgps_vue.pk_tb_leve_gps_metadonnees,
    observateurs_pointgps_vue.pk_tb_observateurs_leves_gps,
    observateurs_pointgps_vue.fk_observateur,
    observateurs_pointgps_vue.id_pt_gps,
    observateurs_pointgps_vue.latitude,
    observateurs_pointgps_vue.longitude,
    observateurs_pointgps_vue.origine_coordonnees,
    observateurs_pointgps_vue.remarques
   FROM ( SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            tb_manipe_metadonnees.fk_protocole,
            tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees,
            tb_observateurs_leves_gps.pk_tb_observateurs_leves_gps,
            tb_observateurs_leves_gps.fk_observateur,
            tb_leve_gps_metadonnees.id_pt_gps,
            tb_leve_gps_metadonnees.latitude,
            tb_leve_gps_metadonnees.longitude,
            tb_leve_gps_metadonnees.origine_coordonnees,
            tb_leve_gps_metadonnees.remarques
           FROM ((ornithologie.tb_observateurs_leves_gps
             LEFT JOIN ornithologie.tb_leve_gps_metadonnees ON (((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (tb_observateurs_leves_gps.fk_code_leve_gps)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (tb_leve_gps_metadonnees.fk_code_manipe)::text)))) observateurs_pointgps_vue;


ALTER TABLE vues_ornithologie.observateurs_pointgps_vue OWNER TO postgres;

--
-- TOC entry 344 (class 1259 OID 30043)
-- Name: pc_permanent_vue; Type: VIEW; Schema: vues_ornithologie; Owner: postgres
--

CREATE VIEW pc_permanent_vue AS
 SELECT row_number() OVER (ORDER BY pc_permanent_vue.date_manipe, pc_permanent_vue.pk_pc_permanent) AS cle_primaire,
    pc_permanent_vue.pk_tb_manipe_metadonnees,
    pc_permanent_vue.date_manipe,
    pc_permanent_vue.saison,
    pc_permanent_vue.date_correction,
    pc_permanent_vue.date_saisie_dans_bd,
    pc_permanent_vue.ordi_saisie_donnee,
    pc_permanent_vue.remarques_manipe,
    pc_permanent_vue.district,
    pc_permanent_vue.pk_pc_permanent_metadonnees,
    pc_permanent_vue.numero_pc_permanent,
    pc_permanent_vue.fk_site,
    pc_permanent_vue.fk_site_arrivee,
    pc_permanent_vue.fk_zone_geo,
    pc_permanent_vue.date_premier_leve,
    pc_permanent_vue.date_dernier_passage,
    pc_permanent_vue.latitude,
    pc_permanent_vue.longitude,
    pc_permanent_vue.the_geom,
    pc_permanent_vue.pente,
    pc_permanent_vue.orientation,
    pc_permanent_vue.remarques_pc_permanent,
    pc_permanent_vue.pk_pc_permanent_changement_vegetation,
    pc_permanent_vue.vegetation,
    pc_permanent_vue.numero_terrier,
    pc_permanent_vue.pk_pc_permanent,
    pc_permanent_vue.fk_espece_vernaculaire,
    pc_permanent_vue.signe_occupation_1,
    pc_permanent_vue.signe_occupation_2,
    pc_permanent_vue.signe_occupation_3,
    pc_permanent_vue.reponse_a_la_repasse,
    pc_permanent_vue.verif_occupation_terrier,
    pc_permanent_vue.verif_si_oeuf,
    pc_permanent_vue.remarques
   FROM ( SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            tb_manipe_metadonnees.saison,
            pc_permanent.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            pc_permanent_metadonnees.pk_pc_permanent_metadonnees,
            pc_permanent_metadonnees.numero_piquet AS numero_pc_permanent,
            pc_permanent_metadonnees.fk_zone_geo,
            pc_permanent_metadonnees.date_premier_leve,
            pc_permanent_metadonnees.date_dernier_passage,
            pc_permanent_metadonnees.latitude,
            pc_permanent_metadonnees.longitude,
            pc_permanent_metadonnees.the_geom,
            pc_permanent_metadonnees.pente,
            pc_permanent_metadonnees.orientation,
            pc_permanent_metadonnees.remarques AS remarques_pc_permanent,
            pc_permanent_changement_vegetation.pk_pc_permanent_changement_vegetation,
            pc_permanent_changement_vegetation.vegetation,
            pc_permanent.numero_terrier,
            pc_permanent.pk_pc_permanent,
            pc_permanent.fk_espece_vernaculaire,
            pc_permanent.signe_occupation_1,
            pc_permanent.signe_occupation_2,
            pc_permanent.signe_occupation_3,
            pc_permanent.reponse_a_la_repasse,
            pc_permanent.verif_occupation_terrier,
            pc_permanent.verif_si_oeuf,
            pc_permanent.remarques
           FROM (((ornithologie.pc_permanent
             LEFT JOIN ornithologie.pc_permanent_metadonnees ON (((pc_permanent_metadonnees.pk_pc_permanent_metadonnees)::text = (pc_permanent.fk_code_piquet)::text)))
             LEFT JOIN ornithologie.pc_permanent_changement_vegetation ON (((pc_permanent_changement_vegetation.fk_numero_piquet)::text = (pc_permanent_metadonnees.pk_pc_permanent_metadonnees)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (pc_permanent.fk_code_manipe)::text)))
          WHERE (pc_permanent_changement_vegetation.date_mise_a_jour_vegetation = tb_manipe_metadonnees.date_manipe)) pc_permanent_vue;


ALTER TABLE vues_ornithologie.pc_permanent_vue OWNER TO postgres;

--
-- TOC entry 345 (class 1259 OID 30048)
-- Name: pc_surtransect_vue; Type: VIEW; Schema: vues_ornithologie; Owner: postgres
--

CREATE VIEW pc_surtransect_vue AS
 SELECT row_number() OVER (ORDER BY pc_surtransect_vue.date_manipe, pc_surtransect_vue.num_leve_gps, pc_surtransect_vue.numero_terrier) AS cle_primaire,
    pc_surtransect_vue.pk_tb_manipe_metadonnees,
    pc_surtransect_vue.date_manipe,
    pc_surtransect_vue.saison,
    pc_surtransect_vue.date_correction,
    pc_surtransect_vue.date_saisie_dans_bd,
    pc_surtransect_vue.ordi_saisie_donnee,
    pc_surtransect_vue.remarques_manipe,
    pc_surtransect_vue.district,
    pc_surtransect_vue.fk_site,
    pc_surtransect_vue.fk_site_arrivee,
    pc_surtransect_vue.fk_zone_geo,
    pc_surtransect_vue.pk_tb_leve_gps_metadonnees,
    pc_surtransect_vue.num_leve_gps,
    pc_surtransect_vue.id_pt_gps,
    pc_surtransect_vue.heure_leve,
    pc_surtransect_vue.latitude,
    pc_surtransect_vue.longitude,
    pc_surtransect_vue.the_geom,
    pc_surtransect_vue.remarques_leve_gps,
    pc_surtransect_vue.origine_coordonnees,
    pc_surtransect_vue.pk_pc_surtransect,
    pc_surtransect_vue.numero_terrier,
    pc_surtransect_vue.numero_transect,
    pc_surtransect_vue.distance_au_pt_precedent,
    pc_surtransect_vue.fk_espece_vernaculaire,
    pc_surtransect_vue.signe_occupation_1,
    pc_surtransect_vue.signe_occupation_2,
    pc_surtransect_vue.signe_occupation_3,
    pc_surtransect_vue.reponse_a_la_repasse,
    pc_surtransect_vue.verif_occupation_terrier,
    pc_surtransect_vue.verif_si_oeuf,
    pc_surtransect_vue.vegetation,
    pc_surtransect_vue.pente,
    pc_surtransect_vue.orientation,
    pc_surtransect_vue.remarques
   FROM ( SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            tb_manipe_metadonnees.saison,
            pc_surtransect.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            tb_manipe_metadonnees.fk_zone_geo,
            tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees,
            tb_leve_gps_metadonnees.num_leve_gps,
            tb_leve_gps_metadonnees.id_pt_gps,
            tb_leve_gps_metadonnees.heure_leve,
            tb_leve_gps_metadonnees.latitude,
            tb_leve_gps_metadonnees.longitude,
            tb_leve_gps_metadonnees.the_geom,
            tb_leve_gps_metadonnees.remarques AS remarques_leve_gps,
            tb_leve_gps_metadonnees.origine_coordonnees,
            pc_surtransect.pk_pc_surtransect,
            pc_surtransect.numero_terrier,
            pc_surtransect.numero_transect,
            pc_surtransect.distance_au_pt_precedent,
            pc_surtransect.fk_espece_vernaculaire,
            pc_surtransect.signe_occupation_1,
            pc_surtransect.signe_occupation_2,
            pc_surtransect.signe_occupation_3,
            pc_surtransect.reponse_a_la_repasse,
            pc_surtransect.verif_occupation_terrier,
            pc_surtransect.verif_si_oeuf,
            pc_surtransect.vegetation,
            pc_surtransect.pente,
            pc_surtransect.orientation,
            pc_surtransect.remarques
           FROM ((ornithologie.pc_surtransect
             LEFT JOIN ornithologie.tb_leve_gps_metadonnees ON (((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (pc_surtransect.fk_code_leve_gps)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (tb_leve_gps_metadonnees.fk_code_manipe)::text)))) pc_surtransect_vue;


ALTER TABLE vues_ornithologie.pc_surtransect_vue OWNER TO postgres;

--
-- TOC entry 362 (class 1259 OID 30473)
-- Name: reprise_bague_vue; Type: VIEW; Schema: vues_ornithologie; Owner: postgres
--

CREATE VIEW reprise_bague_vue AS
 SELECT row_number() OVER (ORDER BY reprise_bague_vue.date_manipe) AS cle_primaire,
    reprise_bague_vue.pk_tb_manipe_metadonnees,
    reprise_bague_vue.date_manipe,
    reprise_bague_vue.saison,
    reprise_bague_vue.date_correction,
    reprise_bague_vue.date_saisie_dans_bd,
    reprise_bague_vue.remarques_manipe,
    reprise_bague_vue.district,
    reprise_bague_vue.fk_site,
    reprise_bague_vue.fk_site_arrivee,
    reprise_bague_vue.fk_zone_geo,
    reprise_bague_vue.ordi_saisie_donnee,
    reprise_bague_vue.pk_tb_leve_gps_metadonnees,
    reprise_bague_vue.id_pt_gps,
    reprise_bague_vue.heure_leve,
    reprise_bague_vue.latitude,
    reprise_bague_vue.longitude,
    reprise_bague_vue.the_geom,
    reprise_bague_vue.remarques_leve_gps,
    reprise_bague_vue.origine_coordonnees,
    reprise_bague_vue.pk_reprise_bague,
    reprise_bague_vue.fk_espece_vernaculaire,
    reprise_bague_vue.statut,
    reprise_bague_vue.num_bague_metal,
    reprise_bague_vue.num_bague_darvic,
    reprise_bague_vue.pays_origine,
    reprise_bague_vue.remarques
   FROM ( SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            tb_manipe_metadonnees.saison,
            reprise_bague.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.remarques_manipe,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            tb_manipe_metadonnees.fk_zone_geo,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees,
            tb_leve_gps_metadonnees.id_pt_gps,
            tb_leve_gps_metadonnees.heure_leve,
            tb_leve_gps_metadonnees.latitude,
            tb_leve_gps_metadonnees.longitude,
            tb_leve_gps_metadonnees.the_geom,
            tb_leve_gps_metadonnees.remarques AS remarques_leve_gps,
            tb_leve_gps_metadonnees.origine_coordonnees,
            reprise_bague.pk_reprise_bague,
            reprise_bague.fk_espece_vernaculaire,
            reprise_bague.statut,
            reprise_bague.num_bague_metal,
            reprise_bague.num_bague_darvic,
            reprise_bague.pays_origine,
            reprise_bague.remarques
           FROM ((ornithologie.reprise_bague
             LEFT JOIN ornithologie.tb_leve_gps_metadonnees ON (((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (reprise_bague.fk_code_leve_gps)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (tb_leve_gps_metadonnees.fk_code_manipe)::text)))) reprise_bague_vue;


ALTER TABLE vues_ornithologie.reprise_bague_vue OWNER TO postgres;

--
-- TOC entry 346 (class 1259 OID 30053)
-- Name: srep_vue; Type: VIEW; Schema: vues_ornithologie; Owner: postgres
--

CREATE VIEW srep_vue AS
 SELECT row_number() OVER (ORDER BY srep_vue.date_manipe, srep_vue.pk_srep_comptage) AS cle_primaire,
    srep_vue.pk_tb_manipe_metadonnees,
    srep_vue.date_manipe,
    srep_vue.date_correction,
    srep_vue.date_saisie_dans_bd,
    srep_vue.ordi_saisie_donnee,
    srep_vue.remarques_manipe,
    srep_vue.district,
    srep_vue.fk_site,
    srep_vue.fk_site_arrivee,
    srep_vue.fk_zone_geo,
    srep_vue.pk_srep_colonies_metadonnees,
    srep_vue.fk_espece_vernaculaire,
    srep_vue.date_dernier_leve,
    srep_vue.latitude,
    srep_vue.longitude,
    srep_vue.the_geom,
    srep_vue.pk_srep_comptage,
    srep_vue.saison,
    srep_vue.numero_passage,
    srep_vue.type_effectif,
    srep_vue.comptage_1,
    srep_vue.comptage_2,
    srep_vue.comptage_3,
    srep_vue.comptage_4,
    srep_vue.moyenne_comptages,
    srep_vue.remarques
   FROM ( SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            srep_comptage.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            srep_colonies_metadonnees.fk_zone_geo,
            srep_colonies_metadonnees.pk_srep_colonies_metadonnees,
            srep_colonies_metadonnees.fk_espece_vernaculaire,
            srep_colonies_metadonnees.date_dernier_leve,
            srep_colonies_metadonnees.latitude,
            srep_colonies_metadonnees.longitude,
            srep_colonies_metadonnees.the_geom,
            srep_comptage.pk_srep_comptage,
            srep_comptage.saison,
            srep_comptage.numero_passage,
            srep_comptage.type_effectif,
            srep_comptage.comptage_1,
            srep_comptage.comptage_2,
            srep_comptage.comptage_3,
            srep_comptage.comptage_4,
            srep_comptage.moyenne_comptages,
            srep_comptage.remarques
           FROM ((ornithologie.srep_comptage
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (srep_comptage.fk_code_manipe)::text)))
             LEFT JOIN ornithologie.srep_colonies_metadonnees ON (((srep_colonies_metadonnees.pk_srep_colonies_metadonnees)::text = (srep_comptage.fk_srep_colonies_metadonnees)::text)))) srep_vue;


ALTER TABLE vues_ornithologie.srep_vue OWNER TO postgres;

--
-- TOC entry 347 (class 1259 OID 30058)
-- Name: tb_leve_gps_metadonnees_vue; Type: VIEW; Schema: vues_ornithologie; Owner: postgres
--

CREATE VIEW tb_leve_gps_metadonnees_vue AS
 SELECT row_number() OVER (ORDER BY tb_leve_gps_metadonnees_vue.date_manipe) AS cle_primaire,
    tb_leve_gps_metadonnees_vue.pk_tb_manipe_metadonnees,
    tb_leve_gps_metadonnees_vue.pk_tb_leve_gps_metadonnees,
    tb_leve_gps_metadonnees_vue.date_manipe,
    tb_leve_gps_metadonnees_vue.date_saisie_dans_bd,
    tb_leve_gps_metadonnees_vue.ordi_saisie_donnee,
    tb_leve_gps_metadonnees_vue.fk_site,
    tb_leve_gps_metadonnees_vue.fk_site_arrivee,
    tb_leve_gps_metadonnees_vue.fk_zone_geo,
    tb_leve_gps_metadonnees_vue.num_leve_gps,
    tb_leve_gps_metadonnees_vue.protocole,
    tb_leve_gps_metadonnees_vue.heure_leve,
    tb_leve_gps_metadonnees_vue.numero_gps,
    tb_leve_gps_metadonnees_vue.id_pt_gps,
    tb_leve_gps_metadonnees_vue.latitude,
    tb_leve_gps_metadonnees_vue.longitude,
    tb_leve_gps_metadonnees_vue.origine_coordonnees,
    tb_leve_gps_metadonnees_vue.remarques
   FROM ( SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            tb_manipe_metadonnees.fk_zone_geo,
            tb_leve_gps_metadonnees.num_leve_gps,
            tb_leve_gps_metadonnees.protocole,
            tb_leve_gps_metadonnees.heure_leve,
            tb_leve_gps_metadonnees.numero_gps,
            tb_leve_gps_metadonnees.id_pt_gps,
            tb_leve_gps_metadonnees.latitude,
            tb_leve_gps_metadonnees.longitude,
            tb_leve_gps_metadonnees.origine_coordonnees,
            tb_leve_gps_metadonnees.remarques
           FROM (ornithologie.tb_leve_gps_metadonnees
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (tb_leve_gps_metadonnees.fk_code_manipe)::text)))) tb_leve_gps_metadonnees_vue;


ALTER TABLE vues_ornithologie.tb_leve_gps_metadonnees_vue OWNER TO postgres;

--
-- TOC entry 348 (class 1259 OID 30063)
-- Name: trsc_especes_epigees_vue; Type: VIEW; Schema: vues_ornithologie; Owner: postgres
--

CREATE VIEW trsc_especes_epigees_vue AS
 SELECT row_number() OVER (ORDER BY trsc_especes_epigees_vue.date_manipe) AS cle_primaire,
    trsc_especes_epigees_vue.pk_tb_manipe_metadonnees,
    trsc_especes_epigees_vue.date_manipe,
    trsc_especes_epigees_vue.saison,
    trsc_especes_epigees_vue.date_correction,
    trsc_especes_epigees_vue.date_saisie_dans_bd,
    trsc_especes_epigees_vue.ordi_saisie_donnee,
    trsc_especes_epigees_vue.remarques_manipe,
    trsc_especes_epigees_vue.district,
    trsc_especes_epigees_vue.fk_site,
    trsc_especes_epigees_vue.fk_site_arrivee,
    trsc_especes_epigees_vue.nom_transect,
    trsc_especes_epigees_vue.date_premier_parcours,
    trsc_especes_epigees_vue.fk_zone_geo,
    trsc_especes_epigees_vue.pk_trsc_transect_parcours,
    trsc_especes_epigees_vue.fk_numero_transect,
    trsc_especes_epigees_vue.type_transect,
    trsc_especes_epigees_vue.direction_suivie,
    trsc_especes_epigees_vue.longueur_sur_terrain,
    trsc_especes_epigees_vue.longueur_sur_logiciel,
    trsc_especes_epigees_vue.remarques_transect,
    trsc_especes_epigees_vue.aucune_obs,
    trsc_especes_epigees_vue.visibilite,
    trsc_especes_epigees_vue.vent,
    trsc_especes_epigees_vue.couverture_nuageuse,
    trsc_especes_epigees_vue.precipitations,
    trsc_especes_epigees_vue.couverture_neigeuse_au_sol,
    trsc_especes_epigees_vue.pk_tb_leve_gps_metadonnees,
    trsc_especes_epigees_vue.id_pt_gps,
    trsc_especes_epigees_vue.num_leve_gps,
    trsc_especes_epigees_vue.heure_leve,
    trsc_especes_epigees_vue.latitude,
    trsc_especes_epigees_vue.longitude,
    trsc_especes_epigees_vue.the_geom,
    trsc_especes_epigees_vue.remarques_leve_gps,
    trsc_especes_epigees_vue.origine_coordonnees,
    trsc_especes_epigees_vue.pk_trsc_especes_epigees,
    trsc_especes_epigees_vue.fk_espece_vernaculaire,
    trsc_especes_epigees_vue.distance_angulaire_d,
    trsc_especes_epigees_vue.angle_magnetique_telemetre_a1,
    trsc_especes_epigees_vue.angle_transect_a2,
    trsc_especes_epigees_vue.distance_perpendiculaire_d,
    trsc_especes_epigees_vue.activite_comportement,
    trsc_especes_epigees_vue.indice_reproduction,
    trsc_especes_epigees_vue.nombre_oeufs,
    trsc_especes_epigees_vue.nombre_poussins,
    trsc_especes_epigees_vue.canards_effectif_male,
    trsc_especes_epigees_vue.canards_effectif_femelle,
    trsc_especes_epigees_vue.canards_effectif_indetermine,
    trsc_especes_epigees_vue.somme_effectif_canards,
    trsc_especes_epigees_vue.nb_skuas,
    trsc_especes_epigees_vue.vegetation,
    trsc_especes_epigees_vue.remarques,
    trsc_especes_epigees_vue.fk_observateur
   FROM ( SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            tb_manipe_metadonnees.saison,
            trsc_especes_epigees.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            trsc_transect_metadonnees.nom_transect,
            trsc_transect_metadonnees.date_premier_parcours,
            tb_manipe_metadonnees.fk_zone_geo,
            trsc_transect_parcours.pk_trsc_transect_parcours,
            trsc_transect_parcours.fk_numero_transect,
            trsc_transect_metadonnees.type_transect,
            trsc_transect_parcours.direction_suivie,
            trsc_transect_parcours.longueur_sur_terrain,
            trsc_transect_metadonnees.longueur_theorique_transect AS longueur_sur_logiciel,
            trsc_transect_parcours.remarques_transect,
            trsc_transect_parcours.aucune_obs,
            tb_meteo.visibilite,
            tb_meteo.vent,
            tb_meteo.couverture_nuageuse,
            tb_meteo.precipitations,
            tb_meteo.couverture_neigeuse_au_sol,
            tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees,
            tb_leve_gps_metadonnees.id_pt_gps,
            tb_leve_gps_metadonnees.num_leve_gps,
            tb_leve_gps_metadonnees.heure_leve,
            tb_leve_gps_metadonnees.latitude,
            tb_leve_gps_metadonnees.longitude,
            tb_leve_gps_metadonnees.the_geom,
            tb_leve_gps_metadonnees.remarques AS remarques_leve_gps,
            tb_leve_gps_metadonnees.origine_coordonnees,
            trsc_especes_epigees.pk_trsc_especes_epigees,
            trsc_especes_epigees.fk_espece_vernaculaire,
            trsc_especes_epigees.distance_angulaire_d,
            trsc_especes_epigees.angle_magnetique_telemetre_a1,
            trsc_especes_epigees.angle_transect_a2,
            trsc_especes_epigees.distance_perpendiculaire_d,
            trsc_especes_epigees.activite_comportement,
            trsc_especes_epigees.indice_reproduction,
            trsc_especes_epigees.nombre_oeufs,
            trsc_especes_epigees.nombre_poussins,
            trsc_especes_epigees.canards_effectif_male,
            trsc_especes_epigees.canards_effectif_femelle,
            trsc_especes_epigees.canards_effectif_indetermine,
            trsc_especes_epigees.somme_effectif AS somme_effectif_canards,
            trsc_especes_epigees.nb_skuas,
            trsc_especes_epigees.vegetation,
            trsc_especes_epigees.remarques,
            trsc_transect_parcours.fk_observateur
           FROM (((((ornithologie.trsc_especes_epigees
             LEFT JOIN ornithologie.trsc_transect_parcours ON (((trsc_transect_parcours.pk_trsc_transect_parcours)::text = (trsc_especes_epigees.fk_trsc_transect_parcours)::text)))
             LEFT JOIN ornithologie.trsc_transect_metadonnees ON ((trsc_transect_metadonnees.pk_trsc_transect_metadonnees = trsc_transect_parcours.fk_numero_transect)))
             LEFT JOIN ornithologie.tb_leve_gps_metadonnees ON (((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (trsc_especes_epigees.fk_code_leve_gps)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (tb_leve_gps_metadonnees.fk_code_manipe)::text)))
             LEFT JOIN ornithologie.tb_meteo ON (((tb_meteo.pk_tb_meteo)::text = (tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text)))
        UNION
         SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            tb_manipe_metadonnees.saison,
            NULL::date AS date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            trsc_transect_metadonnees.nom_transect,
            trsc_transect_metadonnees.date_premier_parcours,
            tb_manipe_metadonnees.fk_zone_geo,
            trsc_transect_parcours.pk_trsc_transect_parcours,
            trsc_transect_parcours.fk_numero_transect,
            trsc_transect_metadonnees.type_transect,
            trsc_transect_parcours.direction_suivie,
            trsc_transect_parcours.longueur_sur_terrain,
            trsc_transect_metadonnees.longueur_theorique_transect AS longueur_sur_logiciel,
            trsc_transect_parcours.remarques_transect,
            trsc_transect_parcours.aucune_obs,
            tb_meteo.visibilite,
            tb_meteo.vent,
            tb_meteo.couverture_nuageuse,
            tb_meteo.precipitations,
            tb_meteo.couverture_neigeuse_au_sol,
            NULL::character varying AS pk_tb_leve_gps_metadonnees,
            NULL::character varying AS id_pt_gps,
            NULL::bigint AS num_leve_gps,
            NULL::time without time zone AS heure_leve,
            NULL::real AS latitude,
            NULL::real AS longitude,
            NULL::public.geometry AS the_geom,
            NULL::text AS remarques_leve_gps,
            NULL::character varying AS origine_coordonnees,
            NULL::character varying AS pk_trsc_especes_epigees,
            NULL::character varying AS fk_espece_vernaculaire,
            NULL::real AS distance_angulaire_d,
            NULL::smallint AS angle_magnetique_telemetre_a1,
            NULL::smallint AS angle_transect_a2,
            NULL::real AS distance_perpendiculaire_d,
            NULL::character varying AS activite_comportement,
            NULL::character varying AS indice_reproduction,
            NULL::smallint AS nombre_oeufs,
            NULL::smallint AS nombre_poussins,
            NULL::smallint AS canards_effectif_male,
            NULL::smallint AS canards_effectif_femelle,
            NULL::smallint AS canards_effectif_indetermine,
            NULL::smallint AS somme_effectif_canards,
            NULL::smallint AS nb_skuas,
            NULL::character varying AS vegetation,
            NULL::text AS remarques,
            trsc_transect_parcours.fk_observateur
           FROM (((ornithologie.trsc_transect_parcours
             LEFT JOIN ornithologie.trsc_transect_metadonnees ON ((trsc_transect_metadonnees.pk_trsc_transect_metadonnees = trsc_transect_parcours.fk_numero_transect)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (trsc_transect_parcours.fk_code_manipe)::text)))
             LEFT JOIN ornithologie.tb_meteo ON (((tb_meteo.pk_tb_meteo)::text = (tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text)))
          WHERE ((trsc_transect_parcours.aucune_obs = true) AND ((tb_manipe_metadonnees.fk_protocole)::text = 'trsc_especes_epigees'::text))) trsc_especes_epigees_vue;


ALTER TABLE vues_ornithologie.trsc_especes_epigees_vue OWNER TO postgres;

--
-- TOC entry 349 (class 1259 OID 30068)
-- Name: trsc_especes_hypogees_vue; Type: VIEW; Schema: vues_ornithologie; Owner: postgres
--

CREATE VIEW trsc_especes_hypogees_vue AS
 SELECT row_number() OVER (ORDER BY trsc_especes_hypogees_vue.date_manipe) AS cle_primaire,
    trsc_especes_hypogees_vue.pk_tb_manipe_metadonnees,
    trsc_especes_hypogees_vue.date_manipe,
    trsc_especes_hypogees_vue.saison,
    trsc_especes_hypogees_vue.date_correction,
    trsc_especes_hypogees_vue.date_saisie_dans_bd,
    trsc_especes_hypogees_vue.ordi_saisie_donnee,
    trsc_especes_hypogees_vue.remarques_manipe,
    trsc_especes_hypogees_vue.district,
    trsc_especes_hypogees_vue.fk_site,
    trsc_especes_hypogees_vue.fk_site_arrivee,
    trsc_especes_hypogees_vue.nom_transect,
    trsc_especes_hypogees_vue.date_premier_parcours,
    trsc_especes_hypogees_vue.fk_zone_geo,
    trsc_especes_hypogees_vue.pk_trsc_transect_parcours,
    trsc_especes_hypogees_vue.fk_numero_transect,
    trsc_especes_hypogees_vue.type_transect,
    trsc_especes_hypogees_vue.direction_suivie,
    trsc_especes_hypogees_vue.longueur_sur_terrain,
    trsc_especes_hypogees_vue.longueur_sur_logiciel,
    trsc_especes_hypogees_vue.remarques_transect,
    trsc_especes_hypogees_vue.aucune_obs,
    trsc_especes_hypogees_vue.visibilite,
    trsc_especes_hypogees_vue.vent,
    trsc_especes_hypogees_vue.couverture_nuageuse,
    trsc_especes_hypogees_vue.precipitations,
    trsc_especes_hypogees_vue.couverture_neigeuse_au_sol,
    trsc_especes_hypogees_vue.pk_tb_leve_gps_metadonnees,
    trsc_especes_hypogees_vue.id_pt_gps,
    trsc_especes_hypogees_vue.num_leve_gps,
    trsc_especes_hypogees_vue.heure_leve,
    trsc_especes_hypogees_vue.latitude,
    trsc_especes_hypogees_vue.longitude,
    trsc_especes_hypogees_vue.the_geom,
    trsc_especes_hypogees_vue.remarques_leve_gps,
    trsc_especes_hypogees_vue.origine_coordonnees,
    trsc_especes_hypogees_vue.pk_trsc_especes_hypogees,
    trsc_especes_hypogees_vue.fk_espece_vernaculaire,
    trsc_especes_hypogees_vue.distance_perpendiculaire_d,
    trsc_especes_hypogees_vue.signe_occupation_1,
    trsc_especes_hypogees_vue.signe_occupation_2,
    trsc_especes_hypogees_vue.signe_occupation_3,
    trsc_especes_hypogees_vue.reponse_a_la_repasse,
    trsc_especes_hypogees_vue.verif_occupation_terrier,
    trsc_especes_hypogees_vue.verif_si_oeuf,
    trsc_especes_hypogees_vue.vegetation,
    trsc_especes_hypogees_vue.remarques,
    trsc_especes_hypogees_vue.fk_observateur
   FROM ( SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            tb_manipe_metadonnees.saison,
            trsc_especes_hypogees.date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            trsc_transect_metadonnees.nom_transect,
            trsc_transect_metadonnees.date_premier_parcours,
            tb_manipe_metadonnees.fk_zone_geo,
            trsc_transect_parcours.pk_trsc_transect_parcours,
            trsc_transect_parcours.fk_numero_transect,
            trsc_transect_metadonnees.type_transect,
            trsc_transect_parcours.direction_suivie,
            trsc_transect_parcours.longueur_sur_terrain,
            trsc_transect_metadonnees.longueur_theorique_transect AS longueur_sur_logiciel,
            trsc_transect_parcours.remarques_transect,
            trsc_transect_parcours.aucune_obs,
            tb_meteo.visibilite,
            tb_meteo.vent,
            tb_meteo.couverture_nuageuse,
            tb_meteo.precipitations,
            tb_meteo.couverture_neigeuse_au_sol,
            tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees,
            tb_leve_gps_metadonnees.id_pt_gps,
            tb_leve_gps_metadonnees.num_leve_gps,
            tb_leve_gps_metadonnees.heure_leve,
            tb_leve_gps_metadonnees.latitude,
            tb_leve_gps_metadonnees.longitude,
            tb_leve_gps_metadonnees.the_geom,
            tb_leve_gps_metadonnees.remarques AS remarques_leve_gps,
            tb_leve_gps_metadonnees.origine_coordonnees,
            trsc_especes_hypogees.pk_trsc_especes_hypogees,
            trsc_especes_hypogees.fk_espece_vernaculaire,
            trsc_especes_hypogees.distance_perpendiculaire_d,
            trsc_especes_hypogees.signe_occupation_1,
            trsc_especes_hypogees.signe_occupation_2,
            trsc_especes_hypogees.signe_occupation_3,
            trsc_especes_hypogees.reponse_a_la_repasse,
            trsc_especes_hypogees.verif_occupation_terrier,
            trsc_especes_hypogees.verif_si_oeuf,
            trsc_especes_hypogees.vegetation,
            trsc_especes_hypogees.remarques,
            trsc_transect_parcours.fk_observateur
           FROM (((((ornithologie.trsc_especes_hypogees
             LEFT JOIN ornithologie.trsc_transect_parcours ON (((trsc_transect_parcours.pk_trsc_transect_parcours)::text = (trsc_especes_hypogees.fk_trsc_transect_parcours)::text)))
             LEFT JOIN ornithologie.trsc_transect_metadonnees ON ((trsc_transect_metadonnees.pk_trsc_transect_metadonnees = trsc_transect_parcours.fk_numero_transect)))
             LEFT JOIN ornithologie.tb_leve_gps_metadonnees ON (((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (trsc_especes_hypogees.fk_code_leve_gps)::text)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (tb_leve_gps_metadonnees.fk_code_manipe)::text)))
             LEFT JOIN ornithologie.tb_meteo ON (((tb_meteo.pk_tb_meteo)::text = (tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text)))
        UNION
         SELECT tb_manipe_metadonnees.pk_tb_manipe_metadonnees,
            tb_manipe_metadonnees.date_manipe,
            tb_manipe_metadonnees.saison,
            NULL::date AS date_correction,
            tb_manipe_metadonnees.date_saisie_dans_bd,
            tb_manipe_metadonnees.ordi_saisie_donnee,
            tb_manipe_metadonnees.remarques_manipe,
            tb_manipe_metadonnees.district,
            tb_manipe_metadonnees.fk_site,
            tb_manipe_metadonnees.fk_site_arrivee,
            trsc_transect_metadonnees.nom_transect,
            trsc_transect_metadonnees.date_premier_parcours,
            tb_manipe_metadonnees.fk_zone_geo,
            trsc_transect_parcours.pk_trsc_transect_parcours,
            trsc_transect_parcours.fk_numero_transect,
            trsc_transect_metadonnees.type_transect,
            trsc_transect_parcours.direction_suivie,
            trsc_transect_parcours.longueur_sur_terrain,
            trsc_transect_metadonnees.longueur_theorique_transect AS longueur_sur_logiciel,
            trsc_transect_parcours.remarques_transect,
            trsc_transect_parcours.aucune_obs,
            tb_meteo.visibilite,
            tb_meteo.vent,
            tb_meteo.couverture_nuageuse,
            tb_meteo.precipitations,
            tb_meteo.couverture_neigeuse_au_sol,
            NULL::character varying AS pk_tb_leve_gps_metadonnees,
            NULL::character varying AS id_pt_gps,
            NULL::bigint AS num_leve_gps,
            NULL::time without time zone AS heure_leve,
            NULL::real AS latitude,
            NULL::real AS longitude,
            NULL::public.geometry AS the_geom,
            NULL::text AS remarques_leve_gps,
            NULL::character varying AS origine_coordonnees,
            NULL::character varying AS pk_trsc_especes_hypogees,
            NULL::character varying AS fk_espece_vernaculaire,
            NULL::real AS distance_perpendiculaire_d,
            NULL::character varying AS signe_occupation_1,
            NULL::character varying AS signe_occupation_2,
            NULL::character varying AS signe_occupation_3,
            NULL::character varying AS reponse_a_la_repasse,
            NULL::character varying AS verif_occupation_terrier,
            NULL::character varying AS verif_si_oeuf,
            NULL::character varying AS vegetation,
            NULL::text AS remarques,
            trsc_transect_parcours.fk_observateur
           FROM (((ornithologie.trsc_transect_parcours
             LEFT JOIN ornithologie.trsc_transect_metadonnees ON ((trsc_transect_metadonnees.pk_trsc_transect_metadonnees = trsc_transect_parcours.fk_numero_transect)))
             LEFT JOIN ornithologie.tb_manipe_metadonnees ON (((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (trsc_transect_parcours.fk_code_manipe)::text)))
             LEFT JOIN ornithologie.tb_meteo ON (((tb_meteo.pk_tb_meteo)::text = (tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text)))
          WHERE ((trsc_transect_parcours.aucune_obs = true) AND ((tb_manipe_metadonnees.fk_protocole)::text = 'trsc_especes_hypogees'::text))) trsc_especes_hypogees_vue;


ALTER TABLE vues_ornithologie.trsc_especes_hypogees_vue OWNER TO postgres;

SET search_path = bdd_especes_introduites_faune, pg_catalog;

--
-- TOC entry 3351 (class 2604 OID 30366)
-- Name: numero_observation; Type: DEFAULT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY obsopportuniste_donnees_presenceabsence ALTER COLUMN numero_observation SET DEFAULT nextval('obsopportuniste_donnees_presenceabsence_numero_observation_seq'::regclass);


SET search_path = demande_manipulation_especes, pg_catalog;

--
-- TOC entry 3335 (class 2604 OID 17806)
-- Name: numero_demande; Type: DEFAULT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY demande ALTER COLUMN numero_demande SET DEFAULT nextval('demande_numero_demande_seq'::regclass);


--
-- TOC entry 3336 (class 2604 OID 17822)
-- Name: pk_espece_demande; Type: DEFAULT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY espece_demande ALTER COLUMN pk_espece_demande SET DEFAULT nextval('espece_demande_pk_espece_demande_seq'::regclass);


SET search_path = donnees_carto, pg_catalog;

--
-- TOC entry 3338 (class 2604 OID 17900)
-- Name: gid; Type: DEFAULT; Schema: donnees_carto; Owner: postgres
--

ALTER TABLE ONLY contours_kerguelen ALTER COLUMN gid SET DEFAULT nextval('contours_kerguelen_gid_seq'::regclass);


--
-- TOC entry 3339 (class 2604 OID 17911)
-- Name: gid; Type: DEFAULT; Schema: donnees_carto; Owner: postgres
--

ALTER TABLE ONLY kerguelen_lacs ALTER COLUMN gid SET DEFAULT nextval('kerguelen_lacs_gid_seq'::regclass);


SET search_path = frequentations_autorisations_ams, pg_catalog;

--
-- TOC entry 3317 (class 2604 OID 17423)
-- Name: pk_debarquements_embarquements; Type: DEFAULT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY debarquements_embarquements ALTER COLUMN pk_debarquements_embarquements SET DEFAULT nextval('debarquements_embarquements_pk_debarquements_embarquements_seq'::regclass);


--
-- TOC entry 3318 (class 2604 OID 17424)
-- Name: code_equipier_sortie; Type: DEFAULT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie ALTER COLUMN code_equipier_sortie SET DEFAULT nextval('equipier_sortie_code_equipier_sortie_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 17425)
-- Name: numero; Type: DEFAULT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY equipiers ALTER COLUMN numero SET DEFAULT nextval('equipiers_numero_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 17426)
-- Name: code_presence; Type: DEFAULT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY presence ALTER COLUMN code_presence SET DEFAULT nextval('presence_code_presence_seq'::regclass);


--
-- TOC entry 3321 (class 2604 OID 17427)
-- Name: code_sortie; Type: DEFAULT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY sortie ALTER COLUMN code_sortie SET DEFAULT nextval('sortie_code_sortie_seq'::regclass);


--
-- TOC entry 3322 (class 2604 OID 17428)
-- Name: code_transit; Type: DEFAULT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY transit ALTER COLUMN code_transit SET DEFAULT nextval('transit_code_transit_seq'::regclass);


SET search_path = frequentations_autorisations_cro, pg_catalog;

--
-- TOC entry 3323 (class 2604 OID 17429)
-- Name: pk_debarquements_embarquements; Type: DEFAULT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY debarquements_embarquements ALTER COLUMN pk_debarquements_embarquements SET DEFAULT nextval('debarquements_embarquements_pk_debarquements_embarquements_seq'::regclass);


--
-- TOC entry 3324 (class 2604 OID 17430)
-- Name: code_equipier_sortie; Type: DEFAULT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie ALTER COLUMN code_equipier_sortie SET DEFAULT nextval('equipier_sortie_code_equipier_sortie_seq'::regclass);


--
-- TOC entry 3325 (class 2604 OID 17431)
-- Name: numero; Type: DEFAULT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY equipiers ALTER COLUMN numero SET DEFAULT nextval('equipiers_numero_seq'::regclass);


--
-- TOC entry 3326 (class 2604 OID 17432)
-- Name: code_presence; Type: DEFAULT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY presence ALTER COLUMN code_presence SET DEFAULT nextval('presence_code_presence_seq'::regclass);


--
-- TOC entry 3327 (class 2604 OID 17433)
-- Name: code_sortie; Type: DEFAULT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY sortie ALTER COLUMN code_sortie SET DEFAULT nextval('sortie_code_sortie_seq'::regclass);


--
-- TOC entry 3328 (class 2604 OID 17434)
-- Name: code_transit; Type: DEFAULT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY transit ALTER COLUMN code_transit SET DEFAULT nextval('transit_code_transit_seq'::regclass);


SET search_path = frequentations_autorisations_ker, pg_catalog;

--
-- TOC entry 3329 (class 2604 OID 17435)
-- Name: pk_debarquements_embarquements; Type: DEFAULT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY debarquements_embarquements ALTER COLUMN pk_debarquements_embarquements SET DEFAULT nextval('debarquements_embarquements_pk_debarquements_embarquements_seq'::regclass);


--
-- TOC entry 3330 (class 2604 OID 17436)
-- Name: code_equipier_sortie; Type: DEFAULT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie ALTER COLUMN code_equipier_sortie SET DEFAULT nextval('equipier_sortie_code_equipier_sortie_seq'::regclass);


--
-- TOC entry 3331 (class 2604 OID 17437)
-- Name: numero; Type: DEFAULT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY equipiers ALTER COLUMN numero SET DEFAULT nextval('equipiers_numero_seq'::regclass);


--
-- TOC entry 3332 (class 2604 OID 17438)
-- Name: code_presence; Type: DEFAULT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY presence ALTER COLUMN code_presence SET DEFAULT nextval('presence_code_presence_seq'::regclass);


--
-- TOC entry 3333 (class 2604 OID 17439)
-- Name: code_sortie; Type: DEFAULT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY sortie ALTER COLUMN code_sortie SET DEFAULT nextval('sortie_code_sortie_seq'::regclass);


--
-- TOC entry 3334 (class 2604 OID 17440)
-- Name: code_transit; Type: DEFAULT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY transit ALTER COLUMN code_transit SET DEFAULT nextval('transit_code_transit_seq'::regclass);


SET search_path = ornithologie, pg_catalog;

--
-- TOC entry 3342 (class 2604 OID 28968)
-- Name: numero_comptage_minmax; Type: DEFAULT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_minmax ALTER COLUMN numero_comptage_minmax SET DEFAULT nextval('cmtg_indiff_minmax_numero_comptage_minmax_seq'::regclass);


--
-- TOC entry 3343 (class 2604 OID 28969)
-- Name: numero_comptage_nids_oeufs_poussins; Type: DEFAULT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_nids_oeufs_poussins ALTER COLUMN numero_comptage_nids_oeufs_poussins SET DEFAULT nextval('cmtg_indiff_nids_oeufs_poussi_numero_comptage_nids_oeufs_po_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 28970)
-- Name: numero_comptage_precis; Type: DEFAULT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_precis ALTER COLUMN numero_comptage_precis SET DEFAULT nextval('cmtg_indiff_precis_numero_comptage_precis_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 28971)
-- Name: numero_observateur; Type: DEFAULT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_observateurs_leves_gps ALTER COLUMN numero_observateur SET DEFAULT nextval('tb_observateurs_leves_gps_numero_observateur_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 28972)
-- Name: pk_tb_traces_gps; Type: DEFAULT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_traces_gps ALTER COLUMN pk_tb_traces_gps SET DEFAULT nextval('tb_traces_gps_pk_tb_traces_gps_seq'::regclass);


--
-- TOC entry 3348 (class 2604 OID 28973)
-- Name: pk_trsc_transect_metadonnees; Type: DEFAULT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_transect_metadonnees ALTER COLUMN pk_trsc_transect_metadonnees SET DEFAULT nextval('trsc_transect_metadonnees_pk_trsc_transect_metadonnees_seq'::regclass);


SET search_path = phylica_amsterdam, pg_catalog;

--
-- TOC entry 3337 (class 2604 OID 17881)
-- Name: gid; Type: DEFAULT; Schema: phylica_amsterdam; Owner: postgres
--

ALTER TABLE ONLY contours_ams ALTER COLUMN gid SET DEFAULT nextval('contours_ams_gid_seq'::regclass);


--
-- TOC entry 3340 (class 2604 OID 27452)
-- Name: id_0; Type: DEFAULT; Schema: phylica_amsterdam; Owner: postgres
--

ALTER TABLE ONLY phylica_historique ALTER COLUMN id_0 SET DEFAULT nextval('phylica_historique_id_0_seq'::regclass);


SET search_path = bdd_especes_introduites_faune, pg_catalog;

--
-- TOC entry 3525 (class 2606 OID 30368)
-- Name: inventaire_piege_ligne_coordonnees_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inventaire_piege_ligne_coordonnees
    ADD CONSTRAINT inventaire_piege_ligne_coordonnees_pkey PRIMARY KEY (fk_inventaire_piege_pose);


--
-- TOC entry 3527 (class 2606 OID 30370)
-- Name: inventaire_piege_ponctuel_coordonnees_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inventaire_piege_ponctuel_coordonnees
    ADD CONSTRAINT inventaire_piege_ponctuel_coordonnees_pkey PRIMARY KEY (fk_inventaire_piege_pose);


--
-- TOC entry 3529 (class 2606 OID 30372)
-- Name: inventaire_piege_pose_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inventaire_piege_pose
    ADD CONSTRAINT inventaire_piege_pose_pkey PRIMARY KEY (pk_inventaire_piege_pose);


--
-- TOC entry 3531 (class 2606 OID 30374)
-- Name: inventaire_piege_releve_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inventaire_piege_releve
    ADD CONSTRAINT inventaire_piege_releve_pkey PRIMARY KEY (pk_inventaire_piege_releve);


--
-- TOC entry 3533 (class 2606 OID 30376)
-- Name: obsopportuniste_donnees_presenceabsence_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY obsopportuniste_donnees_presenceabsence
    ADD CONSTRAINT obsopportuniste_donnees_presenceabsence_pkey PRIMARY KEY (pk_obsopportuniste_donnees_presenceabsence);


--
-- TOC entry 3535 (class 2606 OID 30378)
-- Name: obsopportuniste_donnees_terrain_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY obsopportuniste_donnees_terrain
    ADD CONSTRAINT obsopportuniste_donnees_terrain_pkey PRIMARY KEY (pk_obsopportuniste_donnees_terrain);


--
-- TOC entry 3537 (class 2606 OID 30380)
-- Name: tb_especes_introduites_pkey; Type: CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_especes_introduites
    ADD CONSTRAINT tb_especes_introduites_pkey PRIMARY KEY (pk_espece_vernaculaire);


SET search_path = demande_manipulation_especes, pg_catalog;

--
-- TOC entry 3431 (class 2606 OID 17842)
-- Name: autorisation_demande_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autorisation_demande
    ADD CONSTRAINT autorisation_demande_pkey PRIMARY KEY (fk_numero_demande);


--
-- TOC entry 3427 (class 2606 OID 17811)
-- Name: demande_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY demande
    ADD CONSTRAINT demande_pkey PRIMARY KEY (numero_demande);


--
-- TOC entry 3415 (class 2606 OID 17758)
-- Name: demandeur_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY demandeur
    ADD CONSTRAINT demandeur_pkey PRIMARY KEY (nom);


--
-- TOC entry 3429 (class 2606 OID 17824)
-- Name: espece_demande_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY espece_demande
    ADD CONSTRAINT espece_demande_pkey PRIMARY KEY (pk_espece_demande);


--
-- TOC entry 3425 (class 2606 OID 17800)
-- Name: especes_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY especes
    ADD CONSTRAINT especes_pkey PRIMARY KEY (nom_commun);


--
-- TOC entry 3417 (class 2606 OID 17766)
-- Name: programme_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programme
    ADD CONSTRAINT programme_pkey PRIMARY KEY (numero);


--
-- TOC entry 3423 (class 2606 OID 17795)
-- Name: sites_amsterdam_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sites_amsterdam
    ADD CONSTRAINT sites_amsterdam_pkey PRIMARY KEY (nom_site);


--
-- TOC entry 3421 (class 2606 OID 17787)
-- Name: sites_crozet_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sites_crozet
    ADD CONSTRAINT sites_crozet_pkey PRIMARY KEY (nom_site);


--
-- TOC entry 3419 (class 2606 OID 17779)
-- Name: sites_kerguelen_pkey; Type: CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sites_kerguelen
    ADD CONSTRAINT sites_kerguelen_pkey PRIMARY KEY (nom_site);


SET search_path = donnees_carto, pg_catalog;

--
-- TOC entry 3439 (class 2606 OID 17905)
-- Name: contours_kerguelen_pkey; Type: CONSTRAINT; Schema: donnees_carto; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contours_kerguelen
    ADD CONSTRAINT contours_kerguelen_pkey PRIMARY KEY (gid);


--
-- TOC entry 3441 (class 2606 OID 17916)
-- Name: kerguelen_lacs_pkey; Type: CONSTRAINT; Schema: donnees_carto; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kerguelen_lacs
    ADD CONSTRAINT kerguelen_lacs_pkey PRIMARY KEY (gid);


--
-- TOC entry 3523 (class 2606 OID 29923)
-- Name: toponymie_kerguelen_pkey; Type: CONSTRAINT; Schema: donnees_carto; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY toponymie_kerguelen
    ADD CONSTRAINT toponymie_kerguelen_pkey PRIMARY KEY (pk_nom_site);


SET search_path = frequentations_autorisations_ams, pg_catalog;

--
-- TOC entry 3355 (class 2606 OID 17475)
-- Name: autorisations_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_pkey PRIMARY KEY (programme, site);


--
-- TOC entry 3357 (class 2606 OID 17477)
-- Name: debarquements_embarquements_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY debarquements_embarquements
    ADD CONSTRAINT debarquements_embarquements_pkey PRIMARY KEY (pk_debarquements_embarquements);


--
-- TOC entry 3359 (class 2606 OID 17479)
-- Name: equipier_sortie_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_pkey PRIMARY KEY (code_equipier_sortie);


--
-- TOC entry 3361 (class 2606 OID 17481)
-- Name: equipiers_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipiers
    ADD CONSTRAINT equipiers_pkey PRIMARY KEY (code_equipier);


--
-- TOC entry 3363 (class 2606 OID 17483)
-- Name: presence_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_pkey PRIMARY KEY (code_presence);


--
-- TOC entry 3365 (class 2606 OID 17485)
-- Name: programmes_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programmes
    ADD CONSTRAINT programmes_pkey PRIMARY KEY (code_programme);


--
-- TOC entry 3369 (class 2606 OID 17487)
-- Name: sortie_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sortie
    ADD CONSTRAINT sortie_pkey PRIMARY KEY (code_sortie);


--
-- TOC entry 3371 (class 2606 OID 17489)
-- Name: transit_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_pkey PRIMARY KEY (code_transit);


--
-- TOC entry 3367 (class 2606 OID 17491)
-- Name: zones_sites_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zones_sites
    ADD CONSTRAINT zones_sites_pkey PRIMARY KEY (code_zone_site);


--
-- TOC entry 3373 (class 2606 OID 17493)
-- Name: zones_transitees_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_pkey PRIMARY KEY (code_transit, zone_transitee);


SET search_path = frequentations_autorisations_cro, pg_catalog;

--
-- TOC entry 3375 (class 2606 OID 17495)
-- Name: autorisations_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_pkey PRIMARY KEY (programme, site);


--
-- TOC entry 3377 (class 2606 OID 17497)
-- Name: debarquements_embarquements_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY debarquements_embarquements
    ADD CONSTRAINT debarquements_embarquements_pkey PRIMARY KEY (pk_debarquements_embarquements);


--
-- TOC entry 3379 (class 2606 OID 17499)
-- Name: equipier_sortie_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_pkey PRIMARY KEY (code_equipier_sortie);


--
-- TOC entry 3381 (class 2606 OID 17501)
-- Name: equipiers_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipiers
    ADD CONSTRAINT equipiers_pkey PRIMARY KEY (code_equipier);


--
-- TOC entry 3383 (class 2606 OID 17503)
-- Name: presence_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_pkey PRIMARY KEY (code_presence);


--
-- TOC entry 3385 (class 2606 OID 17505)
-- Name: programmes_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programmes
    ADD CONSTRAINT programmes_pkey PRIMARY KEY (code_programme);


--
-- TOC entry 3389 (class 2606 OID 17507)
-- Name: sortie_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sortie
    ADD CONSTRAINT sortie_pkey PRIMARY KEY (code_sortie);


--
-- TOC entry 3391 (class 2606 OID 17509)
-- Name: transit_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_pkey PRIMARY KEY (code_transit);


--
-- TOC entry 3387 (class 2606 OID 17511)
-- Name: zones_sites_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zones_sites
    ADD CONSTRAINT zones_sites_pkey PRIMARY KEY (code_zone_site);


--
-- TOC entry 3393 (class 2606 OID 17513)
-- Name: zones_transitees_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_pkey PRIMARY KEY (code_transit, zone_transitee);


SET search_path = frequentations_autorisations_ker, pg_catalog;

--
-- TOC entry 3395 (class 2606 OID 17515)
-- Name: autorisations_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_pkey PRIMARY KEY (programme, site);


--
-- TOC entry 3397 (class 2606 OID 17517)
-- Name: debarquements_embarquements_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY debarquements_embarquements
    ADD CONSTRAINT debarquements_embarquements_pkey PRIMARY KEY (pk_debarquements_embarquements);


--
-- TOC entry 3399 (class 2606 OID 17519)
-- Name: equipier_sortie_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_pkey PRIMARY KEY (code_equipier_sortie);


--
-- TOC entry 3401 (class 2606 OID 17521)
-- Name: equipiers_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipiers
    ADD CONSTRAINT equipiers_pkey PRIMARY KEY (code_equipier);


--
-- TOC entry 3403 (class 2606 OID 17523)
-- Name: presence_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_pkey PRIMARY KEY (code_presence);


--
-- TOC entry 3405 (class 2606 OID 17525)
-- Name: programmes_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programmes
    ADD CONSTRAINT programmes_pkey PRIMARY KEY (code_programme);


--
-- TOC entry 3409 (class 2606 OID 17527)
-- Name: sortie_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sortie
    ADD CONSTRAINT sortie_pkey PRIMARY KEY (code_sortie);


--
-- TOC entry 3411 (class 2606 OID 17529)
-- Name: transit_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_pkey PRIMARY KEY (code_transit);


--
-- TOC entry 3407 (class 2606 OID 17531)
-- Name: zones_sites_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zones_sites
    ADD CONSTRAINT zones_sites_pkey PRIMARY KEY (code_zone_site);


--
-- TOC entry 3413 (class 2606 OID 17533)
-- Name: zones_transitees_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_pkey PRIMARY KEY (code_transit, zone_transitee);


SET search_path = ornithologie, pg_catalog;

--
-- TOC entry 3445 (class 2606 OID 28977)
-- Name: cmtg_indiff_classe_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_indiff_classe
    ADD CONSTRAINT cmtg_indiff_classe_pkey PRIMARY KEY (fk_code_metadonnees_comptage_classe);


--
-- TOC entry 3447 (class 2606 OID 28979)
-- Name: cmtg_indiff_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_indiff_metadonnees
    ADD CONSTRAINT cmtg_indiff_metadonnees_pkey PRIMARY KEY (pk_cmtg_indiff_metadonnees);


--
-- TOC entry 3449 (class 2606 OID 28981)
-- Name: cmtg_indiff_minmax_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_indiff_minmax
    ADD CONSTRAINT cmtg_indiff_minmax_pkey PRIMARY KEY (pk_cmtg_indiff_minmax);


--
-- TOC entry 3451 (class 2606 OID 28983)
-- Name: cmtg_indiff_nids_oeufs_poussins_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_indiff_nids_oeufs_poussins
    ADD CONSTRAINT cmtg_indiff_nids_oeufs_poussins_pkey PRIMARY KEY (pk_cmtg_indiff_nids_oeufs_poussins);


--
-- TOC entry 3453 (class 2606 OID 28985)
-- Name: cmtg_indiff_precis_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_indiff_precis
    ADD CONSTRAINT cmtg_indiff_precis_pkey PRIMARY KEY (pk_cmtg_indiff_precis);


--
-- TOC entry 3455 (class 2606 OID 28987)
-- Name: cmtg_indiff_territoire_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_indiff_territoire
    ADD CONSTRAINT cmtg_indiff_territoire_pkey PRIMARY KEY (fk_code_metadonnees_comptage_territoire);


--
-- TOC entry 3459 (class 2606 OID 28989)
-- Name: cmtg_mam_marins_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_mam_marins_metadonnees
    ADD CONSTRAINT cmtg_mam_marins_metadonnees_pkey PRIMARY KEY (pk_cmtg_mam_marins_metadonnees);


--
-- TOC entry 3457 (class 2606 OID 28991)
-- Name: cmtg_mam_marins_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_mam_marins
    ADD CONSTRAINT cmtg_mam_marins_pkey PRIMARY KEY (pk_cmtg_mam_marins);


--
-- TOC entry 3463 (class 2606 OID 28993)
-- Name: cmtg_oiseaux_marins_colonies_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_oiseaux_marins_colonies_metadonnees
    ADD CONSTRAINT cmtg_oiseaux_marins_colonies_metadonnees_pkey PRIMARY KEY (pk_cmtg_oiseaux_marins_colonies_metadonnees);


--
-- TOC entry 3461 (class 2606 OID 28995)
-- Name: cmtg_oiseaux_marins_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_oiseaux_marins
    ADD CONSTRAINT cmtg_oiseaux_marins_pkey PRIMARY KEY (pk_cmtg_oiseaux_marins);


--
-- TOC entry 3465 (class 2606 OID 28997)
-- Name: demos_bilan_repro_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY demos_bilan_repro
    ADD CONSTRAINT demos_bilan_repro_pkey PRIMARY KEY (pk_demos_bilan_repro);


--
-- TOC entry 3467 (class 2606 OID 28999)
-- Name: demos_comptage_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY demos_comptage
    ADD CONSTRAINT demos_comptage_pkey PRIMARY KEY (pk_demos_comptage);


--
-- TOC entry 3469 (class 2606 OID 29001)
-- Name: demos_indices_occup_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY demos_indices_occup
    ADD CONSTRAINT demos_indices_occup_pkey PRIMARY KEY (pk_demos_indices_occup);


--
-- TOC entry 3471 (class 2606 OID 29003)
-- Name: demos_terriers_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY demos_terriers_metadonnees
    ADD CONSTRAINT demos_terriers_metadonnees_pkey PRIMARY KEY (pk_demos_terriers_metadonnees);


--
-- TOC entry 3475 (class 2606 OID 29005)
-- Name: pc_permanent_changement_veget_fk_numero_piquet_date_mise_a__key; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pc_permanent_changement_vegetation
    ADD CONSTRAINT pc_permanent_changement_veget_fk_numero_piquet_date_mise_a__key UNIQUE (fk_numero_piquet, date_mise_a_jour_vegetation);


--
-- TOC entry 3477 (class 2606 OID 29007)
-- Name: pc_permanent_changement_vegetation_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pc_permanent_changement_vegetation
    ADD CONSTRAINT pc_permanent_changement_vegetation_pkey PRIMARY KEY (pk_pc_permanent_changement_vegetation);


--
-- TOC entry 3479 (class 2606 OID 29009)
-- Name: pc_permanent_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pc_permanent_metadonnees
    ADD CONSTRAINT pc_permanent_metadonnees_pkey PRIMARY KEY (pk_pc_permanent_metadonnees);


--
-- TOC entry 3473 (class 2606 OID 29011)
-- Name: pc_permanent_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pc_permanent
    ADD CONSTRAINT pc_permanent_pkey PRIMARY KEY (pk_pc_permanent);


--
-- TOC entry 3481 (class 2606 OID 29013)
-- Name: pc_surtransect_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pc_surtransect
    ADD CONSTRAINT pc_surtransect_pkey PRIMARY KEY (pk_pc_surtransect);


--
-- TOC entry 3539 (class 2606 OID 30455)
-- Name: reprise_bague_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reprise_bague
    ADD CONSTRAINT reprise_bague_pkey PRIMARY KEY (pk_reprise_bague);


--
-- TOC entry 3483 (class 2606 OID 29015)
-- Name: srep_colonies_coordonnees_fk_srep_colonies_metadonnees_date_key; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY srep_colonies_coordonnees
    ADD CONSTRAINT srep_colonies_coordonnees_fk_srep_colonies_metadonnees_date_key UNIQUE (fk_srep_colonies_metadonnees, date_leve);


--
-- TOC entry 3485 (class 2606 OID 29017)
-- Name: srep_colonies_coordonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY srep_colonies_coordonnees
    ADD CONSTRAINT srep_colonies_coordonnees_pkey PRIMARY KEY (pk_srep_colonies_coordonnees);


--
-- TOC entry 3487 (class 2606 OID 29019)
-- Name: srep_colonies_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY srep_colonies_metadonnees
    ADD CONSTRAINT srep_colonies_metadonnees_pkey PRIMARY KEY (pk_srep_colonies_metadonnees);


--
-- TOC entry 3489 (class 2606 OID 29021)
-- Name: srep_comptage_fk_code_manipe_fk_srep_colonies_metadonnees_n_key; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY srep_comptage
    ADD CONSTRAINT srep_comptage_fk_code_manipe_fk_srep_colonies_metadonnees_n_key UNIQUE (fk_code_manipe, fk_srep_colonies_metadonnees, numero_passage, type_effectif);


--
-- TOC entry 3491 (class 2606 OID 29023)
-- Name: srep_comptage_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY srep_comptage
    ADD CONSTRAINT srep_comptage_pkey PRIMARY KEY (pk_srep_comptage);


--
-- TOC entry 3493 (class 2606 OID 29025)
-- Name: tb_espece_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_espece
    ADD CONSTRAINT tb_espece_pkey PRIMARY KEY (pk_tb_espece);


--
-- TOC entry 3495 (class 2606 OID 29027)
-- Name: tb_leve_gps_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_leve_gps_metadonnees
    ADD CONSTRAINT tb_leve_gps_metadonnees_pkey PRIMARY KEY (pk_tb_leve_gps_metadonnees);


--
-- TOC entry 3497 (class 2606 OID 29029)
-- Name: tb_manipe_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_manipe_metadonnees
    ADD CONSTRAINT tb_manipe_metadonnees_pkey PRIMARY KEY (pk_tb_manipe_metadonnees);


--
-- TOC entry 3499 (class 2606 OID 29031)
-- Name: tb_meteo_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_meteo
    ADD CONSTRAINT tb_meteo_pkey PRIMARY KEY (pk_tb_meteo);


--
-- TOC entry 3501 (class 2606 OID 29033)
-- Name: tb_observateur_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_observateur
    ADD CONSTRAINT tb_observateur_pkey PRIMARY KEY (pk_tb_observateur);


--
-- TOC entry 3503 (class 2606 OID 29035)
-- Name: tb_observateurs_leves_gps_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_observateurs_leves_gps
    ADD CONSTRAINT tb_observateurs_leves_gps_pkey PRIMARY KEY (pk_tb_observateurs_leves_gps);


--
-- TOC entry 3505 (class 2606 OID 29037)
-- Name: tb_observateurs_manipes_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_observateurs_manipes
    ADD CONSTRAINT tb_observateurs_manipes_pkey PRIMARY KEY (fk_observateur, fk_code_manipe);


--
-- TOC entry 3507 (class 2606 OID 29039)
-- Name: tb_protocoles_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_protocoles_metadonnees
    ADD CONSTRAINT tb_protocoles_metadonnees_pkey PRIMARY KEY (pk_tb_protocoles_metadonnees);


--
-- TOC entry 3509 (class 2606 OID 29041)
-- Name: tb_traces_gps_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_traces_gps
    ADD CONSTRAINT tb_traces_gps_pkey PRIMARY KEY (pk_tb_traces_gps);


--
-- TOC entry 3511 (class 2606 OID 29043)
-- Name: tb_zone_geo_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_zone_geo
    ADD CONSTRAINT tb_zone_geo_pkey PRIMARY KEY (pk_tb_zone_geo);


--
-- TOC entry 3513 (class 2606 OID 29045)
-- Name: trsc_especes_epigees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trsc_especes_epigees
    ADD CONSTRAINT trsc_especes_epigees_pkey PRIMARY KEY (pk_trsc_especes_epigees);


--
-- TOC entry 3515 (class 2606 OID 29047)
-- Name: trsc_especes_hypogees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trsc_especes_hypogees
    ADD CONSTRAINT trsc_especes_hypogees_pkey PRIMARY KEY (pk_trsc_especes_hypogees);


--
-- TOC entry 3517 (class 2606 OID 29049)
-- Name: trsc_transect_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trsc_transect_metadonnees
    ADD CONSTRAINT trsc_transect_metadonnees_pkey PRIMARY KEY (pk_trsc_transect_metadonnees);


--
-- TOC entry 3519 (class 2606 OID 29051)
-- Name: trsc_transect_parcours_fk_code_manipe_fk_numero_transect_key; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trsc_transect_parcours
    ADD CONSTRAINT trsc_transect_parcours_fk_code_manipe_fk_numero_transect_key UNIQUE (fk_code_manipe, fk_numero_transect);


--
-- TOC entry 3521 (class 2606 OID 29053)
-- Name: trsc_transect_parcours_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trsc_transect_parcours
    ADD CONSTRAINT trsc_transect_parcours_pkey PRIMARY KEY (pk_trsc_transect_parcours);


SET search_path = phylica_amsterdam, pg_catalog;

--
-- TOC entry 3437 (class 2606 OID 17886)
-- Name: contours_ams_pkey; Type: CONSTRAINT; Schema: phylica_amsterdam; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contours_ams
    ADD CONSTRAINT contours_ams_pkey PRIMARY KEY (gid);


--
-- TOC entry 3433 (class 2606 OID 17857)
-- Name: identite_pkey; Type: CONSTRAINT; Schema: phylica_amsterdam; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY identite
    ADD CONSTRAINT identite_pkey PRIMARY KEY (numero_plant);


--
-- TOC entry 3443 (class 2606 OID 27454)
-- Name: phylica_historique_pkey; Type: CONSTRAINT; Schema: phylica_amsterdam; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY phylica_historique
    ADD CONSTRAINT phylica_historique_pkey PRIMARY KEY (id_0);


--
-- TOC entry 3435 (class 2606 OID 17865)
-- Name: suivi_croissance_pkey; Type: CONSTRAINT; Schema: phylica_amsterdam; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY suivi_croissance
    ADD CONSTRAINT suivi_croissance_pkey PRIMARY KEY (pk_suivi_croissance);


SET search_path = public, pg_catalog;

--
-- TOC entry 3353 (class 2606 OID 16660)
-- Name: spatial_ref_sys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spatial_ref_sys
    ADD CONSTRAINT spatial_ref_sys_pkey PRIMARY KEY (srid);


--
-- TOC entry 3831 (class 2618 OID 17083)
-- Name: geometry_columns_delete; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_delete AS
    ON DELETE TO geometry_columns DO INSTEAD NOTHING;


--
-- TOC entry 3829 (class 2618 OID 17081)
-- Name: geometry_columns_insert; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_insert AS
    ON INSERT TO geometry_columns DO INSTEAD NOTHING;


--
-- TOC entry 3830 (class 2618 OID 17082)
-- Name: geometry_columns_update; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_update AS
    ON UPDATE TO geometry_columns DO INSTEAD NOTHING;


SET search_path = vues_ornithologie, pg_catalog;

--
-- TOC entry 3882 (class 2618 OID 30073)
-- Name: cmtg_classe_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_classe_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_classe SET classe = new.classe
  WHERE ((cmtg_indiff_classe.fk_code_metadonnees_comptage_classe)::text = (new.fk_code_metadonnees_comptage_classe)::text);


--
-- TOC entry 3883 (class 2618 OID 30076)
-- Name: cmtg_indiff_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_indiff_delete AS
    ON DELETE TO cmtg_indiff_vue DO INSTEAD  DELETE FROM ornithologie.cmtg_indiff_metadonnees
  WHERE ((cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees)::text = (old.pk_cmtg_indiff_metadonnees)::text);


--
-- TOC entry 3884 (class 2618 OID 30077)
-- Name: cmtg_indiff_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_indiff_metadonnees_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_metadonnees SET fk_espece_vernaculaire = new.fk_espece_vernaculaire, type_comptage = new.type_comptage, lieu_comptage = new.lieu_comptage, comptage_jumelle = new.comptage_jumelle, comportements = new.comportements, contacts_avec_espece = new.contacts_avec_espece, contacts_avec_espece_2 = new.contacts_avec_espece_2, precision_coordonnees = new.precision_coordonnees, remarques = new.remarques
  WHERE ((cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees)::text = (new.pk_cmtg_indiff_metadonnees)::text);


--
-- TOC entry 3885 (class 2618 OID 30078)
-- Name: cmtg_mam_marins_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_mam_marins_delete AS
    ON DELETE TO cmtg_mam_marins_vue DO INSTEAD  DELETE FROM ornithologie.cmtg_mam_marins_metadonnees
  WHERE ((cmtg_mam_marins_metadonnees.pk_cmtg_mam_marins_metadonnees)::text = (old.pk_cmtg_mam_marins_metadonnees)::text);


--
-- TOC entry 3886 (class 2618 OID 30079)
-- Name: cmtg_mam_marins_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_mam_marins_metadonnees_update AS
    ON UPDATE TO cmtg_mam_marins_vue DO INSTEAD  UPDATE ornithologie.cmtg_mam_marins_metadonnees SET lat_depart = new.lat_depart, long_depart = new.long_depart, lat_fin = new.lat_fin, long_fin = new.long_fin, remarques = new.remarques
  WHERE ((cmtg_mam_marins_metadonnees.pk_cmtg_mam_marins_metadonnees)::text = (new.pk_cmtg_mam_marins_metadonnees)::text);


--
-- TOC entry 3887 (class 2618 OID 30080)
-- Name: cmtg_mam_marins_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_mam_marins_update AS
    ON UPDATE TO cmtg_mam_marins_vue DO INSTEAD  UPDATE ornithologie.cmtg_mam_marins SET type_effectif = new.type_effectif, comptage_1 = new.comptage_1, comptage_2 = new.comptage_2, comptage_3 = new.comptage_3, comptage_4 = new.comptage_4, moyenne_comptages = new.moyenne_comptages, date_correction = new.date_correction
  WHERE ((cmtg_mam_marins.pk_cmtg_mam_marins)::text = (new.pk_cmtg_mam_marins)::text);


--
-- TOC entry 3888 (class 2618 OID 30081)
-- Name: cmtg_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_metadonnees_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_metadonnees SET remarques = new.remarques, date_correction = new.date_correction
  WHERE ((cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees)::text = (new.pk_cmtg_indiff_metadonnees)::text);


--
-- TOC entry 3889 (class 2618 OID 30082)
-- Name: cmtg_minmax_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_minmax_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_minmax SET minimum = new.minimum, maximum = new.maximum, type_effectif = new.type_effectif_cmtg_minmax
  WHERE ((cmtg_indiff_minmax.pk_cmtg_indiff_minmax)::text = (new.pk_cmtg_indiff_minmax)::text);


--
-- TOC entry 3890 (class 2618 OID 30083)
-- Name: cmtg_nids_oeufs_poussins_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_nids_oeufs_poussins_delete AS
    ON DELETE TO cmtg_indiff_vue DO INSTEAD  DELETE FROM ornithologie.cmtg_indiff_nids_oeufs_poussins
  WHERE ((cmtg_indiff_nids_oeufs_poussins.pk_cmtg_indiff_nids_oeufs_poussins)::text = (old.pk_cmtg_indiff_nids_oeufs_poussins)::text);


--
-- TOC entry 3891 (class 2618 OID 30084)
-- Name: cmtg_nids_oeufs_poussins_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_nids_oeufs_poussins_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_nids_oeufs_poussins SET nb_oeufs = new.nb_oeufs, nb_poussins = new.nb_poussins
  WHERE ((cmtg_indiff_nids_oeufs_poussins.pk_cmtg_indiff_nids_oeufs_poussins)::text = (new.pk_cmtg_indiff_nids_oeufs_poussins)::text);


--
-- TOC entry 3892 (class 2618 OID 30085)
-- Name: cmtg_oiseaux_marins_coordonnees_colonies_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_oiseaux_marins_coordonnees_colonies_update AS
    ON UPDATE TO cmtg_oiseaux_marins_vue DO INSTEAD  UPDATE ornithologie.cmtg_oiseaux_marins_colonies_metadonnees SET latitude = new.latitude, longitude = new.longitude, fk_espece_vernaculaire = new.fk_espece_vernaculaire
  WHERE ((cmtg_oiseaux_marins_colonies_metadonnees.pk_cmtg_oiseaux_marins_colonies_metadonnees)::text = (new.pk_cmtg_oiseaux_marins_colonies_metadonnees)::text);


--
-- TOC entry 3893 (class 2618 OID 30086)
-- Name: cmtg_oiseaux_marins_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_oiseaux_marins_delete AS
    ON DELETE TO cmtg_oiseaux_marins_vue DO INSTEAD  DELETE FROM ornithologie.cmtg_oiseaux_marins
  WHERE ((cmtg_oiseaux_marins.pk_cmtg_oiseaux_marins)::text = (old.pk_cmtg_oiseaux_marins)::text);


--
-- TOC entry 3894 (class 2618 OID 30087)
-- Name: cmtg_oiseaux_marins_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_oiseaux_marins_update AS
    ON UPDATE TO cmtg_oiseaux_marins_vue DO INSTEAD  UPDATE ornithologie.cmtg_oiseaux_marins SET type_effectif = new.type_effectif, comptage_1_envol = new.comptage_1_envol, comptage_2_envol = new.comptage_2_envol, comptage_3_envol = new.comptage_3_envol, comptage_4_envol = new.comptage_4_envol, comptage_1_adistance = new.comptage_1_adistance, comptage_2_adistance = new.comptage_2_adistance, comptage_3_adistance = new.comptage_3_adistance, comptage_4_adistance = new.comptage_4_adistance, moyenne_comptages_envol = new.moyenne_comptages_envol, moyenne_comptages_adistance = new.moyenne_comptages_adistance, date_correction = new.date_correction, saison = new.saison, numero_passage = new.numero_passage, comptage_en_vol = new.comptage_en_vol, comptage_a_distance = new.comptage_a_distance, rien_vu_lors_du_passage = new.rien_vu_lors_du_passage, remarques = new.remarques
  WHERE ((cmtg_oiseaux_marins.pk_cmtg_oiseaux_marins)::text = (new.pk_cmtg_oiseaux_marins)::text);


--
-- TOC entry 3895 (class 2618 OID 30089)
-- Name: cmtg_precis_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_precis_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_precis SET comptage_1 = new.comptage_1, comptage_2 = new.comptage_2, comptage_3 = new.comptage_3, comptage_4 = new.comptage_4, type_effectif = new.type_effectif_cmtg_precis
  WHERE ((cmtg_indiff_precis.pk_cmtg_indiff_precis)::text = (new.pk_cmtg_indiff_precis)::text);


--
-- TOC entry 3896 (class 2618 OID 30090)
-- Name: cmtg_territoire_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_territoire_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_territoire SET nb_territoires = new.nb_territoires
  WHERE ((cmtg_indiff_territoire.fk_code_metadonnees_comptage_territoire)::text = (new.fk_code_metadonnees_comptage_territoire)::text);


--
-- TOC entry 3897 (class 2618 OID 30091)
-- Name: demos_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE demos_delete AS
    ON DELETE TO demos_vue DO INSTEAD  DELETE FROM ornithologie.demos_comptage
  WHERE ((demos_comptage.pk_demos_comptage)::text = (old.pk_demos_comptage)::text);


--
-- TOC entry 3898 (class 2618 OID 30092)
-- Name: demos_indices_occup_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE demos_indices_occup_delete AS
    ON DELETE TO demos_vue DO INSTEAD  DELETE FROM ornithologie.demos_indices_occup
  WHERE ((demos_indices_occup.pk_demos_indices_occup)::text = (old.pk_demos_indices_occup)::text);


--
-- TOC entry 3899 (class 2618 OID 30093)
-- Name: demos_indices_occup_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE demos_indices_occup_update AS
    ON UPDATE TO demos_vue DO INSTEAD  UPDATE ornithologie.demos_indices_occup SET indices_occupation_1 = new.indices_occupation_1, indices_occupation_2 = new.indices_occupation_2, indices_occupation_3 = new.indices_occupation_3
  WHERE ((demos_indices_occup.pk_demos_indices_occup)::text = (new.pk_demos_indices_occup)::text);


--
-- TOC entry 3900 (class 2618 OID 30094)
-- Name: demos_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE demos_update AS
    ON UPDATE TO demos_vue DO INSTEAD  UPDATE ornithologie.demos_comptage SET reponse_a_la_repasse = new.reponse_a_la_repasse, presence_dans_terrier = new.presence_dans_terrier, remarques = new.remarques, date_correction = new.date_correction, saison = new.saison, numero_passage = new.numero_passage
  WHERE ((demos_comptage.pk_demos_comptage)::text = (new.pk_demos_comptage)::text);


--
-- TOC entry 3901 (class 2618 OID 30095)
-- Name: leve_gps_metadonnees_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE leve_gps_metadonnees_delete AS
    ON DELETE TO tb_leve_gps_metadonnees_vue DO INSTEAD  DELETE FROM ornithologie.tb_leve_gps_metadonnees
  WHERE ((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (old.pk_tb_leve_gps_metadonnees)::text);


--
-- TOC entry 3902 (class 2618 OID 30096)
-- Name: leve_gps_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE leve_gps_metadonnees_update AS
    ON UPDATE TO tb_leve_gps_metadonnees_vue DO INSTEAD  UPDATE ornithologie.tb_leve_gps_metadonnees SET heure_leve = new.heure_leve, numero_gps = new.numero_gps, id_pt_gps = new.id_pt_gps, latitude = new.latitude, longitude = new.longitude, origine_coordonnees = new.origine_coordonnees, remarques = new.remarques
  WHERE ((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (new.pk_tb_leve_gps_metadonnees)::text);


--
-- TOC entry 3903 (class 2618 OID 30097)
-- Name: observateurs_pointgps_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE observateurs_pointgps_delete AS
    ON DELETE TO observateurs_pointgps_vue DO INSTEAD  DELETE FROM ornithologie.tb_observateurs_leves_gps
  WHERE ((tb_observateurs_leves_gps.pk_tb_observateurs_leves_gps)::text = (old.pk_tb_observateurs_leves_gps)::text);


--
-- TOC entry 3904 (class 2618 OID 30098)
-- Name: observateurs_pointgps_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE observateurs_pointgps_update AS
    ON UPDATE TO observateurs_pointgps_vue DO INSTEAD  UPDATE ornithologie.tb_observateurs_leves_gps SET fk_observateur = new.fk_observateur
  WHERE ((tb_observateurs_leves_gps.pk_tb_observateurs_leves_gps)::text = (new.pk_tb_observateurs_leves_gps)::text);


--
-- TOC entry 3905 (class 2618 OID 30099)
-- Name: pc_permanent_changement_vegetation_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE pc_permanent_changement_vegetation_update AS
    ON UPDATE TO pc_permanent_vue DO INSTEAD  UPDATE ornithologie.pc_permanent_changement_vegetation SET vegetation = new.vegetation
  WHERE ((pc_permanent_changement_vegetation.pk_pc_permanent_changement_vegetation)::text = (new.pk_pc_permanent_changement_vegetation)::text);


--
-- TOC entry 3906 (class 2618 OID 30100)
-- Name: pc_permanent_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE pc_permanent_delete AS
    ON DELETE TO pc_permanent_vue DO INSTEAD  DELETE FROM ornithologie.pc_permanent
  WHERE ((pc_permanent.pk_pc_permanent)::text = (old.pk_pc_permanent)::text);


--
-- TOC entry 3907 (class 2618 OID 30101)
-- Name: pc_permanent_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE pc_permanent_update AS
    ON UPDATE TO pc_permanent_vue DO INSTEAD  UPDATE ornithologie.pc_permanent SET signe_occupation_1 = new.signe_occupation_1, signe_occupation_2 = new.signe_occupation_2, signe_occupation_3 = new.signe_occupation_3, reponse_a_la_repasse = new.reponse_a_la_repasse, verif_occupation_terrier = new.verif_occupation_terrier, verif_si_oeuf = new.verif_si_oeuf, remarques = new.remarques, date_correction = new.date_correction, fk_espece_vernaculaire = new.fk_espece_vernaculaire
  WHERE ((pc_permanent.pk_pc_permanent)::text = (new.pk_pc_permanent)::text);


--
-- TOC entry 3908 (class 2618 OID 30102)
-- Name: pc_surtransect_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE pc_surtransect_delete AS
    ON DELETE TO pc_surtransect_vue DO INSTEAD  DELETE FROM ornithologie.pc_surtransect
  WHERE ((pc_surtransect.pk_pc_surtransect)::text = (old.pk_pc_surtransect)::text);


--
-- TOC entry 3909 (class 2618 OID 30103)
-- Name: pc_surtransect_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE pc_surtransect_update AS
    ON UPDATE TO pc_surtransect_vue DO INSTEAD  UPDATE ornithologie.pc_surtransect SET signe_occupation_1 = new.signe_occupation_1, signe_occupation_2 = new.signe_occupation_2, signe_occupation_3 = new.signe_occupation_3, reponse_a_la_repasse = new.reponse_a_la_repasse, verif_occupation_terrier = new.verif_occupation_terrier, verif_si_oeuf = new.verif_si_oeuf, remarques = new.remarques, vegetation = new.vegetation, pente = new.pente, orientation = new.orientation, date_correction = new.date_correction, distance_au_pt_precedent = new.distance_au_pt_precedent, numero_transect = new.numero_transect, fk_espece_vernaculaire = new.fk_espece_vernaculaire
  WHERE ((pc_surtransect.pk_pc_surtransect)::text = (new.pk_pc_surtransect)::text);


--
-- TOC entry 3934 (class 2618 OID 30478)
-- Name: reprise_bague_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE reprise_bague_delete AS
    ON DELETE TO reprise_bague_vue DO INSTEAD  DELETE FROM ornithologie.reprise_bague
  WHERE ((reprise_bague.pk_reprise_bague)::text = (old.pk_reprise_bague)::text);


--
-- TOC entry 3935 (class 2618 OID 30479)
-- Name: reprise_bague_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE reprise_bague_update AS
    ON UPDATE TO reprise_bague_vue DO INSTEAD  UPDATE ornithologie.reprise_bague SET statut = new.statut, num_bague_metal = new.num_bague_metal, num_bague_darvic = new.num_bague_darvic, pays_origine = new.pays_origine, remarques = new.remarques, date_correction = new.date_correction, fk_espece_vernaculaire = new.fk_espece_vernaculaire
  WHERE ((reprise_bague.pk_reprise_bague)::text = (new.pk_reprise_bague)::text);


--
-- TOC entry 3910 (class 2618 OID 30104)
-- Name: srep_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE srep_delete AS
    ON DELETE TO srep_vue DO INSTEAD  DELETE FROM ornithologie.srep_comptage
  WHERE ((srep_comptage.pk_srep_comptage)::text = (old.pk_srep_comptage)::text);


--
-- TOC entry 3911 (class 2618 OID 30105)
-- Name: srep_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE srep_update AS
    ON UPDATE TO srep_vue DO INSTEAD  UPDATE ornithologie.srep_comptage SET type_effectif = new.type_effectif, comptage_1 = new.comptage_1, comptage_2 = new.comptage_2, comptage_3 = new.comptage_3, comptage_4 = new.comptage_4, moyenne_comptages = new.moyenne_comptages, remarques = new.remarques, date_correction = new.date_correction, saison = new.saison, numero_passage = new.numero_passage
  WHERE ((srep_comptage.pk_srep_comptage)::text = (new.pk_srep_comptage)::text);


--
-- TOC entry 3912 (class 2618 OID 30106)
-- Name: tb_leve_gps_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_leve_gps_metadonnees_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.tb_leve_gps_metadonnees SET id_pt_gps = new.id_pt_gps, numero_gps = new.numero_gps, heure_leve = new.heure_leve, latitude = new.latitude, longitude = new.longitude, remarques = new.remarques_leve_gps, origine_coordonnees = new.origine_coordonnees
  WHERE ((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (new.pk_tb_leve_gps_metadonnees)::text);


--
-- TOC entry 3913 (class 2618 OID 30107)
-- Name: tb_leve_gps_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_leve_gps_metadonnees_update AS
    ON UPDATE TO trsc_especes_epigees_vue DO INSTEAD  UPDATE ornithologie.tb_leve_gps_metadonnees SET id_pt_gps = new.id_pt_gps, heure_leve = new.heure_leve, latitude = new.latitude, longitude = new.longitude, remarques = new.remarques_leve_gps, origine_coordonnees = new.origine_coordonnees
  WHERE ((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (new.pk_tb_leve_gps_metadonnees)::text);


--
-- TOC entry 3914 (class 2618 OID 30109)
-- Name: tb_leve_gps_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_leve_gps_metadonnees_update AS
    ON UPDATE TO trsc_especes_hypogees_vue DO INSTEAD  UPDATE ornithologie.tb_leve_gps_metadonnees SET id_pt_gps = new.id_pt_gps, heure_leve = new.heure_leve, latitude = new.latitude, longitude = new.longitude, remarques = new.remarques_leve_gps, origine_coordonnees = new.origine_coordonnees
  WHERE ((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (new.pk_tb_leve_gps_metadonnees)::text);


--
-- TOC entry 3915 (class 2618 OID 30111)
-- Name: tb_leve_gps_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_leve_gps_metadonnees_update AS
    ON UPDATE TO pc_surtransect_vue DO INSTEAD  UPDATE ornithologie.tb_leve_gps_metadonnees SET id_pt_gps = new.id_pt_gps, heure_leve = new.heure_leve, latitude = new.latitude, longitude = new.longitude, remarques = new.remarques_leve_gps, origine_coordonnees = new.origine_coordonnees
  WHERE ((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (new.pk_tb_leve_gps_metadonnees)::text);


--
-- TOC entry 3916 (class 2618 OID 30113)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3917 (class 2618 OID 30114)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO trsc_especes_epigees_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3918 (class 2618 OID 30115)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO trsc_especes_hypogees_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3919 (class 2618 OID 30116)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO cmtg_oiseaux_marins_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3920 (class 2618 OID 30117)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO pc_permanent_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3921 (class 2618 OID 30118)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO pc_surtransect_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3922 (class 2618 OID 30119)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO cmtg_mam_marins_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3923 (class 2618 OID 30121)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO demos_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3924 (class 2618 OID 30122)
-- Name: trsc_especes_epigees_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE trsc_especes_epigees_delete AS
    ON DELETE TO trsc_especes_epigees_vue DO INSTEAD  DELETE FROM ornithologie.trsc_especes_epigees
  WHERE ((trsc_especes_epigees.pk_trsc_especes_epigees)::text = (old.pk_trsc_especes_epigees)::text);


--
-- TOC entry 3925 (class 2618 OID 30123)
-- Name: trsc_especes_epigees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE trsc_especes_epigees_update AS
    ON UPDATE TO trsc_especes_epigees_vue DO INSTEAD  UPDATE ornithologie.trsc_especes_epigees SET distance_angulaire_d = new.distance_angulaire_d, angle_magnetique_telemetre_a1 = new.angle_magnetique_telemetre_a1, angle_transect_a2 = new.angle_transect_a2, distance_perpendiculaire_d = new.distance_perpendiculaire_d, activite_comportement = new.activite_comportement, indice_reproduction = new.indice_reproduction, nombre_oeufs = new.nombre_oeufs, nombre_poussins = new.nombre_poussins, canards_effectif_male = new.canards_effectif_male, canards_effectif_femelle = new.canards_effectif_femelle, canards_effectif_indetermine = new.canards_effectif_indetermine, somme_effectif = new.somme_effectif_canards, remarques = new.remarques, nb_skuas = new.nb_skuas, date_correction = new.date_correction, fk_espece_vernaculaire = new.fk_espece_vernaculaire, vegetation = new.vegetation
  WHERE ((trsc_especes_epigees.pk_trsc_especes_epigees)::text = (new.pk_trsc_especes_epigees)::text);


--
-- TOC entry 3926 (class 2618 OID 30125)
-- Name: trsc_especes_hypogees_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE trsc_especes_hypogees_delete AS
    ON DELETE TO trsc_especes_hypogees_vue DO INSTEAD  DELETE FROM ornithologie.trsc_especes_hypogees
  WHERE ((trsc_especes_hypogees.pk_trsc_especes_hypogees)::text = (old.pk_trsc_especes_hypogees)::text);


--
-- TOC entry 3927 (class 2618 OID 30126)
-- Name: trsc_especes_hypogees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE trsc_especes_hypogees_update AS
    ON UPDATE TO trsc_especes_hypogees_vue DO INSTEAD  UPDATE ornithologie.trsc_especes_hypogees SET distance_perpendiculaire_d = new.distance_perpendiculaire_d, signe_occupation_1 = new.signe_occupation_1, signe_occupation_2 = new.signe_occupation_2, signe_occupation_3 = new.signe_occupation_3, reponse_a_la_repasse = new.reponse_a_la_repasse, verif_occupation_terrier = new.verif_occupation_terrier, verif_si_oeuf = new.verif_si_oeuf, remarques = new.remarques, date_correction = new.date_correction, fk_espece_vernaculaire = new.fk_espece_vernaculaire, vegetation = new.vegetation
  WHERE ((trsc_especes_hypogees.pk_trsc_especes_hypogees)::text = (new.pk_trsc_especes_hypogees)::text);


--
-- TOC entry 3928 (class 2618 OID 30128)
-- Name: trsc_transect_parcours_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE trsc_transect_parcours_update AS
    ON UPDATE TO trsc_especes_epigees_vue DO INSTEAD  UPDATE ornithologie.trsc_transect_parcours SET fk_observateur = new.fk_observateur, remarques_transect = new.remarques_transect, aucune_obs = new.aucune_obs, longueur_sur_terrain = new.longueur_sur_terrain, direction_suivie = new.direction_suivie
  WHERE ((trsc_transect_parcours.pk_trsc_transect_parcours)::text = (new.pk_trsc_transect_parcours)::text);


--
-- TOC entry 3929 (class 2618 OID 30129)
-- Name: trsc_transect_parcours_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE trsc_transect_parcours_update AS
    ON UPDATE TO trsc_especes_hypogees_vue DO INSTEAD  UPDATE ornithologie.trsc_transect_parcours SET fk_observateur = new.fk_observateur, remarques_transect = new.remarques_transect, aucune_obs = new.aucune_obs, longueur_sur_terrain = new.longueur_sur_terrain, direction_suivie = new.direction_suivie
  WHERE ((trsc_transect_parcours.pk_trsc_transect_parcours)::text = (new.pk_trsc_transect_parcours)::text);


SET search_path = bdd_especes_introduites_faune, pg_catalog;

--
-- TOC entry 3710 (class 2620 OID 30381)
-- Name: calcul_position_pt_depart; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER calcul_position_pt_depart BEFORE INSERT OR UPDATE ON inventaire_piege_ligne_coordonnees FOR EACH ROW EXECUTE PROCEDURE calcul_position_pt_depart();


--
-- TOC entry 3711 (class 2620 OID 30382)
-- Name: calcul_position_pt_fin; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER calcul_position_pt_fin BEFORE INSERT OR UPDATE ON inventaire_piege_ligne_coordonnees FOR EACH ROW EXECUTE PROCEDURE calcul_position_pt_fin();


--
-- TOC entry 3717 (class 2620 OID 30383)
-- Name: calcul_the_geom; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER calcul_the_geom BEFORE INSERT OR UPDATE ON obsopportuniste_donnees_terrain FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3713 (class 2620 OID 30384)
-- Name: calcul_the_geom; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER calcul_the_geom BEFORE INSERT OR UPDATE ON inventaire_piege_ponctuel_coordonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3712 (class 2620 OID 30385)
-- Name: calcul_the_geom_piege_ligne; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_piege_ligne BEFORE INSERT OR UPDATE ON inventaire_piege_ligne_coordonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom_piege_ligne();


--
-- TOC entry 3714 (class 2620 OID 30386)
-- Name: trigg_pk_inventaire_piege_pose; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER trigg_pk_inventaire_piege_pose BEFORE INSERT OR UPDATE ON inventaire_piege_pose FOR EACH ROW EXECUTE PROCEDURE trigg_pk_inventaire_piege_pose();


--
-- TOC entry 3715 (class 2620 OID 30387)
-- Name: trigg_pk_inventaire_piege_releve; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER trigg_pk_inventaire_piege_releve BEFORE INSERT OR UPDATE ON inventaire_piege_releve FOR EACH ROW EXECUTE PROCEDURE trigg_pk_inventaire_piege_releve();


--
-- TOC entry 3716 (class 2620 OID 30388)
-- Name: trigg_pk_obsopportuniste_donnees_presenceabsence; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER trigg_pk_obsopportuniste_donnees_presenceabsence BEFORE INSERT OR UPDATE ON obsopportuniste_donnees_presenceabsence FOR EACH ROW EXECUTE PROCEDURE trigg_pk_obsopportuniste_donnees_presenceabsence();


--
-- TOC entry 3718 (class 2620 OID 30389)
-- Name: trigg_pk_obsopportuniste_donnees_terrain; Type: TRIGGER; Schema: bdd_especes_introduites_faune; Owner: postgres
--

CREATE TRIGGER trigg_pk_obsopportuniste_donnees_terrain BEFORE INSERT OR UPDATE ON obsopportuniste_donnees_terrain FOR EACH ROW EXECUTE PROCEDURE trigg_pk_obsopportuniste_donnees_terrain();


SET search_path = frequentations_autorisations_ams, pg_catalog;

--
-- TOC entry 3658 (class 2620 OID 17534)
-- Name: calcul_code_equipier; Type: TRIGGER; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE TRIGGER calcul_code_equipier BEFORE INSERT OR UPDATE ON equipiers FOR EACH ROW EXECUTE PROCEDURE calcul_code_equipier();

ALTER TABLE equipiers DISABLE TRIGGER calcul_code_equipier;


--
-- TOC entry 3659 (class 2620 OID 17751)
-- Name: calcul_nbjours_presence; Type: TRIGGER; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE TRIGGER calcul_nbjours_presence BEFORE INSERT OR UPDATE ON presence FOR EACH ROW EXECUTE PROCEDURE calcul_nbjours_presence();


SET search_path = frequentations_autorisations_cro, pg_catalog;

--
-- TOC entry 3660 (class 2620 OID 17536)
-- Name: calcul_code_equipier; Type: TRIGGER; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE TRIGGER calcul_code_equipier BEFORE INSERT OR UPDATE ON equipiers FOR EACH ROW EXECUTE PROCEDURE calcul_code_equipier();


--
-- TOC entry 3661 (class 2620 OID 17537)
-- Name: calcul_nbjours_presence; Type: TRIGGER; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE TRIGGER calcul_nbjours_presence BEFORE INSERT OR UPDATE ON presence FOR EACH ROW EXECUTE PROCEDURE calcul_nbjours_presence();


SET search_path = frequentations_autorisations_ker, pg_catalog;

--
-- TOC entry 3662 (class 2620 OID 17538)
-- Name: calcul_code_equipier; Type: TRIGGER; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE TRIGGER calcul_code_equipier BEFORE INSERT OR UPDATE ON equipiers FOR EACH ROW EXECUTE PROCEDURE calcul_code_equipier();


--
-- TOC entry 3663 (class 2620 OID 17539)
-- Name: calcul_nbjours_presence; Type: TRIGGER; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE TRIGGER calcul_nbjours_presence BEFORE INSERT OR UPDATE ON presence FOR EACH ROW EXECUTE PROCEDURE calcul_nbjours_presence();


SET search_path = ornithologie, pg_catalog;

--
-- TOC entry 3699 (class 2620 OID 29054)
-- Name: calcul_date_saisie_dans_bd_manipe; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_date_saisie_dans_bd_manipe BEFORE INSERT ON tb_manipe_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_date_saisie_dans_bd();


--
-- TOC entry 3703 (class 2620 OID 29055)
-- Name: calcul_date_saisie_dans_bd_traces_gps; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_date_saisie_dans_bd_traces_gps BEFORE INSERT ON tb_traces_gps FOR EACH ROW EXECUTE PROCEDURE calcul_date_saisie_dans_bd();


--
-- TOC entry 3707 (class 2620 OID 29056)
-- Name: calcul_date_saisie_dans_bd_trsc_transect_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_date_saisie_dans_bd_trsc_transect_metadonnees BEFORE INSERT ON trsc_transect_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_date_saisie_dans_bd();


--
-- TOC entry 3708 (class 2620 OID 29057)
-- Name: calcul_longueur_theorique_transect; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_longueur_theorique_transect BEFORE INSERT OR UPDATE ON trsc_transect_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_longueur_theorique_transect();


--
-- TOC entry 3669 (class 2620 OID 29058)
-- Name: calcul_moyenne_cmtg_indiff_precis; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_moyenne_cmtg_indiff_precis BEFORE INSERT OR UPDATE ON cmtg_indiff_precis FOR EACH ROW EXECUTE PROCEDURE calcul_moyenne_comptages();


--
-- TOC entry 3671 (class 2620 OID 29059)
-- Name: calcul_moyenne_cmtg_mam_marins; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_moyenne_cmtg_mam_marins BEFORE INSERT OR UPDATE ON cmtg_mam_marins FOR EACH ROW EXECUTE PROCEDURE calcul_moyenne_comptages();


--
-- TOC entry 3677 (class 2620 OID 29060)
-- Name: calcul_moyenne_cmtg_oiseaux_marins_adistance; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_moyenne_cmtg_oiseaux_marins_adistance BEFORE INSERT OR UPDATE ON cmtg_oiseaux_marins FOR EACH ROW EXECUTE PROCEDURE calcul_moyenne_cmtg_oiseaux_marins_adistance();


--
-- TOC entry 3678 (class 2620 OID 29061)
-- Name: calcul_moyenne_cmtg_oiseaux_marins_envol; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_moyenne_cmtg_oiseaux_marins_envol BEFORE INSERT OR UPDATE ON cmtg_oiseaux_marins FOR EACH ROW EXECUTE PROCEDURE calcul_moyenne_cmtg_oiseaux_marins_envol();


--
-- TOC entry 3695 (class 2620 OID 29062)
-- Name: calcul_moyenne_comptages_srep; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_moyenne_comptages_srep BEFORE INSERT OR UPDATE ON srep_comptage FOR EACH ROW EXECUTE PROCEDURE calcul_moyenne_comptages();


--
-- TOC entry 3666 (class 2620 OID 29064)
-- Name: calcul_pk_cmtg_indiff_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_indiff_metadonnees BEFORE INSERT ON cmtg_indiff_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_indiff_metadonnees();


--
-- TOC entry 3667 (class 2620 OID 29065)
-- Name: calcul_pk_cmtg_indiff_minmax; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_indiff_minmax BEFORE INSERT ON cmtg_indiff_minmax FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_indiff_minmax();


--
-- TOC entry 3668 (class 2620 OID 29066)
-- Name: calcul_pk_cmtg_indiff_nids_oeufs_poussins; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_indiff_nids_oeufs_poussins BEFORE INSERT ON cmtg_indiff_nids_oeufs_poussins FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_indiff_nids_oeufs_poussins();


--
-- TOC entry 3670 (class 2620 OID 29067)
-- Name: calcul_pk_cmtg_indiff_precis; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_indiff_precis BEFORE INSERT ON cmtg_indiff_precis FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_indiff_precis();


--
-- TOC entry 3672 (class 2620 OID 29068)
-- Name: calcul_pk_cmtg_mam_marins; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_mam_marins BEFORE INSERT OR UPDATE ON cmtg_mam_marins FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_mam_marins();


--
-- TOC entry 3673 (class 2620 OID 29069)
-- Name: calcul_pk_cmtg_mam_marins_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_mam_marins_metadonnees BEFORE INSERT OR UPDATE ON cmtg_mam_marins_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_mam_marins_metadonnees();


--
-- TOC entry 3679 (class 2620 OID 29070)
-- Name: calcul_pk_cmtg_oiseaux_marins; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_oiseaux_marins BEFORE INSERT OR UPDATE ON cmtg_oiseaux_marins FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_oiseaux_marins();


--
-- TOC entry 3680 (class 2620 OID 29071)
-- Name: calcul_pk_cmtg_oiseaux_marins_colonies_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_oiseaux_marins_colonies_metadonnees BEFORE INSERT OR UPDATE ON cmtg_oiseaux_marins_colonies_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_oiseaux_marins_colonies_metadonnees();


--
-- TOC entry 3682 (class 2620 OID 29072)
-- Name: calcul_pk_demos_bilan_repro; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_demos_bilan_repro BEFORE INSERT OR UPDATE ON demos_bilan_repro FOR EACH ROW EXECUTE PROCEDURE calcul_pk_demos_bilan_repro();


--
-- TOC entry 3683 (class 2620 OID 29073)
-- Name: calcul_pk_demos_comptage; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_demos_comptage BEFORE INSERT OR UPDATE ON demos_comptage FOR EACH ROW EXECUTE PROCEDURE calcul_pk_demos_comptage();


--
-- TOC entry 3684 (class 2620 OID 29074)
-- Name: calcul_pk_demos_indices_occup; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_demos_indices_occup BEFORE INSERT OR UPDATE ON demos_indices_occup FOR EACH ROW EXECUTE PROCEDURE calcul_pk_demos_indices_occup();


--
-- TOC entry 3686 (class 2620 OID 29075)
-- Name: calcul_pk_pc_permanent; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_pc_permanent BEFORE INSERT OR UPDATE ON pc_permanent FOR EACH ROW EXECUTE PROCEDURE calcul_pk_pc_permanent();


--
-- TOC entry 3687 (class 2620 OID 29076)
-- Name: calcul_pk_pc_permanent_changement_vegetation; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_pc_permanent_changement_vegetation BEFORE INSERT OR UPDATE ON pc_permanent_changement_vegetation FOR EACH ROW EXECUTE PROCEDURE calcul_pk_pc_permanent_changement_vegetation();


--
-- TOC entry 3688 (class 2620 OID 29077)
-- Name: calcul_pk_pc_permanent_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_pc_permanent_metadonnees BEFORE INSERT OR UPDATE ON pc_permanent_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_pc_permanent_metadonnees();


--
-- TOC entry 3690 (class 2620 OID 29078)
-- Name: calcul_pk_pc_surtransect; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_pc_surtransect BEFORE INSERT ON pc_surtransect FOR EACH ROW EXECUTE PROCEDURE calcul_pk_pc_surtransect();


--
-- TOC entry 3719 (class 2620 OID 30472)
-- Name: calcul_pk_repise_bague; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_repise_bague BEFORE INSERT OR UPDATE ON reprise_bague FOR EACH ROW EXECUTE PROCEDURE calcul_pk_repise_bague();


--
-- TOC entry 3691 (class 2620 OID 29079)
-- Name: calcul_pk_srep_colonies_coordonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_srep_colonies_coordonnees BEFORE INSERT OR UPDATE ON srep_colonies_coordonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_srep_colonies_coordonnees();


--
-- TOC entry 3693 (class 2620 OID 29080)
-- Name: calcul_pk_srep_colonies_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_srep_colonies_metadonnees BEFORE INSERT OR UPDATE ON srep_colonies_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_srep_colonies_metadonnees();


--
-- TOC entry 3696 (class 2620 OID 29081)
-- Name: calcul_pk_srep_comptage; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_srep_comptage BEFORE INSERT OR UPDATE ON srep_comptage FOR EACH ROW EXECUTE PROCEDURE calcul_pk_srep_comptage();


--
-- TOC entry 3697 (class 2620 OID 29082)
-- Name: calcul_pk_tb_leve_gps_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_tb_leve_gps_metadonnees BEFORE INSERT ON tb_leve_gps_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_tb_leve_gps_metadonnees();


--
-- TOC entry 3702 (class 2620 OID 29083)
-- Name: calcul_pk_tb_observateurs_leves_gps; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_tb_observateurs_leves_gps BEFORE INSERT OR UPDATE ON tb_observateurs_leves_gps FOR EACH ROW EXECUTE PROCEDURE calcul_pk_tb_observateurs_leves_gps();


--
-- TOC entry 3704 (class 2620 OID 29084)
-- Name: calcul_pk_trsc_especes_epigees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_trsc_especes_epigees BEFORE INSERT OR UPDATE ON trsc_especes_epigees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_trsc_especes_epigees();


--
-- TOC entry 3706 (class 2620 OID 29085)
-- Name: calcul_pk_trsc_especes_hypogees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_trsc_especes_hypogees BEFORE INSERT OR UPDATE ON trsc_especes_hypogees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_trsc_especes_hypogees();


--
-- TOC entry 3709 (class 2620 OID 29086)
-- Name: calcul_pk_trsc_transect_parcours; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_trsc_transect_parcours BEFORE INSERT OR UPDATE ON trsc_transect_parcours FOR EACH ROW EXECUTE PROCEDURE calcul_pk_trsc_transect_parcours();


--
-- TOC entry 3674 (class 2620 OID 29087)
-- Name: calcul_position_pt_depart_cmtg_mam_marins; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_position_pt_depart_cmtg_mam_marins BEFORE INSERT OR UPDATE ON cmtg_mam_marins_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_position_pt_depart_cmtg_mam_marins();


--
-- TOC entry 3675 (class 2620 OID 29088)
-- Name: calcul_position_pt_fin_cmtg_mam_marins; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_position_pt_fin_cmtg_mam_marins BEFORE INSERT OR UPDATE ON cmtg_mam_marins_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_position_pt_fin_cmtg_mam_marins();


--
-- TOC entry 3705 (class 2620 OID 29089)
-- Name: calcul_somme_effectif_trsc_especes_epigees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_somme_effectif_trsc_especes_epigees BEFORE INSERT OR UPDATE ON trsc_especes_epigees FOR EACH ROW EXECUTE PROCEDURE calcul_somme_effectif_trsc_especes_epigees();


--
-- TOC entry 3676 (class 2620 OID 29090)
-- Name: calcul_the_geom_cmtg_mam_marins_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_cmtg_mam_marins_metadonnees BEFORE INSERT OR UPDATE ON cmtg_mam_marins_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom_cmtg_mam_marins_metadonnees();


--
-- TOC entry 3681 (class 2620 OID 29091)
-- Name: calcul_the_geom_cmtg_oiseaux_marins_colonies_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_cmtg_oiseaux_marins_colonies_metadonnees BEFORE INSERT OR UPDATE ON cmtg_oiseaux_marins_colonies_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3685 (class 2620 OID 29092)
-- Name: calcul_the_geom_demos_terriers_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_demos_terriers_metadonnees BEFORE INSERT OR UPDATE ON demos_terriers_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3689 (class 2620 OID 29093)
-- Name: calcul_the_geom_pc_permanent_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_pc_permanent_metadonnees BEFORE INSERT OR UPDATE ON pc_permanent_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3692 (class 2620 OID 29094)
-- Name: calcul_the_geom_srep_colonies_coordonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_srep_colonies_coordonnees BEFORE INSERT OR UPDATE ON srep_colonies_coordonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3694 (class 2620 OID 29095)
-- Name: calcul_the_geom_srep_colonies_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_srep_colonies_metadonnees BEFORE INSERT OR UPDATE ON srep_colonies_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3698 (class 2620 OID 29096)
-- Name: calcul_the_geom_tb_leve_gps_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_tb_leve_gps_metadonnees BEFORE INSERT OR UPDATE ON tb_leve_gps_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom_tb_leve_gps_metadonnees();


--
-- TOC entry 3700 (class 2620 OID 29097)
-- Name: trigg_pk_tb_manipe_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER trigg_pk_tb_manipe_metadonnees BEFORE INSERT ON tb_manipe_metadonnees FOR EACH ROW EXECUTE PROCEDURE trigg_pk_tb_manipe_metadonnees();


--
-- TOC entry 3701 (class 2620 OID 29098)
-- Name: trigg_pk_tb_observateur; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER trigg_pk_tb_observateur BEFORE INSERT OR UPDATE ON tb_observateur FOR EACH ROW EXECUTE PROCEDURE trigg_pk_tb_observateur();


SET search_path = phylica_amsterdam, pg_catalog;

--
-- TOC entry 3665 (class 2620 OID 17874)
-- Name: calcul_pk_suivi_croissance; Type: TRIGGER; Schema: phylica_amsterdam; Owner: postgres
--

CREATE TRIGGER calcul_pk_suivi_croissance BEFORE INSERT OR UPDATE ON suivi_croissance FOR EACH ROW EXECUTE PROCEDURE calcul_pk_suivi_croissance();


--
-- TOC entry 3664 (class 2620 OID 17872)
-- Name: calcul_the_geom_identite; Type: TRIGGER; Schema: phylica_amsterdam; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_identite BEFORE INSERT OR UPDATE ON identite FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


SET search_path = bdd_especes_introduites_faune, pg_catalog;

--
-- TOC entry 3646 (class 2606 OID 30390)
-- Name: inventaire_piege_ligne_coordonnee_fk_inventaire_piege_pose_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY inventaire_piege_ligne_coordonnees
    ADD CONSTRAINT inventaire_piege_ligne_coordonnee_fk_inventaire_piege_pose_fkey FOREIGN KEY (fk_inventaire_piege_pose) REFERENCES inventaire_piege_pose(pk_inventaire_piege_pose) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3647 (class 2606 OID 30395)
-- Name: inventaire_piege_ponctuel_coordon_fk_inventaire_piege_pose_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY inventaire_piege_ponctuel_coordonnees
    ADD CONSTRAINT inventaire_piege_ponctuel_coordon_fk_inventaire_piege_pose_fkey FOREIGN KEY (fk_inventaire_piege_pose) REFERENCES inventaire_piege_pose(pk_inventaire_piege_pose) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3648 (class 2606 OID 30400)
-- Name: inventaire_piege_pose_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY inventaire_piege_pose
    ADD CONSTRAINT inventaire_piege_pose_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES ornithologie.tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3651 (class 2606 OID 30405)
-- Name: inventaire_piege_releve_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY inventaire_piege_releve
    ADD CONSTRAINT inventaire_piege_releve_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES ornithologie.tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3650 (class 2606 OID 30410)
-- Name: inventaire_piege_releve_fk_inventaire_piege_pose_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY inventaire_piege_releve
    ADD CONSTRAINT inventaire_piege_releve_fk_inventaire_piege_pose_fkey FOREIGN KEY (fk_inventaire_piege_pose) REFERENCES inventaire_piege_pose(pk_inventaire_piege_pose) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3649 (class 2606 OID 30415)
-- Name: inventaire_piege_releve_presence_fk_espece_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY inventaire_piege_releve
    ADD CONSTRAINT inventaire_piege_releve_presence_fk_espece_fkey FOREIGN KEY (presence_fk_espece) REFERENCES tb_especes_introduites(pk_espece_vernaculaire) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3653 (class 2606 OID 30420)
-- Name: obsopportuniste_donnees_presenceabsence_fk_espece_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY obsopportuniste_donnees_presenceabsence
    ADD CONSTRAINT obsopportuniste_donnees_presenceabsence_fk_espece_fkey FOREIGN KEY (fk_espece) REFERENCES tb_especes_introduites(pk_espece_vernaculaire) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3652 (class 2606 OID 30425)
-- Name: obsopportuniste_donnees_presenceabsence_fk_site_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY obsopportuniste_donnees_presenceabsence
    ADD CONSTRAINT obsopportuniste_donnees_presenceabsence_fk_site_fkey FOREIGN KEY (fk_site) REFERENCES donnees_carto.toponymie_kerguelen(pk_nom_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3654 (class 2606 OID 30430)
-- Name: obsopportuniste_donnees_terra_fk_obsopportuniste_donnees_p_fkey; Type: FK CONSTRAINT; Schema: bdd_especes_introduites_faune; Owner: postgres
--

ALTER TABLE ONLY obsopportuniste_donnees_terrain
    ADD CONSTRAINT obsopportuniste_donnees_terra_fk_obsopportuniste_donnees_p_fkey FOREIGN KEY (fk_obsopportuniste_donnees_presenceabsence) REFERENCES obsopportuniste_donnees_presenceabsence(pk_obsopportuniste_donnees_presenceabsence) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = demande_manipulation_especes, pg_catalog;

--
-- TOC entry 3586 (class 2606 OID 17843)
-- Name: autorisation_demande_fk_numero_demande_fkey; Type: FK CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY autorisation_demande
    ADD CONSTRAINT autorisation_demande_fk_numero_demande_fkey FOREIGN KEY (fk_numero_demande) REFERENCES demande(numero_demande) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3583 (class 2606 OID 17812)
-- Name: demande_fk_programme_fkey; Type: FK CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY demande
    ADD CONSTRAINT demande_fk_programme_fkey FOREIGN KEY (fk_programme) REFERENCES programme(numero) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3584 (class 2606 OID 17830)
-- Name: espece_demande_fk_espece_manipulee_fkey; Type: FK CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY espece_demande
    ADD CONSTRAINT espece_demande_fk_espece_manipulee_fkey FOREIGN KEY (fk_espece_manipulee) REFERENCES especes(nom_commun) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3585 (class 2606 OID 17825)
-- Name: espece_demande_fk_numero_demande_fkey; Type: FK CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY espece_demande
    ADD CONSTRAINT espece_demande_fk_numero_demande_fkey FOREIGN KEY (fk_numero_demande) REFERENCES demande(numero_demande) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3582 (class 2606 OID 17767)
-- Name: programme_fk_responsable_fkey; Type: FK CONSTRAINT; Schema: demande_manipulation_especes; Owner: postgres
--

ALTER TABLE ONLY programme
    ADD CONSTRAINT programme_fk_responsable_fkey FOREIGN KEY (fk_responsable) REFERENCES demandeur(nom) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = frequentations_autorisations_ams, pg_catalog;

--
-- TOC entry 3541 (class 2606 OID 17540)
-- Name: autorisations_programme_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_programme_fkey FOREIGN KEY (programme) REFERENCES programmes(code_programme) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3540 (class 2606 OID 17545)
-- Name: autorisations_site_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_site_fkey FOREIGN KEY (site) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3542 (class 2606 OID 17550)
-- Name: enregistrement_modifications_sorties_code_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY enregistrement_modifications_sorties
    ADD CONSTRAINT enregistrement_modifications_sorties_code_sortie_fkey FOREIGN KEY (code_sortie) REFERENCES sortie(code_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3545 (class 2606 OID 17555)
-- Name: equipier_sortie_code_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_code_sortie_fkey FOREIGN KEY (code_sortie) REFERENCES sortie(code_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3544 (class 2606 OID 17560)
-- Name: equipier_sortie_equipier_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_equipier_fkey FOREIGN KEY (equipier) REFERENCES equipiers(code_equipier) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3543 (class 2606 OID 17565)
-- Name: equipier_sortie_programme_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_programme_fkey FOREIGN KEY (programme) REFERENCES programmes(code_programme) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3547 (class 2606 OID 17570)
-- Name: presence_code_equipier_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_code_equipier_sortie_fkey FOREIGN KEY (code_equipier_sortie) REFERENCES equipier_sortie(code_equipier_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3546 (class 2606 OID 17575)
-- Name: presence_zone_presence_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_zone_presence_fkey FOREIGN KEY (zone_presence) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3548 (class 2606 OID 17580)
-- Name: sortie_responsable_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY sortie
    ADD CONSTRAINT sortie_responsable_fkey FOREIGN KEY (responsable) REFERENCES equipiers(code_equipier) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3551 (class 2606 OID 17585)
-- Name: transit_code_equipier_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_code_equipier_sortie_fkey FOREIGN KEY (code_equipier_sortie) REFERENCES equipier_sortie(code_equipier_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3550 (class 2606 OID 17590)
-- Name: transit_site_arrivee_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_site_arrivee_fkey FOREIGN KEY (site_arrivee) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3549 (class 2606 OID 17595)
-- Name: transit_site_depart_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_site_depart_fkey FOREIGN KEY (site_depart) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3553 (class 2606 OID 17600)
-- Name: zones_transitees_code_transit_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_code_transit_fkey FOREIGN KEY (code_transit) REFERENCES transit(code_transit) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3552 (class 2606 OID 17605)
-- Name: zones_transitees_zone_transitee_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_zone_transitee_fkey FOREIGN KEY (zone_transitee) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = frequentations_autorisations_cro, pg_catalog;

--
-- TOC entry 3555 (class 2606 OID 17610)
-- Name: autorisations_programme_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_programme_fkey FOREIGN KEY (programme) REFERENCES programmes(code_programme) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3554 (class 2606 OID 17615)
-- Name: autorisations_site_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_site_fkey FOREIGN KEY (site) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3556 (class 2606 OID 17620)
-- Name: enregistrement_modifications_sorties_code_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY enregistrement_modifications_sorties
    ADD CONSTRAINT enregistrement_modifications_sorties_code_sortie_fkey FOREIGN KEY (code_sortie) REFERENCES sortie(code_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3559 (class 2606 OID 17625)
-- Name: equipier_sortie_code_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_code_sortie_fkey FOREIGN KEY (code_sortie) REFERENCES sortie(code_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3558 (class 2606 OID 17630)
-- Name: equipier_sortie_equipier_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_equipier_fkey FOREIGN KEY (equipier) REFERENCES equipiers(code_equipier) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3557 (class 2606 OID 17635)
-- Name: equipier_sortie_programme_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_programme_fkey FOREIGN KEY (programme) REFERENCES programmes(code_programme) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3561 (class 2606 OID 17640)
-- Name: presence_code_equipier_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_code_equipier_sortie_fkey FOREIGN KEY (code_equipier_sortie) REFERENCES equipier_sortie(code_equipier_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3560 (class 2606 OID 17645)
-- Name: presence_zone_presence_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_zone_presence_fkey FOREIGN KEY (zone_presence) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3562 (class 2606 OID 17650)
-- Name: sortie_responsable_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY sortie
    ADD CONSTRAINT sortie_responsable_fkey FOREIGN KEY (responsable) REFERENCES equipiers(code_equipier) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3565 (class 2606 OID 17655)
-- Name: transit_code_equipier_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_code_equipier_sortie_fkey FOREIGN KEY (code_equipier_sortie) REFERENCES equipier_sortie(code_equipier_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3564 (class 2606 OID 17660)
-- Name: transit_site_arrivee_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_site_arrivee_fkey FOREIGN KEY (site_arrivee) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3563 (class 2606 OID 17665)
-- Name: transit_site_depart_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_site_depart_fkey FOREIGN KEY (site_depart) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3567 (class 2606 OID 17670)
-- Name: zones_transitees_code_transit_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_code_transit_fkey FOREIGN KEY (code_transit) REFERENCES transit(code_transit) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3566 (class 2606 OID 17675)
-- Name: zones_transitees_zone_transitee_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_zone_transitee_fkey FOREIGN KEY (zone_transitee) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = frequentations_autorisations_ker, pg_catalog;

--
-- TOC entry 3569 (class 2606 OID 17680)
-- Name: autorisations_programme_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_programme_fkey FOREIGN KEY (programme) REFERENCES programmes(code_programme) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3568 (class 2606 OID 17685)
-- Name: autorisations_site_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_site_fkey FOREIGN KEY (site) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3570 (class 2606 OID 17690)
-- Name: enregistrement_modifications_sorties_code_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY enregistrement_modifications_sorties
    ADD CONSTRAINT enregistrement_modifications_sorties_code_sortie_fkey FOREIGN KEY (code_sortie) REFERENCES sortie(code_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3573 (class 2606 OID 17695)
-- Name: equipier_sortie_code_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_code_sortie_fkey FOREIGN KEY (code_sortie) REFERENCES sortie(code_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3572 (class 2606 OID 17700)
-- Name: equipier_sortie_equipier_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_equipier_fkey FOREIGN KEY (equipier) REFERENCES equipiers(code_equipier) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3571 (class 2606 OID 17705)
-- Name: equipier_sortie_programme_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_programme_fkey FOREIGN KEY (programme) REFERENCES programmes(code_programme) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3575 (class 2606 OID 17710)
-- Name: presence_code_equipier_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_code_equipier_sortie_fkey FOREIGN KEY (code_equipier_sortie) REFERENCES equipier_sortie(code_equipier_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3574 (class 2606 OID 17715)
-- Name: presence_zone_presence_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_zone_presence_fkey FOREIGN KEY (zone_presence) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3576 (class 2606 OID 17720)
-- Name: sortie_responsable_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY sortie
    ADD CONSTRAINT sortie_responsable_fkey FOREIGN KEY (responsable) REFERENCES equipiers(code_equipier) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3579 (class 2606 OID 17725)
-- Name: transit_code_equipier_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_code_equipier_sortie_fkey FOREIGN KEY (code_equipier_sortie) REFERENCES equipier_sortie(code_equipier_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3578 (class 2606 OID 17730)
-- Name: transit_site_arrivee_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_site_arrivee_fkey FOREIGN KEY (site_arrivee) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3577 (class 2606 OID 17735)
-- Name: transit_site_depart_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_site_depart_fkey FOREIGN KEY (site_depart) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3581 (class 2606 OID 17740)
-- Name: zones_transitees_code_transit_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_code_transit_fkey FOREIGN KEY (code_transit) REFERENCES transit(code_transit) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3580 (class 2606 OID 17745)
-- Name: zones_transitees_zone_transitee_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_zone_transitee_fkey FOREIGN KEY (zone_transitee) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = ornithologie, pg_catalog;

--
-- TOC entry 3588 (class 2606 OID 29114)
-- Name: cmtg_indiff_classe_fk_code_metadonnees_comptage_classe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_classe
    ADD CONSTRAINT cmtg_indiff_classe_fk_code_metadonnees_comptage_classe_fkey FOREIGN KEY (fk_code_metadonnees_comptage_classe) REFERENCES cmtg_indiff_metadonnees(pk_cmtg_indiff_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3591 (class 2606 OID 29119)
-- Name: cmtg_indiff_metadonnees_fk_code_leve_gps_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_metadonnees
    ADD CONSTRAINT cmtg_indiff_metadonnees_fk_code_leve_gps_fkey FOREIGN KEY (fk_code_leve_gps) REFERENCES tb_leve_gps_metadonnees(pk_tb_leve_gps_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3590 (class 2606 OID 29124)
-- Name: cmtg_indiff_metadonnees_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_metadonnees
    ADD CONSTRAINT cmtg_indiff_metadonnees_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3589 (class 2606 OID 29129)
-- Name: cmtg_indiff_metadonnees_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_metadonnees
    ADD CONSTRAINT cmtg_indiff_metadonnees_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3592 (class 2606 OID 29134)
-- Name: cmtg_indiff_minmax_fk_code_metadonnees_comptage_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_minmax
    ADD CONSTRAINT cmtg_indiff_minmax_fk_code_metadonnees_comptage_fkey FOREIGN KEY (fk_code_metadonnees_comptage) REFERENCES cmtg_indiff_metadonnees(pk_cmtg_indiff_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3593 (class 2606 OID 29139)
-- Name: cmtg_indiff_nids_oeufs_poussi_fk_code_metadonnees_comptage_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_nids_oeufs_poussins
    ADD CONSTRAINT cmtg_indiff_nids_oeufs_poussi_fk_code_metadonnees_comptage_fkey FOREIGN KEY (fk_code_metadonnees_comptage) REFERENCES cmtg_indiff_metadonnees(pk_cmtg_indiff_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3594 (class 2606 OID 29144)
-- Name: cmtg_indiff_precis_fk_code_metadonnees_comptage_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_precis
    ADD CONSTRAINT cmtg_indiff_precis_fk_code_metadonnees_comptage_fkey FOREIGN KEY (fk_code_metadonnees_comptage) REFERENCES cmtg_indiff_metadonnees(pk_cmtg_indiff_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3595 (class 2606 OID 29149)
-- Name: cmtg_indiff_territoire_fk_code_metadonnees_comptage_territ_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_territoire
    ADD CONSTRAINT cmtg_indiff_territoire_fk_code_metadonnees_comptage_territ_fkey FOREIGN KEY (fk_code_metadonnees_comptage_territoire) REFERENCES cmtg_indiff_metadonnees(pk_cmtg_indiff_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3596 (class 2606 OID 29154)
-- Name: cmtg_mam_marins_fk_cmtg_mam_marins_metadonnees_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_mam_marins
    ADD CONSTRAINT cmtg_mam_marins_fk_cmtg_mam_marins_metadonnees_fkey FOREIGN KEY (fk_cmtg_mam_marins_metadonnees) REFERENCES cmtg_mam_marins_metadonnees(pk_cmtg_mam_marins_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3598 (class 2606 OID 29159)
-- Name: cmtg_mam_marins_metadonnees_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_mam_marins_metadonnees
    ADD CONSTRAINT cmtg_mam_marins_metadonnees_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3597 (class 2606 OID 29164)
-- Name: cmtg_mam_marins_metadonnees_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_mam_marins_metadonnees
    ADD CONSTRAINT cmtg_mam_marins_metadonnees_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3602 (class 2606 OID 29169)
-- Name: cmtg_oiseaux_marins_colonies_metado_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_oiseaux_marins_colonies_metadonnees
    ADD CONSTRAINT cmtg_oiseaux_marins_colonies_metado_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3601 (class 2606 OID 29174)
-- Name: cmtg_oiseaux_marins_colonies_metadonnees_fk_zone_geo_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_oiseaux_marins_colonies_metadonnees
    ADD CONSTRAINT cmtg_oiseaux_marins_colonies_metadonnees_fk_zone_geo_fkey FOREIGN KEY (fk_zone_geo) REFERENCES tb_zone_geo(pk_tb_zone_geo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3600 (class 2606 OID 29179)
-- Name: cmtg_oiseaux_marins_fk_cmtg_oiseaux_marins_colonies_metado_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_oiseaux_marins
    ADD CONSTRAINT cmtg_oiseaux_marins_fk_cmtg_oiseaux_marins_colonies_metado_fkey FOREIGN KEY (fk_cmtg_oiseaux_marins_colonies_metadonnees) REFERENCES cmtg_oiseaux_marins_colonies_metadonnees(pk_cmtg_oiseaux_marins_colonies_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3599 (class 2606 OID 29184)
-- Name: cmtg_oiseaux_marins_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_oiseaux_marins
    ADD CONSTRAINT cmtg_oiseaux_marins_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3603 (class 2606 OID 29189)
-- Name: demos_bilan_repro_fk_piquet_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY demos_bilan_repro
    ADD CONSTRAINT demos_bilan_repro_fk_piquet_fkey FOREIGN KEY (fk_piquet) REFERENCES demos_terriers_metadonnees(pk_demos_terriers_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3605 (class 2606 OID 29194)
-- Name: demos_comptage_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY demos_comptage
    ADD CONSTRAINT demos_comptage_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3604 (class 2606 OID 29199)
-- Name: demos_comptage_fk_piquet_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY demos_comptage
    ADD CONSTRAINT demos_comptage_fk_piquet_fkey FOREIGN KEY (fk_piquet) REFERENCES demos_terriers_metadonnees(pk_demos_terriers_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3607 (class 2606 OID 29204)
-- Name: demos_indices_occup_fk_demos_comptage_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY demos_indices_occup
    ADD CONSTRAINT demos_indices_occup_fk_demos_comptage_fkey FOREIGN KEY (fk_demos_comptage) REFERENCES demos_comptage(pk_demos_comptage) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3606 (class 2606 OID 29209)
-- Name: demos_indices_occup_fk_piquet_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY demos_indices_occup
    ADD CONSTRAINT demos_indices_occup_fk_piquet_fkey FOREIGN KEY (fk_piquet) REFERENCES demos_terriers_metadonnees(pk_demos_terriers_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3608 (class 2606 OID 29214)
-- Name: demos_terriers_metadonnees_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY demos_terriers_metadonnees
    ADD CONSTRAINT demos_terriers_metadonnees_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3612 (class 2606 OID 29219)
-- Name: pc_permanent_changement_vegetation_fk_numero_piquet_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_permanent_changement_vegetation
    ADD CONSTRAINT pc_permanent_changement_vegetation_fk_numero_piquet_fkey FOREIGN KEY (fk_numero_piquet) REFERENCES pc_permanent_metadonnees(pk_pc_permanent_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3611 (class 2606 OID 29224)
-- Name: pc_permanent_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_permanent
    ADD CONSTRAINT pc_permanent_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3610 (class 2606 OID 29229)
-- Name: pc_permanent_fk_code_piquet_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_permanent
    ADD CONSTRAINT pc_permanent_fk_code_piquet_fkey FOREIGN KEY (fk_code_piquet) REFERENCES pc_permanent_metadonnees(pk_pc_permanent_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3609 (class 2606 OID 29234)
-- Name: pc_permanent_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_permanent
    ADD CONSTRAINT pc_permanent_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3613 (class 2606 OID 29239)
-- Name: pc_permanent_metadonnees_fk_zone_geo_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_permanent_metadonnees
    ADD CONSTRAINT pc_permanent_metadonnees_fk_zone_geo_fkey FOREIGN KEY (fk_zone_geo) REFERENCES tb_zone_geo(pk_tb_zone_geo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3616 (class 2606 OID 29244)
-- Name: pc_surtransect_fk_code_leve_gps_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_surtransect
    ADD CONSTRAINT pc_surtransect_fk_code_leve_gps_fkey FOREIGN KEY (fk_code_leve_gps) REFERENCES tb_leve_gps_metadonnees(pk_tb_leve_gps_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3615 (class 2606 OID 29249)
-- Name: pc_surtransect_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_surtransect
    ADD CONSTRAINT pc_surtransect_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3614 (class 2606 OID 29254)
-- Name: pc_surtransect_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_surtransect
    ADD CONSTRAINT pc_surtransect_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3657 (class 2606 OID 30456)
-- Name: reprise_bague_fk_code_leve_gps_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY reprise_bague
    ADD CONSTRAINT reprise_bague_fk_code_leve_gps_fkey FOREIGN KEY (fk_code_leve_gps) REFERENCES tb_leve_gps_metadonnees(pk_tb_leve_gps_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3656 (class 2606 OID 30461)
-- Name: reprise_bague_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY reprise_bague
    ADD CONSTRAINT reprise_bague_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3655 (class 2606 OID 30466)
-- Name: reprise_bague_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY reprise_bague
    ADD CONSTRAINT reprise_bague_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3617 (class 2606 OID 29259)
-- Name: srep_colonies_coordonnees_fk_srep_colonies_metadonnees_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY srep_colonies_coordonnees
    ADD CONSTRAINT srep_colonies_coordonnees_fk_srep_colonies_metadonnees_fkey FOREIGN KEY (fk_srep_colonies_metadonnees) REFERENCES srep_colonies_metadonnees(pk_srep_colonies_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3619 (class 2606 OID 29264)
-- Name: srep_colonies_metadonnees_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY srep_colonies_metadonnees
    ADD CONSTRAINT srep_colonies_metadonnees_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3618 (class 2606 OID 29269)
-- Name: srep_colonies_metadonnees_fk_zone_geo_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY srep_colonies_metadonnees
    ADD CONSTRAINT srep_colonies_metadonnees_fk_zone_geo_fkey FOREIGN KEY (fk_zone_geo) REFERENCES tb_zone_geo(pk_tb_zone_geo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3621 (class 2606 OID 29274)
-- Name: srep_comptage_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY srep_comptage
    ADD CONSTRAINT srep_comptage_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3620 (class 2606 OID 29279)
-- Name: srep_comptage_fk_srep_colonies_metadonnees_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY srep_comptage
    ADD CONSTRAINT srep_comptage_fk_srep_colonies_metadonnees_fkey FOREIGN KEY (fk_srep_colonies_metadonnees) REFERENCES srep_colonies_metadonnees(pk_srep_colonies_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3622 (class 2606 OID 29284)
-- Name: tb_leve_gps_metadonnees_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_leve_gps_metadonnees
    ADD CONSTRAINT tb_leve_gps_metadonnees_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3625 (class 2606 OID 29289)
-- Name: tb_manipe_metadonnees_fk_protocole_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_manipe_metadonnees
    ADD CONSTRAINT tb_manipe_metadonnees_fk_protocole_fkey FOREIGN KEY (fk_protocole) REFERENCES tb_protocoles_metadonnees(pk_tb_protocoles_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3623 (class 2606 OID 29966)
-- Name: tb_manipe_metadonnees_fk_site_arrivee_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_manipe_metadonnees
    ADD CONSTRAINT tb_manipe_metadonnees_fk_site_arrivee_fkey FOREIGN KEY (fk_site_arrivee) REFERENCES donnees_carto.toponymie_kerguelen(pk_nom_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3624 (class 2606 OID 29956)
-- Name: tb_manipe_metadonnees_fk_site_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_manipe_metadonnees
    ADD CONSTRAINT tb_manipe_metadonnees_fk_site_fkey FOREIGN KEY (fk_site) REFERENCES donnees_carto.toponymie_kerguelen(pk_nom_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3626 (class 2606 OID 29294)
-- Name: tb_meteo_pk_tb_meteo_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_meteo
    ADD CONSTRAINT tb_meteo_pk_tb_meteo_fkey FOREIGN KEY (pk_tb_meteo) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3628 (class 2606 OID 29299)
-- Name: tb_observateurs_leves_gps_fk_code_leve_gps_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_observateurs_leves_gps
    ADD CONSTRAINT tb_observateurs_leves_gps_fk_code_leve_gps_fkey FOREIGN KEY (fk_code_leve_gps) REFERENCES tb_leve_gps_metadonnees(pk_tb_leve_gps_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3627 (class 2606 OID 29304)
-- Name: tb_observateurs_leves_gps_fk_observateur_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_observateurs_leves_gps
    ADD CONSTRAINT tb_observateurs_leves_gps_fk_observateur_fkey FOREIGN KEY (fk_observateur) REFERENCES tb_observateur(pk_tb_observateur) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3630 (class 2606 OID 29309)
-- Name: tb_observateurs_manipes_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_observateurs_manipes
    ADD CONSTRAINT tb_observateurs_manipes_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3629 (class 2606 OID 29314)
-- Name: tb_observateurs_manipes_fk_observateur_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_observateurs_manipes
    ADD CONSTRAINT tb_observateurs_manipes_fk_observateur_fkey FOREIGN KEY (fk_observateur) REFERENCES tb_observateur(pk_tb_observateur) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3631 (class 2606 OID 29319)
-- Name: tb_traces_gps_manipes_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_traces_gps_manipes
    ADD CONSTRAINT tb_traces_gps_manipes_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3636 (class 2606 OID 29324)
-- Name: trsc_especes_epigees_fk_code_leve_gps_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_epigees
    ADD CONSTRAINT trsc_especes_epigees_fk_code_leve_gps_fkey FOREIGN KEY (fk_code_leve_gps) REFERENCES tb_leve_gps_metadonnees(pk_tb_leve_gps_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3635 (class 2606 OID 29329)
-- Name: trsc_especes_epigees_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_epigees
    ADD CONSTRAINT trsc_especes_epigees_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3634 (class 2606 OID 29334)
-- Name: trsc_especes_epigees_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_epigees
    ADD CONSTRAINT trsc_especes_epigees_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3633 (class 2606 OID 29339)
-- Name: trsc_especes_epigees_fk_numero_transect_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_epigees
    ADD CONSTRAINT trsc_especes_epigees_fk_numero_transect_fkey FOREIGN KEY (fk_numero_transect) REFERENCES trsc_transect_metadonnees(pk_trsc_transect_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3632 (class 2606 OID 29344)
-- Name: trsc_especes_epigees_fk_trsc_transect_parcours_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_epigees
    ADD CONSTRAINT trsc_especes_epigees_fk_trsc_transect_parcours_fkey FOREIGN KEY (fk_trsc_transect_parcours) REFERENCES trsc_transect_parcours(pk_trsc_transect_parcours) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3641 (class 2606 OID 29349)
-- Name: trsc_especes_hypogees_fk_code_leve_gps_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_hypogees
    ADD CONSTRAINT trsc_especes_hypogees_fk_code_leve_gps_fkey FOREIGN KEY (fk_code_leve_gps) REFERENCES tb_leve_gps_metadonnees(pk_tb_leve_gps_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3640 (class 2606 OID 29354)
-- Name: trsc_especes_hypogees_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_hypogees
    ADD CONSTRAINT trsc_especes_hypogees_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3639 (class 2606 OID 29359)
-- Name: trsc_especes_hypogees_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_hypogees
    ADD CONSTRAINT trsc_especes_hypogees_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3638 (class 2606 OID 29364)
-- Name: trsc_especes_hypogees_fk_numero_transect_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_hypogees
    ADD CONSTRAINT trsc_especes_hypogees_fk_numero_transect_fkey FOREIGN KEY (fk_numero_transect) REFERENCES trsc_transect_metadonnees(pk_trsc_transect_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3637 (class 2606 OID 29369)
-- Name: trsc_especes_hypogees_fk_trsc_transect_parcours_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_hypogees
    ADD CONSTRAINT trsc_especes_hypogees_fk_trsc_transect_parcours_fkey FOREIGN KEY (fk_trsc_transect_parcours) REFERENCES trsc_transect_parcours(pk_trsc_transect_parcours) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3642 (class 2606 OID 29374)
-- Name: trsc_transect_metadonnees_fk_zone_geo_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_transect_metadonnees
    ADD CONSTRAINT trsc_transect_metadonnees_fk_zone_geo_fkey FOREIGN KEY (fk_zone_geo) REFERENCES tb_zone_geo(pk_tb_zone_geo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3645 (class 2606 OID 29379)
-- Name: trsc_transect_parcours_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_transect_parcours
    ADD CONSTRAINT trsc_transect_parcours_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3644 (class 2606 OID 29384)
-- Name: trsc_transect_parcours_fk_numero_transect_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_transect_parcours
    ADD CONSTRAINT trsc_transect_parcours_fk_numero_transect_fkey FOREIGN KEY (fk_numero_transect) REFERENCES trsc_transect_metadonnees(pk_trsc_transect_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3643 (class 2606 OID 29389)
-- Name: trsc_transect_parcours_fk_observateur_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_transect_parcours
    ADD CONSTRAINT trsc_transect_parcours_fk_observateur_fkey FOREIGN KEY (fk_observateur) REFERENCES tb_observateur(pk_tb_observateur) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = phylica_amsterdam, pg_catalog;

--
-- TOC entry 3587 (class 2606 OID 17866)
-- Name: suivi_croissance_fk_numero_plant_fkey; Type: FK CONSTRAINT; Schema: phylica_amsterdam; Owner: postgres
--

ALTER TABLE ONLY suivi_croissance
    ADD CONSTRAINT suivi_croissance_fk_numero_plant_fkey FOREIGN KEY (fk_numero_plant) REFERENCES identite(numero_plant) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4067 (class 0 OID 0)
-- Dependencies: 12
-- Name: donnees_carto; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA donnees_carto FROM PUBLIC;
REVOKE ALL ON SCHEMA donnees_carto FROM postgres;
GRANT ALL ON SCHEMA donnees_carto TO postgres;
GRANT USAGE ON SCHEMA donnees_carto TO bddrntaaf_visualisation;


--
-- TOC entry 4068 (class 0 OID 0)
-- Dependencies: 13
-- Name: ornithologie; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA ornithologie FROM PUBLIC;
REVOKE ALL ON SCHEMA ornithologie FROM postgres;
GRANT ALL ON SCHEMA ornithologie TO postgres;
GRANT USAGE ON SCHEMA ornithologie TO bddrntaaf_visualisation;


--
-- TOC entry 4070 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


SET search_path = ornithologie, pg_catalog;

--
-- TOC entry 4073 (class 0 OID 0)
-- Dependencies: 320
-- Name: tb_manipe_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_manipe_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE tb_manipe_metadonnees FROM postgres;
GRANT ALL ON TABLE tb_manipe_metadonnees TO postgres;
GRANT SELECT ON TABLE tb_manipe_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 4074 (class 0 OID 0)
-- Dependencies: 321
-- Name: tb_meteo; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_meteo FROM PUBLIC;
REVOKE ALL ON TABLE tb_meteo FROM postgres;
GRANT ALL ON TABLE tb_meteo TO postgres;
GRANT SELECT ON TABLE tb_meteo TO bddrntaaf_visualisation;


SET search_path = donnees_carto, pg_catalog;

--
-- TOC entry 4077 (class 0 OID 0)
-- Dependencies: 277
-- Name: contours_kerguelen; Type: ACL; Schema: donnees_carto; Owner: postgres
--

REVOKE ALL ON TABLE contours_kerguelen FROM PUBLIC;
REVOKE ALL ON TABLE contours_kerguelen FROM postgres;
GRANT ALL ON TABLE contours_kerguelen TO postgres;
GRANT SELECT ON TABLE contours_kerguelen TO bddrntaaf_visualisation;


--
-- TOC entry 4079 (class 0 OID 0)
-- Dependencies: 279
-- Name: kerguelen_lacs; Type: ACL; Schema: donnees_carto; Owner: postgres
--

REVOKE ALL ON TABLE kerguelen_lacs FROM PUBLIC;
REVOKE ALL ON TABLE kerguelen_lacs FROM postgres;
GRANT ALL ON TABLE kerguelen_lacs TO postgres;
GRANT SELECT ON TABLE kerguelen_lacs TO bddrntaaf_visualisation;


SET search_path = ornithologie, pg_catalog;

--
-- TOC entry 4099 (class 0 OID 0)
-- Dependencies: 294
-- Name: cmtg_indiff_classe; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_indiff_classe FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_indiff_classe FROM postgres;
GRANT ALL ON TABLE cmtg_indiff_classe TO postgres;
GRANT SELECT ON TABLE cmtg_indiff_classe TO bddrntaaf_visualisation;


--
-- TOC entry 4100 (class 0 OID 0)
-- Dependencies: 295
-- Name: cmtg_indiff_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_indiff_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_indiff_metadonnees FROM postgres;
GRANT ALL ON TABLE cmtg_indiff_metadonnees TO postgres;
GRANT SELECT ON TABLE cmtg_indiff_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 4101 (class 0 OID 0)
-- Dependencies: 296
-- Name: cmtg_indiff_minmax; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_indiff_minmax FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_indiff_minmax FROM postgres;
GRANT ALL ON TABLE cmtg_indiff_minmax TO postgres;
GRANT SELECT ON TABLE cmtg_indiff_minmax TO bddrntaaf_visualisation;


--
-- TOC entry 4103 (class 0 OID 0)
-- Dependencies: 298
-- Name: cmtg_indiff_nids_oeufs_poussins; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_indiff_nids_oeufs_poussins FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_indiff_nids_oeufs_poussins FROM postgres;
GRANT ALL ON TABLE cmtg_indiff_nids_oeufs_poussins TO postgres;
GRANT SELECT ON TABLE cmtg_indiff_nids_oeufs_poussins TO bddrntaaf_visualisation;


--
-- TOC entry 4105 (class 0 OID 0)
-- Dependencies: 300
-- Name: cmtg_indiff_precis; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_indiff_precis FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_indiff_precis FROM postgres;
GRANT ALL ON TABLE cmtg_indiff_precis TO postgres;
GRANT SELECT ON TABLE cmtg_indiff_precis TO bddrntaaf_visualisation;


--
-- TOC entry 4107 (class 0 OID 0)
-- Dependencies: 302
-- Name: cmtg_indiff_territoire; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_indiff_territoire FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_indiff_territoire FROM postgres;
GRANT ALL ON TABLE cmtg_indiff_territoire TO postgres;
GRANT SELECT ON TABLE cmtg_indiff_territoire TO bddrntaaf_visualisation;


--
-- TOC entry 4108 (class 0 OID 0)
-- Dependencies: 303
-- Name: cmtg_mam_marins; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_mam_marins FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_mam_marins FROM postgres;
GRANT ALL ON TABLE cmtg_mam_marins TO postgres;
GRANT SELECT ON TABLE cmtg_mam_marins TO bddrntaaf_visualisation;


--
-- TOC entry 4109 (class 0 OID 0)
-- Dependencies: 304
-- Name: cmtg_mam_marins_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_mam_marins_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_mam_marins_metadonnees FROM postgres;
GRANT ALL ON TABLE cmtg_mam_marins_metadonnees TO postgres;
GRANT SELECT ON TABLE cmtg_mam_marins_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 4110 (class 0 OID 0)
-- Dependencies: 305
-- Name: cmtg_oiseaux_marins; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_oiseaux_marins FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_oiseaux_marins FROM postgres;
GRANT ALL ON TABLE cmtg_oiseaux_marins TO postgres;
GRANT SELECT ON TABLE cmtg_oiseaux_marins TO bddrntaaf_visualisation;


--
-- TOC entry 4111 (class 0 OID 0)
-- Dependencies: 306
-- Name: cmtg_oiseaux_marins_colonies_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_oiseaux_marins_colonies_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_oiseaux_marins_colonies_metadonnees FROM postgres;
GRANT ALL ON TABLE cmtg_oiseaux_marins_colonies_metadonnees TO postgres;
GRANT SELECT ON TABLE cmtg_oiseaux_marins_colonies_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 4112 (class 0 OID 0)
-- Dependencies: 307
-- Name: demos_bilan_repro; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE demos_bilan_repro FROM PUBLIC;
REVOKE ALL ON TABLE demos_bilan_repro FROM postgres;
GRANT ALL ON TABLE demos_bilan_repro TO postgres;
GRANT SELECT ON TABLE demos_bilan_repro TO bddrntaaf_visualisation;


--
-- TOC entry 4113 (class 0 OID 0)
-- Dependencies: 308
-- Name: demos_comptage; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE demos_comptage FROM PUBLIC;
REVOKE ALL ON TABLE demos_comptage FROM postgres;
GRANT ALL ON TABLE demos_comptage TO postgres;
GRANT SELECT ON TABLE demos_comptage TO bddrntaaf_visualisation;


--
-- TOC entry 4114 (class 0 OID 0)
-- Dependencies: 309
-- Name: demos_indices_occup; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE demos_indices_occup FROM PUBLIC;
REVOKE ALL ON TABLE demos_indices_occup FROM postgres;
GRANT ALL ON TABLE demos_indices_occup TO postgres;
GRANT SELECT ON TABLE demos_indices_occup TO bddrntaaf_visualisation;


--
-- TOC entry 4115 (class 0 OID 0)
-- Dependencies: 310
-- Name: demos_terriers_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE demos_terriers_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE demos_terriers_metadonnees FROM postgres;
GRANT ALL ON TABLE demos_terriers_metadonnees TO postgres;
GRANT SELECT ON TABLE demos_terriers_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 4116 (class 0 OID 0)
-- Dependencies: 311
-- Name: pc_permanent; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE pc_permanent FROM PUBLIC;
REVOKE ALL ON TABLE pc_permanent FROM postgres;
GRANT ALL ON TABLE pc_permanent TO postgres;
GRANT SELECT ON TABLE pc_permanent TO bddrntaaf_visualisation;


--
-- TOC entry 4117 (class 0 OID 0)
-- Dependencies: 312
-- Name: pc_permanent_changement_vegetation; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE pc_permanent_changement_vegetation FROM PUBLIC;
REVOKE ALL ON TABLE pc_permanent_changement_vegetation FROM postgres;
GRANT ALL ON TABLE pc_permanent_changement_vegetation TO postgres;
GRANT SELECT ON TABLE pc_permanent_changement_vegetation TO bddrntaaf_visualisation;


--
-- TOC entry 4118 (class 0 OID 0)
-- Dependencies: 313
-- Name: pc_permanent_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE pc_permanent_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE pc_permanent_metadonnees FROM postgres;
GRANT ALL ON TABLE pc_permanent_metadonnees TO postgres;
GRANT SELECT ON TABLE pc_permanent_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 4119 (class 0 OID 0)
-- Dependencies: 314
-- Name: pc_surtransect; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE pc_surtransect FROM PUBLIC;
REVOKE ALL ON TABLE pc_surtransect FROM postgres;
GRANT ALL ON TABLE pc_surtransect TO postgres;
GRANT SELECT ON TABLE pc_surtransect TO bddrntaaf_visualisation;


--
-- TOC entry 4120 (class 0 OID 0)
-- Dependencies: 361
-- Name: reprise_bague; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE reprise_bague FROM PUBLIC;
REVOKE ALL ON TABLE reprise_bague FROM postgres;
GRANT ALL ON TABLE reprise_bague TO postgres;
GRANT SELECT ON TABLE reprise_bague TO bddrntaaf_visualisation;


--
-- TOC entry 4121 (class 0 OID 0)
-- Dependencies: 315
-- Name: srep_colonies_coordonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE srep_colonies_coordonnees FROM PUBLIC;
REVOKE ALL ON TABLE srep_colonies_coordonnees FROM postgres;
GRANT ALL ON TABLE srep_colonies_coordonnees TO postgres;
GRANT SELECT ON TABLE srep_colonies_coordonnees TO bddrntaaf_visualisation;


--
-- TOC entry 4122 (class 0 OID 0)
-- Dependencies: 316
-- Name: srep_colonies_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE srep_colonies_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE srep_colonies_metadonnees FROM postgres;
GRANT ALL ON TABLE srep_colonies_metadonnees TO postgres;
GRANT SELECT ON TABLE srep_colonies_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 4123 (class 0 OID 0)
-- Dependencies: 317
-- Name: srep_comptage; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE srep_comptage FROM PUBLIC;
REVOKE ALL ON TABLE srep_comptage FROM postgres;
GRANT ALL ON TABLE srep_comptage TO postgres;
GRANT SELECT ON TABLE srep_comptage TO bddrntaaf_visualisation;


--
-- TOC entry 4124 (class 0 OID 0)
-- Dependencies: 318
-- Name: tb_espece; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_espece FROM PUBLIC;
REVOKE ALL ON TABLE tb_espece FROM postgres;
GRANT ALL ON TABLE tb_espece TO postgres;
GRANT SELECT ON TABLE tb_espece TO bddrntaaf_visualisation;


--
-- TOC entry 4125 (class 0 OID 0)
-- Dependencies: 319
-- Name: tb_leve_gps_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_leve_gps_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE tb_leve_gps_metadonnees FROM postgres;
GRANT ALL ON TABLE tb_leve_gps_metadonnees TO postgres;
GRANT SELECT ON TABLE tb_leve_gps_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 4126 (class 0 OID 0)
-- Dependencies: 322
-- Name: tb_observateur; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_observateur FROM PUBLIC;
REVOKE ALL ON TABLE tb_observateur FROM postgres;
GRANT ALL ON TABLE tb_observateur TO postgres;
GRANT SELECT ON TABLE tb_observateur TO bddrntaaf_visualisation;


--
-- TOC entry 4127 (class 0 OID 0)
-- Dependencies: 323
-- Name: tb_observateurs_leves_gps; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_observateurs_leves_gps FROM PUBLIC;
REVOKE ALL ON TABLE tb_observateurs_leves_gps FROM postgres;
GRANT ALL ON TABLE tb_observateurs_leves_gps TO postgres;
GRANT SELECT ON TABLE tb_observateurs_leves_gps TO bddrntaaf_visualisation;


--
-- TOC entry 4129 (class 0 OID 0)
-- Dependencies: 325
-- Name: tb_observateurs_manipes; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_observateurs_manipes FROM PUBLIC;
REVOKE ALL ON TABLE tb_observateurs_manipes FROM postgres;
GRANT ALL ON TABLE tb_observateurs_manipes TO postgres;
GRANT SELECT ON TABLE tb_observateurs_manipes TO bddrntaaf_visualisation;


--
-- TOC entry 4130 (class 0 OID 0)
-- Dependencies: 326
-- Name: tb_protocoles_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_protocoles_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE tb_protocoles_metadonnees FROM postgres;
GRANT ALL ON TABLE tb_protocoles_metadonnees TO postgres;
GRANT SELECT ON TABLE tb_protocoles_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 4131 (class 0 OID 0)
-- Dependencies: 327
-- Name: tb_traces_gps; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_traces_gps FROM PUBLIC;
REVOKE ALL ON TABLE tb_traces_gps FROM postgres;
GRANT ALL ON TABLE tb_traces_gps TO postgres;
GRANT SELECT ON TABLE tb_traces_gps TO bddrntaaf_visualisation;


--
-- TOC entry 4132 (class 0 OID 0)
-- Dependencies: 328
-- Name: tb_traces_gps_manipes; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_traces_gps_manipes FROM PUBLIC;
REVOKE ALL ON TABLE tb_traces_gps_manipes FROM postgres;
GRANT ALL ON TABLE tb_traces_gps_manipes TO postgres;
GRANT SELECT ON TABLE tb_traces_gps_manipes TO bddrntaaf_visualisation;


--
-- TOC entry 4134 (class 0 OID 0)
-- Dependencies: 330
-- Name: tb_zone_geo; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_zone_geo FROM PUBLIC;
REVOKE ALL ON TABLE tb_zone_geo FROM postgres;
GRANT ALL ON TABLE tb_zone_geo TO postgres;
GRANT SELECT ON TABLE tb_zone_geo TO bddrntaaf_visualisation;


--
-- TOC entry 4135 (class 0 OID 0)
-- Dependencies: 331
-- Name: trsc_especes_epigees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE trsc_especes_epigees FROM PUBLIC;
REVOKE ALL ON TABLE trsc_especes_epigees FROM postgres;
GRANT ALL ON TABLE trsc_especes_epigees TO postgres;
GRANT SELECT ON TABLE trsc_especes_epigees TO bddrntaaf_visualisation;


--
-- TOC entry 4136 (class 0 OID 0)
-- Dependencies: 332
-- Name: trsc_especes_hypogees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE trsc_especes_hypogees FROM PUBLIC;
REVOKE ALL ON TABLE trsc_especes_hypogees FROM postgres;
GRANT ALL ON TABLE trsc_especes_hypogees TO postgres;
GRANT SELECT ON TABLE trsc_especes_hypogees TO bddrntaaf_visualisation;


--
-- TOC entry 4137 (class 0 OID 0)
-- Dependencies: 333
-- Name: trsc_transect_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE trsc_transect_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE trsc_transect_metadonnees FROM postgres;
GRANT ALL ON TABLE trsc_transect_metadonnees TO postgres;
GRANT SELECT ON TABLE trsc_transect_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 4139 (class 0 OID 0)
-- Dependencies: 335
-- Name: trsc_transect_parcours; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE trsc_transect_parcours FROM PUBLIC;
REVOKE ALL ON TABLE trsc_transect_parcours FROM postgres;
GRANT ALL ON TABLE trsc_transect_parcours TO postgres;
GRANT SELECT ON TABLE trsc_transect_parcours TO bddrntaaf_visualisation;


SET search_path = public, pg_catalog;

--
-- TOC entry 4142 (class 0 OID 0)
-- Dependencies: 182
-- Name: geography_columns; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE geography_columns FROM PUBLIC;
REVOKE ALL ON TABLE geography_columns FROM postgres;
GRANT ALL ON TABLE geography_columns TO postgres;
GRANT SELECT ON TABLE geography_columns TO PUBLIC;


--
-- TOC entry 4143 (class 0 OID 0)
-- Dependencies: 183
-- Name: geometry_columns; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE geometry_columns FROM PUBLIC;
REVOKE ALL ON TABLE geometry_columns FROM postgres;
GRANT ALL ON TABLE geometry_columns TO postgres;
GRANT SELECT ON TABLE geometry_columns TO PUBLIC;


--
-- TOC entry 4144 (class 0 OID 0)
-- Dependencies: 180
-- Name: spatial_ref_sys; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE spatial_ref_sys FROM PUBLIC;
REVOKE ALL ON TABLE spatial_ref_sys FROM postgres;
GRANT ALL ON TABLE spatial_ref_sys TO postgres;
GRANT SELECT ON TABLE spatial_ref_sys TO PUBLIC;


-- Completed on 2015-03-20 15:03:24 RET

--
-- PostgreSQL database dump complete
--

