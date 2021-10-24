import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// Tex页面
class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Text的使用", MyTextWidget());
  }
}

/// Text: 文本组件
class MyTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300.0,
        height: 300.0,
        padding: EdgeInsets.all(10.0),
        color: Colors.amberAccent,
        child: Text(
          "我是一个文本组件， 我是一个文本组件，我是一个文本组件",
          // 对齐方式
          textAlign: TextAlign.left,
          style: TextStyle(
              // 字体大小
              fontSize: 20.0,
              // 字体颜色
              color: Colors.blue,
              // 字体加粗
              fontWeight: FontWeight.w700,
              // 字体样式
              fontStyle: FontStyle.italic,
              // 下划线
              decoration: TextDecoration.underline,
              // 下划线颜色
              decorationColor: Colors.green,
              // 下划线样式
              decorationStyle: TextDecorationStyle.dashed,
              // 文本字体间距
              letterSpacing: 2.0),
          // 文本溢出的处理方式
          // overflow: TextOverflow.ellipsis,
          // 最大显示几行
          // maxLines: 2,
        ),
      ),
    );
  }
}
