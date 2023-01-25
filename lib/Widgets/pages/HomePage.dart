import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/main.dart';

import '../states/PagesState.dart';

class HomePage extends StatefulWidget{
  MyHomePage home;
  @override
  State<StatefulWidget> createState()=> HomePageState();
  HomePage({required this.home});

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
    timer = Timer.periodic(Duration(seconds: 7), (timer) {
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
              Padding(
                padding: EdgeInsets.all(20),
                child: RaisedButton(
                onPressed: ()=>setState(()=>this.widget.home.cambiaStato(PagesState.NAIVE_BAESYAN)),
                color: Colors.red,
                shape: const RoundedRectangleBorder(
                    side:BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: const Text(
                    "Naive Baesyan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontStyle: FontStyle.italic
                    ),
                )

                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                      onPressed: ()=> setState(()=>this.widget.home.cambiaStato(PagesState.STANDARD_ANALISYS)),
                      color: Colors.red,
                      shape: const RoundedRectangleBorder(
                            side:BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child:const Text(
                          "Standard Queries",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontStyle: FontStyle.italic
                        ),
                      )

                      ),
                  ),
            ],
          ),

        ],
    );
  }

}

