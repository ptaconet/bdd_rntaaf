
<?php
session_start();

if (!isset($_SESSION['connexion_reussie'])){
echo "Accès interdit. Veuillez vous connecter en <a href=\"connexion.php\"> cliquant ici</a>.";
exit();
}

?>
