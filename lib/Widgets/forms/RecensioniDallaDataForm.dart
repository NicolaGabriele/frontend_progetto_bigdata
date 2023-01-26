import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/REST/Utility.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/VisualizzationPage.dart';

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
    '3 anni': 1000
  };


  String? _time = _timingMap.keys.first;
  String? _hotel = "nome hotel";
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
                child: TextField(
                  decoration: InputDecoration(
                      label: Text(_hotel!),
                      border: OutlineInputBorder(),
                  ),
                  onSubmitted: (value)=>_hotel = value,
                  onChanged: (value)=>_hotel = value,
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
                  child: Expanded(
                    child:DropdownButton(
                        value: _time,
                        items: _timingMap.keys.map((e) => DropdownMenuItem(value: e, child: Text(e,textAlign: TextAlign.center))).toList(),
                        onChanged: (String? value)=> setState(()=>_time = value)
                    )
                  )
              )
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

  void submitRecensioniDallaData() async{
    widget.visualizzation.setWidget(
          const SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          )

    );

    List<String> s = await Query.recensioniHotelDallaData(_hotel!, _timingMap[_time]!);
    List<Widget> l = [];
    s.forEach((element) {l.add(
        Padding(padding: EdgeInsets.only(top:20),child: Text(element)));
    });
    widget.visualizzation.setWidget(
      Container(
        width: 1000,
        height: 300,
        child: Scrollbar(
          controller: ScrollController(),
          scrollbarOrientation: ScrollbarOrientation.right,
          thumbVisibility: true,
          child: ListView(
            children: l,
          )
        ),
      )
    );
  }

}