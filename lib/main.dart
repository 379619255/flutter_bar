import 'package:flutter/material.dart';
import 'package:flutter_app_test/TabBarBottomPageWidget.dart';
import 'package:flutter_app_test/TabBarPageWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "tab demo",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MainPage(),
    );
  }
}

//无状态的widget
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      //Scaffold 实现了基本的 Material 布局。只要是在 Material 中定义了的单个界面显示的布局控件元素，都可以使用 Scaffold 来绘制。
      appBar: new AppBar(
        title: new Text("title"),
      ),
      body: new Column(
        children: <Widget>[
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                print("点击了");
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new TabBarPageWidget()));
              },
              child: new Text("Top Tab")),
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new TabBarBottomPageWidget()));
              },
              child: new Text("Bottom Tab")),
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                showDialog(
                    context: context,
                    child: new SimpleDialog(
                      contentPadding: const EdgeInsets.all(10.0),
                      title: new Text("弹出框showDialog标题"),
                      children: <Widget>[new Text("我是内容")],
                    ));
              },
              child: new Text("测试showDialog")),
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                showDialog(
                    context: context,
                    child: new SimpleDialog(
                      contentPadding: const EdgeInsets.all(10.0),
                      title: new Text("我是标题"),
                      children: <Widget>[
                        new ListTile(
                          leading: new Icon(Icons.apps),
                          title: new Text("apps"),
                        ),
                        new ListTile(
                          leading: new Icon(Icons.android),
                          title: new Text("android"),
                        ),
                        new ListTile(
                          leading: new Icon(Icons.cake),
                          title: new Text("cake"),
                        ),
                        new ListTile(
                          leading: new Icon(Icons.local_cafe),
                          title: new Text("cofe"),
                        )
                      ],
                    ));
              },
              child: new Text("显示多个弹出框内容")),
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                showDialog(
                    context: context,
                    child: new AlertDialog(
                      title: new Text("alertDialog标题"),
                      content: new Text("alertDialog内容"),
                      actions: <Widget>[
                        new FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: new Text("确定"))
                      ],
                    ));
              },
              child: new Text("alertDialog控件")),
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => new AlertDialog(
                          title: new Text("标题"),
                          content: new Text("内容"),
                          actions: <Widget>[
                            new FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: new Text("取消")),
                            new FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: new Text("确定"))
                          ],
                        ));
              },
              child: new Text("alert弹框")),
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                showDialog(
                    context: context,
                    child: new AboutDialog(
                      applicationName: "1111",
                      applicationVersion: "1.0",
                      applicationIcon: new Icon(
                        Icons.android,
                        color: Colors.lightBlueAccent,
                      ),
                      children: <Widget>[
                        new Text("111111111111\n22222222222222\n3333333333")
                      ],
                    ));
              },
              child: new Text("AboutDialog控件")),
        ],
      ),
    );
  }
}
