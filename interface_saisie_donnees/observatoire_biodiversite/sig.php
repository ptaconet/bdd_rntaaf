<?php 
session_start();
require_once('config.php');
?>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" >
<head>
  <title>SIG en ligne Observatoire biodiversité des Terres Australes Françaises</title>
  <meta http-equiv="Content-Type" content="text/html";
charset="utf-8" />
        <script src="http://maps.google.com/maps/api/js?v=3&amp;sensor=false"></script>
    <script type="text/javascript" src="../openlayers/OpenLayers.js"></script>
<style>
		html,body {
			height: 99%;
			width: 99%;
		}
		#map {
			width: 100%;
			height: 100%;
			border: 1px solid black;
		}	
	</style>
    </head>
    <body>
  <div id='map'></div>
	 <!-- <div style="width:1000; height:800;border:1px solid blue;" id="map"></div>  -->
      <script defer="defer" type="text/javascript">
  var map = new OpenLayers.Map('map',{ projection: new OpenLayers.Projection('EPSG:900913'), displayProjection: new OpenLayers.Projection('EPSG:32742')
             });          


var contours_ker = new OpenLayers.Layer.WMS( "Trait de côte Kerguelen", "http://193.253.99.148/cgi-bin/mapserv?map=/var/www/observatoire_biodiversite/mapfile_contours_ker.map&",
 {layers:'contours_ker',transparent: true,srs:'EPSG:32742'}, {isBaseLayer: false,visibility:false}
);

var zee_ker = new OpenLayers.Layer.WMS( "ZEE de Kerguelen", "http://193.253.99.148/cgi-bin/mapserv?map=/var/www/observatoire_biodiversite/mapfile_contours_ker.map&",
 {layers:'zee_ker',transparent: true,srs:'EPSG:32742'}, {isBaseLayer: false,visibility:false}
);

var transects_ornitho_ker = new OpenLayers.Layer.WMS( "Transects ornitho de la RN", "http://193.253.99.148/cgi-bin/mapserv?map=/var/www/observatoire_biodiversite/mapfile_contours_ker.map&",
 {layers:'transects_ornitho_ker',transparent: true,srs:'EPSG:32742'}, {isBaseLayer: false}
);


var cabanes_ker = new OpenLayers.Layer.WMS( "Cabanes", "http://193.253.99.148/cgi-bin/mapserv?map=/var/www/observatoire_biodiversite/mapfile_contours_ker.map&",
 {layers:'cabanes_ker',transparent: true,srs:'EPSG:32742'}, {isBaseLayer: false}
);



    var osm = new OpenLayers.Layer.OSM("Open Street Map");
    var gmap_satellite =  new OpenLayers.Layer.Google(
                "Google Satellite",
                {type: google.maps.MapTypeId.SATELLITE, numZoomLevels: 22}
            );
    var gmap_terrain =  new OpenLayers.Layer.Google(
                "Google Terrain",
                {type: google.maps.MapTypeId.TERRAIN, numZoomLevels: 22}
            );

map.addLayers([contours_ker,gmap_satellite,zee_ker,transects_ornitho_ker,gmap_terrain,cabanes_ker]);
  map.setCenter(
                new OpenLayers.LonLat(69.5, -49.3).transform(
                    new OpenLayers.Projection("EPSG:4326"),
                    map.getProjectionObject()
                ), 9
            );   

 //  var osm = new OpenLayers.Layer.Google("Google Satellite", {type: google.maps.MapTypeId.SATEL19LITE, numZoomLevels: 22} );
 //var osm  new OpenLayers.Layer.Google("Google Streets", // the default{numZoomLevels: 20});

map.addControl(new OpenLayers.Control.OverviewMap());
map.addControl(new OpenLayers.Control.ScaleLine());
//map.addControl(new OpenLayers.Control.PanZoomBar());
     map.addControl(new OpenLayers.Control.LayerSwitcher());
      			var ls = map.getControlsByClass('OpenLayers.Control.LayerSwitcher')[0];
ls.maximizeControl();
            //Add a mouse position control
         map.addControl(new OpenLayers.Control.MousePosition({displayProjection:new OpenLayers.Projection('EPSG:4326') }));

//pour avoir les attributs quand on clique sur la carte. Il faut aussi changer le mapfile (ajouter les templates et les sections dans METADATA WEB) et créer les templates (voir le mapfile_zones_frequentees_wms.map)

info = new OpenLayers.Control.WMSGetFeatureInfo({
                url: 'http://193.253.99.148/cgi-bin/mapserv?map=/var/www/observatoire_biodiversite/mapfile_contours_ker.map', 
                title: 'Identify features by clicking',
hover:false,
                queryVisible: true,
                eventListeners: {
                    getfeatureinfo: function(event) {
                        map.addPopup(new OpenLayers.Popup.FramedCloud(
                            "chicken", 
                            map.getLonLatFromPixel(event.xy),
                            null,
                            event.text,
                            null,
                            true
                    ),true);
                }
            }
        });
        map.addControl(info);
        info.activate();


      </script>


	 
</body>
</html>
