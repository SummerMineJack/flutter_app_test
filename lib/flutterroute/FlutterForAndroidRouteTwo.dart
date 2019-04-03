import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('go to FourthScreen'),
            onPressed: () {
              Navigator.of(context).pushNamed("Fourth");
            },
          ),
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
