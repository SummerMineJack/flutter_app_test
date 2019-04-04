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

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  var normalValues = "Go to Second";

  void goToSceondActivity() {
    setState(() {
      Future future = Navigator.of(context).pushNamed("Second");
      //相当于Android的 onActivityResult方法
      future.then((values) {
        print(values);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(normalValues), onPressed: goToSceondActivity);
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
      body: Row(
        children: <Widget>[Results()],
      ),
    );
  }
}
