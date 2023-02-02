import 'package:flutter/material.dart';

import 'SubmitPage.dart';
import 'VisualizzationPage.dart';

class QueriesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _QueriesPageState();

}

class _QueriesPageState extends State<StatefulWidget>{
  VisualizzationPage visualizzation = VisualizzationPage(widgets: Container(),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
              children: [
                Flexible(
                    child:Container(
                        width: 75,
                        height: 75,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle
                        ) ,
                        child: Image.asset("images/logo.jpg")
                    ),
                ),
                const Flexible(
                  child: Text(
                    'Hotel Reviews Analytics',
                    style: TextStyle(
                        fontSize: 50,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ),

              ],
            )//aggiungere bellezze
      ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SubmitPage(visualizzation: visualizzation),
            VerticalDivider(width:2,color: Colors.black,),
            Expanded(child: visualizzation)
          ],
        ),
      bottomNavigationBar: BottomAppBar(color: Colors.red, elevation: 10,child: Container(height: 20,),), //valore base 20
    );
  }

}