
import 'package:flutter/material.dart';

import '../../REST/Query.dart';
import '../../REST/Utility.dart';
import '../pages/VisualizzationPage.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/SubmitPage.dart';
import '../pages/SubmitPage.dart' as sub;
import '../visualizzations/GeoDataHotelsInNation.dart';

class AllFiltersForm extends StatefulWidget{

  _AllFiltersFormState state = _AllFiltersFormState();
  VisualizzationPage visualizzation;
  sub.Form form;
  AllFiltersForm({required this.visualizzation, required this.form});

  @override
  State<StatefulWidget> createState() => state;

  String? getNation(){
    state._nation;
  }

}

class _AllFiltersFormState extends State<AllFiltersForm> {

  static const List<String> list = Utility.nations;

  String? _nation;
  String? _score;
  String? _num;

  @override
  Widget build(BuildContext buildContext){
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
                    onSubmitted: (value) => _nation = value,
                    onChanged: (value) => _nation = value,
                    decoration: const InputDecoration(
                      label: Text("Nome nazione: "),
                      border: OutlineInputBorder(),
                    ),
                  );
                },
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return list.where((String option) {
                    return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (value) => _nation = value,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 50, top: 10),
              child: Container(
                    width: 200,
                    height: 50,
                    color: Colors.red.shade50,
                    child: TextField(
                        decoration: InputDecoration(
                            label: Text("Punteggio minimo: "),
                            border: OutlineInputBorder(),
                        ),
                        onSubmitted: (value) => _score = value,
                        onChanged: (value) => _score = value,
                    ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10),
            child: Container(
              width: 200,
              height: 50,
              color: Colors.red.shade50,
              child: TextField(
                decoration: InputDecoration(
                  label: Text("Numero minimo recensioni: "),
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) => _num = value,
                onChanged: (value) => _num = value,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50,top: 10),
            child: ElevatedButton(
                onPressed: submitAllFilters,//()=>{/*TODO*/},
                child: Text('submit',textAlign: TextAlign.center)
            ),
          )
        ],
      ),
    );
  }

  void submitAllFilters() async{
    //print(_nation);

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

    if (_nation == null || _nation == "") _nation = "all";
    if (_score == null || _score == "") _score = "all";
    if (_num == null || _num == "") _nation = "all";

    debugPrint(_nation);
    debugPrint(_score);
    debugPrint(_num);

    Query.allFilters(_nation!,_score!,_num!).then((value) => {
      widget.visualizzation.setWidget(
          GeoDataHotelsInNation(coordinate: value)
      )
    });

  }//submitHotelDallaNazione


}//_GeoDataState