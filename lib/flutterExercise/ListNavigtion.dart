import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ListMyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListMyAppState();
  }
}

class ListMyAppState extends State<ListMyApp> {
  List<Todo> todos = List<Todo>();
  final List<Tab> _mTabs = <Tab>[
    Tab(
      text: 'Tab1',
      icon: Icon(Icons.airline_seat_flat_angled),
    ),
    Tab(
      text: 'Tab2',
      icon: Icon(Icons.airline_seat_flat_angled),
    ),
    Tab(
      text: 'Tab3',
      icon: Icon(Icons.airline_seat_flat_angled),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 50; i++) {
      todos.add(Todo("Todos标题$i", "Todos内容详细$i"));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: _mTabs.length,
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text("练习Route"),
              leading: Builder(builder: (BuildContext context) {
                return GestureDetector(
                  child: Icon(Icons.menu),
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              })),
          body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (
              context,
              index,
            ) {
              return ListTile(
                title: Text(todos[index].title),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(todo: todos[index])));
                },
              );
            },
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.only(),
              children: <Widget>[
                Container(
                  height: 150 + ScreenUtil.getInstance().statusBarHeight,
                  child: UserAccountsDrawerHeader(
                    accountName: Text("UserAccountName"),
                    accountEmail: Text("hjzxzone@gmail.com"),
                    currentAccountPicture: Image.asset("images/bg.jpg"),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.wifi),
                  title: Text('无线网络1 '),
                  subtitle: Text('我是副标题'),
                ),
                ListTile(
                  leading: Icon(Icons.wifi),
                  title: Text('无线网络2'),
                  subtitle: Text('我是副标题'),
                ),
                ListTile(
                  leading: Icon(Icons.wifi),
                  title: Text('无线网络3'),
                  subtitle: Text('我是副标题'),
                  onTap: () {
                    print('ssss');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.wifi),
                  title: Text('无线网络4'),
                  subtitle: Text('我是副标题'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Todo todo;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}
