import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/text/smart_text.dart';

/// Container页面
class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "Container的使用",
        ),
        body: MyContainer(),
      ),
    );
  }
}

/// Container: 容器组件(类似于Div),以下是封装后的Box,便于开发
/// SizedBox：指定尺寸的容器。
/// ConstrainedBox：带约束条件的容器，如限制最小最大宽度和高度。
/// DecoratedBox：带装饰的容器，比如渐变色。
/// RotatedBox：旋转一定角度的容器。
class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // 宽度
        // width: 300.0,
        // 高度
        // height: 300.0,
        // 子组件
        child: SmartText(
          "文本",
          fontSize: 20,
          fontColor: Colors.red,
          onPressed: (){

          },
        ),
        // 内边距
        padding: EdgeInsets.all(10.0),
        // 外边距
        margin: EdgeInsets.all(10.0),
        // 背景颜色,,如果存在decoration,那么就不能设置该属性,否则会报错
        // color: Colors.red,
        // Container中子组件的对齐方式
        alignment: Alignment.center,
        // 修饰背景和边框
        decoration: BoxDecoration(
          // 背景颜色
          // color: Colors.greenAccent,
          // 边框
          border: Border.all(
            // 边框颜色
            color: Colors.blue,
            // 边框宽度
            width: 2.0,
          ),
          // 渐变
          gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.green],
          ),
          // 边框圆角
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }
}