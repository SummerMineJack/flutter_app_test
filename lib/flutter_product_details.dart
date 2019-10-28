import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _homeWidgets(),
    );
  }

  ///构建第一部分
  Widget _headerImage() {
    return Image.asset(
      "images/bg.jpg",
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }

  ///实现按钮行
  Widget _buttonRow() {
    Color color = Theme.of(context).primaryColor;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _publicButton(color, Icons.call, "Call"),
          _publicButton(color, Icons.near_me, "Route"),
          _publicButton(color, Icons.share, "Share"),
        ],
      ),
    );
  }

  ///实现文本域
  Widget _textContent() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }

  ///按钮行的公共代码
  Widget _publicButton(Color color, IconData icon, String label) {
    return GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: color,
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      ),
      onTap: () {
        Fluttertoast.showToast(msg: label, toastLength: Toast.LENGTH_LONG);
      },
    );
  }

  ///构建第二部分
  Widget _contentTitle() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Oeschinen Lake Campground",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Kandersteg, Switzerland",
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );
  }

  ///构建body
  Widget _bodyContent() {
    return Container(
      child: Column(
        children: <Widget>[_headerImage(), _contentTitle(), _buttonRow(), _textContent()],
      ),
    );
  }

  ///构建页面
  Widget _homeWidgets() {
    return Scaffold(
      appBar: CustomAppBar(
        leftIcon: Icon(Icons.menu),
        title: Text("练习Flutter构建布局"),
        rightIcon: Icon(Icons.more_vert),
        isTitleCenter: true,
      ),
      body: _bodyContent(),
    );
  }
}

///自定义AppBar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  Widget leftIcon;
  Widget title;
  Widget rightIcon;
  bool isTitleCenter;

  CustomAppBar({Key key, @required this.leftIcon, @required this.title, @required this.rightIcon, @required this.isTitleCenter});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      leading: leftIcon,
      title: title,
      actions: <Widget>[rightIcon],
      centerTitle: isTitleCenter,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);
}
