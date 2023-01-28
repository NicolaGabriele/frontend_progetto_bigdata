import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:frontend_progetto_bigdata/Models/GeoData.dart';
import 'package:frontend_progetto_bigdata/models/ReviewsNumberItem.dart';
import 'package:latlong/latlong.dart';

class GeoDataHotelsInNation extends StatefulWidget{

  List<GeoData> coordinate = [];

  GeoDataHotelsInNation({required this.coordinate});

  @override
  State<StatefulWidget> createState()=>_GeoDataHotelsState(coord: coordinate);

}

class _GeoDataHotelsState extends State<GeoDataHotelsInNation>{

  List<GeoData> coord;
  _GeoDataHotelsState({required this.coord});

  final PopupController _popupController = PopupController();
  MapController _mapController = MapController();
  double _zoom = 7;

  List<LatLng> _latLngList = [];

  var _markers = <Marker>[];

  @override
  Widget build(BuildContext context) {
    print("VISUAL"+_markers[1].point.toString());
    return /*Expanded(
        flex: 1,
        child: Column(
          children: [
            Container(height: 30,),*/
            Container(
                width: 1280,
                height: 720,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: buildMap()
            //),
              //]
    );
  }

  @override
  void initState() {
    _markers = coord.map(
            (point) => Marker(
              //point: point,
              point: new LatLng(double.parse(point.getLatitudine()),double.parse(point.getLongitudine())),
              width: 60,
              height: 60,
              builder: (context) => Icon(
                Icons.pin_drop,
                size: 60,
                color: Colors.red.shade900,
              ),
            )).toList();
    //super.initState();
  }

  Widget buildMap(){
    return SafeArea(
      child: Stack(
      children: [
        Positioned.fill(
          child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            zoom: _zoom,
            center: _markers[1].point,
            //bounds: LatLngBounds.fromPoints(lista latlong),
            plugins: [
              MarkerClusterPlugin(),
            ],
            onTap: (_) => _popupController.hidePopup(),
          ),
          layers: [
            TileLayerOptions(
              minZoom: 1,
              maxZoom: 31,
              backgroundColor: Colors.blueGrey,
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerClusterLayerOptions(
              maxClusterRadius: 190,
              disableClusteringAtZoom: 14,
              size: Size(50, 50),
              fitBoundsOptions: FitBoundsOptions(
                maxZoom: 18,
                padding: EdgeInsets.all(50),
              ),
              markers: _markers,
              polygonOptions: PolygonOptions(
                  borderColor: Colors.white,
                  color: Colors.red,
                  borderStrokeWidth: 3),
              popupOptions: PopupOptions(
                  popupSnap: PopupSnap.markerTop,
                  popupController: _popupController,
                  popupBuilder: (_, marker) => Container(
                    color: Colors.amberAccent,
                    child: Text("Hotel Name"),
                  )),
              builder: (context, markers) {
                return Container(
                  alignment: Alignment.center,
                  decoration:
                  BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                  child: Text('${markers.length}'),
                );
              },
            ),
          ], //layers
        ),),
        Positioned( //Tasto di Zoom+
            bottom: 80,
            right: 5,
            child: FloatingActionButton(
              heroTag: 'plus',
              backgroundColor: Colors.blueGrey,
              onPressed: () {
                _mapController.move(
                  _mapController.center, _mapController.zoom+0.5);
              },// onPressed
              child: const Icon(CupertinoIcons.zoom_in),
            ),
        ),
        Positioned( //Tasto di Zoom-
          bottom: 20,
          right: 5,
          child: FloatingActionButton(
            heroTag: 'minus',
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              _mapController.move(
                  _mapController.center, _mapController.zoom-0.5);
            },// onPressed
            child: const Icon(CupertinoIcons.zoom_out),
          ),
        ),
      ],
      ),);
  }

}