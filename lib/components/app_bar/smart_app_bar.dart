import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/routes/route_manager.dart';

/// SmartAppBar: 基础AppBar封装的组件
class SmartAppBar extends StatefulWidget implements PreferredSizeWidget {
  // 高度
  final double height;

  // 标题
  final String text;

  // 字体大小
  final double fontSize;

  // 字体颜色
  final Color fontColor;

  // 背景颜色
  final Color backgroundColor;

  // 标题是否居中
  final bool isCenterTitle;

  // 左侧图标
  final IconData icon;

  // 点击事件回调
  final VoidCallback? onPressed;

  // 右侧图标
  final List<Widget>? actions;

  SmartAppBar(
    this.text, {
    this.height = 54,
    this.fontSize = 18,
    this.fontColor = AppColors.white,
    this.backgroundColor = AppColors.red,
    this.isCenterTitle = false,
    this.icon = Icons.arrow_back,
    this.actions,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SmartAppBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
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
          if (widget.onPressed != null) {
            widget.onPressed!();
          } else {
            RouteManager.goBack();
          }
        },
      ),
      actions: widget.actions,
    );
  }
}
