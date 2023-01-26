import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Widgets/visualizzations/GeoDataHotelsInNation.dart';

class VisualizzationPage extends StatefulWidget{

  List<Widget> widgets;
  _VisualizzationPageState state = _VisualizzationPageState();
  VisualizzationPage({required this.widgets});
  @override
  State<StatefulWidget> createState()=>state;

  void setWidgets(List<Widget> l){
    state.setState(() {
      this.widgets = l;
    });
  }

}

class _VisualizzationPageState extends State<VisualizzationPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (0.77)*MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Stack(
        children: [
          Opacity(
            opacity: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 800, top: 500),
              child: Image.asset(
                "/images/visual.jpg",
              ),
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: this.widget.widgets,
              )
          )
        ],
      ),
    );
  }

}
