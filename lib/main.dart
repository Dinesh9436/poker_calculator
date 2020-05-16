import 'package:flutter/material.dart';

import 'Screens/game.dart';


void main() => runApp(MyApp());

final key = new GlobalKey<MyHomePageState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poker Calculator',
      theme: ThemeData(
        fontFamily:'Righteous',
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(key: key,),
    );
  }
}
