import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/REST/Utility.dart';

class RecensioniDallaDataForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_RecensDallaDataState();

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
  String? _nation = Utility.nations.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 50, top: 10),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red.shade50,
                  ),
                  child: Expanded(
                    child:DropdownButton(
                        value: _nation,
                        items: Utility.nations.map((e) => DropdownMenuItem(value: e, child: Text(e,textAlign: TextAlign.center))).toList(),
                        onChanged: (String? value)=> {setState(()=>{_nation = value})}
                    ),
                  )
              )
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
        ],
      ),
    );
  }
}