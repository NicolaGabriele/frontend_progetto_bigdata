import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Models/FilteredItem.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/VisualizzationPage.dart';
import 'package:frontend_progetto_bigdata/Widgets/visualizzations/AverageScoreVisualizzation.dart';

import '../../REST/Query.dart';

class AverageScoreForm extends StatefulWidget{

  VisualizzationPage visualizzation;
  AverageScoreForm({required this.visualizzation});
  @override
  State<StatefulWidget> createState()=>_AverageScoreState();

}

class _AverageScoreState extends State<AverageScoreForm>{

  static List<String> items = ['1','2','3','4','5','6','7','8','9','10'];
  String _selectedScore = items.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10, left:50),
          child: Container(
            color: Colors.red.shade50,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child:  Text(
                    "Punteggio minimo:",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ),
                DropdownButton(
                  value: _selectedScore,
                  items: items.map((e) => DropdownMenuItem<String>(value: e,child: Text(e))).toList(),
                  onChanged: (String? value)=>setState(()=>_selectedScore = value!),
                ),
              ],
            ),
          )
        ),
        Padding(
            padding: EdgeInsets.only(left: 50,top: 10),
            child:ElevatedButton(
                    onPressed: submit,
                    child: Text("submit"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red)
                ),
              )
          )
      ],
    );
  }
  
  void submit(){
    widget.visualizzation.setWidget(
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator()
            ],
          ),
        )
    );
    Query.averageScoreFilter(_selectedScore).then(
            (value) =>
            {
              value.sort(compare),
              widget.visualizzation.setWidget(
                  AverageScoreVisualizzation(input: value)
              )
            }
    );
  }

  int compare(FilteredItem it1, FilteredItem it2){
    if (double.parse(it1.getPunteggio())<=double.parse(it2.getPunteggio())) return -1;
    return 1;
  }

}