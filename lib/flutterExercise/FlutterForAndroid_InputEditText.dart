import 'package:flutter/material.dart';


class FlutterForAndroidInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "在Flutter中使用hint",
      theme: ThemeData(primaryColor: Colors.amberAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text("在Flutter中使用hint"),
          centerTitle: true,
        ),
        body:InputFieldFlutter(),
      ),
    );
  }
}

class InputFieldFlutter extends StatefulWidget {
  @override
  _InputFieldFlutterState createState() => _InputFieldFlutterState();
}

class _InputFieldFlutterState extends State<InputFieldFlutter> {
  String _errorText;

  String get errorText => _errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (String text) {
        setState(() {
          if (!isEmail(text)) {
            _errorText = "This is not email address";
          } else {
            _errorText = null;
          }
        });
      },
      decoration: InputDecoration(
          hintText: "please input you phone number ", errorText: errorText),
    );
  }

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(emailRegexp);
    return regExp.hasMatch(em);
  }
}
