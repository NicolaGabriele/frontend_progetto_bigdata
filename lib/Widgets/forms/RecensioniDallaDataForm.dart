import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/REST/Utility.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/VisualizzationPage.dart';
import 'package:frontend_progetto_bigdata/Widgets/visualizzations/RecensioniDallaDataVisualization.dart';

import '../../REST/Query.dart';

class RecensioniDallaDataForm extends StatefulWidget{
  _RecensDallaDataState state = _RecensDallaDataState();
  VisualizzationPage visualizzation;
  RecensioniDallaDataForm({required this.visualizzation});
  @override
  State<StatefulWidget> createState()=>state;
  String? getHotel(){
    state._hotel;
  }
  int? getDays(){
    state._time;
  }

}

class _RecensDallaDataState extends State<RecensioniDallaDataForm>{
  static final Map<String,int> _timingMap ={
    '7 giorni': 7,
    'un mese':30,
    '3 mesi': 90,
    '6 mesi':180,
    'un anno': 365,
    '3 anni': 1095
  };

  static const List<String> list = Utility.hotels;
  String? _time = _timingMap.keys.first;
  String? _hotel = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 50, top: 10),
              child:Container(
                width: 200,
                height: 50,
                color: Colors.red.shade50,
                child: Autocomplete<String>(
                  fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                    return TextField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      onEditingComplete: onFieldSubmitted,
                      onSubmitted: (value) => _hotel = value,
                      onChanged: (value) => _hotel = value,
                      decoration: const InputDecoration(
                        label: Text("Nome hotel:"),
                        border: OutlineInputBorder(),
                      ),
                    );
                  },
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    return list.where((String option) {
                      return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (value) => _hotel = value,
                ),
              ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 50, top: 10),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red.shade50,
                  ),
                  child:DropdownButton(
                        value: _time,
                        items: _timingMap.keys.map((e) => DropdownMenuItem(value: e, child: Text(e,textAlign: TextAlign.center))).toList(),
                        onChanged: (String? value)=> setState(()=>_time = value)
                    )
              )
          ),
          Padding(
            padding: EdgeInsets.only(left: 50,top: 10),
            child: Text("*Data di riferimento: 8/3/2017",style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50,top: 10),
            child: ElevatedButton(
                onPressed: submitRecensioniDallaData,//()=>{/*TODO*/},
                child: Text('submit',textAlign: TextAlign.center)
            ),
          )
        ],
      ),
    );
  }

  void submitRecensioniDallaData() async {
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

    Query.recensioniHotelDallaData(_hotel!, _timingMap[_time]!).then((value) =>
    {
      if (value.length==0){
        widget.visualizzation.setWidget(new AlertDialog(
          title: Text("Non abbiamo dati a disposizione riguardo questo hotel nella data specificata", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
        )
        ),
      }
      else
        {
          widget.visualizzation.setWidget(
              RecensioniDallaDataVisualization(recensioni: value)
          )
        }
    });
  }

}