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
            const Padding(
                padding: EdgeInsets.all(20),
              child: Text(
                "TOP 5 HOTELS",
                textAlign: TextAlign.center,
              ),
            ),
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
    List<GeoData> lista = [];
    for(FilteredItem i in widget.input){
      if( i.getLatitudine().compareTo("NA") != 0 && i.getLongitudine().compareTo("N") != 0 ) {
        lista.add(GeoData(i.getLatitudine(), i.getLongitudine()));
      }
    }
    //geoData.forEach((element) {print(element);});
    return GeoDataHotelsInNation(coordinate: lista);
  }

  Widget buildChart(){
    return BarChart(
      [
        Series<FilteredItem,String>(
            id: "test",
            data: widget.input.getRange(widget.input.length-5, widget.input.length).toList(),
            domainFn: (FilteredItem fi, _)=>fi.getNomeHotel(),
            measureFn: (FilteredItem fi, _)=> double.parse(fi.getPunteggio())
        )
      ]
    );
  }

}