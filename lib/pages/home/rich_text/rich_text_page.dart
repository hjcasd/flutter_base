import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/utils/get_helper.dart';

/// RichText页面
class RichTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "RichText的使用",
          isCenterTitle: true,
        ),
        body: MyRichText(),
      ),
    );
  }
}

/// RichText: 富文本组件
class MyRichText extends StatelessWidget {
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
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  GetHelper.showSnackBar("哈哈哈");
                },
            ),
            TextSpan(
              text: "呵呵呵",
              style: TextStyle(
                color: Colors.amberAccent,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  GetHelper.showSnackBar("呵呵呵");
                },
            ),
          ],
        ),
      ),
    );
  }
}
