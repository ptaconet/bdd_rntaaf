<?php
session_start();
include('coordonnees_de_session.php');

if ($_POST['finalite_autre']==NULL){
$_POST['finalite_autre']=NULL;}

if ($_POST['mode_capture_autre']==NULL){
$_POST['mode_capture_autre']=NULL;}

if ($_POST['marquage_leger_autre']==NULL){
$_POST['marquage_leger_autre']=NULL;}

if ($_POST['equipement_externe_autre']==NULL){
$_POST['equipement_externe_autre']=NULL;}

if ($_POST['marquage_definitif_autre']==NULL){
$_POST['marquage_definitif_autre']=NULL;}

if ($_POST['marquage_autre']==NULL){
$_POST['marquage_autre']=NULL;}

if ($_POST['equipement_interne_autre']==NULL){
$_POST['equipement_interne_autre']=NULL;}

if ($_POST['prelevement_autres']==NULL){
$_POST['prelevement_autres']=NULL;}

if ($_POST['prelevement_type_interventionchirugicale']==NULL){
$_POST['prelevement_type_interventionchirugicale']=NULL;}

//integration du nouveau programme
if($_POST['programme']=="NA"){

$_POST['programme']=$_POST['numero_programme'];

$requete = $bdd->prepare('INSERT INTO demande_manipulation_especes.programme(titre,numero,fk_responsable) VALUES (:titre,:numero,:fk_responsable)');
$requete->execute(array(
'titre'=>$_POST['titre_programme'],
'numero'=>$_POST['numero_programme'],
'fk_responsable'=>$_SESSION['responsable']
)) or die(print_r($requete->errorInfo()));
$requete ->closeCursor();
}

//integration des eventuels changements de coordonnées du demandeur
$requete = $bdd->prepare('UPDATE demande_manipulation_especes.demandeur SET organisme_rattachement=:organisme_rattachement, adresse=:adresse, telephone=:telephone, mail=:mail WHERE nom=:nom');
$requete->execute(array(
'organisme_rattachement'=>$_POST['organisme_rattachement'],
'adresse'=>$_POST['adresse'],
'telephone'=>$_POST['telephone'],
'mail'=>$_POST['mail'],
'nom'=>$_SESSION['responsable']
)) or die(print_r($requete->errorInfo()));
$requete ->closeCursor();


//integration des données dans la table demande
switch ($_POST['mois_debut']) {
	case "janvier": 
		$mois_debut="01"; 
		break;
	case "fevrier": 
		$mois_debut="02"; 
		break;
	case "mars": 
		$mois_debut="03"; 
		break;
	case "avril": 
		$mois_debut="04"; 
		break;
	case "mai": 
		$mois_debut="05"; 
		break;
	case "juin": 
		$mois_debut="06"; 
		break;
	case "juillet": 
		$mois_debut="07"; 
		break;
	case "aout": 
		$mois_debut="08"; 
		break;
	case "septembre": 
		$mois_debut="09"; 
		break;
	case "octobre": 
		$mois_debut="10"; 
		break;
	case "novembre": 
		$mois_debut="11"; 
		break;
	case "decembre": 
		$mois_debut="12"; 
		break;
}

switch ($_POST['mois_fin']) {
	case "janvier": 
		$mois_fin="01"; 
		break;
	case "fevrier": 
		$mois_fin="02"; 
		break;
	case "mars": 
		$mois_fin="03"; 
		break;
	case "avril": 
		$mois_fin="04"; 
		break;
	case "mai": 
		$mois_fin="05"; 
		break;
	case "juin": 
		$mois_fin="06"; 
		break;
	case "juillet": 
		$mois_fin="07"; 
		break;
	case "aout": 
		$mois_fin="08"; 
		break;
	case "septembre": 
		$mois_fin="09"; 
		break;
	case "octobre": 
		$mois_fin="10"; 
		break;
	case "novembre": 
		$mois_fin="11"; 
		break;
	case "decembre": 
		$mois_fin="12"; 
		break;
}


$date_debut=$_POST['annee_debut'].'-'.$mois_debut.'-01';
$date_fin=$_POST['annee_fin'].'-'.$mois_fin.'-01';
$date_demande=date('Y-m-d');
$saison="2014/2015";

/*
switch ($_POST['district']) {
	case "Kerguelen": 
		$district="KER"; 
		break;
	case "Crozet": 
		$district="CRO"; 
		break;
	case "Amsterdam": 
		$district="AMS"; 
		break;
	case "Terre Adélie": 
		$district="TAD"; 
		break;
		}
*/

if (isset($_POST['finalite_inventaire'])) {$finalite_inventaire="t";} else {$finalite_inventaire="f";}
if (isset($_POST['finalite_suivi_pop'])) {$finalite_suivi_pop="t";} else {$finalite_suivi_pop="f";}
if (isset($_POST['finalite_etude_ecoethologique'])) {$finalite_etude_ecoethologique="t";} else {$finalite_etude_ecoethologique="f";}
if (isset($_POST['finalite_etude_parasitologique'])) {$finalite_etude_parasitologique="t";} else {$finalite_etude_parasitologique="f";}
if (isset($_POST['finalite_etude_genetique'])) {$finalite_etude_genetique="t";} else {$finalite_etude_genetique="f";}
if (isset($_POST['finalite_etude_biometrique'])) {$finalite_etude_biometrique="t";} else {$finalite_etude_biometrique="f";}
if (isset($_POST['finalite_etude_physiologique'])) {$finalite_etude_physiologique="t";} else {$finalite_etude_physiologique="f";}
if (isset($_POST['finalite_etude_epidemiologique'])) {$finalite_etude_epidemiologique="t";} else {$finalite_etude_epidemiologique="f";}
if (isset($_POST['finalite_etude_epidemiologique'])) {$finalite_etude_epidemiologique="t";} else {$finalite_etude_epidemiologique="f";}

if ($_POST['type_capture']=="euthanasie") {$type_capture_euthanasie="t";} else {$type_capture_euthanasie="f";}
if ($_POST['type_capture']=="definitive") {$type_capture_definitive="t";} else {$type_capture_definitive="f";}
if ($_POST['type_capture']=="temporaire_relache_differe") {$type_capture_temporaire_relachediffere="t";} else {$type_capture_temporaire_relachediffere="f";}
if ($_POST['type_capture']=="temporaire_relache_immediat") {$type_capture_temporaire_relacheimmediat="t";} else {$type_capture_temporaire_relacheimmediat="f";}

if (isset($_POST['mode_capture_manuelle'])) {$mode_capture_manuelle="t";} else {$mode_capture_manuelle="f";}
if (isset($_POST['mode_capture_aufilet'])) {$mode_capture_aufilet="t";} else {$mode_capture_aufilet="f";}
if (isset($_POST['mode_capture_pieges'])) {$mode_capture_pieges="t";} else {$mode_capture_pieges="f";}

if ($_POST['marquage']=="oui") {$marquage="t";} else {$marquage="f";}
if (isset($_POST['marquage_fishtag'])) {$marquage_fishtag="t";} else {$marquage_fishtag="f";}
if (isset($_POST['marquage_baguesplastiques'])) {$marquage_baguesplastiques="t";} else {$marquage_baguesplastiques="f";}
if (isset($_POST['marquage_porcimark'])) {$marquage_porcimark="t";} else {$marquage_porcimark="f";}
if (isset($_POST['marquage_nyanzol'])) {$marquage_nyanzol="t";} else {$marquage_nyanzol="f";}
if (isset($_POST['marquage_baguemetal'])) {$marquage_baguemetal="t";} else {$marquage_baguemetal="f";}
if (isset($_POST['marquage_aileron'])) {$marquage_aileron="t";} else {$marquage_aileron="f";}
if (isset($_POST['marquage_transpondeur'])) {$marquage_transpondeur="t";} else {$marquage_transpondeur="f";}

if ($_POST['equipement']=="oui")  {$equipement="t";} else {$equipement="f";}
if (isset($_POST['equipement_gps'])) {$equipement_gps="t";} else {$equipement_gps="f";}
if (isset($_POST['equipement_gls'])) {$equipement_gls="t";} else {$equipement_gls="f";}
if (isset($_POST['equipement_vhf'])) {$equipement_vhf="t";} else {$equipement_vhf="f";}
if (isset($_POST['equipement_argos'])) {$equipement_argos="t";} else {$equipement_argos="f";}
if (isset($_POST['equipement_interne_sondeoesophagienne'])) {$equipement_interne_sondeoesophagienne="t";} else {$equipement_interne_sondeoesophagienne="f";}

if ($_POST['prelevement']=="oui")  {$prelevement="t";} else {$prelevement="f";}
if (isset($_POST['prelevement_lavagestomacal'])) {$prelevement_lavagestomacal="t";} else {$prelevement_lavagestomacal="f";}
if (isset($_POST['prelevement_prisedesang'])) {$prelevement_prisedesang="t";} else {$prelevement_prisedesang="f";}
if (isset($_POST['prelevement_muscles'])) {$prelevement_muscles="t";} else {$prelevement_muscles="f";}
if ($_POST['intervention_chirugicale']=="oui")  {$prelevement_interventionchirugicale="t";} else {$prelevement_interventionchirugicale="f";}

if ($_POST['commentaires']==NULL) {$_POST['commentaires']=NULL;}



$requete = $bdd->prepare('INSERT INTO demande_manipulation_especes.demande
(date_demande,
saison,
fk_programme,
district,
site,
date_debut,
date_fin,

finalite_inventaire ,
finalite_suivi_pop ,
finalite_etude_ecoethologique ,
finalite_etude_parasitologique ,
finalite_etude_genetique ,
finalite_etude_biometrique ,
finalite_etude_physiologique ,
finalite_etude_epidemiologique ,
finalite_autre ,

type_capture_euthanasie ,
type_capture_definitive ,
type_capture_temporaire_relachediffere ,
type_capture_temporaire_relacheimmediat ,

mode_capture_manuelle ,
mode_capture_aufilet ,
mode_capture_pieges ,
mode_capture_autre,

marquage ,
marquage_fishtag ,
marquage_baguesplastiques ,
marquage_porcimark ,
marquage_nyanzol ,
marquage_leger_autre ,
marquage_baguemetal ,
marquage_aileron ,
marquage_transpondeur ,
marquage_definitif_autre ,
marquage_autre,

equipement ,
equipement_gps ,
equipement_gls ,
equipement_vhf ,
equipement_argos ,
equipement_externe_autre ,
equipement_interne_sondeoesophagienne ,
equipement_interne_autre ,

prelevement ,
prelevement_lavagestomacal ,
prelevement_prisedesang ,
prelevement_muscles ,
prelevement_autres,
prelevement_interventionchirugicale ,
prelevement_type_interventionchirugicale,

commentaires,
piece_jointe
)
VALUES
(:date_demande,
:saison,
:fk_programme,
:district,
:site,
:date_debut,
:date_fin,

:finalite_inventaire ,
:finalite_suivi_pop ,
:finalite_etude_ecoethologique ,
:finalite_etude_parasitologique ,
:finalite_etude_genetique ,
:finalite_etude_biometrique ,
:finalite_etude_physiologique ,
:finalite_etude_epidemiologique ,
:finalite_autre ,

:type_capture_euthanasie ,
:type_capture_definitive ,
:type_capture_temporaire_relachediffere ,
:type_capture_temporaire_relacheimmediat ,

:mode_capture_manuelle ,
:mode_capture_aufilet ,
:mode_capture_pieges ,
:mode_capture_autre,

:marquage ,
:marquage_fishtag ,
:marquage_baguesplastiques ,
:marquage_porcimark ,
:marquage_nyanzol ,
:marquage_leger_autre ,
:marquage_baguemetal ,
:marquage_aileron ,
:marquage_transpondeur ,
:marquage_definitif_autre ,
:marquage_autre,

:equipement ,
:equipement_gps ,
:equipement_gls ,
:equipement_vhf ,
:equipement_argos ,
:equipement_externe_autre ,
:equipement_interne_sondeoesophagienne ,
:equipement_interne_autre ,

:prelevement ,
:prelevement_lavagestomacal ,
:prelevement_prisedesang ,
:prelevement_muscles ,
:prelevement_autres,
:prelevement_interventionchirugicale ,
:prelevement_type_interventionchirugicale,

:commentaires,
:piece_jointe

)
');

$requete->execute(array(

'date_demande'=>$date_demande,
'saison'=>$saison,
'fk_programme'=>$_POST['programme'],
'district'=>$_POST['district'],
'site'=>$_POST['sites'],
'date_debut'=>$date_debut,
'date_fin'=>$date_fin,


'finalite_inventaire'=>$finalite_inventaire ,
'finalite_suivi_pop'=>$finalite_suivi_pop ,
'finalite_etude_ecoethologique'=>$finalite_etude_ecoethologique ,
'finalite_etude_parasitologique'=>$finalite_etude_parasitologique ,
'finalite_etude_genetique'=>$finalite_etude_genetique ,
'finalite_etude_biometrique'=>$finalite_etude_biometrique ,
'finalite_etude_physiologique'=>$finalite_etude_physiologique ,
'finalite_etude_epidemiologique'=>$finalite_etude_epidemiologique ,
'finalite_autre'=>$_POST['finalite_autre'],

'type_capture_euthanasie'=>$type_capture_euthanasie ,
'type_capture_definitive'=>$type_capture_definitive ,
'type_capture_temporaire_relachediffere'=>$type_capture_temporaire_relachediffere ,
'type_capture_temporaire_relacheimmediat'=>$type_capture_temporaire_relacheimmediat ,

'mode_capture_manuelle'=>$mode_capture_manuelle ,
'mode_capture_aufilet'=>$mode_capture_aufilet ,
'mode_capture_pieges'=>$mode_capture_pieges ,
'mode_capture_autre'=>$_POST['mode_capture_autre'],

'marquage'=>$marquage ,
'marquage_fishtag'=>$marquage_fishtag ,
'marquage_baguesplastiques'=>$marquage_baguesplastiques ,
'marquage_porcimark'=>$marquage_porcimark ,
'marquage_nyanzol'=>$marquage_nyanzol ,
'marquage_leger_autre'=>$_POST['marquage_leger_autre'],
'marquage_baguemetal'=>$marquage_baguemetal ,
'marquage_aileron'=>$marquage_aileron ,
'marquage_transpondeur'=>$marquage_transpondeur ,
'marquage_definitif_autre'=>$_POST['marquage_definitif_autre'],
'marquage_autre'=>$_POST['marquage_autre'],

'equipement'=>$equipement ,
'equipement_gps'=>$equipement_gps ,
'equipement_gls'=>$equipement_gls ,
'equipement_vhf'=>$equipement_vhf ,
'equipement_argos'=>$equipement_argos ,
'equipement_externe_autre'=>$_POST['equipement_externe_autre'],
'equipement_interne_sondeoesophagienne'=>$equipement_interne_sondeoesophagienne ,
'equipement_interne_autre'=>$_POST['equipement_interne_autre'],

'prelevement'=>$prelevement ,
'prelevement_lavagestomacal'=>$prelevement_lavagestomacal ,
'prelevement_prisedesang'=>$prelevement_prisedesang ,
'prelevement_muscles'=>$prelevement_muscles ,
'prelevement_autres'=>$_POST['prelevement_autres'],
'prelevement_interventionchirugicale'=>$prelevement_interventionchirugicale ,
'prelevement_type_interventionchirugicale'=>$_POST['prelevement_type_interventionchirugicale'],

'commentaires'=>$_POST['commentaires'],
'piece_jointe'=>'FALSE'


)) or die(print_r($requete->errorInfo()));
$requete ->closeCursor();

//integration des données du nb d'especes manipulees

// recuperation de la derniere valeur de demande
$requete = $bdd->prepare('SELECT numero_demande FROM demande_manipulation_especes.demande WHERE demande.numero_demande=(SELECT MAX(numero_demande) FROM demande_manipulation_especes.demande) AND demande.fk_programme=:fk_programme');
$requete->execute(array(
'fk_programme'=>$_POST['programme']
)) or die(print_r($requete->errorInfo()));

$requeteaa=$requete->fetch();
$numero_demande=$requeteaa['numero_demande'];
$_SESSION['numero_demande']=$requeteaa['numero_demande'];
$requete ->closeCursor();

for  ($i = 1; $i <=$nbespeces; $i++) {
$espece='espece_'.$i;
$nb_adultes_males='nb_adultes_males_'.$i;
$nb_adultes_femelles='nb_adultes_femelles_'.$i;
$nb_adultes_indetermines='nb_adultes_indetermines_'.$i;
$nb_juveniles_males='nb_juveniles_males_'.$i;
$nb_juveniles_femelles='nb_juveniles_femelles_'.$i;
$nb_juveniles_indetermines='nb_juveniles_indetermines_'.$i;
$nb_indetermines='nb_indetermines_'.$i;
$nb_oeufs='nb_oeufs_'.$i;

$nb_individus_total=0;

if ($_POST[$nb_adultes_males]==NULL){
$_POST[$nb_adultes_males]=NULL;}
else {$nb_individus_total=$nb_individus_total+(int)$_POST[$nb_adultes_males];}
if ($_POST[$nb_adultes_femelles]==NULL){
$_POST[$nb_adultes_femelles]=NULL;}
else {$nb_individus_total=$nb_individus_total+(int)$_POST[$nb_adultes_femelles];}
if ($_POST[$nb_adultes_indetermines]==NULL){
$_POST[$nb_adultes_indetermines]=NULL;}
else {$nb_individus_total=$nb_individus_total+(int)$_POST[$nb_adultes_indetermines];}
if ($_POST[$nb_juveniles_males]==NULL){
$_POST[$nb_juveniles_males]=NULL;}
else {$nb_individus_total=$nb_individus_total+(int)$_POST[$nb_juveniles_males];}
if ($_POST[$nb_juveniles_femelles]==NULL){
$_POST[$nb_juveniles_femelles]=NULL;}
else {$nb_individus_total=$nb_individus_total+(int)$_POST[$nb_juveniles_femelles];}
if ($_POST[$nb_juveniles_indetermines]==NULL){
$_POST[$nb_juveniles_indetermines]=NULL;}
else {$nb_individus_total=$nb_individus_total+(int)$_POST[$nb_juveniles_indetermines];}
if ($_POST[$nb_indetermines]==NULL){
$_POST[$nb_indetermines]=NULL;}
else {$nb_individus_total=$nb_individus_total+(int)$_POST[$nb_indetermines];}
if ($_POST[$nb_oeufs]==NULL){
$_POST[$nb_oeufs]=NULL;}
else {$nb_individus_total=$nb_individus_total+(int)$_POST[$nb_oeufs];}

//$nb_individus_total=$_POST[$nb_adultes_males]+$_POST[$nb_adultes_femelles]+$_POST[$nb_adultes_indetermines]+$_POST[$nb_juveniles_males]+$_POST[$nb_juveniles_femelles]+$_POST[$nb_juveniles_indetermines]+$_POST[$nb_indetermines]+$_POST[$nb_oeufs];

$requete = $bdd->prepare('INSERT INTO demande_manipulation_especes.espece_demande (fk_numero_demande,fk_espece_manipulee,nb_individus_adultes_males,nb_individus_adultes_femelles,nb_individus_adultes_indetermines,nb_individus_juveniles_males,nb_individus_juveniles_femelles,nb_individus_juveniles_indetermines,nb_individus_indetermines,nb_individus_oeufs,nb_individus_total) VALUES (:fk_numero_demande,:fk_espece_manipulee,:nb_individus_adultes_males,:nb_individus_adultes_femelles,:nb_individus_adultes_indetermines,:nb_individus_juveniles_males,:nb_individus_juveniles_femelles,:nb_individus_juveniles_indetermines,:nb_individus_indetermines,:nb_individus_oeufs,:nb_individus_total)');
$requete->execute(array(
'fk_numero_demande'=>$numero_demande,
'fk_espece_manipulee'=>$_POST[$espece],
'nb_individus_adultes_males'=>$_POST[$nb_adultes_males],
'nb_individus_adultes_femelles'=>$_POST[$nb_adultes_femelles],
'nb_individus_adultes_indetermines'=>$_POST[$nb_adultes_indetermines],
'nb_individus_juveniles_males'=>$_POST[$nb_juveniles_males],
'nb_individus_juveniles_femelles'=>$_POST[$nb_juveniles_femelles],
'nb_individus_juveniles_indetermines'=>$_POST[$nb_juveniles_indetermines],
'nb_individus_indetermines'=>$_POST[$nb_indetermines],
'nb_individus_oeufs'=>$_POST[$nb_oeufs],
'nb_individus_total'=>$nb_individus_total
)) or die(print_r($requete->errorInfo()));
$requete ->closeCursor();
}


//header("Location:integration_pj.php",TRUE,301);
//exit;
?>
