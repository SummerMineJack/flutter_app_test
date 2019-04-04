import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(ShowToast());
}

class ShowToast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShowToastWidget();
  }
}

class ShowToastWidget extends StatefulWidget {
  @override
  _ShowToastWidgetState createState() => _ShowToastWidgetState();
}

class _ShowToastWidgetState extends State<ShowToastWidget> {
  @override
  Widget build(BuildContext context) {
    void showLongToast() {
      Fluttertoast.showToast(
        msg: "This is Long Toast",
        toastLength: Toast.LENGTH_LONG,
      );
    }

    void showColoredToast() {
      Fluttertoast.showToast(
          msg: "This is Colored Toast",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }

    void showShortToast() {
      Fluttertoast.showToast(
          msg: "This is Short Toast",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIos: 1);
    }

    void showTopShortToast() {
      Fluttertoast.showToast(
          msg: "This is Top Short Toasts",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIos: 1);
    }

    void showCenterShortToast() {
      Fluttertoast.showToast(
          msg: "This is Center Short Toast",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1);
    }

    void cancelToast() {
      Fluttertoast.cancel();
    }

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Toast'),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text(StringContents.welcome),
                    onPressed: showLongToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new IconButton(
                    icon: Icon(Icons.near_me), onPressed: showShortToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text('Show Center Short Toast'),
                    onPressed: showCenterShortToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text('Show Top Short Toast'),
                    onPressed: showTopShortToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                    child: new Text('Show Colored Toast'),
                    onPressed: showColoredToast),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new RaisedButton(
                  child: new Text('Cancel Toasts'),
                  onPressed: cancelToast,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StringContents {
  static String welcome = "Welcome Flutter App !";
}
