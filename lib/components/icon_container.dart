import 'package:flutter/material.dart';
import 'package:flutter_base/theme/AppColors.dart';

/// 带图标的Container
class IconContainer extends StatelessWidget {
  /// 图标
  final IconData iconData;

  /// 背景颜色
  final backgroundColor;

  /// 图标大小
  final iconSize;

  IconContainer(
    this.iconData, {
    this.backgroundColor = AppColors.blue,
    this.iconSize = 32,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: backgroundColor,
      child: Center(
        child: Icon(
          iconData,
          size: iconSize,
          color: AppColors.white,
        ),
      ),
    );
  }
}
