import 'package:flutter/material.dart';
import 'Page1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.redAccent,centerTitle: true,
          title: Text(" Counter",textAlign: TextAlign.center,),
        ),
        body: Counter(),
      )
    );
  }
}
