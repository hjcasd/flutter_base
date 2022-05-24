import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// Text页面
class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "Text的使用",
      ),
      body: MyText(),
    );
  }
}

/// Text: 文本组件
/// 在 Widget 树中，文本的样式默认是可以被继承的（子类文本类组件未指定具体样式时可以使用 Widget 树中父级设置的默认样式），
/// 因此，如果在 Widget 树的某一个节点处设置一个默认的文本样式，那么该节点的子树中所有文本都会默认使用这个样式，而DefaultTextStyle正是用于设置默认文本样式的
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        padding: EdgeInsets.all(10),
        color: AppColors.amber,
        child: Text(
          "我是一个文本组件， 我是一个文本组件，我是一个文本组件",
          // 对齐方式
          textAlign: TextAlign.left,
          style: TextStyle(
            // 字体大小
            fontSize: 20,
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
            letterSpacing: 2,
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
