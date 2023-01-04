import 'package:flutter/material.dart';
import 'package:frontend_progetto_bigdata/Models/ReviewsNumberItem.dart';
import 'package:frontend_progetto_bigdata/REST/Query.dart';
import 'package:frontend_progetto_bigdata/Widgets/States/HomePageState.dart';
import 'package:frontend_progetto_bigdata/Widgets/Pages/SubmitPage.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/QueriesPage.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/ReviewsAutoClassificator.dart';
import 'package:frontend_progetto_bigdata/Widgets/pages/VisualizzationPage.dart';



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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hotel Reviews Analitycs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  static HomePageState state = HomePageState.Query;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child:Scaffold(
        appBar: AppBar(
          title: Center(
            child:Text(widget.title,
              style: const TextStyle(
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  shadows: [Shadow(color: Colors.black, offset: Offset(1, 4), blurRadius: 1),
                    Shadow(color: Colors.blue, offset: Offset(2, 1), blurRadius: 2)]
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          bottom: getBottom(),
        ),
        body: TabBarView(children: [QueriesPage(),QueriesPage(), ReviewsAutoClassificator()],),
      ),
    );
  }

  PreferredSizeWidget getBottom(){
    return const TabBar(
      tabs:[
        Tab(text: "Albergatori",icon: Icon(Icons.hotel),),
        Tab(text: "Viaggiatori",icon: Icon(Icons.travel_explore),),
        Tab(text: "Automatic Reviews Classificator",icon: Icon(Icons.auto_mode),)
      ],
    );
  }

}
