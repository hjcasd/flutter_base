import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

import 'components/icon_container.dart';

/// Column的使用
class ColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Column", MyColumn());
  }
}

// Column组件
class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // 主轴的排序方式
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
        )
      ],
    );
  }
}
