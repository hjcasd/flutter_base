import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/icon_container.dart';

/// Row页面
class RowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar("Row的使用"),
        body: MyRowWidget(),
      ),
    );
  }
}

/// Row: 行组件,水平方向上排列子组件(类似于Linearlayout horizontal)
class MyRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        // 水平方向上(主轴)的排列方式
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconContainer(
            Icons.add,
            color: Colors.yellow,
          ),
          IconContainer(
            Icons.ac_unit,
            color: Colors.blueGrey,
          ),
          IconContainer(
            Icons.settings,
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }
}
