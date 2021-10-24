import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';
import 'package:flutter_base/components/icon_container.dart';

/// Row的使用
class RowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Row", MyRow());
  }
}

// Row组件
class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        // 主轴的排序方式
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconContainer(
            Icons.add,
            color: Colors.yellow,
          ),
          IconContainer(Icons.ac_unit),
          IconContainer(
            Icons.settings,
            color: Colors.cyan,
          )
        ],
      ),
    );
  }
}
