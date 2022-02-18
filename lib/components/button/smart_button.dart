import 'package:flutter/material.dart';
import 'package:flutter_base/theme/app_colors.dart';

/// SmartButton组件: 基础Button封装
class SmartButton extends StatefulWidget {
  /// 文本
  final String text;

  /// 文本字体大小
  final double fontSize;

  /// 文本字体颜色
  final Color fontColor;

  /// 按钮颜色
  final Color backgroundColor;

  /// 点击事件回调
  final VoidCallback? onPressed;

  SmartButton(
    this.text, {
    this.fontSize = 14,
    this.fontColor = AppColors.white,
    this.backgroundColor = AppColors.red,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SmartButtonState();
  }
}

class _SmartButtonState extends State<SmartButton> {
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
