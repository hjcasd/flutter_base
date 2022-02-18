import 'package:flutter/material.dart';
import 'package:flutter_base/theme/app_colors.dart';
import 'package:flutter_base/routes/route_manager.dart';

/// RouteButton组件: 便捷带url跳转
class RouteButton extends StatefulWidget {
  /// 文本
  final String text;

  /// 路由地址
  final String url;

  /// 文本字体大小
  final double fontSize;

  /// 文本字体颜色
  final Color fontColor;

  /// 按钮颜色
  final Color backgroundColor;

  /// 按钮最小宽度
  final double minWidth;

  /// 按钮最小高度
  final double minHeight;

  RouteButton(
    this.text,
    this.url, {
    this.fontSize = 14,
    this.fontColor = AppColors.white,
    this.backgroundColor = AppColors.blue,
    this.minWidth = 200,
    this.minHeight = 36,
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
        RouteManager.jumpToNamedPage(widget.url);
      },
    );
  }
}
