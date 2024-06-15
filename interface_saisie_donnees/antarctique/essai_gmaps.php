<?php 
session_start();
?>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" >
<head>
  <title>MapServer Simple Viewer</title>
  <meta http-equiv="Content-Type" content="text/html";
charset="utf-8" />
    <script type="text/javascript" src="../openlayers/OpenLayers.js"></script>
    </head>
    <body>
	Utiliser les fleches + et - ou la molette de la souris pour zoomer/dezoomer et deplacez-vous sur la carte comme vous le souhaitez.</br>
	En zoomant, le nom et le numéro des zones apparaissent sur les zones correspondantes.</p>
      
	  
	  <div style="width:1000; height:800;border:1px solid blue;" id="map"></div>
      <script defer="defer" type="text/javascript">
var map;

function init() {
    map = new OpenLayers.Map({
        div: "map",
        projection: new OpenLayers.Projection("EPSG:900913")
    });
    
    var osm = new OpenLayers.Layer.OSM();            
    var gmap = new OpenLayers.Layer.Google("Google Streets");
    
    map.addLayers([osm, gmap]);

    map.addControl(new OpenLayers.Control.LayerSwitcher());

    map.setCenter(
        new OpenLayers.LonLat(10.2, 48.9).transform(
            new OpenLayers.Projection("EPSG:4326"),
            map.getProjectionObject()
        ), 
        5
    );
}

      </script>


	 
</body>
</html>
