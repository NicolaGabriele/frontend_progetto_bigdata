import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/QueriesPage.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/ReviewsAutoClassificator.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> HomePageState();
}

class HomePageState extends State<HomePage>{

  late final Timer timer;
  final values = [
    Image.asset("/images/im1.jpg", fit: BoxFit.fitWidth,width: double.infinity, height: double.infinity,),
    Image.asset("/images/im2.jpg",  fit: BoxFit.fitWidth,width: double.infinity, height: double.infinity)];
  int _index = 0;
  @override
  void initState(){
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() => _index = 1-_index);
    });
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 7),
              child: values[_index],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: naiveBayesianButton()
                  ),
              ),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: standardQueriesButton()
                  ),
              )
            ],
          ),

        ],
    );
  }

  Widget naiveBayesianButton(){
    return ElevatedButton(
        onPressed: ()=>{Navigator.push(
            context, MaterialPageRoute(builder: (context)=> ReviewsAutoClassificator())
        )},
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
          shape: MaterialStateProperty.resolveWith((states) => const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            side: BorderSide(color: Colors.black, width: 1)
          ))
        ),
        child: const Text(
          "Naive Bayesian",
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontStyle: FontStyle.italic
          ),
        ),
    );
  }

  Widget standardQueriesButton(){
    return ElevatedButton(
      onPressed: ()=>{Navigator.push(
          context, MaterialPageRoute(builder: (context)=> QueriesPage())
      )},
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
          shape: MaterialStateProperty.resolveWith((states) => const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              side: BorderSide(color: Colors.black, width: 1)
          ))
      ),
      child: const Text(
        "Standard Queries",
        style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontStyle: FontStyle.italic
        ),
      )
    );
  }
}

