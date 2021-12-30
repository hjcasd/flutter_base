import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/icon_container.dart';

/// Column页面
class ColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "Column的使用",
        ),
        body: MyColumn(),
      ),
    );
  }
}

/// Column: 列组件,垂直方向上排列子组件(类似于Linearlayout vertical)
class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // 垂直方向上(主轴)的排列方式
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          Icons.add,
          backgroundColor: Colors.yellow,
        ),
        IconContainer(
          Icons.ac_unit,
          backgroundColor: Colors.blue,
        ),
        IconContainer(
          Icons.settings,
          backgroundColor: Colors.cyan,
        ),
      ],
    );
  }
}
