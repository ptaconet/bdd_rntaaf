<?php
session_start();
$_SESSION = array();
require_once('../config.php');
?>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" >
<head>
<title>Connexion au formulaire de demande manipulation espèces</title>
<meta http-equiv="Content-Type" content="text/html";
charset="utf-8" />


<style>
h4 {text-align:center}
</style>
</head>
<body>


<?php

 if(isset($_POST['submit'])){

$requete = $bdd->prepare('SELECT mot_de_passe FROM demande_manipulation_especes.demandeur WHERE demandeur.nom=?');
$requete->execute(array($_POST['nom_utilisateur']));
$requeteaa=$requete->fetch();

$requete ->closeCursor();

if ($_POST['mot_de_passe']==$requeteaa['mot_de_passe']){ 
$_SESSION['responsable']=$_POST['nom_utilisateur'];
$_SESSION['connexion_reussie']=true;
header("Location:page_accueil.php",TRUE,301);
exit();
}
else{
echo "<FONT COLOR='red'>Mauvaise combinaison nom d'utilisateur/mot de passe.</br> Veuillez saisir à nouveau vos identifiants de connexion.</font></P>";
}

}
?>

<h4> Connexion au site de demande d'autorisations de capture ou de prélevements à des fins scientifiques
de spécimens d'espèces animales protégées au sein des Terres Australes et Antarctiques françaises.
</h4>
</p>
Veuillez saisir ici votre nom d'utilisateur et mot de passe.</br> Si vous n'en avez pas encore, veuillez contacter le gestionnaire de la base de données environnementales des TAAF: paul.taconet@gmail.com
</p>
<form method="POST">
Nom d'utilisateur:<input type="text" name="nom_utilisateur" value="<?php echo (isset($_POST['nom_utilisateur']) ? $_POST['nom_utilisateur'] : ''); ?>"  /></P>
Mot de passe:<input type="password" name="mot_de_passe" /></P>
<input type="submit" name="submit" value="Valider" />
</p>
<!--
<a href="mot_de_passe_oublie.php" > Mot de passe oublié? <a>
-->
</body>
 </html>
