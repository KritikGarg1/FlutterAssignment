import 'package:flutter/material.dart';
import 'Routes.dart';
import 'package:intl/intl.dart';
import 'mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:async';
import 'dart:convert';


final Mobx timer= Mobx();

class TimerPage extends StatefulWidget {

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {


  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return Column(
      children: <Widget>[
        Spacer(),
        Center(
          child: Container(alignment: Alignment.center,width: width/1.6,height:width/1.6,decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.deepPurple)),
            child: Observer(builder: (_)=> Text(
                '${timer.date}',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
            ),
          ),
        ),
        Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                child: Row(
              children: <Widget>[
                RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Prev Page")),
                Spacer(),
                RaisedButton(
                    onPressed: () {
                      Navigator.push(context, Page3());
                    },
                    child: Text("Next Page")),
              ],
            )),
          ),
        ),
      ],
    );
  }
}

void _getTime(){
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('   kk:mm:ss \n EEE d MMM').format(now);
  timer.update(formattedDate);
}