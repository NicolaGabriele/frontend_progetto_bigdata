import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_scatter/flutter_scatter.dart';

import '../../Models/WordCountItem.dart';

class WordCloud extends StatelessWidget{

  List<WordCountItem> lista;
  WordCloud({required this.lista});

  @override
  Widget build(BuildContext context) {

    List<FlutterHashtag> aux = [];
    for(WordCountItem e in lista){
      double factor = 100/350000;
      int size = e.getCounter()/factor as int;
      aux.add(
        FlutterHashtag(e.getWord(), Colors.red, size, false)
      );
    }
    List<Widget> wids = [];
    for(int i = 0; i<aux.length; i++){
      wids.add(ScatterItem(aux[i], i));
    }
    final screenSize = MediaQuery.of(context).size;
    final ratio = screenSize.width / screenSize.height;
    return Center(
      child: FittedBox(
        child: Scatter(
          fillGaps: true,
          delegate: ArchimedeanSpiralScatterDelegate(ratio: ratio),
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

  static const Color white = Color(0xFFFFFFFF);

  static const Color blue400 = Color(0xFF13B9FD);
  static const Color blue600 = Color(0xFF0175C2);
  static const Color blue = Color(0xFF02569B);

  static const Color gray100 = Color(0xFFD5D7DA);
  static const Color gray600 = Color(0xFF60646B);
  static const Color gray = Color(0xFF202124);
}

