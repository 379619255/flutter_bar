import 'package:flutter/material.dart';

//可变的控件
class GSYTabBarWidget extends StatefulWidget {
  static const int BOTTOM_TAB = 1; //底部tab
  static const int TOP_TAB = 2; //顶部tab
  /**
   * static
      类似java中的staitc，表示一个成员属于类而不是对象
      final
      类似java中的final，必须初始化，初始化后值不可变，编译时不能确定值。
      const
      编译时可确定，并且不能被修改
   */
  final int type;
  final List<Widget> tabItems;
  final List<Widget> tabViews;
  final Color backgroundColor; //背景颜色
  final Color indicatorColor;
  final Widget title; //标题
  final Widget drawer;
  final Widget floatingActionButton; //悬浮按钮
  final TarWidgetControl tarWidgetControl;
  final PageController topPageControl;

   GSYTabBarWidget(
      {Key key,
      this.type,
      this.tabItems,
      this.tabViews,
      this.backgroundColor,
      this.indicatorColor,
      this.title,
      this.drawer,
      this.floatingActionButton,
      this.tarWidgetControl,
      this.topPageControl})
      : super(key: key);

  @override
  _GSYTabBarState createState() => new _GSYTabBarState(
      type,
      tabItems,
      tabViews,
      backgroundColor,
      indicatorColor,
      title,
      drawer,
      floatingActionButton,
      topPageControl);
}

class _GSYTabBarState extends State<GSYTabBarWidget>
    with SingleTickerProviderStateMixin {
  final int _type;

  final List<Widget> _tabItems;

  final List<Widget> _tabViews;

  final Color _backgroundColor;

  final Color _indicatorColor;

  final Widget _title;

  final Widget _drawer;

  final Widget _floatingActionButton;

  final PageController _pageController;
  TabController _tabController;

  _GSYTabBarState(
      this._type,
      this._tabItems,
      this._tabViews,
      this._backgroundColor,
      this._indicatorColor,
      this._title,
      this._drawer,
      this._floatingActionButton,
      this._pageController)
      : super();

  @override
  void initState() {
    super.initState();
    //初始化时创建控制器
    //通过 with SingleTickerProviderStateMixin 实现动画效果。
    //vsync //动画效果的异步处理，默认格式，背下来即可
    //length tab的个数
    _tabController = new TabController(length: _tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    //页面销毁时，销毁控制器
    _tabController.dispose();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    //顶部tabBar的模式
    if (this._type == GSYTabBarWidget.TOP_TAB) {
      //Scaffold 实现了基本的 Material 布局
      return new Scaffold(
        //设置侧边滑出 drawer，不需要可以不设置
        drawer: _drawer,
        //设置悬浮按钮，不需要可以不设置
        floatingActionButton: _floatingActionButton,
        //标题栏
        appBar: new AppBar(
          backgroundColor: _backgroundColor,
          title: _title,

          //tabBar控件
          bottom: new TabBar(
            //tabBar为可以滑动的模式
            isScrollable: true,
            //必须有的控制器，与pageView的控制器同步
            controller: _tabController,
            //每一个tab item，是一个List<Widget>
            tabs: _tabItems,
            //tab底部选中条颜色
            indicatorColor: _indicatorColor,
          ),
        ),

        //页面主体，PageView，用于承载Tab对应的页面
        body: new PageView(
          //必须有的控制器，与tabBar的控制器同步
          controller: _pageController,
          //每一个 tab 对应的页面主体，是一个List<Widget>
          children: _tabViews,
          //页面触摸作用滑动回调，用于同步tab选中状态
          onPageChanged: (index) {
            _tabController.animateTo(index);
          },
        ),
      );
    } else if (this._type == GSYTabBarWidget.BOTTOM_TAB) {
      //如果选择的是底部tab
      return new Scaffold(
        //设置侧边滑出 drawer，不需要可以不设置
        drawer: _drawer,
        //设置悬浮按键，不需要可以不设置
        floatingActionButton: _floatingActionButton,
        //标题栏
        appBar: new AppBar(
          backgroundColor: _backgroundColor,
          title: _title,
        ),
        //页面主体，PageView，用于承载Tab对应的页面
        body: new PageView(
          //必须有的控制器，与tabBar的控制器同步
          controller: _pageController,
          //每一个 tab 对应的页面主体，是一个List<Widget>
          children: _tabViews,
          onPageChanged: (index) {
            //页面触摸作用滑动回调，用于同步tab选中状态
            _tabController.animateTo(index); //联动起来
          },
        ),
        //底部导航栏，也就是tab栏
        bottomNavigationBar: new Material(
          color: _backgroundColor,
          child: new TabBar(
            //必须有的控制器，与pageView的控制器同步
            controller: _tabController,
            //每一个tab item，是一个List<Widget>
            tabs: _tabItems,
            //tab底部选中条颜色
            indicatorColor: _indicatorColor,
          ),
        ),
      );
    }
  }
}

class TarWidgetControl {
  List<Widget> footerButton = [];
}
