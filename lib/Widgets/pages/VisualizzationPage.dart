import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Widgets/visualizzations/GeoDataHotelsInNation.dart';

class VisualizzationPage extends StatefulWidget{

  List<Widget>? widgets = null;
  VisualizzationPage({this.widgets});
  @override
  State<StatefulWidget> createState()=>_VisualizzationPageState();

  void setWidgets(List<Widget> l){
    this.widgets = l;
  }

}

class _VisualizzationPageState extends State<VisualizzationPage>{
  @override
  Widget build(BuildContext context) {
    //TODO: debug
    return GeoDataHotelsInNation();
  }

  void update(){
    setState(()=>{});
  }
}
