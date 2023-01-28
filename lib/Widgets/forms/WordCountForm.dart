
import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Models/WordCountItem.dart';
import 'package:frontend_progetto_bigdata/REST/Query.dart';
import '../pages/SubmitPage.dart' as sub;
import '../pages/VisualizzationPage.dart';
import '../visualizzations/WordCountVisualizzation.dart';
class WordCountForm extends StatefulWidget{

  VisualizzationPage visualizzation;
  sub.Form form;
  WordCountForm({required this.visualizzation, required this.form});

  @override
  State<StatefulWidget> createState()=>_WordCountFormState();

}

class _WordCountFormState extends State<WordCountForm>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: ElevatedButton(
        onPressed: submit,
        child: Text("submit"),
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

    if(widget.form == sub.Form.WORD_COUNT_POSITIVE) {
      Query.wordCountPositive().then((value) => {
        widget.visualizzation.setWidget(
            WordCountVisualizzation(data:value)
        )
      });
    } else {
      Query.wordCountNegative().then((value) => {
        widget.visualizzation.setWidget(
            WordCountVisualizzation(data:value)
        )
      });
    }


  }
}