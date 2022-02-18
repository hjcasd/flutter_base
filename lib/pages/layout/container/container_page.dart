import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/text/smart_text.dart';
import 'package:flutter_base/theme/app_colors.dart';

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
        // width: 300,
        // 高度
        // height: 300,
        // 子组件
        child: SmartText(
          "文本",
          fontSize: 20,
          fontColor: AppColors.red,
          onPressed: () {},
        ),
        // 内边距
        padding: EdgeInsets.all(10),
        // 外边距
        margin: EdgeInsets.all(10),
        // 背景颜色,,如果存在decoration,那么就不能设置该属性,否则会报错
        // color: AppColors.red,
        // Container中子组件的对齐方式
        alignment: Alignment.center,
        // 修饰背景和边框
        decoration: BoxDecoration(
          // 背景颜色
          // color: AppColors.green,
          // 边框
          border: Border.all(
            // 边框颜色
            color: AppColors.blue,
            // 边框宽度
            width: 2,
          ),
          // 渐变
          gradient: LinearGradient(
            colors: [AppColors.greenAccent, AppColors.green],
          ),
          // 边框圆角
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
