import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppBarCustom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SliverAppBarCustomState();
  }
}

class SliverAppBarCustomState extends State<SliverAppBarCustom> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text("SliverAppBar练习"),
                  centerTitle: true,
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null),
                    IconButton(
                        icon: Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        onPressed: null)
                  ],
                  leading: GestureDetector(
                    child: Icon(Icons.menu),
                    onTap: () {},
                  ),
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                    "images/bg.jpg",
                    fit: BoxFit.cover,
                  )),
                )
              ];
            },
            body: Container(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("comme$index"),
                    );
                  }),
            )),
      ),
    );
  }
}
