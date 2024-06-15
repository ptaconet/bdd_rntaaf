<?php
try{
$bdd=new PDO ('pgsql:host=localhost; port=5432; dbname=bddrntaaf', 'postgres', 'DEJEAN2000');
}
catch (Exception $e)
{
	die('Erreur: '.$e->getMessage());
}
?>
