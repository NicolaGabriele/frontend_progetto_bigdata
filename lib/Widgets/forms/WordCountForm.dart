import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Models/WordCountItem.dart';
import 'package:frontend_progetto_bigdata/REST/Query.dart';
import '../pages/SubmitPage.dart' as sub;
import '../pages/VisualizzationPage.dart';
import '../visualizzations/WordCountVisualizzation.dart';
import '../../REST/Utility.dart';


class WordCountForm extends StatefulWidget{

  VisualizzationPage visualizzation;
  sub.Form form;
  WordCountForm({required this.visualizzation, required this.form});

  @override
  State<StatefulWidget> createState()=>_WordCountFormState();

}

class _WordCountFormState extends State<WordCountForm>{

  static const List<String> list = Utility.hotels;
  String? _hotel;

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
              child: Autocomplete<String>(
                fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                  return TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    onEditingComplete: onFieldSubmitted,
                    onSubmitted: (value) => _hotel = value,
                    onChanged: (value) => _hotel = value,
                    decoration: const InputDecoration(
                      label: Text("Nome hotel: "),
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
            padding: EdgeInsets.only(left: 50, top: 10),
            child: ElevatedButton(
                onPressed: submit, //()=>{/*TODO*/},
                child: Text('submit', textAlign: TextAlign.center)
            ),
          )
        ],
      ),
    );
  }


  void submit() {
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

    if (_hotel == null || _hotel == "") _hotel = "all";

    debugPrint(_hotel);

    if(widget.form == sub.Form.WORD_COUNT_POSITIVE) {
      Query.wordCountPositive(_hotel!).then((value) => {
        widget.visualizzation.setWidget(
            WordCountVisualizzation(data:value)
        )
      });
    } else {
      Query.wordCountNegative(_hotel!).then((value) => {
        widget.visualizzation.setWidget(
            WordCountVisualizzation(data:value)
        )
      });
    }


  }
}