import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('go to ThirdScreen'),
            onPressed: () {
              Navigator.of(context).pushNamed("Third");
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
