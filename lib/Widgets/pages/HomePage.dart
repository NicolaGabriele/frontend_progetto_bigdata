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
              Padding(
                padding: EdgeInsets.all(20),
                child: RaisedButton(
                    onPressed: ()=>{Navigator.push(
                        context, MaterialPageRoute(builder: (context)=> ReviewsAutoClassificator())
                    )},
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
                      onPressed: ()=>{Navigator.push(
                        context, MaterialPageRoute(builder: (context)=> QueriesPage())
                      )},
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

