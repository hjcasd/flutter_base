import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// RouteButton组件: 便捷带url跳转
class RouteButton extends StatefulWidget {
  final String text;
  final String url;
  final double minWidth;
  final double minHeight;
  final Color backgroundColor;
  final double fontSize;
  final Color fontColor;

  RouteButton(
    this.text,
    this.url, {
    this.minWidth = 200,
    this.minHeight = 36,
    this.backgroundColor = Colors.blue,
    this.fontSize = 14,
    this.fontColor = Colors.white,
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
        minimumSize: MaterialStateProperty.all(
          Size(
            widget.minWidth,
            widget.minHeight,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
      ),
      onPressed: () {
        Get.toNamed(widget.url);
      },
    );
  }
}
