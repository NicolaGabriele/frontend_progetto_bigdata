import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Models/GeoData.dart';
import 'package:frontend_progetto_bigdata/Widgets/visualizzations/GeoDataHotelsInNation.dart';

import '../../Models/FilteredItem.dart';
import 'package:charts_flutter_new/flutter.dart';
class AverageScoreVisualizzation extends StatefulWidget{
  List<FilteredItem> input;
  AverageScoreVisualizzation({required this.input});
  @override
  State<StatefulWidget> createState()=> _AverageScoreVisualState();

}

class _AverageScoreVisualState extends State<AverageScoreVisualizzation>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1280,
      height: 720,
      child: Scrollbar(
        scrollbarOrientation: ScrollbarOrientation.right,
        thumbVisibility: true,
        interactive: true,
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 50),
                width: 500,
              height: 300,
              child:buildChart()
            ),
            buildMap()
          ],
        ),
      ),
    );
  }

  Widget buildMap(){
    List<GeoData> geoData = widget.input
                            .map(
            (e) => GeoData(e.getLatitudine(), e.getLongitudine())
    ).toList();
    return GeoDataHotelsInNation(coordinate: geoData);
  }

  Widget buildChart(){
    return BarChart(
      [
        Series<FilteredItem,String>(
            id: "test",
            data: widget.input,
            domainFn: (FilteredItem fi, _)=>fi.getNomeHotel(),
            measureFn: (FilteredItem fi, _)=> double.parse(fi.getPunteggio())
        )
      ]
    );
  }

}