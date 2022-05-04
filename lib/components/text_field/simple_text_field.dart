import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/utils/log_helper.dart';

/// SimpleTextField: 简易TextField组件封装
class SimpleTextField extends StatefulWidget {
  // 输入框内容
  final String value;

  // 输入框左侧图标
  final Widget? prefixIcon;

  // 输入框占位文本
  final String placeholder;

  // 输入框最大输入长度
  final int? maxLength;

  // 是否为密码形式
  final bool obscureText;

  // 键盘输入类型
  final TextInputType keyboardType;

  // 输入格式
  final List<TextInputFormatter>? inputFormatters;

  // 输入框文本变化监听回调
  final ValueChanged<String> onChanged;

  // 输入框清除回调
  final VoidCallback? onClear;

  // 是否隐藏底部下划线
  final bool isHideDivider;

  SimpleTextField({
    required this.value,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.placeholder = "请输入",
    this.obscureText = false,
    this.maxLength,
    this.prefixIcon,
    this.inputFormatters,
    this.onClear,
    this.isHideDivider = false,
    key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SimpleTextFieldState();
  }
}

/// State
class _SimpleTextFieldState extends State<SimpleTextField> {
  // 当前内容
  var _content = "";

  // 输入框控制器
  var _editingController = TextEditingController();

  // 是否显示删除图标
  var _showDeleteIcon = false;

  // 焦点控制
  var _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _content = widget.value;
    _editingController.value = TextEditingValue(
      // 设置内容
      text: _content,
      // 保持光标在最后
      selection: TextSelection.fromPosition(
        TextPosition(
          affinity: TextAffinity.downstream,
          offset: _content.length,
        ),
      ),
    );

    // 监听输入框焦点变化
    _focusNode.addListener(() {
      LogHelper.e("focus: ${_focusNode.hasFocus}");
      setState(() {
        _showDeleteIcon = _content.isNotEmpty && _focusNode.hasFocus;
      });
    });
  }

  @override
  void didUpdateWidget(covariant SimpleTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _content = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Stack(
        children: [
          _getTextFieldView(),
          _getDividerView(),
        ],
      ),
    );
  }

  /// 输入框
  Widget _getTextFieldView() {
    return Positioned(
      child: Container(
        padding: EdgeInsets.all(15),
        child: TextField(
          // maxLength: widget.maxLength,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          focusNode: _focusNode,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            border: InputBorder.none,
            hintText: widget.placeholder,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black_999999,
            ),
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: BoxConstraints(),
            suffixIcon: _getClearView(),
            suffixIconConstraints: BoxConstraints(),
          ),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.black_333333,
          ),
          controller: _editingController,
          onChanged: (value) {
            setState(() {
              _content = value;
              _showDeleteIcon = value.isNotEmpty;
            });
            widget.onChanged(value);
            // inputFormatters
            _editingController.selection = TextSelection.fromPosition(
              TextPosition(
                offset: value.length,
                affinity: TextAffinity.upstream,
              ),
            );
          },
        ),
      ),
    );
  }

  /// 删除
  Widget _getClearView() {
    return GestureDetector(
      child: Visibility(
        child: Icon(
          Icons.clear,
          size: 15,
        ),
        visible: _showDeleteIcon,
      ),
      onTap: () {
        setState(() {
          _content = "";
          _showDeleteIcon = false;
        });
        _editingController.clear();
        if (widget.onClear != null) {
          widget.onClear!();
        }
      },
    );
  }

  /// 下划线
  Widget _getDividerView() {
    return Visibility(
      visible: !widget.isHideDivider,
      child: Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Divider(
          height: 0.5,
          color: AppColors.grey_E5E5E5,
        ),
      ),
    );
  }

  // 既然有监听当然也要有卸载，防止内存泄漏嘛
  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }
}
