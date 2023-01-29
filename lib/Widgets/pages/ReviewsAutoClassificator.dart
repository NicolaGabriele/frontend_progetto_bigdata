import 'package:flutter/material.dart';

import '../../REST/Query.dart';
import '../../models/NaiveBayesianResult.dart';

class ReviewsAutoClassificator extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_ReviewsClassificatorState();

}

class _ReviewsClassificatorState extends State<ReviewsAutoClassificator>{
  String _recensione = "scrivi qui la tua recensione";
  Widget _resultWid = defaultResultWidget();
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
            child: _resultWid
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

  void submit() async{
    NaiveBayesianResult result = (await Query.naiveBayesian(_recensione)).first;
    print("classe: ${result.getClasse()}");
    print("probs: ${result.getProb()}");
    /*setState(()=>{
      buildResultWidget(result)
    });*/
  }

  Widget buildResultWidget(NaiveBayesianResult result){
    return Container();
  }

  static Widget defaultResultWidget(){
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            Expanded(child: Opacity(opacity: 0.9,child:Container(color: Colors.red))),
            Expanded(child: Opacity(opacity: 0.9,child:Container(color: Colors.green)))
          ],
        ),
        const Text(
          "POSITIVE \\ NEGATIVE \n CLASSIFICATOR TOOL",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 50,
            fontStyle: FontStyle.italic,
          ),
        )
      ],
    );
  }


}