import 'package:flutter/material.dart';
import 'package:flutter_base/theme/AppColors.dart';
import 'package:flutter_base/routes/route_manager.dart';

/// SmartAppBar组件: 基础AppBar封装
class SmartAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// 标题
  final String text;

  /// 字体大小
  final double fontSize;

  /// 字体颜色
  final Color fontColor;

  /// 背景颜色
  final Color backgroundColor;

  /// 标题是否居中
  final bool isCenterTitle;

  /// 左侧图标
  final IconData icon;

  SmartAppBar(
    this.text, {
    this.fontSize = 18,
    this.fontColor = AppColors.white,
    this.backgroundColor = AppColors.red,
    this.isCenterTitle = false,
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
      centerTitle: widget.isCenterTitle,
      title: Text(
        widget.text,
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
          RouteManager.goBack();
        },
      ),
    );
  }
}
