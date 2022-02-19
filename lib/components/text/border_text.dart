import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// 带边框的Text组件
class BorderText extends StatefulWidget {
  /// 文本
  final String text;

  /// 文本字体大小
  final double fontSize;

  /// 文本字体颜色
  final Color fontColor;

  /// 背景颜色
  final Color? backgroundColor;

  /// 内边距
  final EdgeInsetsGeometry? padding;

  /// 透明度
  final double opacity;

  /// 圆角大小
  final double radius;

  /// 边框宽度
  final double borderWidth;

  /// 边框颜色
  final Color borderColor;

  /// 边框样式
  final BorderStyle borderStyle;

  /// 点击事件回调
  final VoidCallback? onPressed;

  BorderText(
    this.text, {
    this.fontSize = 14,
    this.fontColor = AppColors.white,
    this.backgroundColor,
    this.padding,
    this.opacity = 1,
    this.radius = 0,
    this.borderWidth = 0,
    this.borderColor = AppColors.white,
    this.borderStyle = BorderStyle.solid,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BorderTextState();
  }
}

class _BorderTextState extends State<BorderText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Opacity(
        opacity: widget.opacity,
        child: Container(
          padding: widget.padding,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.fontSize,
              color: widget.fontColor,
            ),
          ),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                widget.radius,
              ),
            ),
            border: Border.all(
              color: widget.borderColor,
              width: widget.borderWidth,
              style: widget.borderStyle,
            ),
          ),
        ),
      ),
      onTap: widget.onPressed,
    );
  }
}
