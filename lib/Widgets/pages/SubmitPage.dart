import 'package:flutter/material.dart';

class SubmitPage extends StatefulWidget{

  static const List<String> list = ["Italy","France","United Kindom"];
  @override
  State<StatefulWidget> createState()=>_SubmitPageState();

}

class _SubmitPageState extends State<SubmitPage>{
  @override
  Widget build(BuildContext context) {
    //TODO
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 200, bottom: 200,left: 200,right: 200),
        child: Text("Area di Submit"),
      ),
    );
  }

}