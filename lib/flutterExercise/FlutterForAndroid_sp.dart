import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlutterForAndroidSp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter中SP的使用",
      theme: ThemeData(
          primaryColor: Colors.lightGreen,
          textSelectionColor: Colors.deepOrangeAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter中SP的使用"),
          centerTitle: true,
        ),
        body: Center(
          child: FlutterForAndroidSPValues(),
        ),
      ),
    );
  }
}

class FlutterForAndroidSPValues extends StatefulWidget {
  @override
  _FlutterForAndroidSPValuesState createState() =>
      _FlutterForAndroidSPValuesState();
}

class _FlutterForAndroidSPValuesState extends State<FlutterForAndroidSPValues> {
  String _defaultValues = "";

  //存储SP值
  void insertSpValues() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("EnterApp", "1");
  }

  //取出SP值
  void getSpValues() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String enterApp = sharedPreferences.get("EnterApp");
    setState(() {
      _defaultValues = enterApp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("存储SP值"),
          onPressed: insertSpValues,
        ),
        RaisedButton(
          child: Text(_defaultValues.trim().isEmpty ? "取出SP值" : _defaultValues),
          onPressed: getSpValues,
        ),
      ],
    );
  }
}
