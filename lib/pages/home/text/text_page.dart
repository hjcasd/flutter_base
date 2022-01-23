import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/constants/AppColors.dart';

/// Text页面
class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "Text的使用",
        ),
        body: MyText(),
      ),
    );
  }
}

/// Text: 文本组件
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300.0,
        height: 300.0,
        padding: EdgeInsets.all(10.0),
        color: AppColors.amber,
        child: Text(
          "我是一个文本组件， 我是一个文本组件，我是一个文本组件",
          // 对齐方式
          textAlign: TextAlign.left,
          style: TextStyle(
            // 字体大小
            fontSize: 20.0,
            // 字体颜色
            color: AppColors.blue,
            // 字体加粗
            fontWeight: FontWeight.w700,
            // 字体样式
            fontStyle: FontStyle.italic,
            // 下划线
            decoration: TextDecoration.underline,
            // 下划线颜色
            decorationColor: AppColors.green,
            // 下划线样式
            decorationStyle: TextDecorationStyle.dashed,
            // 文本字体间距
            letterSpacing: 2.0,
          ),
          // 文本溢出的处理方式
          // overflow: TextOverflow.ellipsis,
          // 最大显示几行
          // maxLines: 2,
        ),
      ),
    );
  }
}
