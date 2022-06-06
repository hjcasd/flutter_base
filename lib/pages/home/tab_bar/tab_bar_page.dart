import 'package:buttons_tabbar/buttons_tabbar.dart';
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
  TabController? _tabController;

  List _dataList = ["中国民生银行个人人民币银行结算账户管理协议", "个人税收居民身份声明文件", "跨行通协议"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _dataList.length, vsync: this);
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
            color: AppColors.grey_E5E5E5,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ButtonsTabBar(
              controller: _tabController,
              backgroundColor: AppColors.red_CB1E36,
              unselectedBackgroundColor: AppColors.white,
              radius: 20,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              unselectedLabelStyle: TextStyle(
                color: AppColors.black,
                fontSize: 12,
              ),
              labelStyle: TextStyle(
                color: AppColors.white,
                fontSize: 12,
              ),
              tabs: _getTabsView(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: _getContentView(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getTabsView() {
    List<Widget> list = [];
    for (var i = 0; i < _dataList.length; i++) {
      list.add(Tab(text: _dataList[i]));
    }
    return list;
  }

  List<Widget> _getContentView() {
    List<Widget> list = [];
    for (var i = 0; i < _dataList.length; i++) {
      list.add(
        Container(
          color: AppColors.gold_BFA253,
          padding: EdgeInsets.all(20),
          child: Text(
            _dataList[i],
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
    _tabController?.dispose();
  }
}
