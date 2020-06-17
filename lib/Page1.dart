import 'package:flutter/material.dart';
import 'Routes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int num;

  @override
  void initState() {
    num = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  num.toString(),
                  style: TextStyle(fontSize: 65),
                ),
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  FlatButton(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    color: Colors.redAccent,
                    child: Text("-",
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                    onPressed: () {
                      if (num != 0) {
                        setState(() {
                          num--;
                        });
                      } else {
                        Fluttertoast.showToast(
                          msg: "Value cannot be negative",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                      }
                    },
                  ),
                  SizedBox(width: 10),
                  FlatButton(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    color: Colors.redAccent,
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        num++;
                      });
                    },
                  ),
                  Spacer(),
                ],
              )
            ],
          ),
        ),
        Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                    onPressed: () {
                      Navigator.push(context, Page2());
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
