import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// SimpleText: 基础Text封装的组件
class SimpleText extends StatefulWidget {
  // 文本
  final String text;

  // 文本字体大小
  final double fontSize;

  // 文本字体颜色
  final Color fontColor;

  // 透明度
  final double opacity;

  // 点击事件回调
  final VoidCallback? onPressed;

  SimpleText(
    this.text, {
    this.fontSize = 14,
    this.fontColor = AppColors.white,
    this.opacity = 1,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SimpleTextState();
  }
}

class _SimpleTextState extends State<SimpleText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Opacity(
        opacity: widget.opacity,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.fontSize,
            color: widget.fontColor,
          ),
        ),
      ),
      onTap: widget.onPressed,
    );
  }
}
