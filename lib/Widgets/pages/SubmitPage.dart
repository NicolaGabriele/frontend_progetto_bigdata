import 'package:flutter/material.dart';

class SubmitPage extends StatefulWidget{

  static const List<String> list = ["Italy","France","United Kindom"];
  @override
  State<StatefulWidget> createState()=>_SubmitPageState();

}

class _SubmitPageState extends State<SubmitPage>{

  Map<String,Form> visualMapping = {
    'negative reviews word count':Form.WORD_COUNT_NEGATIVE,
    'positive reviews word count': Form.WORD_COUNT_POSITIVE
  };
  Form? _form = Form.WORD_COUNT_POSITIVE;
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
                items: buildItems(),
                onChanged: (String? value)=>setState(()=>_form = visualMapping[value]),
                dropdownColor: Colors.red.shade50,
                underline: Container(height: 2,color: Colors.red.shade700,),
              ),
            )
        ),
        //mettere form
        Container(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
              onPressed: ()=>{},
              child: Text('submit')
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> buildItems(){
      return visualMapping.keys.map((e) => DropdownMenuItem<String>(value: e,child: Text(e))).toList();
  }


}

enum Form{
  WORD_COUNT_NEGATIVE,
  WORD_COUNT_POSITIVE
}