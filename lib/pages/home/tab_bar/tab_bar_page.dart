import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/routes/route_manager.dart';

/// TabBar页面
class TabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyTabBar();
  }
}

/// TabBar: Tab切换组件
class MyTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List _tabList = ["中国民生银行个人人民币银行结算账户管理协议", "个人税收居民身份声明文件", "跨行通协议"];

  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
    // tab切换监听
    _tabController.addListener(() {
      // 滑动监听调用一次,点击切换调用2次
      if (_tabController.index == _tabController.animation?.value) {
        print("当前索引: ${_tabController.index}");
        setState(() {
          _tabIndex = _tabController.index;
        });
      }
    });
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
            RouteManager.back();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(),
              tabs: _getTabsView(),
            ),
          ),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: _getContentView(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getTabsView() {
    List<Widget> list = [];
    for (var i = 0; i < _tabList.length; i++) {
      list.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: _tabIndex == i
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
          child: Text(
            _tabList[i],
            style: TextStyle(fontSize: 12),
          ),
        ),
      );
    }
    return list;
  }

  List<Widget> _getContentView() {
    List<Widget> list = [];
    for (var i = 0; i < _tabList.length; i++) {
      list.add(
        Container(
          color: AppColors.gold_BFA253,
          padding: EdgeInsets.all(20),
          child: Text(
            _tabList[i],
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }
    return list;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
