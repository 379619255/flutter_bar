import 'package:flutter/material.dart';

class TabBarPageFirst extends StatefulWidget {
  @override
  _TabBarPageFirstState createState() => new _TabBarPageFirstState();
}

/**继承（关键字 extends）、混入 mixins （关键字 with）、接口实现（关键字 implements）
 * AutomaticKeepAliveClientMixin可以防止tab页面切换后被重置
 *
 */
class _TabBarPageFirstState extends State<TabBarPageFirst>
    with AutomaticKeepAliveClientMixin {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(String pair) {
    //一个固定高度的行，通常包含一些文本，以及一个行前或行尾图标
    return new ListTile(
      //点击的时候相应每个title
      onTap: (){
        print("listTitle被点击了");
      },
      onLongPress: (){
        print("listTitle被长点击了");
      },

      title: new Text(
        pair,
        style: _biggerFont,
      ),
    );
  }

  generateWordPairs() {
    return [
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444"
    ];
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs());
          }
          return _buildRow(_suggestions[index]);
        });
  }

  /***
   * 前实例是否应该保持活动状态。

      每当这个getter的值发生变化时，调用updateKeepAlive。
   */
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return _buildSuggestions();
  }
}
