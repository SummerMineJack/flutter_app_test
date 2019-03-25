import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

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
  final englishWordLists = <WordPair>[];
  final englishWordTextSize =
      const TextStyle(fontSize: 18, color: Colors.redAccent);
  final englishWordFavorite = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('创建一个ListView'),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.list), onPressed: openFavoriteEnglisdPage)
        ],
      ),
      body: buildListView(),
    );
  }

  void openFavoriteEnglisdPage() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final title = englishWordFavorite.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: englishWordTextSize,
          ),
        );
      });
      final divied =
          ListTile.divideTiles(tiles: title, context: context).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "我是新打开的页面并显示了收藏的英文单词",
            style: const TextStyle(fontSize: 16),
          ),
        ),
        body: new ListView(children: divied),
      );
    }));
  }

  //创建listview
  Widget buildListView() {
    return new ListView.builder(
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return new Divider();
          }
          final index = i ~/ 2;
          if (index >= englishWordLists.length) {
            englishWordLists.addAll(generateWordPairs().take(10));
          }
          return buildListViewItem(englishWordLists[index]);
        });
  }

  //创建listview item 样式文字
  Widget buildListViewItem(WordPair pair) {
    //进行判断点击的英文单词是否已经在englishWordFavorite中了
    final isFavoriteWord = englishWordFavorite.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: englishWordTextSize,
      ),
      //为当前的item进行添加收藏图标
      trailing: new Icon(
        isFavoriteWord ? Icons.favorite : Icons.favorite_border,
        color: isFavoriteWord ? Colors.red : null,
      ),
      //onTap函数是可点击函数
      onTap: () {
        setState(() {
          if (isFavoriteWord) {
            englishWordFavorite.remove(pair);
          } else {
            englishWordFavorite.add(pair);
          }
        });
      },
    );
  }
}
