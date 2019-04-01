import 'package:flutter/material.dart';

void main() {
  runApp(RowColumnTest());
}

class RowColumnTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //垂直的布局
    Paint bg = Paint();
    bg.color = Color(0xFF3344FF);
    Widget columnWidget = Container(
      child: Column(
        children: <Widget>[
          Image.asset(
            "images/bg.jpg",
            width: 600,
            height: 240,
            fit: BoxFit.fill,
          ),
          Text(
            "垂直的图片详解",
            style: TextStyle(background: bg),
          ),
        ],
      ),
    );
    Column buildIconButton(IconData icon, String label) {
      Color textOrIconColor = Theme.of(context).primaryColor;
      return Column(
        children: <Widget>[
          Icon(
            icon,
            color: textOrIconColor,
          ),
          Text(
            label,
            style: TextStyle(color: textOrIconColor),
          )
        ],
      );
    }

    //自己实现标题栏
    Widget titileLayout = Container(
      color: Theme.of(context).primaryColorLight,
      child: Row(
        //在主轴方向进行居中【这里主轴的意思就是控件，如果是Row：那么就是水平居中，如果是Column:那么就是垂直居中】
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildIconButton(Icons.add, "add"),
          buildIconButton(Icons.add, "add"),
          buildIconButton(Icons.add, "add"),
        ],
      ),
    );

    //水平的布局 【其中 Expanded中flex为android 布局中的weight】权重
    Widget rowWidget = Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 20,
            child: Image.asset(
              "images/bg.jpg",
              width: 310,
              height: 240,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text("水平的图片详解"),
          ),
        ],
      ),
    );

    //在build方法中需要一个总体返回view的方法，return materialapp app的页面。
    //然后设置标题和主题后，设置body，我们想在如果body的控件很多甚至超过了
    //一个页面，在Android java中，使用了ScrollView嵌套外层就可以做出同样的效果
    //flutter 就需要SingleChildScrollView
    return MaterialApp(
      title: "垂直水平练习",
      theme: ThemeData(primaryColor: Colors.amberAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text("垂直水平练习"),
        ),
        body: Column(
          children: <Widget>[titileLayout, titileLayout],
        ),
      ),
    );
  }
}
