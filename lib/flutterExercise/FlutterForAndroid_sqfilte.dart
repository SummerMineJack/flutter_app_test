import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class FlutterForAndroidSqFilte extends StatefulWidget {
  @override
  _FlutterForAndroidSqFilteState createState() =>
      _FlutterForAndroidSqFilteState();
}

class _FlutterForAndroidSqFilteState extends State<FlutterForAndroidSqFilte> {
  String dbPath;
  Database database;
  List<Map> usersInfo = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataBasePath();
  }

  //获取数据库路径
  void getDataBasePath() async {
    var databasePath = await getDatabasesPath();
    dbPath = join(databasePath, "huangjian.db");
  }

  //打开数据库
  void openDataBaseAndCreateTable() async {
    database =
        await openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      await db.execute(
          "create table userinfo (id integer primary key,name text ,age integer,sex text)");
    });
  }

//使用事务进行添加数据
  void insert() async {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          "insert into userinfo (name,age,sex) values ('HuangJian',24,'男' )");
      if (id1.toString().isNotEmpty) {
        Fluttertoast.showToast(msg: "数据插入成功");
      }
    });
    sel();
  }

  //删除并查询显示
  void del() async {
    int delCountRow =
        await database.rawDelete('DELETE FROM userinfo WHERE id = ?', [1]);
    if (delCountRow >= 1) {
      Fluttertoast.showToast(msg: "数据删除成功");
    }
    sel();
  }

  //更新并查询显示
  void update() async {
    int updateCountRow = await database.rawUpdate(
        'UPDATE userinfo SET name = ?, age = ? ,sex=? WHERE id = ?',
        ['New HuangJian Name', 21, '女', 2]);
    if (updateCountRow >= 1) {
      Fluttertoast.showToast(msg: "数据更新成功");
    }
    sel();
  }

  //查询显示
  void sel() async {
    List<Map> users = await database.rawQuery("select name from userinfo");
    setState(() {
      usersInfo = users;
    });
  }

  Widget getRow(int position) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("${usersInfo[position].values}")),
      onTap: () {
        Fluttertoast.showToast(msg: "点击的人名是:${usersInfo[position]}");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter中使用sqfilte",
      theme: ThemeData(
          primaryColor: Colors.deepOrange, textSelectionColor: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter中使用sqfilte"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: openDataBaseAndCreateTable,
                    child: Text("打开数据库并创建数据表"),
                  ),
                  RaisedButton(
                    onPressed: insert,
                    child: Text("增"),
                  ),
                  RaisedButton(
                    onPressed: del,
                    child: Text("删"),
                  ),
                  RaisedButton(
                    onPressed: update,
                    child: Text("改"),
                  ),
                  RaisedButton(
                    onPressed: sel,
                    child: Text("查"),
                  ),
                  GestureDetector(
                    onTap: sel,
                    child: Text("查询数据库"),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemBuilder: (context, position) {
                  return getRow(position);
                },
                itemCount: usersInfo.length,
              ),
            )
          ],
        )),
      ),
    );
  }
}
