import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// 找不到路由后的默认页面
class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("UnknownPage", MyUnknown());
  }
}

class MyUnknown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'Unknown',
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      )),
      color: Colors.blue,
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
                child: Text("热门"),
              ),
              Center(
                child: Text("推荐"),
              ),
              Center(
                child: Text("视频"),
              ),
              Center(
                child: Text("图片"),
              ),
            ],
          ),
        ));
  }
}
