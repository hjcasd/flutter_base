import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// RichText页面
class RichTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("RichText的使用", MyRichTextWidget());
  }
}

/// RichText: 富文本组件
class MyRichTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: RichText(
        text: TextSpan(
          text: "我是富文本",
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 24.0,
          ),
          children: <TextSpan>[
            TextSpan(
              text: "哈哈哈",
              style: TextStyle(
                color: Colors.blue,
                fontStyle: FontStyle.italic,
                fontSize: 20.0,
              ),
            ),
            TextSpan(
              text: "呵呵呵",
              style: TextStyle(
                color: Colors.amberAccent,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
