import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// IconText: 带图标的Text组件
class IconText extends StatefulWidget {
  // 文本
  final String text;

  // 文本大小
  final double fontSize;

  // 文本颜色
  final Color fontColor;

  // 左侧图标
  final Widget? leftIcon;

  // 右侧图标
  final Widget? rightIcon;

  // 文本和图标间距大小
  final double drawableMargin;

  // 内边距
  final EdgeInsetsGeometry? padding;

  // 点击事件回调
  final VoidCallback? onPressed;

  const IconText(
    this.text, {
    this.fontSize = 14,
    this.fontColor = AppColors.black,
    this.leftIcon,
    this.rightIcon,
    this.drawableMargin = 2,
    this.padding,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IconTextState();
}

class _IconTextState extends State<IconText> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    // 文本
    var textWidget = Text(
      widget.text,
      style: TextStyle(
        fontSize: widget.fontSize,
        color: widget.fontColor,
      ),
    );

    // 间距
    var marginWidget = SizedBox(
      width: widget.drawableMargin,
    );

    // 左侧图标布局
    if (widget.leftIcon != null) {
      children.add(widget.leftIcon!);
      children.add(marginWidget);
      children.add(textWidget);
    }

    // 右侧图标布局
    if (widget.rightIcon != null) {
      children.add(textWidget);
      children.add(marginWidget);
      children.add(widget.rightIcon!);
    }

    return GestureDetector(
      child: Container(
        padding: widget.padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
      onTap: widget.onPressed,
    );
  }
}
