import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createStatehy
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Fluttertoast.showToast(msg: "使用GestureDetecotor进行的点击事件，icon本身是没有点击事件的，只有IconButton有,Back");
            },
          ),
          title: Text("Flutter的UI布局"),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
              onTap: () {
                Fluttertoast.showToast(msg: "使用GestureDetecotor进行的点击事件，icon本身是没有点击事件的，只有IconButton有,Search");
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.call),
                      Container(
                        child: Text("Call"),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.call),
                      Container(
                        child: Text("Call"),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.call),
                      Container(
                        child: Text("Call"),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.call),
                      Container(
                        child: Text("Call"),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.call),
                      Container(
                        child: Text("Call"),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("snchdbsjsj"),
                          Text("sdasasdasdasdadasdasdasdasd"),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.green[500],
                                size: 17,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.green[500],
                                size: 17,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.green[500],
                                size: 17,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 17,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 17,
                              ),
                              Text(
                                "170 reviews",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: [
                                    Icon(Icons.kitchen, color: Colors.green[500]),
                                    Text('PREP:'),
                                    Text('25 min'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.timer, color: Colors.green[500]),
                                    Text('COOK:'),
                                    Text('1 hr'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.restaurant, color: Colors.green[500]),
                                    Text('FEEDS:'),
                                    Text('4-6'),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        "images/bg.jpg",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
