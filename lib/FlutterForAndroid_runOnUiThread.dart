import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(FlutterForAndroidAsycle());
}

//使用Flutter进行异步UI操作 使用网络数据进行显示listview数据
class FlutterForAndroidAsycle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "获取网络数据并显示listview",
      theme: ThemeData(primaryColor: Colors.amberAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text("获取网络数据并显示listview"),
        ),
        body: GetNetWorkListViewData(),
      ),
    );
  }
}

class GetNetWorkListViewData extends StatefulWidget {
  @override
  _GetNetWorkListViewDataState createState() => _GetNetWorkListViewDataState();

  GetNetWorkListViewData({Key key}) : super(key: key);
}

class _GetNetWorkListViewDataState extends State<GetNetWorkListViewData> {
  List widgets = [];

  //初始化数据
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getloadDataForNetWork();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: new ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }));
  }

  Widget getRow(int i) {
    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Text("Row ${widgets[i]["title"]}"));
  }

  void getloadDataForNetWork() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}
