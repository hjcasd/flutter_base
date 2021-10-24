import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// AppBar的使用
class AppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAppBar(),
      // 去掉debug图标
      debugShowCheckedModeBanner: false,
    );
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
        backgroundColor: Colors.green,
        // 左侧图标
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Get.back();
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

// 顶部tab切换演示
class MyAppBar2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: <Widget>[
              Expanded(
                child: TabBar(
                  // 指示器颜色
                  indicatorColor: Colors.black,
                  // 选中的字体颜色
                  labelColor: Colors.black,
                  // 未选中的字体颜色
                  unselectedLabelColor: Colors.white,
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
