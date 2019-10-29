import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductDetailsState();
  }
}

class ProductDetailsState extends State<ProductDetails> {
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
          FavoriteWidget(),
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
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onTap: () {
            Fluttertoast.showToast(msg: "菜单按钮", toastLength: Toast.LENGTH_LONG);
          },
        ),
        centerTitle: true,
        title: Text("Flutter练习构建布局"),
        actions: <Widget>[
          GestureDetector(
            child: Container(
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              padding: EdgeInsets.only(right: 8),
            ),
            onTap: () {
              Fluttertoast.showToast(msg: "更多按钮", toastLength: Toast.LENGTH_LONG);
            },
          )
        ],
      ),
      body: _bodyContent(),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: GestureDetector(
            child: Icon(
              _isFavorited ? Icons.star : Icons.star_border,
              color: Colors.red[500],
            ),
            onTap: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 20,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}
