import 'package:flutter/material.dart';

class MyTabBarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyTabBarViewState();
  }
}

class MyTabBarViewState extends State<MyTabBarView> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("测试"),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[_TabBarViewOne(), _TabBarViewTwo(), _TabBarViewThree(), _TabBarViewFour()],
      ),
    );
  }
}

///TabBarViewOne
Widget _TabBarViewOne() {
  return Container(
    child: Center(
      child: Text("测试1"),
    ),
  );
}

///TabBarViewOne
Widget _TabBarViewTwo() {
  return Container(
    child: Center(
      child: Text("测试2"),
    ),
  );
}

///TabBarViewOne
Widget _TabBarViewThree() {
  return Container(
    child: Center(
      child: Text("测试3"),
    ),
  );
}

///TabBarViewOne
Widget _TabBarViewFour() {
  return Container(
    child: Center(
      child: Text("测试4"),
    ),
  );
}
