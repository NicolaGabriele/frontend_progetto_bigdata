
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/models/CoppiaNazionalitaPunteggioMedio.dart';

class DemandingClientsVisualization extends StatefulWidget{

  List<CoppiaNazionalitaPunteggioMedio> input;

  DemandingClientsVisualization({required this.input});

  @override
  State<StatefulWidget> createState()=> _DemandingClientsVisualState();

}

class _DemandingClientsVisualState extends State<DemandingClientsVisualization> {

  @override
  Widget build(BuildContext context) {
    //debugPrint(widget.input.length.toString());
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
                "Gradimento medio più alto degli hotel in Europa per nazionalità del visitatore",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 50),
                width: 500,
                height: 500,
                child: buildChartMaggiori()
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Gradimento medio più basso degli hotel in Europa per nazionalità del visitatore",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 50),
                width: 500,
                height: 500,
                child: buildChartPeggiori()
            ),
          ],
        ),
      ),
    );
  }


  Widget buildChartMaggiori(){
    charts.BarChart chart= charts.BarChart(
        [
          charts.Series<CoppiaNazionalitaPunteggioMedio,String>(
              id: "demanding",
              data: widget.input.getRange(widget.input.length-10, widget.input.length).toList(),
              domainFn: (CoppiaNazionalitaPunteggioMedio coppia, _)=>coppia.getNazionalita(),
              measureFn: (CoppiaNazionalitaPunteggioMedio coppia, _)=> coppia.getPunteggioMedio()
          )
        ]
    );
    return chart;
  }

  Widget buildChartPeggiori(){
    charts.BarChart chart= charts.BarChart(
        [
          charts.Series<CoppiaNazionalitaPunteggioMedio,String>(
              id: "demanding",
              data: widget.input.getRange(0, 10).toList(),
              domainFn: (CoppiaNazionalitaPunteggioMedio coppia, _)=>coppia.getNazionalita(),
              measureFn: (CoppiaNazionalitaPunteggioMedio coppia, _)=> coppia.getPunteggioMedio()
          )
        ]
    );
    return chart;
  }

}