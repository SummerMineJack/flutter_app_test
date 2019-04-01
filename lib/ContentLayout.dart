import 'package:flutter/material.dart';

void main() {
  runApp(ContentApp());
}

class ContentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Row buildStarts(IconData icon, double size) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.amberAccent,
                  size: size,
                ),
                Icon(
                  icon,
                  color: Colors.amberAccent,
                  size: size,
                ),
                Icon(
                  icon,
                  color: Colors.amberAccent,
                  size: size,
                ),
                Icon(
                  icon,
                  color: Colors.amberAccent,
                  size: size,
                ),
                Icon(
                  icon,
                  color: Colors.amberAccent,
                  size: size,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text("170Reviews"),
          )
        ],
      );
    }

    Row buildIconButton(IconData icon, String label, String label2) {
      Color textOrIconColor = Theme.of(context).primaryColor;
      return Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                icon,
                color: textOrIconColor,
              ),
              Text(
                label,
                style: TextStyle(color: textOrIconColor),
              ),
              Text(
                label2,
                style: TextStyle(color: textOrIconColor),
              )
            ],
          )
        ],
      );
    }

    //内容左边的布局
    Widget leftWidget = Container(
      child: Column(
        children: <Widget>[
          Text(
            "左边布局的标题",
            style: TextStyle(color: Colors.redAccent),
          ),
          Text(
            "左边布局的标题的内容左边布局的标题的内容左边"
                "布局的标题的内容左边布局的标题的内容",
            maxLines: 3,
          ),
          buildStarts(Icons.star, 15),
          buildIconButton(Icons.ac_unit, "a", "b"),
          buildIconButton(Icons.ac_unit, "a", "b"),
          buildIconButton(Icons.ac_unit, "a", "b"),
        ],
      ),
    );

    //右边的图片布局
    Widget imageAndTextContent = Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: leftWidget,
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
              "images/bg.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
    return MaterialApp(
      title: "图文并茂内容",
      theme: ThemeData(primaryColor: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: Text("图文并茂内容"),
        ),
        body: Column(
          children: <Widget>[imageAndTextContent],
        ),
      ),
    );
  }
}
