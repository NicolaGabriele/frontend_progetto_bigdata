
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Models/WordCountItem.dart';
import 'package:flutter_scatter/flutter_scatter.dart';

import 'WordCloud.dart';


class WordCountVisualizzation extends StatefulWidget{

  List<WordCountItem> data;
  WordCountVisualizzation({required this.data});

  @override
  State<StatefulWidget> createState()=>_WordCountVisualState();


}

class _WordCountVisualState extends State<WordCountVisualizzation>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
        height: 500,
        child:Scrollbar(
            interactive: true,
            scrollbarOrientation: ScrollbarOrientation.right,
            thumbVisibility: true,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                WordCloud(lista:widget.data.getRange(widget.data.length-30, widget.data.length).toList()),
      Padding(
          padding: const EdgeInsets.only(right: 20, top: 20),
        child: Container(
          width: 300,
          height: 500,
          alignment: Alignment.center,
          child: charts.BarChart(
              [charts.Series<WordCountItem,String>(
                  id: "word count visualizzation",
                  domainFn: (WordCountItem wc, _)=>wc.getWord(),
                  measureFn: (WordCountItem wc,_)=>wc.getCounter(),
                  data: widget.data.getRange(widget.data.length-10,widget.data.length).toList()
              )]
          ),
        ),
      )
              ],
            )
        )
    );
  }

}


