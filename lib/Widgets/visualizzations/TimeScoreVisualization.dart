import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/models/TimeScoreItem.dart';

class TimeScoreVisualization extends StatefulWidget{

  List<TimeScoreItem> input;
  TimeScoreVisualization({required this.input});

  @override
  State<StatefulWidget> createState()=> _TimeScoreVisualState();

}

class _TimeScoreVisualState extends State<TimeScoreVisualization> {

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
                "Andamento temporale delle recensioni",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 50),
                width: 500,
                height: 500,
                child: buildTimeSeriesChart()
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimeSeriesChart() {
    if (widget.input.length == 0) {
      return const AlertDialog(
        title: Text("Non esistono recensioni per l'hotel specificato.",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      );
    }
    return charts.TimeSeriesChart(
      _createSampleData(),
      animate: true,
    );
  }

  List<charts.Series<TimeScoreItem, DateTime>> _createSampleData() {
    return [
      charts.Series<TimeScoreItem, DateTime>(
        id: 'TimeScore',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeScoreItem item, _) =>
            DateTime(item.getAnno(), item.getMese(), item.getGiorno()),
        measureFn: (TimeScoreItem item, _) => item.getPunteggio(),
        data: widget.input,
      )
    ];
  }

}
