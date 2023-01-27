
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Models/WordCountItem.dart';
import 'package:flutter_scatter/flutter_scatter.dart';

import 'WordCloud.dart';


class WordCountVisualizzation extends StatelessWidget{

  List<WordCountItem> data;
  WordCountVisualizzation({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
     width: 500,
     height: 500,
     child: WordCloud(lista:data.getRange(data.length-10, data.length).toList()),
    );
    /*Container(
      width: 700,
      height: 500,
      alignment: Alignment.center,
      child: charts.BarChart(
        [charts.Series<WordCountItem,String>(
          id: "word count visualizzation",
          domainFn: (WordCountItem wc, _)=>wc.getWord(),
          measureFn: (WordCountItem wc,_)=>wc.getCounter(),
          data: data.getRange(data.length-10, data.length).toList()
        )]
      ),
    );*/
  }

}


