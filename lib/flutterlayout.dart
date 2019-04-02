import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
          Favorite()
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
          ShareWidget()
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

//自定义分享Widget并可交互
class ShareWidget extends StatefulWidget {
  @override
  _ShareWidgetState createState() => _ShareWidgetState();
}

class _ShareWidgetState extends State<ShareWidget> {
  bool _isClick = true;
  String textContent = "No Click";

  void _setIconTextChange() {
    Fluttertoast.showToast(
        msg: "This is Center short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 3,
        backgroundColor: Colors.red,
        textColor: Colors.black87);
   /* setState(() {

      *//*if (_isClick) {
        _isClick = false;
        textContent = "Clicked";
      } else {
        _isClick = true;
        textContent = "No Click";
      }*//*
    });*/
  }

  @override
  Widget build(BuildContext context) {
    //封装一个图标的公共方法
    Column buildButton(IconData icons, String label) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: Icon(icons),
              color: Colors.red,
              onPressed: _setIconTextChange),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              textContent,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      );
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[buildButton(Icons.share, "SHARE")],
      ),
    );
  }
}

//自定义有状态的widget需要两个类，一个是继承StatefulWidget类 ，一个是state类，用于改变状态
//自定义一个有状态的widget
class Favorite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteState();
  }
}

//收藏的自定义状态控件类
class _FavoriteState extends State<Favorite> {
  bool _isFavorite = true;
  int _favoriteCount = 41;

  //这里进行判断是否已经点击iconbutton
  void _toggleFavroite() {
    //使用setState方法进行通知UI框架，我这里 需要重新绘制uI
    setState(() {
      if (_isFavorite) {
        _favoriteCount -= 1;
        _isFavorite = false;
      } else {
        _favoriteCount += 1;
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
              icon: (_isFavorite ? Icon(Icons.star) : Icon(Icons.star_border)),
              color: Colors.red,
              onPressed: _toggleFavroite),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text("$_favoriteCount"),
          ),
        )
      ],
    );
  }
}
