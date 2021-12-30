import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// SmartAppBar组件: 基础AppBar封装
class SmartAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// 标题
  final String title;

  /// 背景颜色
  final Color backgroundColor;

  /// 字体大小
  final double fontSize;

  /// 字体颜色
  final Color fontColor;

  /// 左侧图标
  final IconData icon;

  SmartAppBar(
    this.title, {
    this.backgroundColor = Colors.red,
    this.fontSize = 18.0,
    this.fontColor = Colors.white,
    this.icon = Icons.arrow_back,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SmartAppBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _SmartAppBarState extends State<SmartAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: widget.fontSize,
          color: widget.fontColor,
        ),
      ),
      backgroundColor: widget.backgroundColor,
      leading: IconButton(
        icon: Icon(
          widget.icon,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
