import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/HomePage.dart';

import 'Widgets/pages/HomePage.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Reviews Analitycs',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Hotel Reviews Analitycs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Row(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle
                    ) ,
                    child: Image.asset("images/logo.jpg")
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 50,
                        fontStyle: FontStyle.italic
                    ),
                  )
                ],
              )
          ), //aggiungere bellezze
        ),
        body: HomePage(),
        bottomNavigationBar: BottomAppBar(color: Colors.red, elevation: 10,child: Container(height: 25,),),
      );
  }



}
