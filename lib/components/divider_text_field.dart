import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 带下划线的TextField
class DividerTextField extends StatelessWidget {
  final String value;
  final double height;
  final double margin;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLength;
  final FocusNode? focusNode;
  final String? hintText;
  final IconData? prefixIcon;
  final double prefixIconSize;
  final Function? onClear;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  DividerTextField(
    this.value, {
    this.height = 50.0,
    this.margin = 10.0,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.focusNode,
    this.maxLength,
    this.hintText,
    this.prefixIcon,
    this.prefixIconSize = 20.0,
    this.onClear,
    this.controller,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.all(margin),
      child: Column(
        children: [
          TextField(
            keyboardType: keyboardType,
            obscureText: obscureText,
            focusNode: focusNode,
            maxLength: maxLength,
            decoration: InputDecoration(
              counterText: "",
              hintText: hintText,
              icon: Icon(
                prefixIcon,
                size: prefixIconSize,
              ),
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                child: Offstage(
                  child: Icon(
                    Icons.clear,
                  ),
                  offstage: value == null || value == "",
                ),
                onTap: () {
                  onClear!();
                },
              ),
            ),
            controller: controller,
            onChanged: onChanged,
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
