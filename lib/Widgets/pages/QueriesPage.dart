import 'package:flutter/material.dart';

import 'SubmitPage.dart';
import 'VisualizzationPage.dart';

class QueriesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _QueriesPageState();

}

class _QueriesPageState extends State<StatefulWidget>{
  VisualizzationPage visualizzation = VisualizzationPage(widgets: [],);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Row(
              children: [
                Container(
                    width: 75,
                    height: 75,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle
                    ) ,
                    child: Image.asset("images/logo.jpg")
                ),
                const Text(
                  'Hotel Reviews Analitycs',
                  style: TextStyle(
                      fontSize: 50,
                      fontStyle: FontStyle.italic
                  ),
                )
              ],
            )
        ), //aggiungere bellezze
      ),
        body: Row(
          children: [SubmitPage(visualizzation: visualizzation),VerticalDivider(width: 2,color: Colors.black,),visualizzation],
        ),
      bottomNavigationBar: BottomAppBar(color: Colors.red, elevation: 10,child: Container(height: 25,),),
    );
  }

}