//在flutter 中，自定义widget不是继承Widget去重新方法，而是通过组合widget的形式进行自定义Widget
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class FlutterForAndroidCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "自定义Widget",
      home: Scaffold(
        appBar: AppBar(
          title: Text("自定义Widget"),
          centerTitle: true,
        ),
        body: Center(
          child: CustomWidget("自定义Widget"),
        ),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final String label;

  CustomWidget(this.label);

  void onPressToast() {
    Fluttertoast.showToast(
        msg: "Toast提示",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 3000,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressToast,
      child: Text(label),
    );
  }
}
