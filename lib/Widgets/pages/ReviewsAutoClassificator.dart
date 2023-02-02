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
  static PageState _pageState = PageState.Not_Loading;
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
                 label: Text("inserisci la tua recensione"),
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
    setState(()=>{
      _pageState = PageState.Loading,
      _resultWid = defaultResultWidget()
    });
    NaiveBayesianResult result = (await Query.naiveBayesian(_recensione)).first;
    setState(()=>{
      _resultWid = buildResultWidget(result)
    });
  }

  Widget buildResultWidget(NaiveBayesianResult result){
    int posProb = (result.getProb().first*100).toInt();
    int negProb = ((result.getProb()[1])*100).toInt();
    return Row(
      children: [
        Expanded(
          flex: flexFactor(negProb),
            child: Opacity(
                opacity: 0.9,
                child:Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                    color: Colors.red,
                    child: Text(
                      textAlign: TextAlign.center,
                      "LA TUA RECENSIONE E' NEGATIVA CON UNA PROBABILITA' DEL ${negProb}%",
                      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
                    ),
                )
            )
        ),
        Expanded(
            flex: flexFactor(posProb),
            child: Opacity(
                opacity: 0.9,
                child:Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                    color: Colors.green,
                    child: Text(
                      textAlign: TextAlign.center,
                      "LA TUA RECENSIONE E' POSITIVA CON UNA PROBABILITA' DEL ${posProb}%",
                      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
                    ),
                )
            )
        )
      ],
    );
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
        formatPage()
      ],
    );
  }

  static Widget formatPage(){
    return (_pageState == PageState.Loading)?
        const SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(color: Colors.black,),
        ):
    const Text(
      "NEGATIVE \\ POSITIVE \n CLASSIFICATOR TOOL",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 50,
        fontStyle: FontStyle.italic,
      ),
    );
  }
  
  int flexFactor(int prob){
    return  (prob >= 0 && prob < 11)?1:
            (prob > 10 && prob <21)?2:
            (prob > 20 && prob < 31)?3:
            (prob > 30 && prob < 41 )?4:
            (prob > 40 && prob < 51)?5:
            (prob > 50 && prob < 61)?6:
            (prob > 60 && prob < 71)?7:
            (prob > 70 && prob < 81)?8:
            (prob > 80 && prob < 91)?9:10;
  }

}

enum PageState{
  Loading,
  Not_Loading
}