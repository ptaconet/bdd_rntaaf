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
    </head>
    <body>





<div style="float:right;width:28%">
 <h1 style="font-size:1.3em;">Informations</h1>
 <p style="font-size:.8em;">Cliquer sur un point pour avoir les informations sur le levé.</p>
<div id="nodeList">
</div>
 </div>
<!--
<div style="float:aside;width:28%">
 <img src="<?php echo 'images_oiseaux/'.$_POST['espece'].'.jpg' ?>" alt="Smiley face" height="420" width="420"> 
 </div>
!-->
<b> Observations ponctuelles d'espèces d'oiseaux </b></P>
<form method="POST">
Choisissez l'espèce: <select name="espece"> 
				<option value="NA"></option>
				<?php 
				$reponse=$bdd->query('SELECT distinct fk_espece_vernaculaire FROM vues_ornithologie.cmtg_indiff_vue ORDER BY fk_espece_vernaculaire ASC');
				while ($especes=$reponse->fetch()){
				echo '<option value="'.$especes['fk_espece_vernaculaire'].'">'.$especes['fk_espece_vernaculaire'].'  </option>'; }			
$reponse ->closeCursor(); ?>
			   </select> 


<input type="submit" name="valider" value="valider" />
</p>

	Utiliser les fleches + et - ou la molette de la souris pour zoomer/dezoomer et deplacez-vous sur la carte comme vous le souhaitez.</p>
Localisation des observations ponctuelles de <b><?php echo $_POST['espece'] ?></b> </p>
	  
	  <div style="width:800; height:800;border:1px solid blue;" id="map"></div>
      <script defer="defer" type="text/javascript">
OpenLayers.ProxyHost = "/cgi-bin/proxy.cgi?url=";
  var map = new OpenLayers.Map('map',
                                     // mettre les coordonnees (bounds) dans le systeme de projection du district
									 {maxExtent: 
new OpenLayers.Bounds(7566042,-6494701,7912761, -6137857),
//new OpenLayers.Bounds( <?php echo '.$xmin.','.$ymin.','.$xmax.','.$ymax' ?>), 
                                      projection: new OpenLayers.Projection('EPSG:900913'), displayProjection: new OpenLayers.Projection('EPSG:32742')
               });     

  


 var wms = new OpenLayers.Layer.WMS( "<?php echo $_POST['espece'] ?>", "http://193.253.99.148/cgi-bin/mapserv?map=/var/www/observatoire_biodiversite/mapfile_espece.map&",

 {layers:'espece_choisie',transparent: true,especevernaculaire:'<?php echo $_POST['espece'] ?>',srs:'EPSG:32742'}, {isBaseLayer: false} );


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


map.addLayers([osm,gmap_satellite,wms,gmap_terrain]);

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

 map.events.register('click', map, function (e) {
OpenLayers.Util.getElement('nodeList').innerHTML = "Chargement... veuillez patienter...";

var url = wms.getFullRequestString({
REQUEST: "GetFeatureInfo",
EXCEPTIONS: "application/vnd.ogc.se_xml",
BBOX: wms.map.getExtent().toBBOX(),
X: e.xy.x,
Y: e.xy.y,
INFO_FORMAT: 'text/html',
QUERY_LAYERS: wms.params.LAYERS,
REDIUS:2,
WIDTH: wms.map.size.w,
HEIGHT: wms.map.size.h});

 //  OpenLayers.Util.getElement('nodeList').innerHTML = url;
 // Event.stop(e);
//});


OpenLayers.Request.GET({url: url, callback: setHTML});
OpenLayers.Event.stop(e);
});

function setHTML(response) {
OpenLayers.Util.getElement('nodeList').innerHTML = response.responseText;
}






      </script>
 
</body>
</html>
