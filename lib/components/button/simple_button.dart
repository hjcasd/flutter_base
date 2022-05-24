import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// SimpleButton: 基础Button封装的组件
class SimpleButton extends StatefulWidget {
  // 文本
  final String text;

  // 文本字体大小
  final double fontSize;

  // 文本字体颜色
  final Color fontColor;

  // 按钮颜色
  final Color backgroundColor;

  // 点击事件回调
  final VoidCallback? onPressed;

  SimpleButton(
    this.text, {
    this.fontSize = 14,
    this.fontColor = AppColors.white,
    this.backgroundColor = AppColors.red,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SimpleButtonState();
  }
}

class _SimpleButtonState extends State<SimpleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: widget.fontSize,
          color: widget.fontColor,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
      ),
      onPressed: widget.onPressed,
    );
  }
}
