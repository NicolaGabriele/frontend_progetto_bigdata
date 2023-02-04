

import 'package:flutter/material.dart';

import '../../REST/Query.dart';
import '../pages/VisualizzationPage.dart';
import '../visualizzations/DemandingClientsVisualization.dart';
import '../pages/SubmitPage.dart' as sub;


class DemandingClientsForm extends StatefulWidget {

  _DemandingClientsState state = _DemandingClientsState();
  VisualizzationPage visualizzation;
  sub.Form form;
  DemandingClientsForm({required this.visualizzation, required this.form});

  @override
  State<StatefulWidget> createState() => state;

}//CoppieHotelRevForm

class _DemandingClientsState extends State<DemandingClientsForm> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40, top: 20),
      child: ElevatedButton(
        onPressed: submit,
        child: Text("submit"),
      ),
    );
  }//build

  void submit() async{
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

    Query.demandingClients().then((value) => {
      widget.visualizzation.setWidget(
          DemandingClientsVisualization(input: value)
      )
      });
  }//submit

}