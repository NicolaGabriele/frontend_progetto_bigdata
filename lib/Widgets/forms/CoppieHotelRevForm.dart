import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Models/GeoData.dart';
import 'package:frontend_progetto_bigdata/REST/Utility.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/SubmitPage.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/VisualizzationPage.dart';
import 'package:frontend_progetto_bigdata/Widgets/visualizzations/CoppieHotelRevVisualization.dart';
import 'package:frontend_progetto_bigdata/Widgets/visualizzations/GeoDataHotelsInNation.dart';
import '../pages/SubmitPage.dart' as sub;
import '../../REST/Query.dart';

class CoppieHotelRevForm extends StatefulWidget {

  _CoppieHotelRevState state = _CoppieHotelRevState();
  VisualizzationPage visualizzation;
  sub.Form form;
  CoppieHotelRevForm({required this.visualizzation, required this.form});

  @override
  State<StatefulWidget> createState() => state;

}//CoppieHotelRevForm

class _CoppieHotelRevState extends State<CoppieHotelRevForm> {

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

    Query.coppieHotel_PosReviews().then((value) => {
    Query.coppieHotel_NegReviews().then((value2) =>
    {widget.visualizzation.setWidget(
          CoppieHotelRevVisualization(coppia: value, coppia2: value2,)
      )
    })});


  }//submit

}//_CoppieHotelRevState