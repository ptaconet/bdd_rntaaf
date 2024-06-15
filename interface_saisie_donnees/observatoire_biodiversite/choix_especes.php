<?php
session_start();
require_once('config.php'); ?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" >
<head>
<title>Choix espèce</title>
<meta http-equiv="Content-Type" content="text/html";
charset="utf-8" />
<link rel="stylesheet" href="jquery-ui.css" />
<script language="javascript" src="jquery-1.9.1.js"></script>
<script language="javascript" src="jquery-ui.js"></script>
<script type="text/javascript" src="openlayers/OpenLayers.js"></script>

</head>
<body>


<form action="carto_especes.php" method="POST">
Choisissez l'espèce: <select name="espece"> 
				<option value="NA"></option>
				<?php 
				$reponse=$bdd->query('SELECT distinct fk_espece_vernaculaire FROM vues_ornithologie.cmtg_indiff_vue ORDER BY fk_espece_vernaculaire ASC');
				while ($especes=$reponse->fetch()){
				echo '<option value="'.$especes['fk_espece_vernaculaire'].'">'.$especes['fk_espece_vernaculaire'].'  </option>'; }			
$reponse ->closeCursor(); ?>
			   </select> 


<input type="submit" name="valider" value="valider" />
