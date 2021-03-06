import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/utils/get_helper.dart';

/// RichText页面
class RichTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartAppBar(
        "RichText的使用",
        isCenterTitle: true,
      ),
      body: MyRichText(),
    );
  }
}

/// RichText: 富文本组件
class MyRichText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: RichText(
        text: TextSpan(
          text: "我是富文本",
          style: TextStyle(
            color: AppColors.green,
            fontSize: 24,
          ),
          children: <TextSpan>[
            TextSpan(
              text: "哈哈哈",
              style: TextStyle(
                color: AppColors.blue,
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  GetHelper.showSnackBar("哈哈哈");
                },
            ),
            TextSpan(
              text: "呵呵呵",
              style: TextStyle(
                color: AppColors.amber,
                fontWeight: FontWeight.w700,
                fontSize: 16,
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
