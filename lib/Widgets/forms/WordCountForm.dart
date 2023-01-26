
import 'package:flutter/material.dart';

import '../pages/VisualizzationPage.dart';
import '../visualizzations/WordCountVisualizzation.dart';

class WordCountForm extends StatefulWidget{

  VisualizzationPage visualizzation;
  WordCountForm({required this.visualizzation});

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

  void submit(){
    widget.visualizzation.setWidget(WordCountVisualizzation());
  }
}