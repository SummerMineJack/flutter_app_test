import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ceshsi",
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          title: Text("测试是"),
        ),
        body: Row(
          children: <Widget>[
            Center(
              child: Contener(),
            )
          ],
        ),
      ),
    );
  }
}

class Contener extends StatefulWidget {
  @override
  _ContenerState createState() => _ContenerState();
}

class _ContenerState extends State<Contener> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If we changed _counter without calling
      // setState(), then the build method would not be called again,
      // and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed: _increment,
          child: Text("Increment"),
        ),
        Text("$_counter"),
      ],
    );
  }
}
