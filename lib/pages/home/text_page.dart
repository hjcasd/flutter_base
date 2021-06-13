import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

// Text的使用
class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Text", MyText());
  }
}

// Text(): 文本组件
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 300.0,
            height: 300.0,
            padding: EdgeInsets.all(10.0),
            color: Colors.amberAccent,
            child: Text(
              "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  // fontStyle: FontStyle.italic,
                  // decoration: TextDecoration.lineThrough,
                  // decorationColor: Colors.green,
                  // decorationStyle: TextDecorationStyle.dashed,
                  letterSpacing: 5.0),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )));
  }
}
