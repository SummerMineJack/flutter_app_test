import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//使用Flutter进行异步UI操作 使用网络数据进行显示listview数据
class FlutterForAndroidAsycle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "获取网络数据并显示listview",
      theme: ThemeData(primaryColor: Colors.amberAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text("获取网络数据并显示listview"),
          centerTitle: true,
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
  final englishWordTextSize =
      const TextStyle(fontSize: 18, color: Colors.redAccent);

  //初始化数据
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getloadDataForNetWork();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            padding: EdgeInsets.all(15),
            itemCount: widgets.length,
            itemBuilder: (context, i) {
              if (i.isOdd) {
                return Divider();
              }
              return getRow(i);
            }));
  }

  Widget getRow(int i) {
    return ListTile(
      title: Text(
        "${widgets[i]["title"]}",
        style: TextStyle(fontSize: 16, color: Colors.deepOrange),
      ),
    );
  }

  void getloadDataForNetWork() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}
