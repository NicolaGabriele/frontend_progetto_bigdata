import 'package:flutter/material.dart';

class RecensioniDallaDataVisualization extends StatefulWidget{

  List<String> recensioni = [];
  RecensioniDallaDataVisualization({required this.recensioni});

  @override
  State<StatefulWidget> createState()=>_RecensioniDallaDataState(reviews: recensioni);

}//RecensioniDallaDataVisualization

class _RecensioniDallaDataState extends State<RecensioniDallaDataVisualization> {

  List<String> reviews;

  _RecensioniDallaDataState({required this.reviews});

  List<String> _reviews = [];

  @override
  void initState() {
    reviews.forEach((element) {
      print(element);
      _reviews.add(element);
    });
  }//initState

  @override
  Widget build(BuildContext context){
    return Container(
        child: ListView.builder(
          reverse: false,
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.blueGrey),
                ),
                color: Colors.white,
              ),
              child: ListTile(
                title: Text(
                  reviews.reversed.toList()[index],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                leading: Icon(Icons.reviews, size: 20,),
              ),
            );
          },
        )
    );//Container
  }//build

}//_RecensioniDallaDataState