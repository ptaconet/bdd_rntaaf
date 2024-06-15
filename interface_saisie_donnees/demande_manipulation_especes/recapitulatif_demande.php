﻿<?php

include('coordonnees_de_session.php');
require_once('../config.php');

include('donnees_saisies.php');

require('fpdf.php');


class PDF extends FPDF
{
// En-tête
function Header()
{
    // Logo    
	   $this->SetFont('Times','I',10);

 //$this->Cell(20,5,html_entity_decode(utf8_decode('Demande n° '.$_SESSION['numero_demande'])),0,1);
    // Saut de ligne

}



// Pied de page
function Footer()
{
    // Positionnement à 1,5 cm du bas
    $this->SetY(-15);
    // Police Arial italique 8
    $this->SetFont('Arial','I',8);
    // Numéro de page
    $this->Cell(0,10,html_entity_decode(utf8_decode('Demande n° '.$_SESSION['numero_demande'].' - Page '.$this->PageNo().'/{nb}')),0,0,'C');
}




}



$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();

$pdf->Image('logo_rn_taaf.jpg',110,10,80);
$pdf->Image('logo-taaf.jpg',10,10,70);
$pdf->Ln(50);
    $pdf->SetFont('Times','B',13);
    // Décalage à droite
    $pdf->Cell(90);
    // Titre
    $pdf->Cell(10,8,html_entity_decode(utf8_decode('DEMANDE D\'AUTORISATION DE CAPTURE OU DE PRÉLÈVEMENT ')),0,1,'C');
      $pdf->Cell(90);
$pdf->Cell(10,8,html_entity_decode(utf8_decode(' À DES FINS SCIENTIFIQUES DE SPÉCIMENS D\'ESPÈCES ANIMALES PROTEGÉES')),0,1,'C');

  // $pdf->MultiCell(10,10,html_entity_decode(utf8_decode(' DEMANDE D\'AUTORISATION DE CAPTURE OU DE PRÉLÈVEMENT À DES FINS SCIENTIFIQUES DE SPÉCIMENS D\'ESPÈCES ANIMALES PROTEGÉES')),0,1,'C');
  
$pdf->Ln(10);
$pdf->SetFont('Times','B',12);
 $pdf->SetFillColor(200,220,255);
    
	//identification du demandeur et du programme
	
	$pdf->Cell(0,10,"IDENTIFICATION DU DEMANDEUR ET DU PROGRAMME",0,1,'C',true);
	$pdf->SetFont('Times','',12);
	$pdf->Ln(5);
$pdf->Cell(0,10,html_entity_decode(utf8_decode('Nom et prénom du demandeur: '.strtoupper($demandeur['nom']).' '.$demandeur['prenom'])),0,1); 
$pdf->Cell(0,10,html_entity_decode(utf8_decode('Titre du programme: '.$programme['numero'].' - '.$programme['titre'])),0,1);
$pdf->Cell(0,10,html_entity_decode(utf8_decode('Coordonnées: '.$demandeur['adresse'])),0,1);
$pdf->Cell(0,10,html_entity_decode(utf8_decode('Organisme de rattachement: '.$demandeur['organisme_rattachement'])),0,1);
	$pdf->Ln(5);
	
		//dates et lieux de capture ou de prélevement
$pdf->SetFont('Times','B',12);
$pdf->Cell(0,10,"DATES ET LIEUX DE CAPTURE OU DE PRELEVEMENT",0,1,'C',true);
$pdf->SetFont('Times','',12);
$pdf->Ln(5);
$pdf->Cell(0,10,html_entity_decode(utf8_decode('District: '.strtoupper($demande['district']))),0,1); 
$pdf->Cell(0,10,html_entity_decode(utf8_decode('Nom du site: '.$demande['site'])),0,1); 
$pdf->Cell(0,10,html_entity_decode(utf8_decode('Période: '.$date_debut.' - '.$date_fin)),0,1); 
	$pdf->Ln(5);

	
		//Espèces manipulées
$pdf->SetFont('Times','B',12);
$pdf->Cell(0,10,"IDENTIFICATION DES SPECIMENS",0,1,'C',true);

 $pdf->SetFillColor(224,224,224);
$pdf->SetFont('Times','',12);
$pdf->Ln(5);
$pdf->SetFont('Times','B',12);
$pdf->Cell(95,6,html_entity_decode(utf8_decode('Espèce')),1,0,'C',true);
$pdf->SetFont('Times','',12);
$pdf->Cell(10,6,html_entity_decode(utf8_decode('A.M.')),1,0,'C',true);
$pdf->Cell(10,6,html_entity_decode(utf8_decode('A.F.')),1,0,'C',true);
$pdf->Cell(10,6,html_entity_decode(utf8_decode('A.I.')),1,0,'C',true);
$pdf->Cell(10,6,html_entity_decode(utf8_decode('J.M.')),1,0,'C',true);
$pdf->Cell(10,6,html_entity_decode(utf8_decode('J.F.')),1,0,'C',true);
$pdf->Cell(10,6,html_entity_decode(utf8_decode('J.I.')),1,0,'C',true);
$pdf->Cell(10,6,html_entity_decode(utf8_decode('I.')),1,0,'C',true);
$pdf->Cell(10,6,html_entity_decode(utf8_decode('O.')),1,0,'C',true);
$pdf->SetFont('Times','B',12);
$pdf->Cell(15,6,html_entity_decode(utf8_decode('TOTAL')),1,1,'C',true);
$pdf->SetFont('Times','',12);
$requete4 = $bdd->prepare('SELECT * FROM demande_manipulation_especes.espece_demande WHERE fk_numero_demande=?');
$requete4->execute(array($_SESSION['numero_demande'])) or die(print_r($requete4->errorInfo()));
while ($especes=$requete4->fetch()){
$pdf->SetFont('Times','B',12);
$pdf->Cell(95,6,html_entity_decode(utf8_decode($especes['fk_espece_manipulee'])),1,0,'C');
$pdf->SetFont('Times','',12);
$pdf->Cell(10,6,html_entity_decode(utf8_decode($especes['nb_individus_adultes_males'])),1,0,'C');
$pdf->Cell(10,6,html_entity_decode(utf8_decode($especes['nb_individus_adultes_femelles'])),1,0,'C');
$pdf->Cell(10,6,html_entity_decode(utf8_decode($especes['nb_individus_adultes_indetermines'])),1,0,'C');
$pdf->Cell(10,6,html_entity_decode(utf8_decode($especes['nb_individus_juveniles_males'])),1,0,'C');
$pdf->Cell(10,6,html_entity_decode(utf8_decode($especes['nb_individus_juveniles_femelles'])),1,0,'C');
$pdf->Cell(10,6,html_entity_decode(utf8_decode($especes['nb_individus_juveniles_indetermines'])),1,0,'C');
$pdf->Cell(10,6,html_entity_decode(utf8_decode($especes['nb_individus_indetermines'])),1,0,'C');
$pdf->Cell(10,6,html_entity_decode(utf8_decode($especes['nb_individus_oeufs'])),1,0,'C');
$pdf->SetFont('Times','B',12);
$pdf->Cell(15,6,html_entity_decode(utf8_decode($especes['nb_individus_total'])),1,1,'C');
$pdf->SetFont('Times','',12);

}
$pdf->SetFont('Times','',10);
$pdf->Ln(5);
 $pdf->SetFillColor(248,248,248);

$pdf->Cell(15,4,html_entity_decode(utf8_decode('A.M.')),0,0,'C',false);
$pdf->Cell(70,4,html_entity_decode(utf8_decode('Nombre d\'adultes mâles')),0,1,'L',false);
$pdf->Cell(15,4,html_entity_decode(utf8_decode('A.F.')),0,0,'C',false);
$pdf->Cell(70,4,html_entity_decode(utf8_decode('Nombre d\'adultes femelles')),0,1,'L',false);
$pdf->Cell(15,4,html_entity_decode(utf8_decode('A.I.')),0,0,'C',false);
$pdf->Cell(70,4,html_entity_decode(utf8_decode('Nombre d\'adultes indeterminés')),0,1,'L',false);
$pdf->Cell(15,4,html_entity_decode(utf8_decode('J.M.')),0,0,'C',false);
$pdf->Cell(70,4,html_entity_decode(utf8_decode('Nombre de juvéniles mâles')),0,1,'L',false);
$pdf->Cell(15,4,html_entity_decode(utf8_decode('J.F.')),0,0,'C',false);
$pdf->Cell(70,4,html_entity_decode(utf8_decode('Nombre de juvéniles femelles')),0,1,'L',false);
$pdf->Cell(15,4,html_entity_decode(utf8_decode('J.I.')),0,0,'C',false);
$pdf->Cell(70,4,html_entity_decode(utf8_decode('Nombre de juvéniles indeterminés')),0,1,'L',false);
$pdf->Cell(15,4,html_entity_decode(utf8_decode('I.')),0,0,'C',false);
$pdf->Cell(70,4,html_entity_decode(utf8_decode('Nombre d\'individus indeterminés')),0,1,'L',false);
$pdf->Cell(15,4,html_entity_decode(utf8_decode('O.')),0,0,'C',false);
$pdf->Cell(70,4,html_entity_decode(utf8_decode('Nombre d\'oeufs')),0,1,'L',false);
$pdf->Cell(15,4,html_entity_decode(utf8_decode('TOTAL')),0,0,'C',false);
$pdf->Cell(70,4,html_entity_decode(utf8_decode('Nombre d\'individus totaux')),0,1,'L',false);


 $pdf->SetFillColor(200,220,255);
	$pdf->Ln(5);
//Caractéristiques de la manipulation
$pdf->SetFont('Times','B',12);
$pdf->Cell(0,10,html_entity_decode(utf8_decode('FINALITÉ ET PROPRIÉTÉS DE LA MANIPULATION')),0,1,'C',true);
	$pdf->Ln(5);
$pdf->SetFont('Times','',12);
$pdf->Cell(70,10,html_entity_decode(utf8_decode('Finalité(s): ')),0,0);
$pdf->MultiCell(125,10,html_entity_decode(utf8_decode($finalite)),0,1);
$pdf->Ln(4);
$pdf->Cell(70,10,html_entity_decode(utf8_decode('Type de capture: ')),0,0);
$pdf->MultiCell(125,10,html_entity_decode(utf8_decode($type_de_capture)),0,1);
$pdf->Ln(4);
$pdf->Cell(70,10,html_entity_decode(utf8_decode('Mode de capture: ')),0,0);
$pdf->MultiCell(125,10,html_entity_decode(utf8_decode($mode_de_capture)),0,1);
$pdf->Ln(4);
$pdf->Cell(70,10,html_entity_decode(utf8_decode('Marquage: '.$marquage_oui)),0,0);
$pdf->MultiCell(125,10,html_entity_decode(utf8_decode($marquage)),0,1);
$pdf->Ln(4);
$pdf->Cell(70,10,html_entity_decode(utf8_decode('Pose d\'équipement: '.$equipement_oui)),0,0);
$pdf->MultiCell(125,10,html_entity_decode(utf8_decode($equipement)),0,1);
$pdf->Ln(4);
$pdf->Cell(70,10,html_entity_decode(utf8_decode('Prélèvements envisagés: '.$prelevement_oui)),0,0);
$pdf->MultiCell(125,10,html_entity_decode(utf8_decode($prelevement)),0,1);
$pdf->Ln(4);
$pdf->Cell(70,10,html_entity_decode(utf8_decode('Intervention chirugicale: '.$intervention_chirugicale_oui)),0,0);
$pdf->MultiCell(125,10,html_entity_decode(utf8_decode($demande['prelevement_type_interventionchirugicale'])),0,1);

	$pdf->Ln(30);

//identification du demandeur et du programme

	$pdf->Cell(55,10,html_entity_decode(utf8_decode("Pièce jointe ajoutée au dossier: ")),0,0);
		$pdf->Cell(0,10,html_entity_decode(utf8_decode($piece_jointe)),0,1); 
	$pdf->Cell(30,10,"Commentaires: ",0,0);
	$pdf->Cell(0,10,html_entity_decode(utf8_decode($demande['commentaires'])),0,1); 

	$pdf->Ln(5);



$pdf->Output();
?>

