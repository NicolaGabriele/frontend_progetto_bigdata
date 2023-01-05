import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class GeoDataHotelsInNation extends StatefulWidget{


  @override
  State<StatefulWidget> createState()=>_GeoDataHotelsState();

}

class _GeoDataHotelsState extends State<GeoDataHotelsInNation>{
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            height: 500,
            width: 800,
            decoration: BoxDecoration(
                border: Border.all(width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child:buildMap(),
            )
        )
    );
  }

  Widget buildMap(){
    return Stack(
      children: [
        FlutterMap(options: MapOptions(
            center: LatLng(41.890444, 12.492093),
            zoom: 5.0
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
        ),
      ],
    );
  }


}