<?php 
session_start();
require_once('config.php');
?>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" >
<head>
  <title>MapServer Simple Viewer</title>
  <meta http-equiv="Content-Type" content="text/html";
charset="utf-8" />

    </head>
    <body>
<form action="carte_antarctique.php" method="POST">
Selectionnez le nom:
<select name="nom">
<?php 
		$reponse=$bdd->query('SELECT gid,place_name,country,scar_featu FROM donnees_carto.toponymie_antarctique_scar_total ORDER BY place_name ASC');
		while ($nom=$reponse->fetch()){
		echo '<option value="'.$nom['gid'].'">'.$nom['place_name'].'  |  '.$nom['scar_featu'].'  |  '.$nom['country'].'</option>'; }?>
</select>

<input type="submit" name="valider" value="Valider" />	 
</body>
</html>
