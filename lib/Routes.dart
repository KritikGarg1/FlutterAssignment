import 'package:flutter/material.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'Page4.dart';


class Page1 extends MaterialPageRoute<Null> {
  Page1() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.redAccent,
        title: Text(" Counter",textAlign: TextAlign.center,),
      ),
      body: Counter(),
    );
  }
  );
}


class Page2 extends MaterialPageRoute<Null> {
  Page2() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple,centerTitle: true,
        title: Text(" Counter",textAlign: TextAlign.center,),
      ),
      body: TimerPage(),
    );
  }
  );
}

class Page3 extends MaterialPageRoute<Null> {
  Page3() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,backgroundColor: Colors.teal,
        title: Text("  API List",textAlign: TextAlign.center,),
      ),
      body: ApiList(),
    );
  }
  );
}


class Page4 extends MaterialPageRoute<Null> {
  Page4() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,backgroundColor: Colors.deepOrange,
        title: Text("  Earth",textAlign: TextAlign.center,),
      ),
      body: Earth(),
    );
  }
  );
}