<?php
include('coordonnees_de_session.php');
require_once('../config.php');

?>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" >
<head>
<title>Page d'accueil pour les demandes de manipulations d'espèces</title>
<meta http-equiv="Content-Type" content="text/html";
charset="utf-8" />


<style>
h4 {text-align:center}
</style>
</head>
<body>
<?php
if (isset($_SESSION['confirmation_demande_supprimee'])){
echo "<FONT COLOR='green'><strong>La demande à bien été supprimée.</strong></font>";
unset($_SESSION['confirmation_demande_supprimee']);
}
?>
<form action="redirection_post_choix_demandes_soumises.php" method="POST">


Veillez trouver ci-dessous la liste des demandes soumises par <b><?php echo $_SESSION['responsable']; ?></b>. </p>
 <a href="page_accueil.php"> Cliquez ici</a> pour retourner à la page d'accueil.
</p>
<table border="1">
<tr>
<th> Numéro </br>demande </th>
<th> Date soumission </th>
<th> Programme </th>
<th> District - Site </th>
<th> Période </th>
<th> Espèces </th>
<th> Actions </th>
</tr>




<?php 
$requete1=$bdd->prepare('SELECT numero_demande,date_demande,district,site,date_debut,date_fin,numero FROM demande_manipulation_especes.demande,demande_manipulation_especes.programme WHERE programme.numero=demande.fk_programme AND programme.fk_responsable=? ORDER BY date_demande');
$requete1->execute(array($_SESSION['responsable'])) or die(print_r($requete1->errorInfo())); 
while ($demandes=$requete1->fetch()){ 
$date_demande=date_format(date_create_from_format('Y-m-d', $demandes['date_demande']), 'd/m/Y');
$date_debut=date_format(date_create_from_format('Y-m-d', $demandes['date_debut']), 'm/Y');
$date_fin=date_format(date_create_from_format('Y-m-d', $demandes['date_fin']), 'm/Y');
$modifier='modifier_'.$demandes['numero_demande'];
$voir='voir_'.$demandes['numero_demande'];
$supprimer='supprimer_'.$demandes['numero_demande'];


echo '<tr><td>'.$demandes['numero_demande'].'</td>
<td>'.$date_demande.'</td>
<td>'.$demandes['numero'].'</td>
<td>'.$demandes['district'].' - '.$demandes['site'].'</td>
<td>'.$date_debut.' - '.$date_fin.'</td>
<td>
';

$requete2=$bdd->prepare('SELECT fk_espece_manipulee,nb_individus_total FROM demande_manipulation_especes.espece_demande WHERE fk_numero_demande=?');
$requete2->execute(array($demandes['numero_demande'])) or die(print_r($requete2->errorInfo())); 
while ($especes=$requete2->fetch()){ 
echo '&nbsp'.$especes['nb_individus_total'].' '.$especes['fk_espece_manipulee'].'</br>';

}
echo '</td>
<td>
<input type="submit" name="'.$voir.'" value="Voir" />&nbsp
<input type="submit" name="'.$modifier.'" value="Modifier" />&nbsp
<input type="submit" name="'.$supprimer.'" value="Supprimer" />
</td>
</tr>';
}
echo '</table>';
$requete1 ->closeCursor();
?>
</body>
 </html>
