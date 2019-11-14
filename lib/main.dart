import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/flutterExercise/FlutterShowToast.dart';
import 'package:flutter_app_test/flutterExercise/FlutterSliverAppBar.dart';
import 'package:flutter_app_test/flutterExercise/ListNavigtion.dart';
import 'package:flutter_app_test/flutterExercise/RowColumnTest.dart';
import 'package:flutter_app_test/flutterExercise/UseMaterialDesign.dart';
import 'package:flutter_app_test/flutterExercise/flutter_tabbarview.dart';
import 'package:flutter_app_test/flutterExercise/platform_channel.dart';

import 'flutterExercise/ContentLayout.dart';
import 'flutterExercise/FlutterForAndroid_AnimationController.dart';
import 'flutterExercise/FlutterForAndroid_AsyncTask.dart';
import 'flutterExercise/FlutterForAndroid_CustomWidget.dart';
import 'flutterExercise/FlutterForAndroid_InputEditText.dart';
import 'flutterExercise/FlutterForAndroid_Layouts.dart';
import 'flutterExercise/FlutterForAndroid_appchangeLife.dart';
import 'flutterExercise/FlutterForAndroid_onclick.dart';
import 'flutterExercise/FlutterForAndroid_runOnUiThread.dart';
import 'flutterExercise/FlutterForAndroid_sp.dart';
import 'flutterExercise/FlutterForAndroid_sqfilte.dart';
import 'flutterExercise/WidgetState.dart';
import 'flutterExercise/flutter_product_details.dart';
import 'flutterroute/FlutterForAndroidGetIntentData.dart';
import 'flutterroute/FlutterForAndroidRoute.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      //更改主题颜色
      theme: new ThemeData(primaryColor: Colors.deepOrangeAccent),
      home: new IsVariableWidget(),
    );
  }
}

//创建一个可变的控件
class IsVariableWidget extends StatefulWidget {
  @override
  createState() => new IsVariableWidgetWords();
}

//创建一个listview 组件
class IsVariableWidgetWords extends State<IsVariableWidget> {
  List<String> _widgetNames = List<String>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widgetNames.add("Row和Column练习");
    _widgetNames.add("MaterialDesign");
    _widgetNames.add("WidgetStatesClass");
    _widgetNames.add("ListView传参");
    _widgetNames.add("FlutterToast例子");
    _widgetNames.add("FlutterForAndroidSqFilte");
    _widgetNames.add("FlutterForAndroidSp");
    _widgetNames.add("FlutterForAndroidAsycle");
    _widgetNames.add("FlutterForAndroidClick");
    _widgetNames.add("FlutterForAndroidLayouts");
    _widgetNames.add("FlutterForAndroidInputField");
    _widgetNames.add("FlutterForAndroidCustomWidget");
    _widgetNames.add("FlutterForAndroidAsyncTask");
    _widgetNames.add("FlutterForAndroidLfeChange");
    _widgetNames.add("FlutterAnimations");
    _widgetNames.add("ProductDetails");
    _widgetNames.add("ContentApp");
    _widgetNames.add("FlutterRoute");
    _widgetNames.add("FlutterRouteGetData");
    _widgetNames.add("SliverAppBar");
    _widgetNames.add("TabBarView");
    _widgetNames.add("batterylevel");
  }

  Color randomColor() {
    return Color.fromARGB(255, Random().nextInt(256) + 0, Random().nextInt(256) + 0, Random().nextInt(256) + 0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter练习集锦'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _widgetNames.length,
          itemBuilder: (context, index) {
            return Ink(
              color: randomColor(),
              child: ListTile(
                title: Text(
                  _widgetNames[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RowColumnTest()));
                      break;
                    case 1:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserMaterialDesign()));
                      break;
                    case 2:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WidgetStatesClass()));
                      break;
                    case 3:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListMyApp()));
                      break;
                    case 4:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ShowToast()));
                      break; //FlutterLayout
                    case 5:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterForAndroidSqFilte()));
                      break;
                    case 6:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterForAndroidSp()));
                      break;
                    case 7:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterForAndroidAsycle()));
                      break;
                    case 8:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterForAndroidClick()));
                      break;
                    case 9:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterForAndroidLayouts()));
                      break;
                    case 10:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterForAndroidInputField()));
                      break;
                    case 11:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterForAndroidCustomWidget()));
                      break;
                    case 12:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterForAndroidAsyncTask()));
                      break;
                    case 13:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterForAndroidLfeChange()));
                      break;
                    case 14:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterAnimations()));
                      break;
                    case 15:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails()));
                      break;
                    case 16:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ContentApp()));
                      break;
                    case 17:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterRoute()));
                      break;
                    case 18:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterRouteGetData()));
                      break;
                    case 19:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SliverAppBarCustom()));
                      break;
                    case 20:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyTabBarView()));
                      break;
                    case 21:
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PlatFormBatteryLevel()));
                      break;
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
