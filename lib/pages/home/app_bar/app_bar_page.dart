import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/routes/route_manager.dart';

/// AppBar的使用
class AppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyAppBar();
    // return MyAppTabBar();
  }
}

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AppBar",
        ),
        // 背景
        backgroundColor: AppColors.green,
        // 左侧图标
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            RouteManager.goBack();
          },
        ),
        // 右侧图标
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              print("search");
            },
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {
              print("setting");
            },
          )
        ],
        // 标题是否居中
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text(
            "哈哈哈",
          ),
        ),
      ),
    );
  }
}

/// 顶部tab切换演示
class MyAppTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.green,
          title: Row(
            children: <Widget>[
              Expanded(
                child: TabBar(
                  // 指示器颜色
                  indicatorColor: AppColors.black,
                  // 选中的字体颜色
                  labelColor: AppColors.black,
                  // 未选中的字体颜色
                  unselectedLabelColor: AppColors.white,
                  // 下划线宽度
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(
                      text: "热门",
                    ),
                    Tab(
                      text: "推荐",
                    ),
                    Tab(
                      text: "视频",
                    ),
                    Tab(
                      text: "图片",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text(
                "热门",
              ),
            ),
            Center(
              child: Text(
                "推荐",
              ),
            ),
            Center(
              child: Text(
                "视频",
              ),
            ),
            Center(
              child: Text(
                "图片",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
