import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// TabController的使用
class TabControllerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyTabController(),
    );
  }
}

class MyTabController extends StatefulWidget {
  @override
  _TabControllerState createState() => _TabControllerState();
}

// TabController 演示
class _TabControllerState extends State<MyTabController> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    // tab切换监听
    _tabController.addListener(() {
      // 滑动监听调用一次,点击切换调用2次
      if(_tabController.index == _tabController.animation.value) {
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
        title: Text("TabController"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            }),
        bottom: TabBar(
          controller: this._tabController,
          tabs: <Widget>[
            Tab(
              text: "推荐",
            ),
            Tab(
              text: "热门",
            ),
            Tab(
              text: "视频",
            ),
            Tab(
              text: "图片",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[
          Center(
            child: Text("推荐"),
          ),
          Center(
            child: Text("热门"),
          ),
          Center(
            child: Text("视频"),
          ),
          Center(
            child: Text("图片"),
          )
        ],
      ),
    );
  }
}
