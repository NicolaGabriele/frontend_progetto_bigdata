import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Models/ReviewsNumberItem.dart';
import 'package:frontend_progetto_bigdata/REST/Query.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() async{
    List<ReviewsNumberItem> l = await Query.reviewsNumberFilter(10);
    print(l);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
                onPressed: ()=>Query.wordCountNegative().then((value) => print(value)),
                child: Text("wordCountNeg"),
            ),
            RaisedButton(
                onPressed: ()=>Query.wordCountPositive().then((value) => print(value)),
              child: Text("wordCountPos"),
            )
          ],
        ),
      )
    );
  }
}
