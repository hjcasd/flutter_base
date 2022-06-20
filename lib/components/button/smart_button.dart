import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// SmartButton: 自定义按钮组件
class SmartButton extends StatefulWidget {
  // 文本
  final String text;

  // 文本字体大小
  final double fontSize;

  // 按钮可用时的文本颜色
  final Color fontColor;

  // 按钮不可用时的文本颜色
  final Color disabledFontColor;

  // 按钮可用时的背景颜色
  final Color backgroundColor;

  // 按钮不可用时的背景颜色
  final Color disabledBackgroundColor;

  // 宽度
  final double? width;

  // 高度
  final double? height;

  // 内边距
  final EdgeInsetsGeometry? padding;

  // 外边距
  final EdgeInsetsGeometry? margin;

  // 边框圆角
  final BorderRadiusGeometry? borderRadius;

  // 按钮是否不可用
  final bool isDisabled;

  // 点击事件回调
  final VoidCallback? onPressed;

  SmartButton(
    this.text, {
    this.fontSize = 14,
    this.fontColor = AppColors.white,
    this.disabledFontColor = AppColors.black999999,
    this.backgroundColor = AppColors.blue,
    this.disabledBackgroundColor = AppColors.greyBCBCBC,
    this.width,
    this.height,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    this.margin,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.isDisabled = false,
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
    return GestureDetector(
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: widget.width == null ? widget.padding : null,
        margin: widget.margin,
        alignment: widget.width != null ? Alignment.center : null,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.fontSize,
            color: widget.isDisabled ? widget.disabledFontColor : widget.fontColor,
          ),
        ),
        decoration: BoxDecoration(
          color: widget.isDisabled ? widget.disabledBackgroundColor : widget.backgroundColor,
          borderRadius: widget.borderRadius,
        ),
      ),
      onTap: () {
        if (!widget.isDisabled && widget.onPressed != null) {
          widget.onPressed!();
        }
      },
    );
  }
}
