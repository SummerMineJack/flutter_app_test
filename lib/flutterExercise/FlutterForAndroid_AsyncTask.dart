import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


//使用flutter的AsyncTask实现网络请求功能
class FlutterForAndroidAsyncTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter中的AsyncTask网络请求",
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: SampleApp(),
    );
  }
}

class SampleApp extends StatefulWidget {
  @override
  _SampleAppState createState() => _SampleAppState();

  SampleApp({Key key}) : super(key: key);
}

class _SampleAppState extends State<SampleApp> {
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 使用AsyncTask"),
        centerTitle: true,
      ),
      body: getBody(),
    );
  }

  //显示网络请求dialog
  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }
    return false;
  }

  //返回页面内容
  getBody() {
    if (showLoadingDialog()) {
      //如果当前的widgets为空就显示进度条
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return getListView();
    }
  }

  //如果当前的widget不为空,就进行显示lsitview的数据
  getListView() {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }
        return getRow(i);
      },
      itemCount: widgets.length,
    );
  }

  getRow(int i) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row ${widgets[i]["title"]}"));
  }

  //去请求网络
  void loadData() async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    SendPort sendPort = await receivePort.first;
    List msg = await sendReceive(
        sendPort, "https://jsonplaceholder.typicode.com/posts");
    setState(() {
      widgets = msg;
    });
  }

  // the entry point for the isolate
  static dataLoader(SendPort sendPort) async {
    // Open the ReceivePort for incoming messages.
    ReceivePort port = new ReceivePort();

    // Notify any other isolates what port this isolate listens to.
    sendPort.send(port.sendPort);

    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataURL = data;
      http.Response response = await http.get(dataURL);
      // Lots of JSON to parse
      replyTo.send(jsonDecode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = new ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }
}
