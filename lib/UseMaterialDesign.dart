import 'package:flutter/material.dart';

void main() {
  runApp(UserMaterialDesign());
}

class UserMaterialDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "使用MaterailDesign组件",
      theme: ThemeData(primaryColor: Colors.amberAccent),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: null,
            tooltip: "Navigation menu",
          ),
          title: Text(
            "使用MaterailDesign组件",
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search tip",
              onPressed: null,
            )
          ],
        ),
        body: Center(
          child: Text("Hello world"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          tooltip: "Add",
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
