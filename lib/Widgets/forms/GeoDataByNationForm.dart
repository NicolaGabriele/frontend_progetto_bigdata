
import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Models/GeoData.dart';
import 'package:frontend_progetto_bigdata/REST/Utility.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/SubmitPage.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/VisualizzationPage.dart';
import 'package:frontend_progetto_bigdata/Widgets/visualizzations/GeoDataHotelsInNation.dart';
import '../pages/SubmitPage.dart' as sub;
import '../../REST/Query.dart';

class GeoDataByNationForm extends StatefulWidget{

  _GeoDataState state = _GeoDataState();
  VisualizzationPage visualizzation;
  sub.Form form;
  GeoDataByNationForm({required this.visualizzation, required this.form});

  @override
  State<StatefulWidget> createState() => state;

  String? getNation(){
    state._nation;
  }

}//GeoDataByNationForm

class _GeoDataState extends State<GeoDataByNationForm> {

  //String? _nation = "nome nazione";

  static const List<String> list = Utility.nations;
  String _nation = list.first;

  @override
  Widget build(BuildContext buildContext){
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10),
            child: Container(
              width: 200,
              height: 50,
              color: Colors.red.shade50,
              child: new DropdownButton<String>(
                value: _nation,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.deepOrange,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    _nation = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50,top: 10),
            child: ElevatedButton(
                onPressed: submitHotelDallaNazione,//()=>{/*TOD]O*/}
                child: Text('submit',textAlign: TextAlign.center),
            ),
          )
        ],
      ),
    );
  }//build

  void submitHotelDallaNazione() async{
    //print(_nation);

    widget.visualizzation.setWidget(
      const SizedBox(
        width: 62,
        height: 62,
        child: CircularProgressIndicator(backgroundColor: Colors.red, color: Colors.white),
      )
    );

    Query.geoDataHotelsInNation(_nation).then((value) => {
      widget.visualizzation.setWidget(
        GeoDataHotelsInNation(coordinate: value)
      )
    });

  }//submitHotelDallaNazione


}//_GeoDataState