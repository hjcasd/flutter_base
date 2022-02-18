import 'package:flutter/material.dart';
import 'package:flutter_base/theme/app_colors.dart';

/// 带下划线的输入框
class DividerTextField extends StatefulWidget {
  /// 输入框内容
  final String value;

  /// 输入框高度
  final double height;

  /// 输入框外边距
  final double margin;

  /// 隐藏文本
  final bool obscureText;

  /// 输入框最大输入长度
  final int? maxLength;

  /// 输入框占位文本
  final String? hintText;

  /// 左侧图标
  final IconData? prefixIcon;

  /// 左侧图标大小
  final double prefixIconSize;

  /// 输入框焦点
  final FocusNode? focusNode;

  /// 键盘输入类型
  final TextInputType? keyboardType;

  /// 输入框控制器
  final TextEditingController? controller;

  /// 输入框文本变化监听回调
  final ValueChanged<String>? onChanged;

  /// 输入框清除回调
  final VoidCallback? onClear;

  DividerTextField(
    this.value, {
    this.height = 50,
    this.margin = 10,
    this.obscureText = false,
    this.maxLength,
    this.hintText,
    this.prefixIcon,
    this.prefixIconSize = 20,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onChanged,
    this.onClear,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DividerTextField();
  }
}

class _DividerTextField extends State<DividerTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: EdgeInsets.all(widget.margin),
      child: Column(
        children: [
          _getTextField(),
          _getDivider(),
        ],
      ),
    );
  }

  /// 输入框
  Widget _getTextField() {
    return TextField(
      maxLength: widget.maxLength,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        counterText: "",
        hintText: widget.hintText,
        icon: Icon(
          widget.prefixIcon,
          size: widget.prefixIconSize,
        ),
        border: InputBorder.none,
        suffixIcon: GestureDetector(
          child: Offstage(
            child: Icon(
              Icons.clear,
            ),
            offstage: widget.value == "",
          ),
          onTap: widget.onClear,
        ),
      ),
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      onChanged: widget.onChanged,
    );
  }

  /// 下划线
  Widget _getDivider() {
    return Divider(
      height: 1,
      color: AppColors.grey_E5E5E5,
    );
  }
}
