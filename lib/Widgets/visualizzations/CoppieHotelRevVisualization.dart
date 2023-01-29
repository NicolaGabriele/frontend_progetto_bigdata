import 'package:flutter/material.dart';

import '../../Models/CoppiaHotelNumRecensioni.dart';

class CoppieHotelRevVisualization extends StatefulWidget{

  List<CoppiaHotelNumRecensioni> coppia = [];
  List<CoppiaHotelNumRecensioni> coppia2 = [];


  CoppieHotelRevVisualization({required this.coppia, required this.coppia2});

  @override
  State<StatefulWidget> createState()=>_CoppieHotelRevState(coppiePos: coppia, coppieNeg: coppia2);

}//CoppieHotelRevVisualization

class _CoppieHotelRevState extends State<CoppieHotelRevVisualization> {

  List<CoppiaHotelNumRecensioni> coppiePos;
  List<CoppiaHotelNumRecensioni> coppieNeg;

  _CoppieHotelRevState({required this.coppiePos, required this.coppieNeg});

  List<String> _hotels = [];
  List<int> _recensioniPos  = [];
  List<int> _recensioniNeg  = [];


  @override
  void initState() {
    coppiePos.forEach((element) {
      _hotels.add(element.getHotel());
      _recensioniPos.add(element.getNumRecensioni());
    });
    coppieNeg.forEach((element) {_recensioniNeg.add(element.getNumRecensioni());});
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        reverse: false,
        itemCount: _hotels.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white38,
            ),
            child: ListTile(
              title: Text(
                _hotels.reversed.toList()[index],
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              leading: Icon(Icons.hotel, size: 20),
              trailing: SizedBox.fromSize(
                size: Size(111, 111),
                child: ClipRRect(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {},
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.thumb_up,color: Colors.green), // <-- Icon
                              Text(_recensioniPos.reversed.toList()[index].toString()), // <-- Text
                            ],
                          ),
                          SizedBox(width: 30),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.thumb_down,color: Colors.redAccent), // <-- Icon
                              Text(_recensioniNeg.reversed.toList()[index].toString()), // <-- Text
                            ],
                          ),
                        ],
                    ),
                  ),
                ),
              )
              ),
              ),
            );
        },
      )
    );//Container
  }//build


}//_CoppieHotelRevState