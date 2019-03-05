import 'package:flutter/material.dart';
import 'package:flutter_app_test/GSYTabBarWidget.dart';
import 'package:flutter_app_test/TabBarPageFirst.dart';
import 'package:flutter_app_test/TabBarPageSecond.dart';
import 'package:flutter_app_test/TabBarPageThree.dart';

class TabBarPageWidget extends StatefulWidget {
  @override
  _TabBarPageWidgetState createState() => new _TabBarPageWidgetState();
}

class _TabBarPageWidgetState extends State<TabBarPageWidget> {
  final PageController topPageControl = new PageController();
  final List<String> tab = [
    "顶部tab1",
    "顶部tab2",
    "顶部tab3",
    "顶部tab4",
    "顶部tab5",
    "顶部tab6",
  ];

  //tab
  _renderTab() {
    List<Widget> list = new List();
    for (int i = 0; i < tab.length; i++) {
      list.add(new FlatButton(
          onPressed: () {
            topPageControl.jumpTo(
                MediaQuery.of(context).size.width * 1); //使用这个方法则无需引入包  宽度
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
      new TabBarPageFirst(),
      new TabBarPageSecond(),
      new TabBarPageThree(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GSYTabBarWidget(
        type: GSYTabBarWidget.TOP_TAB,
        tabItems: _renderTab(),
        tabViews: _renderPage(),
        topPageControl: topPageControl,
        backgroundColor: Colors.lightBlue,
        indicatorColor: Colors.white,
        title: new Text("Test"));
  }
}
