import 'package:flutter/material.dart';

/// 带下划线的TextField
class DividerTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final InputDecoration inputDecoration;
  final FocusNode focusNode;
  final Function onChanged;
  final TextEditingController controller;
  final double height;

  DividerTextField(
    this.keyboardType, {
    this.inputDecoration,
    this.focusNode,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: inputDecoration,
            focusNode: focusNode,
            controller: controller,
            onChanged: onChanged,
          ),
          Divider(
            height: 1.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
