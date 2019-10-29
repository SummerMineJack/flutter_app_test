import 'package:flutter/material.dart';

import 'FlutterForAndroidRouteOne.dart';
import 'FlutterForAndroidRouteThree.dart';
import 'FlutterForAndroidRouteTwo.dart';

class FlutterRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    Future future = Navigator.of(context).pushNamed("Second");
    //相当于Android的 onActivityResult方法
    future.then((values) {
      setState(() {
        normalValues = values;
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
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[Results()],
      ),
    );
  }
}
