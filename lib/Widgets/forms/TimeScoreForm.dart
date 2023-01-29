
import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/REST/Utility.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/VisualizzationPage.dart';
import 'package:frontend_progetto_bigdata/Widgets/visualizzations/TimeScoreVisualization.dart';
import 'package:frontend_progetto_bigdata/models/TimeScoreItem.dart';

import '../../REST/Query.dart';


class TimeScoreForm extends StatefulWidget {

  _TimeScoreState state = _TimeScoreState();
  VisualizzationPage visualizzation; //visualizzazione richiesta

  TimeScoreForm({required this.visualizzation});

  @override
  State<StatefulWidget> createState()=>state;

  String? getHotel(){
    state._hotel;
  }


}


class _TimeScoreState extends State<TimeScoreForm> {

  String? _hotel = "Nome hotel:";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10),
            child: Container(
              width: 200,
              height: 50,
              color: Colors.red.shade50,
              child: TextField(
                decoration: InputDecoration(
                  label: Text(_hotel!),
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) => _hotel = value,
                onChanged: (value) => _hotel = value,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, top: 10),
            child: ElevatedButton(
                onPressed: submitTimeScoreEvolution, //()=>{/*TODO*/},
                child: Text('submit', textAlign: TextAlign.center)
            ),
          )
        ],
      ),
    );
  }

  void submitTimeScoreEvolution() async {
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
    Query.timeScoreEvolution( _hotel! ).then(
            (value) => widget.visualizzation.setWidget( TimeScoreVisualization(input: value,)
        )
    );

  }

}