import 'package:flutter/material.dart';

/// 自定义组件
class IconContainer extends StatelessWidget {
  final IconData icon;
  final color;
  final size;

  IconContainer(this.icon, {this.size = 32.0, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: this.color,
      child: Center(
        child: Icon(
          this.icon,
          size: this.size,
          color: Colors.white,
        ),
      ),
    );
  }
}
