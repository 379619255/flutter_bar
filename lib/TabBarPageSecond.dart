import 'package:flutter/material.dart';

//创建statefulWidget子类
class TabBarPageSecond extends StatefulWidget{
  //以下划线（_）开头的成员或类是私有的 创建实例
  @override
  _TabBarPageSecondState  createState() => _TabBarPageSecondState();

}

class _TabBarPageSecondState extends State<TabBarPageSecond> with AutomaticKeepAliveClientMixin{
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return _buildSuggestions();
  }
  Widget _buildRow(String pair){
    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
    );
  }

  generateWordPairs() {
    return [
      "yyyyyyy",
      "uuuuuuu",
      "iiiiiii",
      "ooooooo",
      "ppppppp",
      "yyyyyyy",
      "uuuuuuu",
      "iiiiiii",
      "ooooooo",
      "ppppppp",
      "yyyyyyy",
      "uuuuuuu",
      "iiiiiii",
      "ooooooo",
      "ppppppp",
    ];
  }

  Widget _buildSuggestions(){
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context,i){
          if(i.isOdd){
            return new Divider();//添加一个1像素高度的分割线
          }
          /**
           * //i~/2 意为 i除以2，返回int型整数
              //例如i分别为1，2，3，4，5，结果分别为 0，1，1，2，2
              //以此来计算ListView中词组的真实数量，减掉了分割线的数量
           */
          final index = i ~/ 2;
          if(index >=_suggestions.length){
            _suggestions.addAll(generateWordPairs());
          }
          return _buildRow(_suggestions[i]);
        });
  }

  /**
   * 重新被加载了，解决办法使用 with AutomaticKeepAliveClientMixin  实现  @protected bool get wantKeepAlive=>true; 即可，
   */
  @override
  bool get wantKeepAlive =>true;
}