import 'package:flutter/material.dart';
import 'Routes.dart';
import 'dart:math';
import 'package:flutter_earth/flutter_earth.dart';

class Earth extends StatefulWidget {
  @override
  _EarthState createState() => _EarthState();
}

class _EarthState extends State<Earth> {
  FlutterEarthController _controller;
  double _zoom = 0;
  LatLon _position = LatLon(0, 0);

  void _onMapCreated(FlutterEarthController controller) {
    _controller = controller;
  }

//
//  void _moveToNextCity(double lat,double lon) {
//      _controller.animateCamera(newLatLon: LatLon(lat, lon).inRadians(), riseZoom: 2.2, fallZoom: 11.2, panSpeed: 500, riseSpeed: 3, fallSpeed: 2);
//    }
//  }

  void _search(double lat, double lon) {
    _controller.animateCamera(
        newLatLon: LatLon(lat, lon).inRadians(),
        riseZoom: 2.2,
        fallZoom: 9,
        panSpeed: 500,
        riseSpeed: 3,
        fallSpeed: 2);
  }

  void _onCameraMove(LatLon latLon, double zoom) {
    setState(() {
      _zoom = zoom;
      _position = latLon.inDegrees();
    });
  }

  TextEditingController latx = TextEditingController();
  TextEditingController longx = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return Stack(
      children: <Widget>[
        Container(
          color: Colors.black54,
        ),
        Center(
          child: FlutterEarth(
            onCameraMove: _onCameraMove,
            onMapCreated: _onMapCreated,
            url: 'http://mt0.google.com/vt/lyrs=y&hl=en&x={x}&y={y}&z={z}',
            radius: 180,
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black54),
          height: height * 0.2,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.deepOrange)),
                        padding: EdgeInsets.all(8),
                        width: width / 2.2,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(labelText: "Longitude"),
                          controller: latx,
                        )),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.deepOrange)),
                        padding: EdgeInsets.all(8),
                        width: width / 2.2,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(labelText: "Longitude"),
                          controller: longx,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Find Location",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    width: width,
                    height: 40,
                  ),
                  color: Colors.deepOrange,
                  onPressed: () => _search(
                    double.parse(latx.text),
                    double.parse(longx.text),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Prev Page")),
              ],
            )),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Align(alignment: Alignment.centerRight,
                child: Text(
                    'lat:${_position.latitude.toStringAsFixed(2)} lon:${_position.longitude.toStringAsFixed(2)} zoom:${_zoom.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15),
                  ),
              ),
            ),

          ],
        ),
      ],
    );
  }
}
