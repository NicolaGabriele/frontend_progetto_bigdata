import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Widgets/visualizzations/GeoDataHotelsInNation.dart';

class VisualizzationPage extends StatefulWidget{

  Widget widgets;
  _VisualizzationPageState state = _VisualizzationPageState();
  VisualizzationPage({required this.widgets});
  @override
  State<StatefulWidget> createState()=>state;

  void setWidget(Widget l){
    state.setState(() {
      this.widgets = l;
    });
  }

}

class _VisualizzationPageState extends State<VisualizzationPage>{
  @override
  Widget build(BuildContext context) {
    //return GeoDataHotelsInNation();
    return widget.widgets;
  }

}
