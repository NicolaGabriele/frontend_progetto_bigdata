import 'package:flutter/material.dart';

import 'SubmitPage.dart';
import 'VisualizzationPage.dart';

class QueriesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _QueriesPageState();

}

class _QueriesPageState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
          children: [SubmitPage(),VerticalDivider(width: 2,color: Colors.black,),VisualizzationPage()],
        )
    );
  }

}