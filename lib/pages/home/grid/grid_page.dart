import 'package:flutter/material.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// GridView页面
class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("GridView的使用", MyGridWidget());
  }
}

/// GridView: 网格组件
class MyGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          LayoutUtils.generateButton(Routes.GridCount, "Count网格"),
          LayoutUtils.generateButton(Routes.GridBuilder, "Builder网格"),
        ],
      ),
    );
  }
}