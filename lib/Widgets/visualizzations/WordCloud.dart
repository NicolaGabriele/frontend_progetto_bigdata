import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_scatter/flutter_scatter.dart';

import 'dart:math';

import '../../Models/WordCountItem.dart';

class WordCloud extends StatelessWidget{

  List<WordCountItem> lista;
  WordCloud({required this.lista});

  @override
  Widget build(BuildContext context) {

    debugPrint(lista.length.toString());
    List<FlutterHashtag> aux = [];
    double factor = 10/lista.first.getCounter();
    var rng = Random();
    for(WordCountItem e in lista){
      int size = (e.getCounter()*factor).toInt();
      bool rotate = rng.nextBool();
      Color color;
      switch(rng.nextInt(5)) {
        case 0: { color = FlutterColors.red; } break;
        case 1: { color = FlutterColors.blue; } break;
        case 2: { color = FlutterColors.green; } break;
        case 3: { color = FlutterColors.yellow; } break;
        default: { color = FlutterColors.purple; } break;
      }
      aux.add(
        FlutterHashtag(e.getWord(), color, size, rotate)
      );
    }
    List<Widget> wids = [];
    for(int i = 0; i<aux.length; i++){
      wids.add(ScatterItem(aux[aux.length-i-1], i));
      debugPrint(wids.length.toString());
      //wids.shuffle();
    }
    final screenSize = MediaQuery.of(context).size;
    final ratio = screenSize.width / screenSize.height;
    return Center(
      child: Container(
        //color: Colors.red.shade50,
        child: Scatter(
          fillGaps: true,
          delegate: FermatSpiralScatterDelegate(ratio: ratio),
          children: wids,
        ),
      ),
    );

  }

}

class ScatterItem extends StatelessWidget {
  ScatterItem(this.hashtag, this.index);
  final FlutterHashtag hashtag;
  final int index;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: hashtag.size.toDouble(),
      color: hashtag.color,
    );
    return RotatedBox(
      quarterTurns: hashtag.rotated ? 1 : 0,
      child: Text(
        hashtag.hashtag,
        style: style,
      ),
    );
  }
}

class FlutterHashtag {
  const FlutterHashtag(
      this.hashtag,
      this.color,
      this.size,
      this.rotated,
      );
  final String hashtag;
  final Color color;
  final int size;
  final bool rotated;
}

class FlutterColors {
  const FlutterColors._();

  static const Color yellow = Color(0xFFFFC108);
  static const Color red = Colors.red;
  static const Color blue = Color(0xFF02569B);
  static const Color green = Colors.green;
  static const Color purple = Colors.deepPurple;

}

