<?php 
session_start();
require_once('config.php');
?>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" >
<head>
  <title>Observations ponctuelles d'espèces d'oiseaux</title>
  <meta http-equiv="Content-Type" content="text/html";
charset="utf-8" />
 
    <script type="text/javascript" src="../openlayers/OpenLayers.js"></script>
        <script src="http://maps.google.com/maps/api/js?v=3&amp;sensor=false"></script>

 <script type="text/javascript" >



</script>




    </head>




    <body>
<!--
<div style="float:right;width:28%">
 <h1 style="font-size:1.3em;">Informations</h1>
 <p style="font-size:.8em;">Cliquer sur un point pour avoir les informations sur le levé.</p>
!-->
<div id="nodeList">
</div>
 </div>

<b> Observations ponctuelles d'espèces d'oiseaux </b></P>


<div style="float:right;width:28%">
<table cellpadding="2" cellspacing="5" width="100%"> 
<?php 
$i=0;
$reponse=$bdd->query("SELECT distinct fk_espece_vernaculaire FROM vues_ornithologie.cmtg_indiff_vue WHERE fk_espece_vernaculaire<>'Canard d''Eaton de Kerguelen' ORDER BY fk_espece_vernaculaire ASC");
while ($especes=$reponse->fetch()){
$i=$i+1;
?>

<tr>
<td width=2> 
 <img src="http://193.253.99.148/cgi-bin/mapserv?map=/var/www/observatoire_biodiversite/mapfile_espece.map&SERVICE=WMS&VERSION=1.1.1&REQUEST=GetLegendGraphic&FORMAT=image/png&LAYER=espece_choisie&RULE=<?php echo $especes['fk_espece_vernaculaire']?>" alt="" style="border:none;"/><br /> 
</td>
 <td><input type="checkbox" name="<?php echo $especes['fk_espece_vernaculaire']?>" id="<?php echo $especes['fk_espece_vernaculaire']?>" value="<?php echo 'wms_'.$i ?>"  onclick="toggleControl(this);"/> <label for="<?php echo $especes['fk_espece_vernaculaire']?>"><?php echo $especes['fk_espece_vernaculaire']?></label></td>

 </tr>


<?php } $reponse ->closeCursor();  ?>

</table>
</div>
</p>

	Utiliser les fleches + et - ou la molette de la souris pour zoomer/dezoomer et deplacez-vous sur la carte comme vous le souhaitez.</p>
<!-- Localisation des observations ponctuelles de <b><?php echo $_POST['espece'] ?></b> </p> !-->
	  
	  <div style="width:800; height:700;border:1px solid blue;" id="map"></div>
      <script defer="defer" type="text/javascript">

 function toggleControl(element){

<?php 
$i=0;
$reponse=$bdd->query("SELECT distinct fk_espece_vernaculaire FROM vues_ornithologie.cmtg_indiff_vue WHERE fk_espece_vernaculaire<>'Canard d''Eaton de Kerguelen'  ORDER BY fk_espece_vernaculaire ASC");
while ($especes=$reponse->fetch()){
$i=$i+1;
?>

if(element.value == "<?php echo 'wms_'.$i ?>"){
<?php echo 'wms_'.$i.'.setVisibility(element.checked);' ?>
}

<?php } $reponse ->closeCursor();  ?>
} 
OpenLayers.ProxyHost = "/cgi-bin/proxy.cgi?url=";

//var esp="'Manchot royal','Sterne de Kerguelen'";
  var map = new OpenLayers.Map('map',
                                     // mettre les coordonnees (bounds) dans le systeme de projection du district
									 {maxExtent: 
new OpenLayers.Bounds(7566042,-6494701,7912761, -6137857),
//new OpenLayers.Bounds( <?php echo '.$xmin.','.$ymin.','.$xmax.','.$ymax' ?>), 
                                      projection: new OpenLayers.Projection('EPSG:900913'), displayProjection: new OpenLayers.Projection('EPSG:32742')
               });     

<?php 
$i=0;
$reponse=$bdd->query("SELECT distinct fk_espece_vernaculaire FROM vues_ornithologie.cmtg_indiff_vue WHERE fk_espece_vernaculaire<>'Canard d''Eaton de Kerguelen'  ORDER BY fk_espece_vernaculaire ASC");
while ($especes=$reponse->fetch()){
$i=$i+1;
?>

 var <?php echo 'wms_'.$i ?> = new OpenLayers.Layer.WMS( "<?php echo $especes['fk_espece_vernaculaire'] ?>", "http://193.253.99.148/cgi-bin/mapserv?map=/var/www/observatoire_biodiversite/mapfile_espece.map&",

 {layers:'espece_choisie',transparent: true,especevernaculaire: <?php echo '\''.$especes['fk_espece_vernaculaire'].'\'' ?>,srs:'EPSG:32742'}, {isBaseLayer: false, visibility: false,'displayInLayerSwitcher':false} );
map.addLayer(<?php echo 'wms_'.$i ?>);
<?php } $reponse ->closeCursor();  ?>


    var osm = new OpenLayers.Layer.OSM("OSM");
    var gmap_satellite =  new OpenLayers.Layer.Google(
                "Google Satellite",
                {type: google.maps.MapTypeId.SATELLITE, numZoomLevels: 22}
            );
    var gmap_terrain =  new OpenLayers.Layer.Google(
                "Google Terrain",
                {type: google.maps.MapTypeId.TERRAIN, numZoomLevels: 22}
            );


 //  var osm = new OpenLayers.Layer.Google("Google Satellite", {type: google.maps.MapTypeId.SATELLITE, numZoomLevels: 22} );
 //var osm  new OpenLayers.Layer.Google("Google Streets", // the default{numZoomLevels: 20});


map.addLayers([osm,gmap_satellite,gmap_terrain]);

            //Add a mouse position control
            map.addControl(new OpenLayers.Control.MousePosition({displayProjection:new OpenLayers.Projection('EPSG:4326') }));

            // Add a layer switcher control
            map.addControl(new OpenLayers.Control.LayerSwitcher({}));
			var ls = map.getControlsByClass('OpenLayers.Control.LayerSwitcher')[0];
ls.maximizeControl();

if(!map.getCenter()){
                map.zoomToExtent(new OpenLayers.Bounds( 7566042,-6494701,7912761, -6137857));
            }



//pour avoir les attributs quand on clique sur la carte. Il faut aussi changer le mapfile (ajouter les templates et les sections dans METADATA WEB) et créer les templates (voir le mapfile_zones_frequentees_wms.map)


//map.events.register('click', map, function (e) {
//OpenLayers.Util.getElement('nodeList').innerHTML = "Chargement... veuillez patienter...";

//var url = wms.getFullRequestString({//
//REQUEST: "GetFeatureInfo",
//EXCEPTIONS: "application/vnd.ogc.se_xml",
//BBOX: map.getExtent().toBBOX(),
//X: e.xy.x,
//Y: e.xy.y,
//INFO_FORMAT: 'text/html',
//QUERY_LAYERS: wms_1.params.LAYERS + "," + wms_2.params.LAYERS,
//REDIUS:2,
//WIDTH: map.size.w,
//HEIGHT: map.size.h});

//OpenLayers.Request.GET({url: url, callback: setHTML});
//OpenLayers.Event.stop(e);
//});

//function setHTML(response) {
//OpenLayers.Util.getElement('nodeList').innerHTML = response.responseText;
//}


//pour avoir l'url:
 //  OpenLayers.Util.getElement('nodeList').innerHTML = url;
 // Event.stop(e);
//});


      </script>
 
</body>
</html>