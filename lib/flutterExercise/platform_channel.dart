import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatFormBatteryLevel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PlatFormBatteryLevelState();
  }
}

class PlatFormBatteryLevelState extends State<PlatFormBatteryLevel> {
  static const platform = const MethodChannel("samples.flutter.io/battery");
  static const platformToast = const MethodChannel("samples.flutter.io/toast");
  String _batteryLevel = "Unknow battery level";

  void _getAndroidToast() async {
    await platformToast.invokeMethod("showToast");
  }

  ///获取电池电量
  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod("getBatteryLevel");
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("通过特定平台获取电池的电量"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text("获取电池电量"),
              onPressed: _getBatteryLevel,
            ),
            RaisedButton(
              child: Text("点击我进行Toast提示"),
              onPressed: _getAndroidToast,
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
