import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourth Screen'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('go  back'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      )),
    );
  }
}
