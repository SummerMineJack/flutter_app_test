import 'package:flutter/material.dart';

void main() {
  runApp(FlutterForAndroidLayouts());
}

class FlutterForAndroidLayouts extends StatefulWidget {
  @override
  _FlutterForAndroidLayoutsState createState() =>
      _FlutterForAndroidLayoutsState();
}

class _FlutterForAndroidLayoutsState extends State<FlutterForAndroidLayouts> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter中的布局",
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter中的布局"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Row1",
              style: TextStyle(color: Colors.deepOrange),
            ),
            Text(
              "Row2",
              style: TextStyle(color: Colors.amberAccent),
            ),
            Text(
              "Row3",
              style: TextStyle(color: Colors.amber),
            ),
            Text(
              "Row4",
              style: TextStyle(color: Colors.lightGreen),
            ),
            Text(
              "Row5",
              style: TextStyle(color: Colors.black54),
            ),
            Text(
              "Row6",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
