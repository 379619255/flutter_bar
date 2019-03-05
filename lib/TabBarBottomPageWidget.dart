import 'package:flutter/material.dart';
import 'package:flutter_app_test/GSYTabBarWidget.dart';
import 'package:flutter_app_test/TabBarPageFirst.dart';
import 'package:flutter_app_test/TabBarPageSecond.dart';
import 'package:flutter_app_test/TabBarPageThree.dart';

/**
 * 底部的tab
 */
class TabBarBottomPageWidget extends StatefulWidget {
  @override
  _TabBarBottomPageWidgetState createState() =>
      new _TabBarBottomPageWidgetState();
}

class _TabBarBottomPageWidgetState extends State<TabBarBottomPageWidget> {
  //页面视图的控制器
  final PageController topPageControl = new PageController();
  final List<String> tab = ["底部tab1", "底部tab2", "底部tab3"];

  _renderTab() {
    List<Widget> list = new List();
    for (int i = 0; i < tab.length; i++) {
      list.add(new FlatButton(
          onPressed: () {
            topPageControl.jumpTo(
                MediaQuery.of(context).size.width * i); //使用这个方法则无需引入包  宽度
          },
          child: new Text(
            tab[i],
            maxLines: 1,
          )));
    }
    return list;
  }

  _renderPage() {
    return [
      new TabBarPageFirst(),
      new TabBarPageSecond(),
      new TabBarPageThree(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GSYTabBarWidget(
      type: GSYTabBarWidget.BOTTOM_TAB,
      //渲染tab
      tabItems: _renderTab(),
      //渲染页面
      tabViews: _renderPage(),
      topPageControl: topPageControl,
      backgroundColor: Colors.black45,
      indicatorColor: Colors.white,
      title: new Text("test2"),
    );
  }
}
