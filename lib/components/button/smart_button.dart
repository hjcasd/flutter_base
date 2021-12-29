import 'package:flutter/material.dart';

/// SmartButton组件: 基础Button封装
class SmartButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final double fontSize;
  final Color fontColor;
  final VoidCallback? onPressed;

  SmartButton(
    this.text, {
    this.backgroundColor = Colors.blue,
    this.fontSize = 14.0,
    this.fontColor = Colors.white,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SmartButtonState();
  }
}

class _SmartButtonState extends State<SmartButton> {
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
        backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
      ),
      onPressed: widget.onPressed,
    );
  }
}
