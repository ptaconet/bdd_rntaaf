--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-03-20 15:06:39 RET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 12 (class 2615 OID 17894)
-- Name: donnees_carto; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA donnees_carto;


ALTER SCHEMA donnees_carto OWNER TO postgres;

--
-- TOC entry 13 (class 2615 OID 28730)
-- Name: ornithologie; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ornithologie;


ALTER SCHEMA ornithologie OWNER TO postgres;

--
-- TOC entry 14 (class 2615 OID 30007)
-- Name: vues_ornithologie; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA vues_ornithologie;


ALTER SCHEMA vues_ornithologie OWNER TO postgres;

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

SET search_path = donnees_carto, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- TOC entry 3679 (class 0 OID 0)
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
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 278
-- Name: kerguelen_lacs_gid_seq; Type: SEQUENCE OWNED BY; Schema: donnees_carto; Owner: postgres
--

ALTER SEQUENCE kerguelen_lacs_gid_seq OWNED BY kerguelen_lacs.gid;


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
-- TOC entry 3685 (class 0 OID 0)
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
-- TOC entry 3687 (class 0 OID 0)
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
-- TOC entry 3689 (class 0 OID 0)
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
-- TOC entry 3711 (class 0 OID 0)
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
-- TOC entry 3716 (class 0 OID 0)
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
-- TOC entry 3721 (class 0 OID 0)
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

SET search_path = donnees_carto, pg_catalog;

--
-- TOC entry 3201 (class 2604 OID 17900)
-- Name: gid; Type: DEFAULT; Schema: donnees_carto; Owner: postgres
--

ALTER TABLE ONLY contours_kerguelen ALTER COLUMN gid SET DEFAULT nextval('contours_kerguelen_gid_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 17911)
-- Name: gid; Type: DEFAULT; Schema: donnees_carto; Owner: postgres
--

ALTER TABLE ONLY kerguelen_lacs ALTER COLUMN gid SET DEFAULT nextval('kerguelen_lacs_gid_seq'::regclass);


SET search_path = ornithologie, pg_catalog;

--
-- TOC entry 3204 (class 2604 OID 28968)
-- Name: numero_comptage_minmax; Type: DEFAULT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_minmax ALTER COLUMN numero_comptage_minmax SET DEFAULT nextval('cmtg_indiff_minmax_numero_comptage_minmax_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 28969)
-- Name: numero_comptage_nids_oeufs_poussins; Type: DEFAULT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_nids_oeufs_poussins ALTER COLUMN numero_comptage_nids_oeufs_poussins SET DEFAULT nextval('cmtg_indiff_nids_oeufs_poussi_numero_comptage_nids_oeufs_po_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 28970)
-- Name: numero_comptage_precis; Type: DEFAULT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_precis ALTER COLUMN numero_comptage_precis SET DEFAULT nextval('cmtg_indiff_precis_numero_comptage_precis_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 28971)
-- Name: numero_observateur; Type: DEFAULT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_observateurs_leves_gps ALTER COLUMN numero_observateur SET DEFAULT nextval('tb_observateurs_leves_gps_numero_observateur_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 28972)
-- Name: pk_tb_traces_gps; Type: DEFAULT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_traces_gps ALTER COLUMN pk_tb_traces_gps SET DEFAULT nextval('tb_traces_gps_pk_tb_traces_gps_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 28973)
-- Name: pk_trsc_transect_metadonnees; Type: DEFAULT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_transect_metadonnees ALTER COLUMN pk_trsc_transect_metadonnees SET DEFAULT nextval('trsc_transect_metadonnees_pk_trsc_transect_metadonnees_seq'::regclass);


SET search_path = donnees_carto, pg_catalog;

--
-- TOC entry 3214 (class 2606 OID 17905)
-- Name: contours_kerguelen_pkey; Type: CONSTRAINT; Schema: donnees_carto; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contours_kerguelen
    ADD CONSTRAINT contours_kerguelen_pkey PRIMARY KEY (gid);


--
-- TOC entry 3216 (class 2606 OID 17916)
-- Name: kerguelen_lacs_pkey; Type: CONSTRAINT; Schema: donnees_carto; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kerguelen_lacs
    ADD CONSTRAINT kerguelen_lacs_pkey PRIMARY KEY (gid);


--
-- TOC entry 3296 (class 2606 OID 29923)
-- Name: toponymie_kerguelen_pkey; Type: CONSTRAINT; Schema: donnees_carto; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY toponymie_kerguelen
    ADD CONSTRAINT toponymie_kerguelen_pkey PRIMARY KEY (pk_nom_site);


SET search_path = ornithologie, pg_catalog;

--
-- TOC entry 3218 (class 2606 OID 28977)
-- Name: cmtg_indiff_classe_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_indiff_classe
    ADD CONSTRAINT cmtg_indiff_classe_pkey PRIMARY KEY (fk_code_metadonnees_comptage_classe);


--
-- TOC entry 3220 (class 2606 OID 28979)
-- Name: cmtg_indiff_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_indiff_metadonnees
    ADD CONSTRAINT cmtg_indiff_metadonnees_pkey PRIMARY KEY (pk_cmtg_indiff_metadonnees);


--
-- TOC entry 3222 (class 2606 OID 28981)
-- Name: cmtg_indiff_minmax_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_indiff_minmax
    ADD CONSTRAINT cmtg_indiff_minmax_pkey PRIMARY KEY (pk_cmtg_indiff_minmax);


--
-- TOC entry 3224 (class 2606 OID 28983)
-- Name: cmtg_indiff_nids_oeufs_poussins_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_indiff_nids_oeufs_poussins
    ADD CONSTRAINT cmtg_indiff_nids_oeufs_poussins_pkey PRIMARY KEY (pk_cmtg_indiff_nids_oeufs_poussins);


--
-- TOC entry 3226 (class 2606 OID 28985)
-- Name: cmtg_indiff_precis_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_indiff_precis
    ADD CONSTRAINT cmtg_indiff_precis_pkey PRIMARY KEY (pk_cmtg_indiff_precis);


--
-- TOC entry 3228 (class 2606 OID 28987)
-- Name: cmtg_indiff_territoire_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_indiff_territoire
    ADD CONSTRAINT cmtg_indiff_territoire_pkey PRIMARY KEY (fk_code_metadonnees_comptage_territoire);


--
-- TOC entry 3232 (class 2606 OID 28989)
-- Name: cmtg_mam_marins_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_mam_marins_metadonnees
    ADD CONSTRAINT cmtg_mam_marins_metadonnees_pkey PRIMARY KEY (pk_cmtg_mam_marins_metadonnees);


--
-- TOC entry 3230 (class 2606 OID 28991)
-- Name: cmtg_mam_marins_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_mam_marins
    ADD CONSTRAINT cmtg_mam_marins_pkey PRIMARY KEY (pk_cmtg_mam_marins);


--
-- TOC entry 3236 (class 2606 OID 28993)
-- Name: cmtg_oiseaux_marins_colonies_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_oiseaux_marins_colonies_metadonnees
    ADD CONSTRAINT cmtg_oiseaux_marins_colonies_metadonnees_pkey PRIMARY KEY (pk_cmtg_oiseaux_marins_colonies_metadonnees);


--
-- TOC entry 3234 (class 2606 OID 28995)
-- Name: cmtg_oiseaux_marins_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cmtg_oiseaux_marins
    ADD CONSTRAINT cmtg_oiseaux_marins_pkey PRIMARY KEY (pk_cmtg_oiseaux_marins);


--
-- TOC entry 3238 (class 2606 OID 28997)
-- Name: demos_bilan_repro_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY demos_bilan_repro
    ADD CONSTRAINT demos_bilan_repro_pkey PRIMARY KEY (pk_demos_bilan_repro);


--
-- TOC entry 3240 (class 2606 OID 28999)
-- Name: demos_comptage_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY demos_comptage
    ADD CONSTRAINT demos_comptage_pkey PRIMARY KEY (pk_demos_comptage);


--
-- TOC entry 3242 (class 2606 OID 29001)
-- Name: demos_indices_occup_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY demos_indices_occup
    ADD CONSTRAINT demos_indices_occup_pkey PRIMARY KEY (pk_demos_indices_occup);


--
-- TOC entry 3244 (class 2606 OID 29003)
-- Name: demos_terriers_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY demos_terriers_metadonnees
    ADD CONSTRAINT demos_terriers_metadonnees_pkey PRIMARY KEY (pk_demos_terriers_metadonnees);


--
-- TOC entry 3248 (class 2606 OID 29005)
-- Name: pc_permanent_changement_veget_fk_numero_piquet_date_mise_a__key; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pc_permanent_changement_vegetation
    ADD CONSTRAINT pc_permanent_changement_veget_fk_numero_piquet_date_mise_a__key UNIQUE (fk_numero_piquet, date_mise_a_jour_vegetation);


--
-- TOC entry 3250 (class 2606 OID 29007)
-- Name: pc_permanent_changement_vegetation_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pc_permanent_changement_vegetation
    ADD CONSTRAINT pc_permanent_changement_vegetation_pkey PRIMARY KEY (pk_pc_permanent_changement_vegetation);


--
-- TOC entry 3252 (class 2606 OID 29009)
-- Name: pc_permanent_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pc_permanent_metadonnees
    ADD CONSTRAINT pc_permanent_metadonnees_pkey PRIMARY KEY (pk_pc_permanent_metadonnees);


--
-- TOC entry 3246 (class 2606 OID 29011)
-- Name: pc_permanent_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pc_permanent
    ADD CONSTRAINT pc_permanent_pkey PRIMARY KEY (pk_pc_permanent);


--
-- TOC entry 3254 (class 2606 OID 29013)
-- Name: pc_surtransect_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pc_surtransect
    ADD CONSTRAINT pc_surtransect_pkey PRIMARY KEY (pk_pc_surtransect);


--
-- TOC entry 3298 (class 2606 OID 30455)
-- Name: reprise_bague_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reprise_bague
    ADD CONSTRAINT reprise_bague_pkey PRIMARY KEY (pk_reprise_bague);


--
-- TOC entry 3256 (class 2606 OID 29015)
-- Name: srep_colonies_coordonnees_fk_srep_colonies_metadonnees_date_key; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY srep_colonies_coordonnees
    ADD CONSTRAINT srep_colonies_coordonnees_fk_srep_colonies_metadonnees_date_key UNIQUE (fk_srep_colonies_metadonnees, date_leve);


--
-- TOC entry 3258 (class 2606 OID 29017)
-- Name: srep_colonies_coordonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY srep_colonies_coordonnees
    ADD CONSTRAINT srep_colonies_coordonnees_pkey PRIMARY KEY (pk_srep_colonies_coordonnees);


--
-- TOC entry 3260 (class 2606 OID 29019)
-- Name: srep_colonies_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY srep_colonies_metadonnees
    ADD CONSTRAINT srep_colonies_metadonnees_pkey PRIMARY KEY (pk_srep_colonies_metadonnees);


--
-- TOC entry 3262 (class 2606 OID 29021)
-- Name: srep_comptage_fk_code_manipe_fk_srep_colonies_metadonnees_n_key; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY srep_comptage
    ADD CONSTRAINT srep_comptage_fk_code_manipe_fk_srep_colonies_metadonnees_n_key UNIQUE (fk_code_manipe, fk_srep_colonies_metadonnees, numero_passage, type_effectif);


--
-- TOC entry 3264 (class 2606 OID 29023)
-- Name: srep_comptage_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY srep_comptage
    ADD CONSTRAINT srep_comptage_pkey PRIMARY KEY (pk_srep_comptage);


--
-- TOC entry 3266 (class 2606 OID 29025)
-- Name: tb_espece_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_espece
    ADD CONSTRAINT tb_espece_pkey PRIMARY KEY (pk_tb_espece);


--
-- TOC entry 3268 (class 2606 OID 29027)
-- Name: tb_leve_gps_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_leve_gps_metadonnees
    ADD CONSTRAINT tb_leve_gps_metadonnees_pkey PRIMARY KEY (pk_tb_leve_gps_metadonnees);


--
-- TOC entry 3270 (class 2606 OID 29029)
-- Name: tb_manipe_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_manipe_metadonnees
    ADD CONSTRAINT tb_manipe_metadonnees_pkey PRIMARY KEY (pk_tb_manipe_metadonnees);


--
-- TOC entry 3272 (class 2606 OID 29031)
-- Name: tb_meteo_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_meteo
    ADD CONSTRAINT tb_meteo_pkey PRIMARY KEY (pk_tb_meteo);


--
-- TOC entry 3274 (class 2606 OID 29033)
-- Name: tb_observateur_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_observateur
    ADD CONSTRAINT tb_observateur_pkey PRIMARY KEY (pk_tb_observateur);


--
-- TOC entry 3276 (class 2606 OID 29035)
-- Name: tb_observateurs_leves_gps_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_observateurs_leves_gps
    ADD CONSTRAINT tb_observateurs_leves_gps_pkey PRIMARY KEY (pk_tb_observateurs_leves_gps);


--
-- TOC entry 3278 (class 2606 OID 29037)
-- Name: tb_observateurs_manipes_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_observateurs_manipes
    ADD CONSTRAINT tb_observateurs_manipes_pkey PRIMARY KEY (fk_observateur, fk_code_manipe);


--
-- TOC entry 3280 (class 2606 OID 29039)
-- Name: tb_protocoles_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_protocoles_metadonnees
    ADD CONSTRAINT tb_protocoles_metadonnees_pkey PRIMARY KEY (pk_tb_protocoles_metadonnees);


--
-- TOC entry 3282 (class 2606 OID 29041)
-- Name: tb_traces_gps_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_traces_gps
    ADD CONSTRAINT tb_traces_gps_pkey PRIMARY KEY (pk_tb_traces_gps);


--
-- TOC entry 3284 (class 2606 OID 29043)
-- Name: tb_zone_geo_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tb_zone_geo
    ADD CONSTRAINT tb_zone_geo_pkey PRIMARY KEY (pk_tb_zone_geo);


--
-- TOC entry 3286 (class 2606 OID 29045)
-- Name: trsc_especes_epigees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trsc_especes_epigees
    ADD CONSTRAINT trsc_especes_epigees_pkey PRIMARY KEY (pk_trsc_especes_epigees);


--
-- TOC entry 3288 (class 2606 OID 29047)
-- Name: trsc_especes_hypogees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trsc_especes_hypogees
    ADD CONSTRAINT trsc_especes_hypogees_pkey PRIMARY KEY (pk_trsc_especes_hypogees);


--
-- TOC entry 3290 (class 2606 OID 29049)
-- Name: trsc_transect_metadonnees_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trsc_transect_metadonnees
    ADD CONSTRAINT trsc_transect_metadonnees_pkey PRIMARY KEY (pk_trsc_transect_metadonnees);


--
-- TOC entry 3292 (class 2606 OID 29051)
-- Name: trsc_transect_parcours_fk_code_manipe_fk_numero_transect_key; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trsc_transect_parcours
    ADD CONSTRAINT trsc_transect_parcours_fk_code_manipe_fk_numero_transect_key UNIQUE (fk_code_manipe, fk_numero_transect);


--
-- TOC entry 3294 (class 2606 OID 29053)
-- Name: trsc_transect_parcours_pkey; Type: CONSTRAINT; Schema: ornithologie; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trsc_transect_parcours
    ADD CONSTRAINT trsc_transect_parcours_pkey PRIMARY KEY (pk_trsc_transect_parcours);


SET search_path = vues_ornithologie, pg_catalog;

--
-- TOC entry 3567 (class 2618 OID 30073)
-- Name: cmtg_classe_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_classe_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_classe SET classe = new.classe
  WHERE ((cmtg_indiff_classe.fk_code_metadonnees_comptage_classe)::text = (new.fk_code_metadonnees_comptage_classe)::text);


--
-- TOC entry 3568 (class 2618 OID 30076)
-- Name: cmtg_indiff_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_indiff_delete AS
    ON DELETE TO cmtg_indiff_vue DO INSTEAD  DELETE FROM ornithologie.cmtg_indiff_metadonnees
  WHERE ((cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees)::text = (old.pk_cmtg_indiff_metadonnees)::text);


--
-- TOC entry 3569 (class 2618 OID 30077)
-- Name: cmtg_indiff_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_indiff_metadonnees_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_metadonnees SET fk_espece_vernaculaire = new.fk_espece_vernaculaire, type_comptage = new.type_comptage, lieu_comptage = new.lieu_comptage, comptage_jumelle = new.comptage_jumelle, comportements = new.comportements, contacts_avec_espece = new.contacts_avec_espece, contacts_avec_espece_2 = new.contacts_avec_espece_2, precision_coordonnees = new.precision_coordonnees, remarques = new.remarques
  WHERE ((cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees)::text = (new.pk_cmtg_indiff_metadonnees)::text);


--
-- TOC entry 3570 (class 2618 OID 30078)
-- Name: cmtg_mam_marins_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_mam_marins_delete AS
    ON DELETE TO cmtg_mam_marins_vue DO INSTEAD  DELETE FROM ornithologie.cmtg_mam_marins_metadonnees
  WHERE ((cmtg_mam_marins_metadonnees.pk_cmtg_mam_marins_metadonnees)::text = (old.pk_cmtg_mam_marins_metadonnees)::text);


--
-- TOC entry 3571 (class 2618 OID 30079)
-- Name: cmtg_mam_marins_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_mam_marins_metadonnees_update AS
    ON UPDATE TO cmtg_mam_marins_vue DO INSTEAD  UPDATE ornithologie.cmtg_mam_marins_metadonnees SET lat_depart = new.lat_depart, long_depart = new.long_depart, lat_fin = new.lat_fin, long_fin = new.long_fin, remarques = new.remarques
  WHERE ((cmtg_mam_marins_metadonnees.pk_cmtg_mam_marins_metadonnees)::text = (new.pk_cmtg_mam_marins_metadonnees)::text);


--
-- TOC entry 3572 (class 2618 OID 30080)
-- Name: cmtg_mam_marins_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_mam_marins_update AS
    ON UPDATE TO cmtg_mam_marins_vue DO INSTEAD  UPDATE ornithologie.cmtg_mam_marins SET type_effectif = new.type_effectif, comptage_1 = new.comptage_1, comptage_2 = new.comptage_2, comptage_3 = new.comptage_3, comptage_4 = new.comptage_4, moyenne_comptages = new.moyenne_comptages, date_correction = new.date_correction
  WHERE ((cmtg_mam_marins.pk_cmtg_mam_marins)::text = (new.pk_cmtg_mam_marins)::text);


--
-- TOC entry 3573 (class 2618 OID 30081)
-- Name: cmtg_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_metadonnees_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_metadonnees SET remarques = new.remarques, date_correction = new.date_correction
  WHERE ((cmtg_indiff_metadonnees.pk_cmtg_indiff_metadonnees)::text = (new.pk_cmtg_indiff_metadonnees)::text);


--
-- TOC entry 3574 (class 2618 OID 30082)
-- Name: cmtg_minmax_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_minmax_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_minmax SET minimum = new.minimum, maximum = new.maximum, type_effectif = new.type_effectif_cmtg_minmax
  WHERE ((cmtg_indiff_minmax.pk_cmtg_indiff_minmax)::text = (new.pk_cmtg_indiff_minmax)::text);


--
-- TOC entry 3575 (class 2618 OID 30083)
-- Name: cmtg_nids_oeufs_poussins_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_nids_oeufs_poussins_delete AS
    ON DELETE TO cmtg_indiff_vue DO INSTEAD  DELETE FROM ornithologie.cmtg_indiff_nids_oeufs_poussins
  WHERE ((cmtg_indiff_nids_oeufs_poussins.pk_cmtg_indiff_nids_oeufs_poussins)::text = (old.pk_cmtg_indiff_nids_oeufs_poussins)::text);


--
-- TOC entry 3576 (class 2618 OID 30084)
-- Name: cmtg_nids_oeufs_poussins_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_nids_oeufs_poussins_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_nids_oeufs_poussins SET nb_oeufs = new.nb_oeufs, nb_poussins = new.nb_poussins
  WHERE ((cmtg_indiff_nids_oeufs_poussins.pk_cmtg_indiff_nids_oeufs_poussins)::text = (new.pk_cmtg_indiff_nids_oeufs_poussins)::text);


--
-- TOC entry 3577 (class 2618 OID 30085)
-- Name: cmtg_oiseaux_marins_coordonnees_colonies_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_oiseaux_marins_coordonnees_colonies_update AS
    ON UPDATE TO cmtg_oiseaux_marins_vue DO INSTEAD  UPDATE ornithologie.cmtg_oiseaux_marins_colonies_metadonnees SET latitude = new.latitude, longitude = new.longitude, fk_espece_vernaculaire = new.fk_espece_vernaculaire
  WHERE ((cmtg_oiseaux_marins_colonies_metadonnees.pk_cmtg_oiseaux_marins_colonies_metadonnees)::text = (new.pk_cmtg_oiseaux_marins_colonies_metadonnees)::text);


--
-- TOC entry 3578 (class 2618 OID 30086)
-- Name: cmtg_oiseaux_marins_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_oiseaux_marins_delete AS
    ON DELETE TO cmtg_oiseaux_marins_vue DO INSTEAD  DELETE FROM ornithologie.cmtg_oiseaux_marins
  WHERE ((cmtg_oiseaux_marins.pk_cmtg_oiseaux_marins)::text = (old.pk_cmtg_oiseaux_marins)::text);


--
-- TOC entry 3579 (class 2618 OID 30087)
-- Name: cmtg_oiseaux_marins_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_oiseaux_marins_update AS
    ON UPDATE TO cmtg_oiseaux_marins_vue DO INSTEAD  UPDATE ornithologie.cmtg_oiseaux_marins SET type_effectif = new.type_effectif, comptage_1_envol = new.comptage_1_envol, comptage_2_envol = new.comptage_2_envol, comptage_3_envol = new.comptage_3_envol, comptage_4_envol = new.comptage_4_envol, comptage_1_adistance = new.comptage_1_adistance, comptage_2_adistance = new.comptage_2_adistance, comptage_3_adistance = new.comptage_3_adistance, comptage_4_adistance = new.comptage_4_adistance, moyenne_comptages_envol = new.moyenne_comptages_envol, moyenne_comptages_adistance = new.moyenne_comptages_adistance, date_correction = new.date_correction, saison = new.saison, numero_passage = new.numero_passage, comptage_en_vol = new.comptage_en_vol, comptage_a_distance = new.comptage_a_distance, rien_vu_lors_du_passage = new.rien_vu_lors_du_passage, remarques = new.remarques
  WHERE ((cmtg_oiseaux_marins.pk_cmtg_oiseaux_marins)::text = (new.pk_cmtg_oiseaux_marins)::text);


--
-- TOC entry 3580 (class 2618 OID 30089)
-- Name: cmtg_precis_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_precis_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_precis SET comptage_1 = new.comptage_1, comptage_2 = new.comptage_2, comptage_3 = new.comptage_3, comptage_4 = new.comptage_4, type_effectif = new.type_effectif_cmtg_precis
  WHERE ((cmtg_indiff_precis.pk_cmtg_indiff_precis)::text = (new.pk_cmtg_indiff_precis)::text);


--
-- TOC entry 3581 (class 2618 OID 30090)
-- Name: cmtg_territoire_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE cmtg_territoire_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.cmtg_indiff_territoire SET nb_territoires = new.nb_territoires
  WHERE ((cmtg_indiff_territoire.fk_code_metadonnees_comptage_territoire)::text = (new.fk_code_metadonnees_comptage_territoire)::text);


--
-- TOC entry 3582 (class 2618 OID 30091)
-- Name: demos_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE demos_delete AS
    ON DELETE TO demos_vue DO INSTEAD  DELETE FROM ornithologie.demos_comptage
  WHERE ((demos_comptage.pk_demos_comptage)::text = (old.pk_demos_comptage)::text);


--
-- TOC entry 3583 (class 2618 OID 30092)
-- Name: demos_indices_occup_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE demos_indices_occup_delete AS
    ON DELETE TO demos_vue DO INSTEAD  DELETE FROM ornithologie.demos_indices_occup
  WHERE ((demos_indices_occup.pk_demos_indices_occup)::text = (old.pk_demos_indices_occup)::text);


--
-- TOC entry 3584 (class 2618 OID 30093)
-- Name: demos_indices_occup_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE demos_indices_occup_update AS
    ON UPDATE TO demos_vue DO INSTEAD  UPDATE ornithologie.demos_indices_occup SET indices_occupation_1 = new.indices_occupation_1, indices_occupation_2 = new.indices_occupation_2, indices_occupation_3 = new.indices_occupation_3
  WHERE ((demos_indices_occup.pk_demos_indices_occup)::text = (new.pk_demos_indices_occup)::text);


--
-- TOC entry 3585 (class 2618 OID 30094)
-- Name: demos_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE demos_update AS
    ON UPDATE TO demos_vue DO INSTEAD  UPDATE ornithologie.demos_comptage SET reponse_a_la_repasse = new.reponse_a_la_repasse, presence_dans_terrier = new.presence_dans_terrier, remarques = new.remarques, date_correction = new.date_correction, saison = new.saison, numero_passage = new.numero_passage
  WHERE ((demos_comptage.pk_demos_comptage)::text = (new.pk_demos_comptage)::text);


--
-- TOC entry 3586 (class 2618 OID 30095)
-- Name: leve_gps_metadonnees_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE leve_gps_metadonnees_delete AS
    ON DELETE TO tb_leve_gps_metadonnees_vue DO INSTEAD  DELETE FROM ornithologie.tb_leve_gps_metadonnees
  WHERE ((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (old.pk_tb_leve_gps_metadonnees)::text);


--
-- TOC entry 3587 (class 2618 OID 30096)
-- Name: leve_gps_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE leve_gps_metadonnees_update AS
    ON UPDATE TO tb_leve_gps_metadonnees_vue DO INSTEAD  UPDATE ornithologie.tb_leve_gps_metadonnees SET heure_leve = new.heure_leve, numero_gps = new.numero_gps, id_pt_gps = new.id_pt_gps, latitude = new.latitude, longitude = new.longitude, origine_coordonnees = new.origine_coordonnees, remarques = new.remarques
  WHERE ((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (new.pk_tb_leve_gps_metadonnees)::text);


--
-- TOC entry 3588 (class 2618 OID 30097)
-- Name: observateurs_pointgps_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE observateurs_pointgps_delete AS
    ON DELETE TO observateurs_pointgps_vue DO INSTEAD  DELETE FROM ornithologie.tb_observateurs_leves_gps
  WHERE ((tb_observateurs_leves_gps.pk_tb_observateurs_leves_gps)::text = (old.pk_tb_observateurs_leves_gps)::text);


--
-- TOC entry 3589 (class 2618 OID 30098)
-- Name: observateurs_pointgps_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE observateurs_pointgps_update AS
    ON UPDATE TO observateurs_pointgps_vue DO INSTEAD  UPDATE ornithologie.tb_observateurs_leves_gps SET fk_observateur = new.fk_observateur
  WHERE ((tb_observateurs_leves_gps.pk_tb_observateurs_leves_gps)::text = (new.pk_tb_observateurs_leves_gps)::text);


--
-- TOC entry 3590 (class 2618 OID 30099)
-- Name: pc_permanent_changement_vegetation_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE pc_permanent_changement_vegetation_update AS
    ON UPDATE TO pc_permanent_vue DO INSTEAD  UPDATE ornithologie.pc_permanent_changement_vegetation SET vegetation = new.vegetation
  WHERE ((pc_permanent_changement_vegetation.pk_pc_permanent_changement_vegetation)::text = (new.pk_pc_permanent_changement_vegetation)::text);


--
-- TOC entry 3591 (class 2618 OID 30100)
-- Name: pc_permanent_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE pc_permanent_delete AS
    ON DELETE TO pc_permanent_vue DO INSTEAD  DELETE FROM ornithologie.pc_permanent
  WHERE ((pc_permanent.pk_pc_permanent)::text = (old.pk_pc_permanent)::text);


--
-- TOC entry 3592 (class 2618 OID 30101)
-- Name: pc_permanent_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE pc_permanent_update AS
    ON UPDATE TO pc_permanent_vue DO INSTEAD  UPDATE ornithologie.pc_permanent SET signe_occupation_1 = new.signe_occupation_1, signe_occupation_2 = new.signe_occupation_2, signe_occupation_3 = new.signe_occupation_3, reponse_a_la_repasse = new.reponse_a_la_repasse, verif_occupation_terrier = new.verif_occupation_terrier, verif_si_oeuf = new.verif_si_oeuf, remarques = new.remarques, date_correction = new.date_correction, fk_espece_vernaculaire = new.fk_espece_vernaculaire
  WHERE ((pc_permanent.pk_pc_permanent)::text = (new.pk_pc_permanent)::text);


--
-- TOC entry 3593 (class 2618 OID 30102)
-- Name: pc_surtransect_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE pc_surtransect_delete AS
    ON DELETE TO pc_surtransect_vue DO INSTEAD  DELETE FROM ornithologie.pc_surtransect
  WHERE ((pc_surtransect.pk_pc_surtransect)::text = (old.pk_pc_surtransect)::text);


--
-- TOC entry 3594 (class 2618 OID 30103)
-- Name: pc_surtransect_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE pc_surtransect_update AS
    ON UPDATE TO pc_surtransect_vue DO INSTEAD  UPDATE ornithologie.pc_surtransect SET signe_occupation_1 = new.signe_occupation_1, signe_occupation_2 = new.signe_occupation_2, signe_occupation_3 = new.signe_occupation_3, reponse_a_la_repasse = new.reponse_a_la_repasse, verif_occupation_terrier = new.verif_occupation_terrier, verif_si_oeuf = new.verif_si_oeuf, remarques = new.remarques, vegetation = new.vegetation, pente = new.pente, orientation = new.orientation, date_correction = new.date_correction, distance_au_pt_precedent = new.distance_au_pt_precedent, numero_transect = new.numero_transect, fk_espece_vernaculaire = new.fk_espece_vernaculaire
  WHERE ((pc_surtransect.pk_pc_surtransect)::text = (new.pk_pc_surtransect)::text);


--
-- TOC entry 3619 (class 2618 OID 30478)
-- Name: reprise_bague_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE reprise_bague_delete AS
    ON DELETE TO reprise_bague_vue DO INSTEAD  DELETE FROM ornithologie.reprise_bague
  WHERE ((reprise_bague.pk_reprise_bague)::text = (old.pk_reprise_bague)::text);


--
-- TOC entry 3620 (class 2618 OID 30479)
-- Name: reprise_bague_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE reprise_bague_update AS
    ON UPDATE TO reprise_bague_vue DO INSTEAD  UPDATE ornithologie.reprise_bague SET statut = new.statut, num_bague_metal = new.num_bague_metal, num_bague_darvic = new.num_bague_darvic, pays_origine = new.pays_origine, remarques = new.remarques, date_correction = new.date_correction, fk_espece_vernaculaire = new.fk_espece_vernaculaire
  WHERE ((reprise_bague.pk_reprise_bague)::text = (new.pk_reprise_bague)::text);


--
-- TOC entry 3595 (class 2618 OID 30104)
-- Name: srep_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE srep_delete AS
    ON DELETE TO srep_vue DO INSTEAD  DELETE FROM ornithologie.srep_comptage
  WHERE ((srep_comptage.pk_srep_comptage)::text = (old.pk_srep_comptage)::text);


--
-- TOC entry 3596 (class 2618 OID 30105)
-- Name: srep_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE srep_update AS
    ON UPDATE TO srep_vue DO INSTEAD  UPDATE ornithologie.srep_comptage SET type_effectif = new.type_effectif, comptage_1 = new.comptage_1, comptage_2 = new.comptage_2, comptage_3 = new.comptage_3, comptage_4 = new.comptage_4, moyenne_comptages = new.moyenne_comptages, remarques = new.remarques, date_correction = new.date_correction, saison = new.saison, numero_passage = new.numero_passage
  WHERE ((srep_comptage.pk_srep_comptage)::text = (new.pk_srep_comptage)::text);


--
-- TOC entry 3597 (class 2618 OID 30106)
-- Name: tb_leve_gps_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_leve_gps_metadonnees_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.tb_leve_gps_metadonnees SET id_pt_gps = new.id_pt_gps, numero_gps = new.numero_gps, heure_leve = new.heure_leve, latitude = new.latitude, longitude = new.longitude, remarques = new.remarques_leve_gps, origine_coordonnees = new.origine_coordonnees
  WHERE ((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (new.pk_tb_leve_gps_metadonnees)::text);


--
-- TOC entry 3598 (class 2618 OID 30107)
-- Name: tb_leve_gps_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_leve_gps_metadonnees_update AS
    ON UPDATE TO trsc_especes_epigees_vue DO INSTEAD  UPDATE ornithologie.tb_leve_gps_metadonnees SET id_pt_gps = new.id_pt_gps, heure_leve = new.heure_leve, latitude = new.latitude, longitude = new.longitude, remarques = new.remarques_leve_gps, origine_coordonnees = new.origine_coordonnees
  WHERE ((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (new.pk_tb_leve_gps_metadonnees)::text);


--
-- TOC entry 3599 (class 2618 OID 30109)
-- Name: tb_leve_gps_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_leve_gps_metadonnees_update AS
    ON UPDATE TO trsc_especes_hypogees_vue DO INSTEAD  UPDATE ornithologie.tb_leve_gps_metadonnees SET id_pt_gps = new.id_pt_gps, heure_leve = new.heure_leve, latitude = new.latitude, longitude = new.longitude, remarques = new.remarques_leve_gps, origine_coordonnees = new.origine_coordonnees
  WHERE ((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (new.pk_tb_leve_gps_metadonnees)::text);


--
-- TOC entry 3600 (class 2618 OID 30111)
-- Name: tb_leve_gps_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_leve_gps_metadonnees_update AS
    ON UPDATE TO pc_surtransect_vue DO INSTEAD  UPDATE ornithologie.tb_leve_gps_metadonnees SET id_pt_gps = new.id_pt_gps, heure_leve = new.heure_leve, latitude = new.latitude, longitude = new.longitude, remarques = new.remarques_leve_gps, origine_coordonnees = new.origine_coordonnees
  WHERE ((tb_leve_gps_metadonnees.pk_tb_leve_gps_metadonnees)::text = (new.pk_tb_leve_gps_metadonnees)::text);


--
-- TOC entry 3601 (class 2618 OID 30113)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO cmtg_indiff_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3602 (class 2618 OID 30114)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO trsc_especes_epigees_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3603 (class 2618 OID 30115)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO trsc_especes_hypogees_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3604 (class 2618 OID 30116)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO cmtg_oiseaux_marins_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3605 (class 2618 OID 30117)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO pc_permanent_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3606 (class 2618 OID 30118)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO pc_surtransect_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3607 (class 2618 OID 30119)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO cmtg_mam_marins_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3608 (class 2618 OID 30121)
-- Name: tb_manipe_metadonnees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE tb_manipe_metadonnees_update AS
    ON UPDATE TO demos_vue DO INSTEAD  UPDATE ornithologie.tb_manipe_metadonnees SET fk_site = new.fk_site, fk_site_arrivee = new.fk_site_arrivee, remarques_manipe = new.remarques_manipe
  WHERE ((tb_manipe_metadonnees.pk_tb_manipe_metadonnees)::text = (new.pk_tb_manipe_metadonnees)::text);


--
-- TOC entry 3609 (class 2618 OID 30122)
-- Name: trsc_especes_epigees_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE trsc_especes_epigees_delete AS
    ON DELETE TO trsc_especes_epigees_vue DO INSTEAD  DELETE FROM ornithologie.trsc_especes_epigees
  WHERE ((trsc_especes_epigees.pk_trsc_especes_epigees)::text = (old.pk_trsc_especes_epigees)::text);


--
-- TOC entry 3610 (class 2618 OID 30123)
-- Name: trsc_especes_epigees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE trsc_especes_epigees_update AS
    ON UPDATE TO trsc_especes_epigees_vue DO INSTEAD  UPDATE ornithologie.trsc_especes_epigees SET distance_angulaire_d = new.distance_angulaire_d, angle_magnetique_telemetre_a1 = new.angle_magnetique_telemetre_a1, angle_transect_a2 = new.angle_transect_a2, distance_perpendiculaire_d = new.distance_perpendiculaire_d, activite_comportement = new.activite_comportement, indice_reproduction = new.indice_reproduction, nombre_oeufs = new.nombre_oeufs, nombre_poussins = new.nombre_poussins, canards_effectif_male = new.canards_effectif_male, canards_effectif_femelle = new.canards_effectif_femelle, canards_effectif_indetermine = new.canards_effectif_indetermine, somme_effectif = new.somme_effectif_canards, remarques = new.remarques, nb_skuas = new.nb_skuas, date_correction = new.date_correction, fk_espece_vernaculaire = new.fk_espece_vernaculaire, vegetation = new.vegetation
  WHERE ((trsc_especes_epigees.pk_trsc_especes_epigees)::text = (new.pk_trsc_especes_epigees)::text);


--
-- TOC entry 3611 (class 2618 OID 30125)
-- Name: trsc_especes_hypogees_delete; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE trsc_especes_hypogees_delete AS
    ON DELETE TO trsc_especes_hypogees_vue DO INSTEAD  DELETE FROM ornithologie.trsc_especes_hypogees
  WHERE ((trsc_especes_hypogees.pk_trsc_especes_hypogees)::text = (old.pk_trsc_especes_hypogees)::text);


--
-- TOC entry 3612 (class 2618 OID 30126)
-- Name: trsc_especes_hypogees_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE trsc_especes_hypogees_update AS
    ON UPDATE TO trsc_especes_hypogees_vue DO INSTEAD  UPDATE ornithologie.trsc_especes_hypogees SET distance_perpendiculaire_d = new.distance_perpendiculaire_d, signe_occupation_1 = new.signe_occupation_1, signe_occupation_2 = new.signe_occupation_2, signe_occupation_3 = new.signe_occupation_3, reponse_a_la_repasse = new.reponse_a_la_repasse, verif_occupation_terrier = new.verif_occupation_terrier, verif_si_oeuf = new.verif_si_oeuf, remarques = new.remarques, date_correction = new.date_correction, fk_espece_vernaculaire = new.fk_espece_vernaculaire, vegetation = new.vegetation
  WHERE ((trsc_especes_hypogees.pk_trsc_especes_hypogees)::text = (new.pk_trsc_especes_hypogees)::text);


--
-- TOC entry 3613 (class 2618 OID 30128)
-- Name: trsc_transect_parcours_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE trsc_transect_parcours_update AS
    ON UPDATE TO trsc_especes_epigees_vue DO INSTEAD  UPDATE ornithologie.trsc_transect_parcours SET fk_observateur = new.fk_observateur, remarques_transect = new.remarques_transect, aucune_obs = new.aucune_obs, longueur_sur_terrain = new.longueur_sur_terrain, direction_suivie = new.direction_suivie
  WHERE ((trsc_transect_parcours.pk_trsc_transect_parcours)::text = (new.pk_trsc_transect_parcours)::text);


--
-- TOC entry 3614 (class 2618 OID 30129)
-- Name: trsc_transect_parcours_update; Type: RULE; Schema: vues_ornithologie; Owner: postgres
--

CREATE RULE trsc_transect_parcours_update AS
    ON UPDATE TO trsc_especes_hypogees_vue DO INSTEAD  UPDATE ornithologie.trsc_transect_parcours SET fk_observateur = new.fk_observateur, remarques_transect = new.remarques_transect, aucune_obs = new.aucune_obs, longueur_sur_terrain = new.longueur_sur_terrain, direction_suivie = new.direction_suivie
  WHERE ((trsc_transect_parcours.pk_trsc_transect_parcours)::text = (new.pk_trsc_transect_parcours)::text);


SET search_path = ornithologie, pg_catalog;

--
-- TOC entry 3393 (class 2620 OID 29054)
-- Name: calcul_date_saisie_dans_bd_manipe; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_date_saisie_dans_bd_manipe BEFORE INSERT ON tb_manipe_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_date_saisie_dans_bd();


--
-- TOC entry 3397 (class 2620 OID 29055)
-- Name: calcul_date_saisie_dans_bd_traces_gps; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_date_saisie_dans_bd_traces_gps BEFORE INSERT ON tb_traces_gps FOR EACH ROW EXECUTE PROCEDURE calcul_date_saisie_dans_bd();


--
-- TOC entry 3401 (class 2620 OID 29056)
-- Name: calcul_date_saisie_dans_bd_trsc_transect_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_date_saisie_dans_bd_trsc_transect_metadonnees BEFORE INSERT ON trsc_transect_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_date_saisie_dans_bd();


--
-- TOC entry 3402 (class 2620 OID 29057)
-- Name: calcul_longueur_theorique_transect; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_longueur_theorique_transect BEFORE INSERT OR UPDATE ON trsc_transect_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_longueur_theorique_transect();


--
-- TOC entry 3363 (class 2620 OID 29058)
-- Name: calcul_moyenne_cmtg_indiff_precis; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_moyenne_cmtg_indiff_precis BEFORE INSERT OR UPDATE ON cmtg_indiff_precis FOR EACH ROW EXECUTE PROCEDURE calcul_moyenne_comptages();


--
-- TOC entry 3365 (class 2620 OID 29059)
-- Name: calcul_moyenne_cmtg_mam_marins; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_moyenne_cmtg_mam_marins BEFORE INSERT OR UPDATE ON cmtg_mam_marins FOR EACH ROW EXECUTE PROCEDURE calcul_moyenne_comptages();


--
-- TOC entry 3371 (class 2620 OID 29060)
-- Name: calcul_moyenne_cmtg_oiseaux_marins_adistance; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_moyenne_cmtg_oiseaux_marins_adistance BEFORE INSERT OR UPDATE ON cmtg_oiseaux_marins FOR EACH ROW EXECUTE PROCEDURE calcul_moyenne_cmtg_oiseaux_marins_adistance();


--
-- TOC entry 3372 (class 2620 OID 29061)
-- Name: calcul_moyenne_cmtg_oiseaux_marins_envol; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_moyenne_cmtg_oiseaux_marins_envol BEFORE INSERT OR UPDATE ON cmtg_oiseaux_marins FOR EACH ROW EXECUTE PROCEDURE calcul_moyenne_cmtg_oiseaux_marins_envol();


--
-- TOC entry 3389 (class 2620 OID 29062)
-- Name: calcul_moyenne_comptages_srep; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_moyenne_comptages_srep BEFORE INSERT OR UPDATE ON srep_comptage FOR EACH ROW EXECUTE PROCEDURE calcul_moyenne_comptages();


--
-- TOC entry 3360 (class 2620 OID 29064)
-- Name: calcul_pk_cmtg_indiff_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_indiff_metadonnees BEFORE INSERT ON cmtg_indiff_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_indiff_metadonnees();


--
-- TOC entry 3361 (class 2620 OID 29065)
-- Name: calcul_pk_cmtg_indiff_minmax; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_indiff_minmax BEFORE INSERT ON cmtg_indiff_minmax FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_indiff_minmax();


--
-- TOC entry 3362 (class 2620 OID 29066)
-- Name: calcul_pk_cmtg_indiff_nids_oeufs_poussins; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_indiff_nids_oeufs_poussins BEFORE INSERT ON cmtg_indiff_nids_oeufs_poussins FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_indiff_nids_oeufs_poussins();


--
-- TOC entry 3364 (class 2620 OID 29067)
-- Name: calcul_pk_cmtg_indiff_precis; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_indiff_precis BEFORE INSERT ON cmtg_indiff_precis FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_indiff_precis();


--
-- TOC entry 3366 (class 2620 OID 29068)
-- Name: calcul_pk_cmtg_mam_marins; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_mam_marins BEFORE INSERT OR UPDATE ON cmtg_mam_marins FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_mam_marins();


--
-- TOC entry 3367 (class 2620 OID 29069)
-- Name: calcul_pk_cmtg_mam_marins_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_mam_marins_metadonnees BEFORE INSERT OR UPDATE ON cmtg_mam_marins_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_mam_marins_metadonnees();


--
-- TOC entry 3373 (class 2620 OID 29070)
-- Name: calcul_pk_cmtg_oiseaux_marins; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_oiseaux_marins BEFORE INSERT OR UPDATE ON cmtg_oiseaux_marins FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_oiseaux_marins();


--
-- TOC entry 3374 (class 2620 OID 29071)
-- Name: calcul_pk_cmtg_oiseaux_marins_colonies_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_cmtg_oiseaux_marins_colonies_metadonnees BEFORE INSERT OR UPDATE ON cmtg_oiseaux_marins_colonies_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_cmtg_oiseaux_marins_colonies_metadonnees();


--
-- TOC entry 3376 (class 2620 OID 29072)
-- Name: calcul_pk_demos_bilan_repro; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_demos_bilan_repro BEFORE INSERT OR UPDATE ON demos_bilan_repro FOR EACH ROW EXECUTE PROCEDURE calcul_pk_demos_bilan_repro();


--
-- TOC entry 3377 (class 2620 OID 29073)
-- Name: calcul_pk_demos_comptage; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_demos_comptage BEFORE INSERT OR UPDATE ON demos_comptage FOR EACH ROW EXECUTE PROCEDURE calcul_pk_demos_comptage();


--
-- TOC entry 3378 (class 2620 OID 29074)
-- Name: calcul_pk_demos_indices_occup; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_demos_indices_occup BEFORE INSERT OR UPDATE ON demos_indices_occup FOR EACH ROW EXECUTE PROCEDURE calcul_pk_demos_indices_occup();


--
-- TOC entry 3380 (class 2620 OID 29075)
-- Name: calcul_pk_pc_permanent; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_pc_permanent BEFORE INSERT OR UPDATE ON pc_permanent FOR EACH ROW EXECUTE PROCEDURE calcul_pk_pc_permanent();


--
-- TOC entry 3381 (class 2620 OID 29076)
-- Name: calcul_pk_pc_permanent_changement_vegetation; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_pc_permanent_changement_vegetation BEFORE INSERT OR UPDATE ON pc_permanent_changement_vegetation FOR EACH ROW EXECUTE PROCEDURE calcul_pk_pc_permanent_changement_vegetation();


--
-- TOC entry 3382 (class 2620 OID 29077)
-- Name: calcul_pk_pc_permanent_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_pc_permanent_metadonnees BEFORE INSERT OR UPDATE ON pc_permanent_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_pc_permanent_metadonnees();


--
-- TOC entry 3384 (class 2620 OID 29078)
-- Name: calcul_pk_pc_surtransect; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_pc_surtransect BEFORE INSERT ON pc_surtransect FOR EACH ROW EXECUTE PROCEDURE calcul_pk_pc_surtransect();


--
-- TOC entry 3404 (class 2620 OID 30472)
-- Name: calcul_pk_repise_bague; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_repise_bague BEFORE INSERT OR UPDATE ON reprise_bague FOR EACH ROW EXECUTE PROCEDURE calcul_pk_repise_bague();


--
-- TOC entry 3385 (class 2620 OID 29079)
-- Name: calcul_pk_srep_colonies_coordonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_srep_colonies_coordonnees BEFORE INSERT OR UPDATE ON srep_colonies_coordonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_srep_colonies_coordonnees();


--
-- TOC entry 3387 (class 2620 OID 29080)
-- Name: calcul_pk_srep_colonies_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_srep_colonies_metadonnees BEFORE INSERT OR UPDATE ON srep_colonies_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_srep_colonies_metadonnees();


--
-- TOC entry 3390 (class 2620 OID 29081)
-- Name: calcul_pk_srep_comptage; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_srep_comptage BEFORE INSERT OR UPDATE ON srep_comptage FOR EACH ROW EXECUTE PROCEDURE calcul_pk_srep_comptage();


--
-- TOC entry 3391 (class 2620 OID 29082)
-- Name: calcul_pk_tb_leve_gps_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_tb_leve_gps_metadonnees BEFORE INSERT ON tb_leve_gps_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_tb_leve_gps_metadonnees();


--
-- TOC entry 3396 (class 2620 OID 29083)
-- Name: calcul_pk_tb_observateurs_leves_gps; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_tb_observateurs_leves_gps BEFORE INSERT OR UPDATE ON tb_observateurs_leves_gps FOR EACH ROW EXECUTE PROCEDURE calcul_pk_tb_observateurs_leves_gps();


--
-- TOC entry 3398 (class 2620 OID 29084)
-- Name: calcul_pk_trsc_especes_epigees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_trsc_especes_epigees BEFORE INSERT OR UPDATE ON trsc_especes_epigees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_trsc_especes_epigees();


--
-- TOC entry 3400 (class 2620 OID 29085)
-- Name: calcul_pk_trsc_especes_hypogees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_trsc_especes_hypogees BEFORE INSERT OR UPDATE ON trsc_especes_hypogees FOR EACH ROW EXECUTE PROCEDURE calcul_pk_trsc_especes_hypogees();


--
-- TOC entry 3403 (class 2620 OID 29086)
-- Name: calcul_pk_trsc_transect_parcours; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_pk_trsc_transect_parcours BEFORE INSERT OR UPDATE ON trsc_transect_parcours FOR EACH ROW EXECUTE PROCEDURE calcul_pk_trsc_transect_parcours();


--
-- TOC entry 3368 (class 2620 OID 29087)
-- Name: calcul_position_pt_depart_cmtg_mam_marins; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_position_pt_depart_cmtg_mam_marins BEFORE INSERT OR UPDATE ON cmtg_mam_marins_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_position_pt_depart_cmtg_mam_marins();


--
-- TOC entry 3369 (class 2620 OID 29088)
-- Name: calcul_position_pt_fin_cmtg_mam_marins; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_position_pt_fin_cmtg_mam_marins BEFORE INSERT OR UPDATE ON cmtg_mam_marins_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_position_pt_fin_cmtg_mam_marins();


--
-- TOC entry 3399 (class 2620 OID 29089)
-- Name: calcul_somme_effectif_trsc_especes_epigees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_somme_effectif_trsc_especes_epigees BEFORE INSERT OR UPDATE ON trsc_especes_epigees FOR EACH ROW EXECUTE PROCEDURE calcul_somme_effectif_trsc_especes_epigees();


--
-- TOC entry 3370 (class 2620 OID 29090)
-- Name: calcul_the_geom_cmtg_mam_marins_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_cmtg_mam_marins_metadonnees BEFORE INSERT OR UPDATE ON cmtg_mam_marins_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom_cmtg_mam_marins_metadonnees();


--
-- TOC entry 3375 (class 2620 OID 29091)
-- Name: calcul_the_geom_cmtg_oiseaux_marins_colonies_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_cmtg_oiseaux_marins_colonies_metadonnees BEFORE INSERT OR UPDATE ON cmtg_oiseaux_marins_colonies_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3379 (class 2620 OID 29092)
-- Name: calcul_the_geom_demos_terriers_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_demos_terriers_metadonnees BEFORE INSERT OR UPDATE ON demos_terriers_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3383 (class 2620 OID 29093)
-- Name: calcul_the_geom_pc_permanent_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_pc_permanent_metadonnees BEFORE INSERT OR UPDATE ON pc_permanent_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3386 (class 2620 OID 29094)
-- Name: calcul_the_geom_srep_colonies_coordonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_srep_colonies_coordonnees BEFORE INSERT OR UPDATE ON srep_colonies_coordonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3388 (class 2620 OID 29095)
-- Name: calcul_the_geom_srep_colonies_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_srep_colonies_metadonnees BEFORE INSERT OR UPDATE ON srep_colonies_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom();


--
-- TOC entry 3392 (class 2620 OID 29096)
-- Name: calcul_the_geom_tb_leve_gps_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER calcul_the_geom_tb_leve_gps_metadonnees BEFORE INSERT OR UPDATE ON tb_leve_gps_metadonnees FOR EACH ROW EXECUTE PROCEDURE calcul_the_geom_tb_leve_gps_metadonnees();


--
-- TOC entry 3394 (class 2620 OID 29097)
-- Name: trigg_pk_tb_manipe_metadonnees; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER trigg_pk_tb_manipe_metadonnees BEFORE INSERT ON tb_manipe_metadonnees FOR EACH ROW EXECUTE PROCEDURE trigg_pk_tb_manipe_metadonnees();


--
-- TOC entry 3395 (class 2620 OID 29098)
-- Name: trigg_pk_tb_observateur; Type: TRIGGER; Schema: ornithologie; Owner: postgres
--

CREATE TRIGGER trigg_pk_tb_observateur BEFORE INSERT OR UPDATE ON tb_observateur FOR EACH ROW EXECUTE PROCEDURE trigg_pk_tb_observateur();


--
-- TOC entry 3299 (class 2606 OID 29114)
-- Name: cmtg_indiff_classe_fk_code_metadonnees_comptage_classe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_classe
    ADD CONSTRAINT cmtg_indiff_classe_fk_code_metadonnees_comptage_classe_fkey FOREIGN KEY (fk_code_metadonnees_comptage_classe) REFERENCES cmtg_indiff_metadonnees(pk_cmtg_indiff_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3302 (class 2606 OID 29119)
-- Name: cmtg_indiff_metadonnees_fk_code_leve_gps_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_metadonnees
    ADD CONSTRAINT cmtg_indiff_metadonnees_fk_code_leve_gps_fkey FOREIGN KEY (fk_code_leve_gps) REFERENCES tb_leve_gps_metadonnees(pk_tb_leve_gps_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3301 (class 2606 OID 29124)
-- Name: cmtg_indiff_metadonnees_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_metadonnees
    ADD CONSTRAINT cmtg_indiff_metadonnees_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3300 (class 2606 OID 29129)
-- Name: cmtg_indiff_metadonnees_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_metadonnees
    ADD CONSTRAINT cmtg_indiff_metadonnees_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3303 (class 2606 OID 29134)
-- Name: cmtg_indiff_minmax_fk_code_metadonnees_comptage_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_minmax
    ADD CONSTRAINT cmtg_indiff_minmax_fk_code_metadonnees_comptage_fkey FOREIGN KEY (fk_code_metadonnees_comptage) REFERENCES cmtg_indiff_metadonnees(pk_cmtg_indiff_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3304 (class 2606 OID 29139)
-- Name: cmtg_indiff_nids_oeufs_poussi_fk_code_metadonnees_comptage_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_nids_oeufs_poussins
    ADD CONSTRAINT cmtg_indiff_nids_oeufs_poussi_fk_code_metadonnees_comptage_fkey FOREIGN KEY (fk_code_metadonnees_comptage) REFERENCES cmtg_indiff_metadonnees(pk_cmtg_indiff_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3305 (class 2606 OID 29144)
-- Name: cmtg_indiff_precis_fk_code_metadonnees_comptage_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_precis
    ADD CONSTRAINT cmtg_indiff_precis_fk_code_metadonnees_comptage_fkey FOREIGN KEY (fk_code_metadonnees_comptage) REFERENCES cmtg_indiff_metadonnees(pk_cmtg_indiff_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3306 (class 2606 OID 29149)
-- Name: cmtg_indiff_territoire_fk_code_metadonnees_comptage_territ_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_indiff_territoire
    ADD CONSTRAINT cmtg_indiff_territoire_fk_code_metadonnees_comptage_territ_fkey FOREIGN KEY (fk_code_metadonnees_comptage_territoire) REFERENCES cmtg_indiff_metadonnees(pk_cmtg_indiff_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3307 (class 2606 OID 29154)
-- Name: cmtg_mam_marins_fk_cmtg_mam_marins_metadonnees_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_mam_marins
    ADD CONSTRAINT cmtg_mam_marins_fk_cmtg_mam_marins_metadonnees_fkey FOREIGN KEY (fk_cmtg_mam_marins_metadonnees) REFERENCES cmtg_mam_marins_metadonnees(pk_cmtg_mam_marins_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3309 (class 2606 OID 29159)
-- Name: cmtg_mam_marins_metadonnees_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_mam_marins_metadonnees
    ADD CONSTRAINT cmtg_mam_marins_metadonnees_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3308 (class 2606 OID 29164)
-- Name: cmtg_mam_marins_metadonnees_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_mam_marins_metadonnees
    ADD CONSTRAINT cmtg_mam_marins_metadonnees_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3313 (class 2606 OID 29169)
-- Name: cmtg_oiseaux_marins_colonies_metado_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_oiseaux_marins_colonies_metadonnees
    ADD CONSTRAINT cmtg_oiseaux_marins_colonies_metado_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3312 (class 2606 OID 29174)
-- Name: cmtg_oiseaux_marins_colonies_metadonnees_fk_zone_geo_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_oiseaux_marins_colonies_metadonnees
    ADD CONSTRAINT cmtg_oiseaux_marins_colonies_metadonnees_fk_zone_geo_fkey FOREIGN KEY (fk_zone_geo) REFERENCES tb_zone_geo(pk_tb_zone_geo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3311 (class 2606 OID 29179)
-- Name: cmtg_oiseaux_marins_fk_cmtg_oiseaux_marins_colonies_metado_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_oiseaux_marins
    ADD CONSTRAINT cmtg_oiseaux_marins_fk_cmtg_oiseaux_marins_colonies_metado_fkey FOREIGN KEY (fk_cmtg_oiseaux_marins_colonies_metadonnees) REFERENCES cmtg_oiseaux_marins_colonies_metadonnees(pk_cmtg_oiseaux_marins_colonies_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3310 (class 2606 OID 29184)
-- Name: cmtg_oiseaux_marins_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY cmtg_oiseaux_marins
    ADD CONSTRAINT cmtg_oiseaux_marins_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3314 (class 2606 OID 29189)
-- Name: demos_bilan_repro_fk_piquet_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY demos_bilan_repro
    ADD CONSTRAINT demos_bilan_repro_fk_piquet_fkey FOREIGN KEY (fk_piquet) REFERENCES demos_terriers_metadonnees(pk_demos_terriers_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3316 (class 2606 OID 29194)
-- Name: demos_comptage_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY demos_comptage
    ADD CONSTRAINT demos_comptage_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3315 (class 2606 OID 29199)
-- Name: demos_comptage_fk_piquet_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY demos_comptage
    ADD CONSTRAINT demos_comptage_fk_piquet_fkey FOREIGN KEY (fk_piquet) REFERENCES demos_terriers_metadonnees(pk_demos_terriers_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3318 (class 2606 OID 29204)
-- Name: demos_indices_occup_fk_demos_comptage_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY demos_indices_occup
    ADD CONSTRAINT demos_indices_occup_fk_demos_comptage_fkey FOREIGN KEY (fk_demos_comptage) REFERENCES demos_comptage(pk_demos_comptage) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3317 (class 2606 OID 29209)
-- Name: demos_indices_occup_fk_piquet_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY demos_indices_occup
    ADD CONSTRAINT demos_indices_occup_fk_piquet_fkey FOREIGN KEY (fk_piquet) REFERENCES demos_terriers_metadonnees(pk_demos_terriers_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3319 (class 2606 OID 29214)
-- Name: demos_terriers_metadonnees_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY demos_terriers_metadonnees
    ADD CONSTRAINT demos_terriers_metadonnees_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3323 (class 2606 OID 29219)
-- Name: pc_permanent_changement_vegetation_fk_numero_piquet_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_permanent_changement_vegetation
    ADD CONSTRAINT pc_permanent_changement_vegetation_fk_numero_piquet_fkey FOREIGN KEY (fk_numero_piquet) REFERENCES pc_permanent_metadonnees(pk_pc_permanent_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3322 (class 2606 OID 29224)
-- Name: pc_permanent_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_permanent
    ADD CONSTRAINT pc_permanent_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3321 (class 2606 OID 29229)
-- Name: pc_permanent_fk_code_piquet_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_permanent
    ADD CONSTRAINT pc_permanent_fk_code_piquet_fkey FOREIGN KEY (fk_code_piquet) REFERENCES pc_permanent_metadonnees(pk_pc_permanent_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3320 (class 2606 OID 29234)
-- Name: pc_permanent_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_permanent
    ADD CONSTRAINT pc_permanent_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3324 (class 2606 OID 29239)
-- Name: pc_permanent_metadonnees_fk_zone_geo_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_permanent_metadonnees
    ADD CONSTRAINT pc_permanent_metadonnees_fk_zone_geo_fkey FOREIGN KEY (fk_zone_geo) REFERENCES tb_zone_geo(pk_tb_zone_geo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3327 (class 2606 OID 29244)
-- Name: pc_surtransect_fk_code_leve_gps_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_surtransect
    ADD CONSTRAINT pc_surtransect_fk_code_leve_gps_fkey FOREIGN KEY (fk_code_leve_gps) REFERENCES tb_leve_gps_metadonnees(pk_tb_leve_gps_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3326 (class 2606 OID 29249)
-- Name: pc_surtransect_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_surtransect
    ADD CONSTRAINT pc_surtransect_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3325 (class 2606 OID 29254)
-- Name: pc_surtransect_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY pc_surtransect
    ADD CONSTRAINT pc_surtransect_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3359 (class 2606 OID 30456)
-- Name: reprise_bague_fk_code_leve_gps_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY reprise_bague
    ADD CONSTRAINT reprise_bague_fk_code_leve_gps_fkey FOREIGN KEY (fk_code_leve_gps) REFERENCES tb_leve_gps_metadonnees(pk_tb_leve_gps_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3358 (class 2606 OID 30461)
-- Name: reprise_bague_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY reprise_bague
    ADD CONSTRAINT reprise_bague_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3357 (class 2606 OID 30466)
-- Name: reprise_bague_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY reprise_bague
    ADD CONSTRAINT reprise_bague_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3328 (class 2606 OID 29259)
-- Name: srep_colonies_coordonnees_fk_srep_colonies_metadonnees_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY srep_colonies_coordonnees
    ADD CONSTRAINT srep_colonies_coordonnees_fk_srep_colonies_metadonnees_fkey FOREIGN KEY (fk_srep_colonies_metadonnees) REFERENCES srep_colonies_metadonnees(pk_srep_colonies_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3330 (class 2606 OID 29264)
-- Name: srep_colonies_metadonnees_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY srep_colonies_metadonnees
    ADD CONSTRAINT srep_colonies_metadonnees_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3329 (class 2606 OID 29269)
-- Name: srep_colonies_metadonnees_fk_zone_geo_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY srep_colonies_metadonnees
    ADD CONSTRAINT srep_colonies_metadonnees_fk_zone_geo_fkey FOREIGN KEY (fk_zone_geo) REFERENCES tb_zone_geo(pk_tb_zone_geo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3332 (class 2606 OID 29274)
-- Name: srep_comptage_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY srep_comptage
    ADD CONSTRAINT srep_comptage_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3331 (class 2606 OID 29279)
-- Name: srep_comptage_fk_srep_colonies_metadonnees_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY srep_comptage
    ADD CONSTRAINT srep_comptage_fk_srep_colonies_metadonnees_fkey FOREIGN KEY (fk_srep_colonies_metadonnees) REFERENCES srep_colonies_metadonnees(pk_srep_colonies_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3333 (class 2606 OID 29284)
-- Name: tb_leve_gps_metadonnees_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_leve_gps_metadonnees
    ADD CONSTRAINT tb_leve_gps_metadonnees_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3336 (class 2606 OID 29289)
-- Name: tb_manipe_metadonnees_fk_protocole_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_manipe_metadonnees
    ADD CONSTRAINT tb_manipe_metadonnees_fk_protocole_fkey FOREIGN KEY (fk_protocole) REFERENCES tb_protocoles_metadonnees(pk_tb_protocoles_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3334 (class 2606 OID 29966)
-- Name: tb_manipe_metadonnees_fk_site_arrivee_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_manipe_metadonnees
    ADD CONSTRAINT tb_manipe_metadonnees_fk_site_arrivee_fkey FOREIGN KEY (fk_site_arrivee) REFERENCES donnees_carto.toponymie_kerguelen(pk_nom_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3335 (class 2606 OID 29956)
-- Name: tb_manipe_metadonnees_fk_site_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_manipe_metadonnees
    ADD CONSTRAINT tb_manipe_metadonnees_fk_site_fkey FOREIGN KEY (fk_site) REFERENCES donnees_carto.toponymie_kerguelen(pk_nom_site) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3337 (class 2606 OID 29294)
-- Name: tb_meteo_pk_tb_meteo_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_meteo
    ADD CONSTRAINT tb_meteo_pk_tb_meteo_fkey FOREIGN KEY (pk_tb_meteo) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3339 (class 2606 OID 29299)
-- Name: tb_observateurs_leves_gps_fk_code_leve_gps_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_observateurs_leves_gps
    ADD CONSTRAINT tb_observateurs_leves_gps_fk_code_leve_gps_fkey FOREIGN KEY (fk_code_leve_gps) REFERENCES tb_leve_gps_metadonnees(pk_tb_leve_gps_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3338 (class 2606 OID 29304)
-- Name: tb_observateurs_leves_gps_fk_observateur_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_observateurs_leves_gps
    ADD CONSTRAINT tb_observateurs_leves_gps_fk_observateur_fkey FOREIGN KEY (fk_observateur) REFERENCES tb_observateur(pk_tb_observateur) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3341 (class 2606 OID 29309)
-- Name: tb_observateurs_manipes_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_observateurs_manipes
    ADD CONSTRAINT tb_observateurs_manipes_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3340 (class 2606 OID 29314)
-- Name: tb_observateurs_manipes_fk_observateur_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_observateurs_manipes
    ADD CONSTRAINT tb_observateurs_manipes_fk_observateur_fkey FOREIGN KEY (fk_observateur) REFERENCES tb_observateur(pk_tb_observateur) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3342 (class 2606 OID 29319)
-- Name: tb_traces_gps_manipes_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY tb_traces_gps_manipes
    ADD CONSTRAINT tb_traces_gps_manipes_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3347 (class 2606 OID 29324)
-- Name: trsc_especes_epigees_fk_code_leve_gps_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_epigees
    ADD CONSTRAINT trsc_especes_epigees_fk_code_leve_gps_fkey FOREIGN KEY (fk_code_leve_gps) REFERENCES tb_leve_gps_metadonnees(pk_tb_leve_gps_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3346 (class 2606 OID 29329)
-- Name: trsc_especes_epigees_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_epigees
    ADD CONSTRAINT trsc_especes_epigees_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3345 (class 2606 OID 29334)
-- Name: trsc_especes_epigees_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_epigees
    ADD CONSTRAINT trsc_especes_epigees_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3344 (class 2606 OID 29339)
-- Name: trsc_especes_epigees_fk_numero_transect_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_epigees
    ADD CONSTRAINT trsc_especes_epigees_fk_numero_transect_fkey FOREIGN KEY (fk_numero_transect) REFERENCES trsc_transect_metadonnees(pk_trsc_transect_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3343 (class 2606 OID 29344)
-- Name: trsc_especes_epigees_fk_trsc_transect_parcours_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_epigees
    ADD CONSTRAINT trsc_especes_epigees_fk_trsc_transect_parcours_fkey FOREIGN KEY (fk_trsc_transect_parcours) REFERENCES trsc_transect_parcours(pk_trsc_transect_parcours) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3352 (class 2606 OID 29349)
-- Name: trsc_especes_hypogees_fk_code_leve_gps_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_hypogees
    ADD CONSTRAINT trsc_especes_hypogees_fk_code_leve_gps_fkey FOREIGN KEY (fk_code_leve_gps) REFERENCES tb_leve_gps_metadonnees(pk_tb_leve_gps_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3351 (class 2606 OID 29354)
-- Name: trsc_especes_hypogees_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_hypogees
    ADD CONSTRAINT trsc_especes_hypogees_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3350 (class 2606 OID 29359)
-- Name: trsc_especes_hypogees_fk_espece_vernaculaire_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_hypogees
    ADD CONSTRAINT trsc_especes_hypogees_fk_espece_vernaculaire_fkey FOREIGN KEY (fk_espece_vernaculaire) REFERENCES tb_espece(pk_tb_espece) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3349 (class 2606 OID 29364)
-- Name: trsc_especes_hypogees_fk_numero_transect_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_hypogees
    ADD CONSTRAINT trsc_especes_hypogees_fk_numero_transect_fkey FOREIGN KEY (fk_numero_transect) REFERENCES trsc_transect_metadonnees(pk_trsc_transect_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3348 (class 2606 OID 29369)
-- Name: trsc_especes_hypogees_fk_trsc_transect_parcours_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_especes_hypogees
    ADD CONSTRAINT trsc_especes_hypogees_fk_trsc_transect_parcours_fkey FOREIGN KEY (fk_trsc_transect_parcours) REFERENCES trsc_transect_parcours(pk_trsc_transect_parcours) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3353 (class 2606 OID 29374)
-- Name: trsc_transect_metadonnees_fk_zone_geo_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_transect_metadonnees
    ADD CONSTRAINT trsc_transect_metadonnees_fk_zone_geo_fkey FOREIGN KEY (fk_zone_geo) REFERENCES tb_zone_geo(pk_tb_zone_geo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3356 (class 2606 OID 29379)
-- Name: trsc_transect_parcours_fk_code_manipe_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_transect_parcours
    ADD CONSTRAINT trsc_transect_parcours_fk_code_manipe_fkey FOREIGN KEY (fk_code_manipe) REFERENCES tb_manipe_metadonnees(pk_tb_manipe_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3355 (class 2606 OID 29384)
-- Name: trsc_transect_parcours_fk_numero_transect_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_transect_parcours
    ADD CONSTRAINT trsc_transect_parcours_fk_numero_transect_fkey FOREIGN KEY (fk_numero_transect) REFERENCES trsc_transect_metadonnees(pk_trsc_transect_metadonnees) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3354 (class 2606 OID 29389)
-- Name: trsc_transect_parcours_fk_observateur_fkey; Type: FK CONSTRAINT; Schema: ornithologie; Owner: postgres
--

ALTER TABLE ONLY trsc_transect_parcours
    ADD CONSTRAINT trsc_transect_parcours_fk_observateur_fkey FOREIGN KEY (fk_observateur) REFERENCES tb_observateur(pk_tb_observateur) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 12
-- Name: donnees_carto; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA donnees_carto FROM PUBLIC;
REVOKE ALL ON SCHEMA donnees_carto FROM postgres;
GRANT ALL ON SCHEMA donnees_carto TO postgres;
GRANT USAGE ON SCHEMA donnees_carto TO bddrntaaf_visualisation;


--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 13
-- Name: ornithologie; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA ornithologie FROM PUBLIC;
REVOKE ALL ON SCHEMA ornithologie FROM postgres;
GRANT ALL ON SCHEMA ornithologie TO postgres;
GRANT USAGE ON SCHEMA ornithologie TO bddrntaaf_visualisation;


--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 320
-- Name: tb_manipe_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_manipe_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE tb_manipe_metadonnees FROM postgres;
GRANT ALL ON TABLE tb_manipe_metadonnees TO postgres;
GRANT SELECT ON TABLE tb_manipe_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 321
-- Name: tb_meteo; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_meteo FROM PUBLIC;
REVOKE ALL ON TABLE tb_meteo FROM postgres;
GRANT ALL ON TABLE tb_meteo TO postgres;
GRANT SELECT ON TABLE tb_meteo TO bddrntaaf_visualisation;


SET search_path = donnees_carto, pg_catalog;

--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 277
-- Name: contours_kerguelen; Type: ACL; Schema: donnees_carto; Owner: postgres
--

REVOKE ALL ON TABLE contours_kerguelen FROM PUBLIC;
REVOKE ALL ON TABLE contours_kerguelen FROM postgres;
GRANT ALL ON TABLE contours_kerguelen TO postgres;
GRANT SELECT ON TABLE contours_kerguelen TO bddrntaaf_visualisation;


--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 279
-- Name: kerguelen_lacs; Type: ACL; Schema: donnees_carto; Owner: postgres
--

REVOKE ALL ON TABLE kerguelen_lacs FROM PUBLIC;
REVOKE ALL ON TABLE kerguelen_lacs FROM postgres;
GRANT ALL ON TABLE kerguelen_lacs TO postgres;
GRANT SELECT ON TABLE kerguelen_lacs TO bddrntaaf_visualisation;


SET search_path = ornithologie, pg_catalog;

--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 294
-- Name: cmtg_indiff_classe; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_indiff_classe FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_indiff_classe FROM postgres;
GRANT ALL ON TABLE cmtg_indiff_classe TO postgres;
GRANT SELECT ON TABLE cmtg_indiff_classe TO bddrntaaf_visualisation;


--
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 295
-- Name: cmtg_indiff_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_indiff_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_indiff_metadonnees FROM postgres;
GRANT ALL ON TABLE cmtg_indiff_metadonnees TO postgres;
GRANT SELECT ON TABLE cmtg_indiff_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 296
-- Name: cmtg_indiff_minmax; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_indiff_minmax FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_indiff_minmax FROM postgres;
GRANT ALL ON TABLE cmtg_indiff_minmax TO postgres;
GRANT SELECT ON TABLE cmtg_indiff_minmax TO bddrntaaf_visualisation;


--
-- TOC entry 3686 (class 0 OID 0)
-- Dependencies: 298
-- Name: cmtg_indiff_nids_oeufs_poussins; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_indiff_nids_oeufs_poussins FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_indiff_nids_oeufs_poussins FROM postgres;
GRANT ALL ON TABLE cmtg_indiff_nids_oeufs_poussins TO postgres;
GRANT SELECT ON TABLE cmtg_indiff_nids_oeufs_poussins TO bddrntaaf_visualisation;


--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 300
-- Name: cmtg_indiff_precis; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_indiff_precis FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_indiff_precis FROM postgres;
GRANT ALL ON TABLE cmtg_indiff_precis TO postgres;
GRANT SELECT ON TABLE cmtg_indiff_precis TO bddrntaaf_visualisation;


--
-- TOC entry 3690 (class 0 OID 0)
-- Dependencies: 302
-- Name: cmtg_indiff_territoire; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_indiff_territoire FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_indiff_territoire FROM postgres;
GRANT ALL ON TABLE cmtg_indiff_territoire TO postgres;
GRANT SELECT ON TABLE cmtg_indiff_territoire TO bddrntaaf_visualisation;


--
-- TOC entry 3691 (class 0 OID 0)
-- Dependencies: 303
-- Name: cmtg_mam_marins; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_mam_marins FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_mam_marins FROM postgres;
GRANT ALL ON TABLE cmtg_mam_marins TO postgres;
GRANT SELECT ON TABLE cmtg_mam_marins TO bddrntaaf_visualisation;


--
-- TOC entry 3692 (class 0 OID 0)
-- Dependencies: 304
-- Name: cmtg_mam_marins_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_mam_marins_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_mam_marins_metadonnees FROM postgres;
GRANT ALL ON TABLE cmtg_mam_marins_metadonnees TO postgres;
GRANT SELECT ON TABLE cmtg_mam_marins_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 3693 (class 0 OID 0)
-- Dependencies: 305
-- Name: cmtg_oiseaux_marins; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_oiseaux_marins FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_oiseaux_marins FROM postgres;
GRANT ALL ON TABLE cmtg_oiseaux_marins TO postgres;
GRANT SELECT ON TABLE cmtg_oiseaux_marins TO bddrntaaf_visualisation;


--
-- TOC entry 3694 (class 0 OID 0)
-- Dependencies: 306
-- Name: cmtg_oiseaux_marins_colonies_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE cmtg_oiseaux_marins_colonies_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE cmtg_oiseaux_marins_colonies_metadonnees FROM postgres;
GRANT ALL ON TABLE cmtg_oiseaux_marins_colonies_metadonnees TO postgres;
GRANT SELECT ON TABLE cmtg_oiseaux_marins_colonies_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 3695 (class 0 OID 0)
-- Dependencies: 307
-- Name: demos_bilan_repro; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE demos_bilan_repro FROM PUBLIC;
REVOKE ALL ON TABLE demos_bilan_repro FROM postgres;
GRANT ALL ON TABLE demos_bilan_repro TO postgres;
GRANT SELECT ON TABLE demos_bilan_repro TO bddrntaaf_visualisation;


--
-- TOC entry 3696 (class 0 OID 0)
-- Dependencies: 308
-- Name: demos_comptage; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE demos_comptage FROM PUBLIC;
REVOKE ALL ON TABLE demos_comptage FROM postgres;
GRANT ALL ON TABLE demos_comptage TO postgres;
GRANT SELECT ON TABLE demos_comptage TO bddrntaaf_visualisation;


--
-- TOC entry 3697 (class 0 OID 0)
-- Dependencies: 309
-- Name: demos_indices_occup; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE demos_indices_occup FROM PUBLIC;
REVOKE ALL ON TABLE demos_indices_occup FROM postgres;
GRANT ALL ON TABLE demos_indices_occup TO postgres;
GRANT SELECT ON TABLE demos_indices_occup TO bddrntaaf_visualisation;


--
-- TOC entry 3698 (class 0 OID 0)
-- Dependencies: 310
-- Name: demos_terriers_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE demos_terriers_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE demos_terriers_metadonnees FROM postgres;
GRANT ALL ON TABLE demos_terriers_metadonnees TO postgres;
GRANT SELECT ON TABLE demos_terriers_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 311
-- Name: pc_permanent; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE pc_permanent FROM PUBLIC;
REVOKE ALL ON TABLE pc_permanent FROM postgres;
GRANT ALL ON TABLE pc_permanent TO postgres;
GRANT SELECT ON TABLE pc_permanent TO bddrntaaf_visualisation;


--
-- TOC entry 3700 (class 0 OID 0)
-- Dependencies: 312
-- Name: pc_permanent_changement_vegetation; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE pc_permanent_changement_vegetation FROM PUBLIC;
REVOKE ALL ON TABLE pc_permanent_changement_vegetation FROM postgres;
GRANT ALL ON TABLE pc_permanent_changement_vegetation TO postgres;
GRANT SELECT ON TABLE pc_permanent_changement_vegetation TO bddrntaaf_visualisation;


--
-- TOC entry 3701 (class 0 OID 0)
-- Dependencies: 313
-- Name: pc_permanent_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE pc_permanent_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE pc_permanent_metadonnees FROM postgres;
GRANT ALL ON TABLE pc_permanent_metadonnees TO postgres;
GRANT SELECT ON TABLE pc_permanent_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 3702 (class 0 OID 0)
-- Dependencies: 314
-- Name: pc_surtransect; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE pc_surtransect FROM PUBLIC;
REVOKE ALL ON TABLE pc_surtransect FROM postgres;
GRANT ALL ON TABLE pc_surtransect TO postgres;
GRANT SELECT ON TABLE pc_surtransect TO bddrntaaf_visualisation;


--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 361
-- Name: reprise_bague; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE reprise_bague FROM PUBLIC;
REVOKE ALL ON TABLE reprise_bague FROM postgres;
GRANT ALL ON TABLE reprise_bague TO postgres;
GRANT SELECT ON TABLE reprise_bague TO bddrntaaf_visualisation;


--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 315
-- Name: srep_colonies_coordonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE srep_colonies_coordonnees FROM PUBLIC;
REVOKE ALL ON TABLE srep_colonies_coordonnees FROM postgres;
GRANT ALL ON TABLE srep_colonies_coordonnees TO postgres;
GRANT SELECT ON TABLE srep_colonies_coordonnees TO bddrntaaf_visualisation;


--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 316
-- Name: srep_colonies_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE srep_colonies_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE srep_colonies_metadonnees FROM postgres;
GRANT ALL ON TABLE srep_colonies_metadonnees TO postgres;
GRANT SELECT ON TABLE srep_colonies_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 317
-- Name: srep_comptage; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE srep_comptage FROM PUBLIC;
REVOKE ALL ON TABLE srep_comptage FROM postgres;
GRANT ALL ON TABLE srep_comptage TO postgres;
GRANT SELECT ON TABLE srep_comptage TO bddrntaaf_visualisation;


--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 318
-- Name: tb_espece; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_espece FROM PUBLIC;
REVOKE ALL ON TABLE tb_espece FROM postgres;
GRANT ALL ON TABLE tb_espece TO postgres;
GRANT SELECT ON TABLE tb_espece TO bddrntaaf_visualisation;


--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 319
-- Name: tb_leve_gps_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_leve_gps_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE tb_leve_gps_metadonnees FROM postgres;
GRANT ALL ON TABLE tb_leve_gps_metadonnees TO postgres;
GRANT SELECT ON TABLE tb_leve_gps_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 322
-- Name: tb_observateur; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_observateur FROM PUBLIC;
REVOKE ALL ON TABLE tb_observateur FROM postgres;
GRANT ALL ON TABLE tb_observateur TO postgres;
GRANT SELECT ON TABLE tb_observateur TO bddrntaaf_visualisation;


--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 323
-- Name: tb_observateurs_leves_gps; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_observateurs_leves_gps FROM PUBLIC;
REVOKE ALL ON TABLE tb_observateurs_leves_gps FROM postgres;
GRANT ALL ON TABLE tb_observateurs_leves_gps TO postgres;
GRANT SELECT ON TABLE tb_observateurs_leves_gps TO bddrntaaf_visualisation;


--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 325
-- Name: tb_observateurs_manipes; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_observateurs_manipes FROM PUBLIC;
REVOKE ALL ON TABLE tb_observateurs_manipes FROM postgres;
GRANT ALL ON TABLE tb_observateurs_manipes TO postgres;
GRANT SELECT ON TABLE tb_observateurs_manipes TO bddrntaaf_visualisation;


--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 326
-- Name: tb_protocoles_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_protocoles_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE tb_protocoles_metadonnees FROM postgres;
GRANT ALL ON TABLE tb_protocoles_metadonnees TO postgres;
GRANT SELECT ON TABLE tb_protocoles_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 327
-- Name: tb_traces_gps; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_traces_gps FROM PUBLIC;
REVOKE ALL ON TABLE tb_traces_gps FROM postgres;
GRANT ALL ON TABLE tb_traces_gps TO postgres;
GRANT SELECT ON TABLE tb_traces_gps TO bddrntaaf_visualisation;


--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 328
-- Name: tb_traces_gps_manipes; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_traces_gps_manipes FROM PUBLIC;
REVOKE ALL ON TABLE tb_traces_gps_manipes FROM postgres;
GRANT ALL ON TABLE tb_traces_gps_manipes TO postgres;
GRANT SELECT ON TABLE tb_traces_gps_manipes TO bddrntaaf_visualisation;


--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 330
-- Name: tb_zone_geo; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE tb_zone_geo FROM PUBLIC;
REVOKE ALL ON TABLE tb_zone_geo FROM postgres;
GRANT ALL ON TABLE tb_zone_geo TO postgres;
GRANT SELECT ON TABLE tb_zone_geo TO bddrntaaf_visualisation;


--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 331
-- Name: trsc_especes_epigees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE trsc_especes_epigees FROM PUBLIC;
REVOKE ALL ON TABLE trsc_especes_epigees FROM postgres;
GRANT ALL ON TABLE trsc_especes_epigees TO postgres;
GRANT SELECT ON TABLE trsc_especes_epigees TO bddrntaaf_visualisation;


--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 332
-- Name: trsc_especes_hypogees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE trsc_especes_hypogees FROM PUBLIC;
REVOKE ALL ON TABLE trsc_especes_hypogees FROM postgres;
GRANT ALL ON TABLE trsc_especes_hypogees TO postgres;
GRANT SELECT ON TABLE trsc_especes_hypogees TO bddrntaaf_visualisation;


--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 333
-- Name: trsc_transect_metadonnees; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE trsc_transect_metadonnees FROM PUBLIC;
REVOKE ALL ON TABLE trsc_transect_metadonnees FROM postgres;
GRANT ALL ON TABLE trsc_transect_metadonnees TO postgres;
GRANT SELECT ON TABLE trsc_transect_metadonnees TO bddrntaaf_visualisation;


--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 335
-- Name: trsc_transect_parcours; Type: ACL; Schema: ornithologie; Owner: postgres
--

REVOKE ALL ON TABLE trsc_transect_parcours FROM PUBLIC;
REVOKE ALL ON TABLE trsc_transect_parcours FROM postgres;
GRANT ALL ON TABLE trsc_transect_parcours TO postgres;
GRANT SELECT ON TABLE trsc_transect_parcours TO bddrntaaf_visualisation;


-- Completed on 2015-03-20 15:06:39 RET

--
-- PostgreSQL database dump complete
--

