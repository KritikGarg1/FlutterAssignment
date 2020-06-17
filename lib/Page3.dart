import 'package:flutter/material.dart';
import 'Routes.dart';
import 'model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ApiList extends StatefulWidget {
  @override
  _ApiListState createState() => _ApiListState();
}

class _ApiListState extends State<ApiList> {
  Future<List<User>> _fetch() async {
    var data = await http.get(
        "https://randomapi.com/api/6de6abfedb24f889e0b5f675edc50deb?fmt=raw&sole");

    var JSONdata = json.decode(data.body);
    List<User> users = [];
    for (var u in JSONdata) {
      User user = User(u["first"], u["last"], u["email"], u["address"],
          u["created"], u["balance"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: height * 0.12, left: 15, right: 10,top: 10),
          child: FutureBuilder(
            future: _fetch(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null)
                return Container(
                  child: Center(
                    child: Text("Loading...",style: TextStyle(fontSize: 25,color: Colors.teal),),
                  ),
                );
              else
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Column(
                              children: <Widget>[
                                ListTile(trailing: Column(crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data[i].amount,
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.w600,color: Colors.teal),
                                    ),
                                    Text(
                                      snapshot.data[i].date,
                                      style: TextStyle(
                                          fontSize: 12, fontWeight: FontWeight.w600,color: Colors.greenAccent),
                                    ),
                                  ],
                                ),subtitle: Text(
                                  snapshot.data[i].email,
                                  style: TextStyle(
                                      fontSize: 13, fontWeight: FontWeight.w400),
                                ),
                                  title: Text(
                                    snapshot.data[i].firstName+" "+snapshot.data[i].lastName,
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(height: 1,color: Colors.grey,width: width*0.9,)
                              ],
                            );
                          }),
                    ),
                  ],
                );
            },
          ),
        ),
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
                      Navigator.pop(context);
                    },
                    child: Text("Prev Page")),
                Spacer(),
                RaisedButton(
                    onPressed: () {
                      Navigator.push(context, Page4());
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
