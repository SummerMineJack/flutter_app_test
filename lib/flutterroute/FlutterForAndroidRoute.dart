import 'package:flutter/material.dart';

import 'FlutterForAndroidRouteOne.dart';
import 'FlutterForAndroidRouteThree.dart';
import 'FlutterForAndroidRouteTwo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      home: FirstScreen(),
      routes: <String, WidgetBuilder>{
        "Second": (BuildContext context) => SecondPage(),
        "Third": (BuildContext context) => ThirdPage(),
        "Fourth": (BuildContext context) => FourthPage(),
      },
    );
  }
}

// demo1_navigation.dart
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('go to Second Screen'),
          onPressed: () {
            Navigator.of(context).pushNamed("Second");
          },
        ),
      ),
    );
  }
}
