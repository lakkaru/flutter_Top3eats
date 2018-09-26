import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

var apiKey = "AIzaSyCNrobi3dcdGQQqnFJbtWrj4lUg1UPkDPQ";

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapView mapView = MapView();
  CameraPosition cameraPosition;
  var staticMapProvider =
      StaticMapProvider("AIzaSyCNrobi3dcdGQQqnFJbtWrj4lUg1UPkDPQ");
  Uri staticMapUri;

  List<Marker> markers = <Marker>[
    Marker("1", "Lakkaru Resturent", 7.001581, 80.774787, color: Colors.amber)
  ];

  showMap() {
    MapView.setApiKey(apiKey);
    mapView.show(MapOptions(
        mapViewType: MapViewType.normal,
        initialCameraPosition:
            CameraPosition(Location(7.000581, 80.773787), 15.0),
        showUserLocation: true,
        title: "Recent Location"));

    mapView.onMapTapped.listen((_) {
      mapView.setMarkers(markers);
      mapView.zoomToFit(padding: 100);
    });
  }

  @override
  void initState() {
    super.initState();
    cameraPosition = CameraPosition(Location(7.000581, 80.773787), 2.0);
    staticMapUri = staticMapProvider.getStaticUri(
        Location(7.000581, 80.773787), 12,
        height: 400, width: 900, mapType: StaticMapViewType.roadmap);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Container(
          height: 300.0,
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  child: Text(
                    "Map should show here",
                    textAlign: TextAlign.center,
                  ),
                  padding: const EdgeInsets.all(20.0),
                ),
              ),
              InkWell(
                child: Center(
                  child: Image.network(staticMapUri.toString()),
                ),
                onTap: () {
                  showMap();
                },
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            "Tap the map to iteract",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 25.0),
          child: Text(
              "Camera Possition: \n\nLat: ${cameraPosition.center.latitude}\n\nLan: ${cameraPosition.center.longitude}\n\nZoom: ${cameraPosition.zoom}"),
        ),
      ]),
    );
  }
}
