import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/routes/route_manager.dart';

/// RouteButton: 便捷带路由地址跳转的按钮组件
class RouteButton extends StatefulWidget {
  // 文本
  final String text;

  // 路由地址
  final String url;

  // 文本字体大小
  final double fontSize;

  // 文本字体颜色
  final Color fontColor;

  // 按钮颜色
  final Color backgroundColor;

  // 按钮最小宽度
  final double minWidth;

  // 按钮最小高度
  final double minHeight;

  // 点击事件回调
  final VoidCallback? onPressed;

  RouteButton(
    this.text,
    this.url, {
    this.fontSize = 14,
    this.fontColor = AppColors.white,
    this.backgroundColor = AppColors.blue,
    this.minWidth = 200,
    this.minHeight = 36,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RouteButtonState();
  }
}

class _RouteButtonState extends State<RouteButton> {
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
        minimumSize: MaterialStateProperty.all(Size(widget.minWidth, widget.minHeight)),
        backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
      ),
      onPressed: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
        } else {
          RouteManager.jumpToNamedPage(widget.url);
        }
      },
    );
  }
}
