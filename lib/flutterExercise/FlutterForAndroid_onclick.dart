import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class FlutterForAndroidClick extends StatelessWidget {
  void unableClick() {
    Fluttertoast.showToast(msg: "不支持点击事件的Widget弹出的Toast");
  }

  void ableClick() {
    Fluttertoast.showToast(msg: "支持点击事件的Widget弹出的Toast");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wdiget点击事件',
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Wdiget点击事件"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              GestureDetector(
                //其他手势
                //onTap ：
                child: Text("本Widget不支持事件监听也可以进行点击提示"),
                onTap: unableClick,
              ),
              RaisedButton(
                onPressed: ableClick,
                child: Text("本Widget支持事件监听"),
              ),
              //双击图像进行旋转
              DoubleRouteView(),
            ],
          ),
        ),
      ),
    );
  }
}


//对图像的双击点击旋转事件
class DoubleRouteView extends StatefulWidget {
  @override
  _DoubleRouteViewState createState() => _DoubleRouteViewState();
}

class _DoubleRouteViewState extends State<DoubleRouteView>
    with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    curve = CurvedAnimation(parent: controller, curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: RotationTransition(
          turns: curve,
          child: Image.asset(
            "images/bg.jpg",
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          )),
      onDoubleTap: () {
        if (controller.isCompleted) {
          controller.reverse();
        } else {
          controller.forward();
        }
      },
    );
  }
}
