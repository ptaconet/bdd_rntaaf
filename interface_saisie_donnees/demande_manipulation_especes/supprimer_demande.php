<?php
include('coordonnees_de_session.php');
require_once('../config.php');

if (isset($_POST['supprimer_oui'])){

//suppression de la sortie en entier
$requete=$bdd->prepare('DELETE FROM demande_manipulation_especes.demande WHERE numero_demande=:numero_demande');
$requete->execute(array(
'numero_demande' => $_SESSION['numero_demande']
)) 
or die(print_r($requete->errorInfo()));
$requete ->closeCursor();
$_SESSION['confirmation_demande_supprimee']=TRUE;
header("Location:demandes_soumises.php",TRUE,301);
exit;
}

elseif (isset($_POST['supprimer_non'])){
header("Location:demandes_soumises.php",TRUE,301);
exit;
}
?>