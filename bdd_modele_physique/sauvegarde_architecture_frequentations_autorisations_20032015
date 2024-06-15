--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-03-20 15:04:31 RET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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

SET search_path = frequentations_autorisations_ams, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- TOC entry 3613 (class 0 OID 0)
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
-- TOC entry 3614 (class 0 OID 0)
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
-- TOC entry 3615 (class 0 OID 0)
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
-- TOC entry 3616 (class 0 OID 0)
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
-- TOC entry 3617 (class 0 OID 0)
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
-- TOC entry 3618 (class 0 OID 0)
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
-- TOC entry 3619 (class 0 OID 0)
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
-- TOC entry 3620 (class 0 OID 0)
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
-- TOC entry 3621 (class 0 OID 0)
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
-- TOC entry 3622 (class 0 OID 0)
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
-- TOC entry 3623 (class 0 OID 0)
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
-- TOC entry 3624 (class 0 OID 0)
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
-- TOC entry 3625 (class 0 OID 0)
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
-- TOC entry 3626 (class 0 OID 0)
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
-- TOC entry 3627 (class 0 OID 0)
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
-- TOC entry 3628 (class 0 OID 0)
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
-- TOC entry 3629 (class 0 OID 0)
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
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 260
-- Name: transit_code_transit_seq; Type: SEQUENCE OWNED BY; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER SEQUENCE transit_code_transit_seq OWNED BY transit.code_transit;


SET search_path = frequentations_autorisations_ams, pg_catalog;

--
-- TOC entry 3216 (class 2604 OID 17423)
-- Name: pk_debarquements_embarquements; Type: DEFAULT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY debarquements_embarquements ALTER COLUMN pk_debarquements_embarquements SET DEFAULT nextval('debarquements_embarquements_pk_debarquements_embarquements_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 17424)
-- Name: code_equipier_sortie; Type: DEFAULT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie ALTER COLUMN code_equipier_sortie SET DEFAULT nextval('equipier_sortie_code_equipier_sortie_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 17425)
-- Name: numero; Type: DEFAULT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY equipiers ALTER COLUMN numero SET DEFAULT nextval('equipiers_numero_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 17426)
-- Name: code_presence; Type: DEFAULT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY presence ALTER COLUMN code_presence SET DEFAULT nextval('presence_code_presence_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 17427)
-- Name: code_sortie; Type: DEFAULT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY sortie ALTER COLUMN code_sortie SET DEFAULT nextval('sortie_code_sortie_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 17428)
-- Name: code_transit; Type: DEFAULT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY transit ALTER COLUMN code_transit SET DEFAULT nextval('transit_code_transit_seq'::regclass);


SET search_path = frequentations_autorisations_cro, pg_catalog;

--
-- TOC entry 3222 (class 2604 OID 17429)
-- Name: pk_debarquements_embarquements; Type: DEFAULT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY debarquements_embarquements ALTER COLUMN pk_debarquements_embarquements SET DEFAULT nextval('debarquements_embarquements_pk_debarquements_embarquements_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 17430)
-- Name: code_equipier_sortie; Type: DEFAULT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie ALTER COLUMN code_equipier_sortie SET DEFAULT nextval('equipier_sortie_code_equipier_sortie_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 17431)
-- Name: numero; Type: DEFAULT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY equipiers ALTER COLUMN numero SET DEFAULT nextval('equipiers_numero_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 17432)
-- Name: code_presence; Type: DEFAULT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY presence ALTER COLUMN code_presence SET DEFAULT nextval('presence_code_presence_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 17433)
-- Name: code_sortie; Type: DEFAULT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY sortie ALTER COLUMN code_sortie SET DEFAULT nextval('sortie_code_sortie_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 17434)
-- Name: code_transit; Type: DEFAULT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY transit ALTER COLUMN code_transit SET DEFAULT nextval('transit_code_transit_seq'::regclass);


SET search_path = frequentations_autorisations_ker, pg_catalog;

--
-- TOC entry 3228 (class 2604 OID 17435)
-- Name: pk_debarquements_embarquements; Type: DEFAULT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY debarquements_embarquements ALTER COLUMN pk_debarquements_embarquements SET DEFAULT nextval('debarquements_embarquements_pk_debarquements_embarquements_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 17436)
-- Name: code_equipier_sortie; Type: DEFAULT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie ALTER COLUMN code_equipier_sortie SET DEFAULT nextval('equipier_sortie_code_equipier_sortie_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 17437)
-- Name: numero; Type: DEFAULT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY equipiers ALTER COLUMN numero SET DEFAULT nextval('equipiers_numero_seq'::regclass);


--
-- TOC entry 3231 (class 2604 OID 17438)
-- Name: code_presence; Type: DEFAULT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY presence ALTER COLUMN code_presence SET DEFAULT nextval('presence_code_presence_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 17439)
-- Name: code_sortie; Type: DEFAULT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY sortie ALTER COLUMN code_sortie SET DEFAULT nextval('sortie_code_sortie_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 17440)
-- Name: code_transit; Type: DEFAULT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY transit ALTER COLUMN code_transit SET DEFAULT nextval('transit_code_transit_seq'::regclass);


SET search_path = frequentations_autorisations_ams, pg_catalog;

--
-- TOC entry 3235 (class 2606 OID 17475)
-- Name: autorisations_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_pkey PRIMARY KEY (programme, site);


--
-- TOC entry 3237 (class 2606 OID 17477)
-- Name: debarquements_embarquements_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY debarquements_embarquements
    ADD CONSTRAINT debarquements_embarquements_pkey PRIMARY KEY (pk_debarquements_embarquements);


--
-- TOC entry 3239 (class 2606 OID 17479)
-- Name: equipier_sortie_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_pkey PRIMARY KEY (code_equipier_sortie);


--
-- TOC entry 3241 (class 2606 OID 17481)
-- Name: equipiers_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipiers
    ADD CONSTRAINT equipiers_pkey PRIMARY KEY (code_equipier);


--
-- TOC entry 3243 (class 2606 OID 17483)
-- Name: presence_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_pkey PRIMARY KEY (code_presence);


--
-- TOC entry 3245 (class 2606 OID 17485)
-- Name: programmes_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programmes
    ADD CONSTRAINT programmes_pkey PRIMARY KEY (code_programme);


--
-- TOC entry 3249 (class 2606 OID 17487)
-- Name: sortie_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sortie
    ADD CONSTRAINT sortie_pkey PRIMARY KEY (code_sortie);


--
-- TOC entry 3251 (class 2606 OID 17489)
-- Name: transit_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_pkey PRIMARY KEY (code_transit);


--
-- TOC entry 3247 (class 2606 OID 17491)
-- Name: zones_sites_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zones_sites
    ADD CONSTRAINT zones_sites_pkey PRIMARY KEY (code_zone_site);


--
-- TOC entry 3253 (class 2606 OID 17493)
-- Name: zones_transitees_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_pkey PRIMARY KEY (code_transit, zone_transitee);


SET search_path = frequentations_autorisations_cro, pg_catalog;

--
-- TOC entry 3255 (class 2606 OID 17495)
-- Name: autorisations_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_pkey PRIMARY KEY (programme, site);


--
-- TOC entry 3257 (class 2606 OID 17497)
-- Name: debarquements_embarquements_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY debarquements_embarquements
    ADD CONSTRAINT debarquements_embarquements_pkey PRIMARY KEY (pk_debarquements_embarquements);


--
-- TOC entry 3259 (class 2606 OID 17499)
-- Name: equipier_sortie_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_pkey PRIMARY KEY (code_equipier_sortie);


--
-- TOC entry 3261 (class 2606 OID 17501)
-- Name: equipiers_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipiers
    ADD CONSTRAINT equipiers_pkey PRIMARY KEY (code_equipier);


--
-- TOC entry 3263 (class 2606 OID 17503)
-- Name: presence_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_pkey PRIMARY KEY (code_presence);


--
-- TOC entry 3265 (class 2606 OID 17505)
-- Name: programmes_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programmes
    ADD CONSTRAINT programmes_pkey PRIMARY KEY (code_programme);


--
-- TOC entry 3269 (class 2606 OID 17507)
-- Name: sortie_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sortie
    ADD CONSTRAINT sortie_pkey PRIMARY KEY (code_sortie);


--
-- TOC entry 3271 (class 2606 OID 17509)
-- Name: transit_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_pkey PRIMARY KEY (code_transit);


--
-- TOC entry 3267 (class 2606 OID 17511)
-- Name: zones_sites_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zones_sites
    ADD CONSTRAINT zones_sites_pkey PRIMARY KEY (code_zone_site);


--
-- TOC entry 3273 (class 2606 OID 17513)
-- Name: zones_transitees_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_pkey PRIMARY KEY (code_transit, zone_transitee);


SET search_path = frequentations_autorisations_ker, pg_catalog;

--
-- TOC entry 3275 (class 2606 OID 17515)
-- Name: autorisations_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_pkey PRIMARY KEY (programme, site);


--
-- TOC entry 3277 (class 2606 OID 17517)
-- Name: debarquements_embarquements_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY debarquements_embarquements
    ADD CONSTRAINT debarquements_embarquements_pkey PRIMARY KEY (pk_debarquements_embarquements);


--
-- TOC entry 3279 (class 2606 OID 17519)
-- Name: equipier_sortie_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_pkey PRIMARY KEY (code_equipier_sortie);


--
-- TOC entry 3281 (class 2606 OID 17521)
-- Name: equipiers_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipiers
    ADD CONSTRAINT equipiers_pkey PRIMARY KEY (code_equipier);


--
-- TOC entry 3283 (class 2606 OID 17523)
-- Name: presence_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_pkey PRIMARY KEY (code_presence);


--
-- TOC entry 3285 (class 2606 OID 17525)
-- Name: programmes_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY programmes
    ADD CONSTRAINT programmes_pkey PRIMARY KEY (code_programme);


--
-- TOC entry 3289 (class 2606 OID 17527)
-- Name: sortie_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sortie
    ADD CONSTRAINT sortie_pkey PRIMARY KEY (code_sortie);


--
-- TOC entry 3291 (class 2606 OID 17529)
-- Name: transit_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_pkey PRIMARY KEY (code_transit);


--
-- TOC entry 3287 (class 2606 OID 17531)
-- Name: zones_sites_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zones_sites
    ADD CONSTRAINT zones_sites_pkey PRIMARY KEY (code_zone_site);


--
-- TOC entry 3293 (class 2606 OID 17533)
-- Name: zones_transitees_pkey; Type: CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_pkey PRIMARY KEY (code_transit, zone_transitee);


SET search_path = frequentations_autorisations_ams, pg_catalog;

--
-- TOC entry 3336 (class 2620 OID 17534)
-- Name: calcul_code_equipier; Type: TRIGGER; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE TRIGGER calcul_code_equipier BEFORE INSERT OR UPDATE ON equipiers FOR EACH ROW EXECUTE PROCEDURE calcul_code_equipier();

ALTER TABLE equipiers DISABLE TRIGGER calcul_code_equipier;


--
-- TOC entry 3337 (class 2620 OID 17751)
-- Name: calcul_nbjours_presence; Type: TRIGGER; Schema: frequentations_autorisations_ams; Owner: postgres
--

CREATE TRIGGER calcul_nbjours_presence BEFORE INSERT OR UPDATE ON presence FOR EACH ROW EXECUTE PROCEDURE calcul_nbjours_presence();


SET search_path = frequentations_autorisations_cro, pg_catalog;

--
-- TOC entry 3338 (class 2620 OID 17536)
-- Name: calcul_code_equipier; Type: TRIGGER; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE TRIGGER calcul_code_equipier BEFORE INSERT OR UPDATE ON equipiers FOR EACH ROW EXECUTE PROCEDURE calcul_code_equipier();


--
-- TOC entry 3339 (class 2620 OID 17537)
-- Name: calcul_nbjours_presence; Type: TRIGGER; Schema: frequentations_autorisations_cro; Owner: postgres
--

CREATE TRIGGER calcul_nbjours_presence BEFORE INSERT OR UPDATE ON presence FOR EACH ROW EXECUTE PROCEDURE calcul_nbjours_presence();


SET search_path = frequentations_autorisations_ker, pg_catalog;

--
-- TOC entry 3340 (class 2620 OID 17538)
-- Name: calcul_code_equipier; Type: TRIGGER; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE TRIGGER calcul_code_equipier BEFORE INSERT OR UPDATE ON equipiers FOR EACH ROW EXECUTE PROCEDURE calcul_code_equipier();


--
-- TOC entry 3341 (class 2620 OID 17539)
-- Name: calcul_nbjours_presence; Type: TRIGGER; Schema: frequentations_autorisations_ker; Owner: postgres
--

CREATE TRIGGER calcul_nbjours_presence BEFORE INSERT OR UPDATE ON presence FOR EACH ROW EXECUTE PROCEDURE calcul_nbjours_presence();


SET search_path = frequentations_autorisations_ams, pg_catalog;

--
-- TOC entry 3295 (class 2606 OID 17540)
-- Name: autorisations_programme_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_programme_fkey FOREIGN KEY (programme) REFERENCES programmes(code_programme) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3294 (class 2606 OID 17545)
-- Name: autorisations_site_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_site_fkey FOREIGN KEY (site) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3296 (class 2606 OID 17550)
-- Name: enregistrement_modifications_sorties_code_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY enregistrement_modifications_sorties
    ADD CONSTRAINT enregistrement_modifications_sorties_code_sortie_fkey FOREIGN KEY (code_sortie) REFERENCES sortie(code_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3299 (class 2606 OID 17555)
-- Name: equipier_sortie_code_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_code_sortie_fkey FOREIGN KEY (code_sortie) REFERENCES sortie(code_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3298 (class 2606 OID 17560)
-- Name: equipier_sortie_equipier_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_equipier_fkey FOREIGN KEY (equipier) REFERENCES equipiers(code_equipier) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3297 (class 2606 OID 17565)
-- Name: equipier_sortie_programme_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_programme_fkey FOREIGN KEY (programme) REFERENCES programmes(code_programme) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3301 (class 2606 OID 17570)
-- Name: presence_code_equipier_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_code_equipier_sortie_fkey FOREIGN KEY (code_equipier_sortie) REFERENCES equipier_sortie(code_equipier_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3300 (class 2606 OID 17575)
-- Name: presence_zone_presence_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_zone_presence_fkey FOREIGN KEY (zone_presence) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3302 (class 2606 OID 17580)
-- Name: sortie_responsable_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY sortie
    ADD CONSTRAINT sortie_responsable_fkey FOREIGN KEY (responsable) REFERENCES equipiers(code_equipier) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3305 (class 2606 OID 17585)
-- Name: transit_code_equipier_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_code_equipier_sortie_fkey FOREIGN KEY (code_equipier_sortie) REFERENCES equipier_sortie(code_equipier_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3304 (class 2606 OID 17590)
-- Name: transit_site_arrivee_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_site_arrivee_fkey FOREIGN KEY (site_arrivee) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3303 (class 2606 OID 17595)
-- Name: transit_site_depart_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_site_depart_fkey FOREIGN KEY (site_depart) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3307 (class 2606 OID 17600)
-- Name: zones_transitees_code_transit_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_code_transit_fkey FOREIGN KEY (code_transit) REFERENCES transit(code_transit) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3306 (class 2606 OID 17605)
-- Name: zones_transitees_zone_transitee_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ams; Owner: postgres
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_zone_transitee_fkey FOREIGN KEY (zone_transitee) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = frequentations_autorisations_cro, pg_catalog;

--
-- TOC entry 3309 (class 2606 OID 17610)
-- Name: autorisations_programme_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_programme_fkey FOREIGN KEY (programme) REFERENCES programmes(code_programme) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3308 (class 2606 OID 17615)
-- Name: autorisations_site_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_site_fkey FOREIGN KEY (site) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3310 (class 2606 OID 17620)
-- Name: enregistrement_modifications_sorties_code_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY enregistrement_modifications_sorties
    ADD CONSTRAINT enregistrement_modifications_sorties_code_sortie_fkey FOREIGN KEY (code_sortie) REFERENCES sortie(code_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3313 (class 2606 OID 17625)
-- Name: equipier_sortie_code_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_code_sortie_fkey FOREIGN KEY (code_sortie) REFERENCES sortie(code_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3312 (class 2606 OID 17630)
-- Name: equipier_sortie_equipier_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_equipier_fkey FOREIGN KEY (equipier) REFERENCES equipiers(code_equipier) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3311 (class 2606 OID 17635)
-- Name: equipier_sortie_programme_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_programme_fkey FOREIGN KEY (programme) REFERENCES programmes(code_programme) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3315 (class 2606 OID 17640)
-- Name: presence_code_equipier_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_code_equipier_sortie_fkey FOREIGN KEY (code_equipier_sortie) REFERENCES equipier_sortie(code_equipier_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3314 (class 2606 OID 17645)
-- Name: presence_zone_presence_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_zone_presence_fkey FOREIGN KEY (zone_presence) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3316 (class 2606 OID 17650)
-- Name: sortie_responsable_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY sortie
    ADD CONSTRAINT sortie_responsable_fkey FOREIGN KEY (responsable) REFERENCES equipiers(code_equipier) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3319 (class 2606 OID 17655)
-- Name: transit_code_equipier_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_code_equipier_sortie_fkey FOREIGN KEY (code_equipier_sortie) REFERENCES equipier_sortie(code_equipier_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3318 (class 2606 OID 17660)
-- Name: transit_site_arrivee_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_site_arrivee_fkey FOREIGN KEY (site_arrivee) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3317 (class 2606 OID 17665)
-- Name: transit_site_depart_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_site_depart_fkey FOREIGN KEY (site_depart) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3321 (class 2606 OID 17670)
-- Name: zones_transitees_code_transit_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_code_transit_fkey FOREIGN KEY (code_transit) REFERENCES transit(code_transit) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3320 (class 2606 OID 17675)
-- Name: zones_transitees_zone_transitee_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_cro; Owner: postgres
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_zone_transitee_fkey FOREIGN KEY (zone_transitee) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = frequentations_autorisations_ker, pg_catalog;

--
-- TOC entry 3323 (class 2606 OID 17680)
-- Name: autorisations_programme_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_programme_fkey FOREIGN KEY (programme) REFERENCES programmes(code_programme) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3322 (class 2606 OID 17685)
-- Name: autorisations_site_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY autorisations
    ADD CONSTRAINT autorisations_site_fkey FOREIGN KEY (site) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3324 (class 2606 OID 17690)
-- Name: enregistrement_modifications_sorties_code_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY enregistrement_modifications_sorties
    ADD CONSTRAINT enregistrement_modifications_sorties_code_sortie_fkey FOREIGN KEY (code_sortie) REFERENCES sortie(code_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3327 (class 2606 OID 17695)
-- Name: equipier_sortie_code_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_code_sortie_fkey FOREIGN KEY (code_sortie) REFERENCES sortie(code_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3326 (class 2606 OID 17700)
-- Name: equipier_sortie_equipier_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_equipier_fkey FOREIGN KEY (equipier) REFERENCES equipiers(code_equipier) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3325 (class 2606 OID 17705)
-- Name: equipier_sortie_programme_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY equipier_sortie
    ADD CONSTRAINT equipier_sortie_programme_fkey FOREIGN KEY (programme) REFERENCES programmes(code_programme) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3329 (class 2606 OID 17710)
-- Name: presence_code_equipier_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_code_equipier_sortie_fkey FOREIGN KEY (code_equipier_sortie) REFERENCES equipier_sortie(code_equipier_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3328 (class 2606 OID 17715)
-- Name: presence_zone_presence_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY presence
    ADD CONSTRAINT presence_zone_presence_fkey FOREIGN KEY (zone_presence) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3330 (class 2606 OID 17720)
-- Name: sortie_responsable_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY sortie
    ADD CONSTRAINT sortie_responsable_fkey FOREIGN KEY (responsable) REFERENCES equipiers(code_equipier) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3333 (class 2606 OID 17725)
-- Name: transit_code_equipier_sortie_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_code_equipier_sortie_fkey FOREIGN KEY (code_equipier_sortie) REFERENCES equipier_sortie(code_equipier_sortie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3332 (class 2606 OID 17730)
-- Name: transit_site_arrivee_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_site_arrivee_fkey FOREIGN KEY (site_arrivee) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3331 (class 2606 OID 17735)
-- Name: transit_site_depart_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY transit
    ADD CONSTRAINT transit_site_depart_fkey FOREIGN KEY (site_depart) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3335 (class 2606 OID 17740)
-- Name: zones_transitees_code_transit_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_code_transit_fkey FOREIGN KEY (code_transit) REFERENCES transit(code_transit) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3334 (class 2606 OID 17745)
-- Name: zones_transitees_zone_transitee_fkey; Type: FK CONSTRAINT; Schema: frequentations_autorisations_ker; Owner: postgres
--

ALTER TABLE ONLY zones_transitees
    ADD CONSTRAINT zones_transitees_zone_transitee_fkey FOREIGN KEY (zone_transitee) REFERENCES zones_sites(code_zone_site) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2015-03-20 15:04:31 RET

--
-- PostgreSQL database dump complete
--

