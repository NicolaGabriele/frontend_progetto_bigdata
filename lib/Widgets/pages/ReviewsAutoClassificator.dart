import 'package:flutter/material.dart';

import '../../REST/Query.dart';

class ReviewsAutoClassificator extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_ReviewsClassificatorState();

}

class _ReviewsClassificatorState extends State<ReviewsAutoClassificator>{
  String _recensione = "scrivi qui la tua recensione";
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
                  'Hotel Reviews Analitycs',
                  style: TextStyle(
                      fontSize: 50,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),

            ],
          )//aggiungere bellezze
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.green,
              alignment: Alignment.center,
              child: Text(
                "Positive",
                style: TextStyle(
                  fontSize: 50
                ),
              ),
            )
          ),
          Divider(color: Colors.black,height: 2,thickness: 2),
           Padding(
               padding:EdgeInsets.all(10),
             child: TextField(
               decoration: InputDecoration(
                 label: Text(_recensione),
               ),
               onChanged: (value)=>_recensione = value,
               maxLines: null,
               keyboardType: TextInputType.multiline,
             ),
           ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: submit,
                child: Text("submit"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red)
                ),
              ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(color: Colors.red, elevation: 10,child: Container(height: 20,),), //valore base 20
    );
  }

  void submit(){
    Query.naiveBayesian("porco dio").then((value) => print(value));
  }

}