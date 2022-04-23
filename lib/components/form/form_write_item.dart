import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// FormWriteItem: 表单Item编辑组件
class FormWriteItem extends StatefulWidget {
  // 左侧标题
  final String title;

  // 输入框内容
  final String value;

  // 左侧标题宽度
  final double titleWidth;

  // 输入框占位文本
  final String placeholder;

  // 键盘输入类型
  final TextInputType keyboardType;

  // 输入格式
  final List<TextInputFormatter>? inputFormatters;

  // 输入框控制器
  final TextEditingController? controller;

  // 输入框文本变化监听回调
  final ValueChanged<String>? onChanged;

  // 输入框清除回调
  final VoidCallback? onClear;

  // 底部提示文本
  final String bottomTip;

  // 是否显示底部提示文本
  final bool isShowBottom;

  // 右侧组件
  final Widget? rightWidget;

  // 是否显示右侧组件
  final bool isShowRight;

  // 是否隐藏底部下划线
  final bool isHideDivider;

  FormWriteItem({
    required this.title,
    required this.value,
    required this.placeholder,
    this.titleWidth = 60,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.controller,
    this.onChanged,
    this.onClear,
    this.rightWidget,
    this.isShowRight = false,
    this.bottomTip = "",
    this.isShowBottom = false,
    this.isHideDivider = false,
    key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FormWriteItemState();
  }
}

/// State
class _FormWriteItemState extends State<FormWriteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Stack(
        children: [
          _getItemView(),
          _getDividerView(),
        ],
      ),
    );
  }

  /// Item
  Widget _getItemView() {
    return Positioned(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, widget.isShowBottom ? 5 : 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getTitleView(),
            _getContentView(),
            _getRightView(),
          ],
        ),
      ),
    );
  }

  /// 左侧标题
  Widget _getTitleView() {
    return Container(
      width: widget.titleWidth,
      child: Text(
        widget.title,
      ),
    );
  }

  /// 中间内容和底部提示
  Widget _getContentView() {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getTextFieldView(),
            _getBottomTipView(),
          ],
        ),
      ),
    );
  }

  /// 输入框
  Widget _getTextFieldView() {
    return Container(
      child: TextField(
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          border: InputBorder.none,
          hintText: widget.placeholder,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.black_999999,
          ),
          suffixIconConstraints: BoxConstraints(maxHeight: 20),
          suffixIcon: GestureDetector(
            child: Offstage(
              child: Icon(
                Icons.clear,
                size: 15,
              ),
              offstage: widget.value == "",
            ),
            onTap: widget.onClear,
          ),
        ),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.black_333333,
        ),
        controller: widget.controller,
        onChanged: widget.onChanged,
      ),
    );
  }

  /// 底部提示信息
  Widget _getBottomTipView() {
    return Visibility(
      visible: widget.isShowBottom,
      child: Text(
        widget.bottomTip,
        style: TextStyle(
          fontSize: 10,
          color: AppColors.gold_A89769,
        ),
      ),
    );
  }

  /// 右侧组件
  Widget _getRightView() {
    return Offstage(
      offstage: !widget.isShowRight,
      child: widget.rightWidget,
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
}
