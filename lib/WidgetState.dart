import 'package:flutter/material.dart';

void main() {
  runApp(WidgetStatesClass());
}

class WidgetStatesClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.redAccent),
      title: "Flutter box demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter box demo"),
        ),
        body: Scaffold(
          body: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TapBoxA(),
              ),
              Expanded(
                flex: 1,
                child: TapBoxA(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TapBoxA extends StatefulWidget {
  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _onTaps() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTaps,
      child: Container(
        margin: EdgeInsets.all(12),
        child: Center(
          child: Text(
            _active ? "Active boxa" : "Inactive boxa",
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ),
        ),
        width: 100,
        height: 100,
        decoration:
            BoxDecoration(color: _active ? Colors.lightGreen : Colors.grey),
      ),
    );
  }
}
