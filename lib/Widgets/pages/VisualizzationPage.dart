import 'dart:collection';

import 'package:flutter/material.dart';

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
    return Container(
        child: Padding(
          padding: EdgeInsets.all(200),
          child: Column(
              children: (widget.widgets!=null)? widget.widgets as List<Widget>:List.empty()
          ),
        )
        );
  }

  void update(){
    setState(()=>{});
  }
}