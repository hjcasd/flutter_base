import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// DividerTextField: 带下划线的输入框组件
class DividerTextField extends StatefulWidget {
  // 输入框高度
  final double height;

  // 输入框外边距
  final double margin;

  // 是否为密码形式
  final bool obscureText;

  // 输入框最大输入长度
  final int? maxLength;

  // 输入框占位文本
  final String? hintText;

  // 输入框左侧图标
  final Widget? prefixIcon;

  // 键盘输入类型
  final TextInputType? keyboardType;

  // 输入框控制器
  final TextEditingController controller;

  // 输入框文本变化监听回调
  final ValueChanged<String>? onChanged;

  DividerTextField({
    required this.controller,
    this.height = 50,
    this.margin = 10,
    this.obscureText = false,
    this.maxLength,
    this.hintText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DividerTextField();
  }
}

class _DividerTextField extends State<DividerTextField> {
  bool _showDeleteIcon = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: EdgeInsets.all(widget.margin),
      child: Column(
        children: [
          _getTextFieldView(),
          _getDividerView(),
        ],
      ),
    );
  }

  /// 输入框
  Widget _getTextFieldView() {
    return TextField(
      maxLength: widget.maxLength,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        counterText: "",
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _showDeleteIcon ? _getDeleteView() : null,
        border: InputBorder.none,
      ),
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      onChanged: (value) {
        setState(() {
          _showDeleteIcon = value.isNotEmpty;
        });
        widget.onChanged!(value);
      },
    );
  }

  /// 删除图标
  Widget _getDeleteView() {
    return InkWell(
      onTap: () {
        setState(() {
          _showDeleteIcon = false;
          widget.controller.clear();
        });
      },
      child: Icon(
        Icons.clear,
      ),
    );
  }

  /// 下划线
  Widget _getDividerView() {
    return Divider(
      height: 1,
      color: AppColors.grey_E5E5E5,
    );
  }
}
