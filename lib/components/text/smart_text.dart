import 'package:flutter/material.dart';

/// SmartText组件: 基础Text封装
class SmartText extends StatefulWidget {
  /// 文本
  final String text;

  /// 文本字体大小
  final double fontSize;

  /// 文本字体颜色
  final Color fontColor;

  /// 点击事件回调
  final VoidCallback? onPressed;

  SmartText(
    this.text, {
    this.fontSize = 14,
    this.fontColor = Colors.white,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SmartTextState();
  }
}

class _SmartTextState extends State<SmartText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: widget.fontSize,
          color: widget.fontColor,
        ),
      ),
      onTap: widget.onPressed,
    );
  }
}