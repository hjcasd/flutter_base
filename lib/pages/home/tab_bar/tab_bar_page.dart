import 'package:flutter/material.dart';
import 'package:flutter_base/routes/route_manager.dart';

/// TabBar页面
class TabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabBar(),
    );
  }
}

/// TabBar: Tab切换组件
class MyTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> _tabList = <Tab>[
    new Tab(
      text: 'Android',
    ),
    new Tab(
      text: 'IOS',
    ),
    new Tab(
      text: 'Flutter',
    ),
    new Tab(
      text: 'Python',
    ),
    new Tab(
      text: 'Java',
    ),
    new Tab(
      text: 'C',
    ),
    new Tab(
      text: 'C++',
    ),
    new Tab(
      text: 'Go',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
    // tab切换监听
    _tabController.addListener(() {
      // 滑动监听调用一次,点击切换调用2次
      if (_tabController.index == _tabController.animation?.value) {
        print("当前索引: ${_tabController.index}");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TabBar的使用",
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            RouteManager.goBack();
          },
        ),
        bottom: TabBar(
          /// 指示器颜色
          indicatorColor: Colors.amberAccent,
          isScrollable: true,
          controller: _tabController,
          tabs: _tabList,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabList.map((Tab tab) {
          return Center(
            child: Text(
              tab.text!,
            ),
          );
        }).toList(),
      ),
    );
  }
}
