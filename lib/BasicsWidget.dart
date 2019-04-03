import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "学习Flutter App widget",
    home: MyScaffold(),
  ));
}

//显示body内容【包含appbar】
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              "Example Title",
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Center(
              child: Text("Hello world"),
            ),
          )
        ],
      ),
    );
  }
}

//自定义AppBar
class MyAppBar extends StatelessWidget {
  final Widget title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.redAccent,
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Navigation menu",
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: null,
          )
        ],
      ),
    );
  }
}
