import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';
import 'package:flutter_base/components/icon_container.dart';

/// Column页面
class ColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Column的使用", MyColumnWidget());
  }
}

/// Column: 列组件,垂直方向上排列子组件(类似于Linearlayout vertical)
class MyColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // 垂直方向上(主轴)的排列方式
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          Icons.add,
          color: Colors.yellow,
        ),
        IconContainer(
          Icons.ac_unit,
          color: Colors.blue,
        ),
        IconContainer(
          Icons.settings,
          color: Colors.cyan,
        ),
      ],
    );
  }
}
