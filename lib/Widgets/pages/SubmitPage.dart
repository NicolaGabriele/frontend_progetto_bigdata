import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Widgets/forms/AverageScoreForm.dart';
import 'package:frontend_progetto_bigdata/Widgets/forms/CoppieHotelRevForm.dart';
import 'package:frontend_progetto_bigdata/Widgets/forms/GeoDataByNationForm.dart';
import 'package:frontend_progetto_bigdata/Widgets/forms/RecensioniDallaDataForm.dart';
import 'package:frontend_progetto_bigdata/Widgets/forms/TimeScoreForm.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/VisualizzationPage.dart';
import 'package:frontend_progetto_bigdata/Widgets/forms/WordCountForm.dart';

import '../forms/WordCountForm.dart';
class SubmitPage extends StatefulWidget{

  VisualizzationPage visualizzation;
  SubmitPage({required this.visualizzation});
  @override
  State<StatefulWidget> createState()=>_SubmitPageState();

}

class _SubmitPageState extends State<SubmitPage>{

   static Map<String,Form> visualMapping = {
     'select query': Form.NO_SELECTED,
    'negative reviews word count':Form.WORD_COUNT_NEGATIVE,
    'positive reviews word count': Form.WORD_COUNT_POSITIVE,
     'recensioni hotel':Form.RECENSIONI_HOTEL,
     'Get Hotels in Nation':Form.HOTEL_IN_NATION,
     'Average Score Filter':Form.AVERAGE_SCORE_FILTER,
     'Time Score Evolution':Form.TIME_SCORE_EVOLUTION,
     'Coppie Hotel-Recensioni':Form.HOTEL_REVIEW,
  };

  String dropdownvalue = visualMapping.keys.first;
  Form _form = Form.NO_SELECTED;
  Widget _formWidget = Container();

  @override
  Widget build(BuildContext context) {
    //TODO
    return Container(
      child: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Image.asset("/images/submit.jpg"),
          ),
          buildForm()
        ],
      )
    );
  }

  Widget buildForm(){
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 50, top: 30),
            child: DecoratedBox(
             decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red.shade50,
              ),
              child: DropdownButton(
                  value: dropdownvalue,
                  items: visualMapping.keys.map((e) => DropdownMenuItem<String>(value: e,child: Text(e,textAlign: TextAlign.center))).toList(),
                  onChanged: (String? value)=>setState(()=>{
                    dropdownvalue=value!,
                    _form = visualMapping[value] as Form,
                    setForm()
                  }),
                  dropdownColor: Colors.red.shade50,
                  underline: Container(height: 2,color: Colors.red.shade700,),
                ),
            )
        ),
        _formWidget,

      ],
    );
  }

  List<DropdownMenuItem<String>> buildItems(){
      return visualMapping.keys.map((e) => DropdownMenuItem<String>(value: e,child: Text(e))).toList();
  }

  void setForm(){
    switch(_form){
      case Form.RECENSIONI_HOTEL: _formWidget = RecensioniDallaDataForm(visualizzation: widget.visualizzation);break;
      case Form.WORD_COUNT_POSITIVE: _formWidget = WordCountForm(visualizzation: widget.visualizzation, form: this._form);break;
      case Form.WORD_COUNT_NEGATIVE: _formWidget = WordCountForm(visualizzation: widget.visualizzation, form: this._form);break;
      case Form.HOTEL_IN_NATION: _formWidget = GeoDataByNationForm(visualizzation: widget.visualizzation, form: this._form);break;
      case Form.AVERAGE_SCORE_FILTER: _formWidget = AverageScoreForm(visualizzation: widget.visualizzation);break;
      case Form.TIME_SCORE_EVOLUTION: _formWidget = TimeScoreForm(visualizzation: widget.visualizzation);break;
      case Form.HOTEL_REVIEW: _formWidget = CoppieHotelRevForm(visualizzation: widget.visualizzation, form: this._form);break;
      default: _formWidget=Container();break;
    }
  }



}

enum Form{
  NO_SELECTED,
  WORD_COUNT_NEGATIVE,
  WORD_COUNT_POSITIVE,
  RECENSIONI_HOTEL,
  HOTEL_IN_NATION,
  AVERAGE_SCORE_FILTER,
  TIME_SCORE_EVOLUTION,
  HOTEL_REVIEW,
}