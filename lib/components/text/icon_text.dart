import 'package:flutter/material.dart';

/// 带图标的Text组件
class IconText extends StatefulWidget {
  /// 文本
  final String text;

  // 文本大小
  final double textSize;

  // 文本颜色
  final Color textColor;

  // 左侧图标
  final Widget? leftIcon;

  // 右侧图标
  final Widget? rightIcon;

  /// 文本和图标间距大小
  final double margin;

  final EdgeInsetsGeometry? padding;

  // 点击事件回调
  final VoidCallback? onPressed;

  const IconText(
    this.text, {
    this.textSize = 14,
    this.textColor = Colors.black,
    this.leftIcon,
    this.rightIcon,
    this.margin = 2,
    this.padding,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _IconTextState createState() => _IconTextState();
}

class _IconTextState extends State<IconText> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    // 文本
    var textWidget = Text(
      widget.text,
      style: TextStyle(
        fontSize: widget.textSize,
        color: widget.textColor,
      ),
    );

    // 间距
    var marginWidget = SizedBox(
      width: widget.margin,
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
        color: Colors.amber,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
      onTap: widget.onPressed,
    );
  }
}