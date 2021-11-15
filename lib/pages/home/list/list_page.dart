import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// ListView页面
class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("ListView的使用", MyListWidget());
  }
}

/// ListView: 列表组件
class MyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          LayoutUtils.generateButton(Routes.ListStatic, "静态列表"),
          LayoutUtils.generateButton(Routes.ListDynamic, "动态列表"),
        ],
      ),
    );
  }
}
