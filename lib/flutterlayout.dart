import 'package:flutter/material.dart';

void main() {
  runApp(FlutterLayout());
}

//学习Flutter 布局结构
class FlutterLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //新建一个文本内容版本布局
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "OSChina 周一乱弹 —— 可乐进化史",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "https://my.oschina.net/xxiaobian/blog/3027132",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ],
          )),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text("41"),
        ],
      ),
    );

    //封装一个图标的公共方法
    Column buildButton(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      );
    }

    //中间图标布局
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButton(Icons.call, "CALL"),
          buildButton(Icons.near_me, "ROUTE"),
          buildButton(Icons.share, "SHARE")
        ],
      ),
    );

    //编写超长文本内容块
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        "近日，佛山三水一外卖小哥何某驾驶电动自行车闯红灯，此时，前方一辆停在路边的轿车车门突然打开，何某闪避不及，直接撞上车门，经多日抢救无效，不幸身亡。近日，公安交警部门认定，轿车女司机叶某承担此事故的主要责任，何某承担此事故的次要责任。#都有责任 没错。#",
        softWrap: true,
      ),
    );

    //每一个build方法中只返回一个view，在这个view这种，可以将前面所编写的布局进行顺序添加到body里面，
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter 布局例子",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter 布局例子"),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(
              "images/bg.jpg",
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }
}
