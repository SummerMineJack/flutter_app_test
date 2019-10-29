import 'package:flutter/material.dart';


//使用Flutter Animation动画制作
class FlutterAnimations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "Flutter Animations Title",
        theme: ThemeData(primaryColor: Colors.amberAccent),
        home: FlutterAnimationsa(
          title: "Fade Demo",
        ));
  }
}

class FlutterAnimationsa extends StatefulWidget {
  FlutterAnimationsa({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FlutterAnimationsaState createState() => _FlutterAnimationsaState();
}

class _FlutterAnimationsaState extends State<FlutterAnimationsa>
    with TickerProviderStateMixin {
  AnimationController animationController;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 10000));
    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
      ),
      body: new Center(
          child: new Container(
              child: new FadeTransition(
                  opacity: curvedAnimation,
                  child: new FlutterLogo(
                    size: 100.0,
                  )))),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Fade',
        child: new Icon(Icons.brush),
        onPressed: () {
          animationController.forward();
        },
      ),
    );
  }
}
