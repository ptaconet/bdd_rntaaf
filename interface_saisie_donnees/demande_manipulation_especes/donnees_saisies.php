<?php

//données de la demande
$requete = $bdd->prepare('SELECT * FROM demande_manipulation_especes.demande WHERE numero_demande=?');
$requete->execute(array($_SESSION['numero_demande'])) or die(print_r($requete->errorInfo()));
$demande=$requete->fetch();

//données sur le programme
$requete2 = $bdd->prepare('SELECT * FROM demande_manipulation_especes.programme WHERE numero=?');
$requete2->execute(array($demande['fk_programme'])) or die(print_r($requete2->errorInfo()));
$programme=$requete2->fetch();

//données sur le demandeur
$requete3 = $bdd->prepare('SELECT * FROM demande_manipulation_especes.demandeur WHERE nom=?');
$requete3->execute(array($programme['fk_responsable'])) or die(print_r($requete3->errorInfo()));
$demandeur=$requete3->fetch();



//traitement des dates de début et de fin
//$date_debut=date("d-m-Y", new DateTime($demande['date_debut']));

$date_debut = date_format(date_create_from_format('Y-m-d', $demande['date_debut']), 'm/Y');
$date_fin = date_format(date_create_from_format('Y-m-d', $demande['date_fin']), 'm/Y');


//finalité(s) de la manip
$finalite="";
if ($demande['finalite_inventaire']=="true"){ $finalite="Inventaire +";}
if ($demande['finalite_suivi_pop']=="true"){ $finalite=$finalite.' Suivi de population +';}
if ($demande['finalite_etude_ecoethologique']=="true"){ $finalite=$finalite.' Etude écoéthologique +';}
if ($demande['finalite_etude_parasitologique']=="true"){ $finalite=$finalite.' Etude parasitologique +';}
if ($demande['finalite_etude_genetique']=="true"){ $finalite=$finalite.' Etude génétique +';}
if ($demande['finalite_etude_biometrique']=="true"){ $finalite=$finalite.' Etude biométrique +';}
if ($demande['finalite_etude_physiologique']=="true"){ $finalite=$finalite.' Etude physiologique +';}
if ($demande['finalite_etude_epidemiologique']=="true"){ $finalite=$finalite.' Etude épidémiologique +';}
if (!empty($demande['finalite_autre'])){ $finalite=$finalite.' '.$demande['finalite_autre'].' ';}

$finalite = substr($finalite, 0, -1);



//type de capture
$type_de_capture="";
if ($demande['type_capture_euthanasie']=="true"){ $type_de_capture="Euthanasie + ";}
if ($demande['type_capture_definitive']=="true"){ $type_de_capture="Capture définitive + ";}
if ($demande['type_capture_temporaire_relachediffere']=="true"){ $type_de_capture="Capture temporaire avec relaché différé + ";}
if ($demande['type_capture_temporaire_relacheimmediat']=="true"){ $type_de_capture="Capture temporaire avec relaché immediat + ";}

$type_de_capture = substr($type_de_capture, 0, -2);

//mode de capture
$mode_de_capture="";
if ($demande['mode_capture_manuelle']=="true"){ $mode_de_capture="Manuelle +";}
if ($demande['mode_capture_aufilet']=="true"){ $mode_de_capture=$mode_de_capture.' Au filet +';}
if ($demande['mode_capture_pieges']=="true"){ $mode_de_capture=$mode_de_capture.' Pièges +';}
if (!empty($demande['mode_capture_autre'])){ $mode_de_capture=$mode_de_capture.' '.$demande['mode_capture_autre'].' ';}

$mode_de_capture = substr($mode_de_capture, 0, -1);

//marquage
if ($demande['marquage']=="true"){
$marquage_oui="OUI";
$marquage="";
if ($demande['marquage_fishtag']=="true"){ $marquage=$marquage.'Fishtag + ';}
if ($demande['marquage_baguesplastiques']=="true"){ $marquage=$marquage.'Bagues plastiques + ';}
if ($demande['marquage_porcimark']=="true"){ $marquage=$marquage.'Porcimark + ';}
if ($demande['marquage_nyanzol']=="true"){ $marquage=$marquage.'Nyanzol + ';}
if (!empty($demande['marquage_leger_autre'])){ $marquage=$marquage.' + '.$demande['marquage_leger_autre'].'  ';}
if ($demande['marquage_baguemetal']=="true"){ $marquage=$marquage.'Bague métal + ';}
if ($demande['marquage_aileron']=="true"){ $marquage=$marquage.'aileron + ';}
if ($demande['marquage_transpondeur']=="true"){ $marquage=$marquage.'transpondeur + ';}
if (!empty($demande['marquage_definitif_autre'])){ $marquage=$marquage.' '.$demande['marquage_definitif_autre'].'  ';}
if (!empty($demande['marquage_autre'])){ $marquage=$marquage.' '.$demande['marquage_autre'].'  ';}

$marquage = substr($marquage, 0, -2);


}
else {$marquage_oui="NON";$marquage="";}


//equipement-pose de materiel
if ($demande['equipement']=="true"){
$equipement_oui="OUI";
$equipement="";
if ($demande['equipement_gps']=="true"){ $equipement=$equipement.'GPS + ';}
if ($demande['equipement_gls']=="true"){ $equipement=$equipement.'GLS + ';}
if ($demande['equipement_vhf']=="true"){ $equipement=$equipement.'VHF + ';}
if ($demande['equipement_argos']=="true"){ $equipement=$equipement.'ARGOS + ';}
if (!empty($demande['equipement_externe_autre'])){ $equipement=$equipement.' '.$demande['equipement_externe_autre'].'  ';}
if ($demande['equipement_interne_sondeoesophagienne']=="true"){ $equipement=$equipement.' Sonde Oesophagienne + ';}
if (!empty($demande['equipement_interne_autre'])){ $equipement=$equipement.' '.$demande['equipement_interne_autre'].'  ';}

$equipement = substr($equipement, 0, -2);


}
else {$equipement_oui="NON";$equipement="";}


//prelevements envisagés
$prelevement="";
if ($demande['prelevement']=="true"){
$prelevement_oui="OUI";

if ($demande['prelevement_lavagestomacal']=="true"){ $prelevement=$prelevement.'Lavage stomacal + ';}
if ($demande['prelevement_prisedesang']=="true"){ $prelevement=$prelevement.'Prise de sang + ';}
if ($demande['prelevement_muscles']=="true"){ $prelevement=$prelevement.'Muscles + ';}
if (!empty($demande['prelevement_autres'])){ $prelevement=$prelevement.' '.$demande['prelevement_autres'].'  ';}

$prelevement = substr($prelevement, 0, -2);
}
else {$prelevement_oui="NON";}


//interventions chirugicale
if ($demande['prelevement_interventionchirugicale']=="true"){
$intervention_chirugicale_oui='OUI';
}
else {$intervention_chirugicale_oui="NON";}

//piece jointe
if ($demande['piece_jointe']=="true"){ $piece_jointe="OUI";} else {$piece_jointe="NON";}

?>
