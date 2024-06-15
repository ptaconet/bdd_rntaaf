<?php
include('coordonnees_de_session.php');
require_once('../config.php');

$requete1=$bdd->prepare('SELECT numero_demande FROM demande_manipulation_especes.demande,demande_manipulation_especes.programme WHERE programme.numero=demande.fk_programme AND programme.fk_responsable=?') ;
$requete1->execute(array($_SESSION['responsable'])) or die(print_r($requete1->errorInfo())); 
while ($demandes=$requete1->fetch()){ 

$modifier='modifier_'.$demandes['numero_demande'];
$voir='voir_'.$demandes['numero_demande'];
$supprimer='supprimer_'.$demandes['numero_demande'];

//modifier
if (isset($_POST[$modifier])){

header("Location:demande.php",TRUE,301);
exit;
}

//voir
if (isset($_POST[$voir])){
$_SESSION['numero_demande']=$demandes['numero_demande'];

header("Location:recapitulatif_demande.php",TRUE,301);
exit;
}

//supprimer
if (isset($_POST[$supprimer])){
$_SESSION['numero_demande']=$demandes['numero_demande'];
echo 'Etes-vous certain de vouloir supprimer cette demande?';
echo '<form action="supprimer_demande.php" method="POST">';
echo '<input type="submit" name="supprimer_oui" value="Oui" /></p>';
echo '<input type="submit" name="supprimer_non" value="Non" /></p>';
exit;
}

}
$requete1 ->closeCursor();


?>

