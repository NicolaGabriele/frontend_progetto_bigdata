import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class GeoDataHotelsInNation extends StatefulWidget{

  @override
  State<StatefulWidget> createState()=>_GeoDataHotelsState();

}

class _GeoDataHotelsState extends State<GeoDataHotelsInNation>{
  double _zoom_level = 5;
  final LatLng center = LatLng(41.890444, 12.492093);
  MapController? control;
  @override
  Widget build(BuildContext context) {
    print(_zoom_level);
    return Expanded(
        flex: 1,
        child: Column(
          children: [
            Container(height: 30,),
            Container(
                width: 400,
                height: 500,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: buildMap()
            ),
          ],
        )
    );
  }

  Widget buildMap(){
    return Stack(
      children: [
        FlutterMap(options: MapOptions(
            center: center,
            zoom: _zoom_level
        ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a','b','c'],
            ),
            MarkerLayerOptions(
                markers: [
                  Marker(
                      width: 100.0,
                      height: 100.0,
                      point: LatLng(41.890444, 12.492093),
                      builder: (ctx) => Icon(Icons.location_on, color:Colors.red)
                  ),]
            ),
          ],
        )
      ],
    );
  }
}