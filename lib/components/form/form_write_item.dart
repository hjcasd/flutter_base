import 'package:flutter/material.dart';
import 'package:flutter_base/theme/AppColors.dart';

/// 表单编辑Item
class FormWriteItem extends StatefulWidget {
  /// 左侧标题
  final String title;

  /// 输入框内容
  final String value;

  /// 输入框占位文本
  final String placeholder;

  /// 键盘输入类型
  final TextInputType? keyboardType;

  /// 底部提示文本
  final String tip;

  /// 右侧文本
  final String operate;

  /// 是否隐藏底部下划线
  final bool isHideDivider;

  /// 输入框控制器
  final TextEditingController? controller;

  /// 输入框文本变化监听回调
  final ValueChanged<String>? onChanged;

  /// 输入框清除回调
  final VoidCallback? onClear;

  /// 右侧文本点击事件回调
  final VoidCallback? onOperatePressed;

  FormWriteItem(
    this.title,
    this.value,
    this.placeholder, {
    this.keyboardType = TextInputType.text,
    this.tip = "",
    this.operate = "",
    this.isHideDivider = false,
    this.controller,
    this.onChanged,
    this.onClear,
    this.onOperatePressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FormWriteItemState();
  }
}

class _FormWriteItemState extends State<FormWriteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Stack(
        children: [
          _getItem(),
          _getDivider(),
        ],
      ),
    );
  }

  /// Item
  Widget _getItem() {
    return Positioned(
      child: Container(
        padding: EdgeInsets.fromLTRB(18, 18, 16, 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getTitle(),
            SizedBox(
              width: 40,
            ),
            _getContent(),
            _getOperate(),
          ],
        ),
      ),
    );
  }

  /// 左侧标题
  Widget _getTitle() {
    return Container(
      width: 50,
      child: Text(
        widget.title,
      ),
    );
  }

  /// 中间内容和底部提示
  Widget _getContent() {
    return Expanded(
      flex: 1,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: TextField(
                keyboardType: widget.keyboardType,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  border: InputBorder.none,
                  hintText: widget.placeholder,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: AppColors.black_999999,
                  ),
                  suffixIconConstraints: BoxConstraints(maxHeight: 20),
                  suffixIcon: GestureDetector(
                    child: Offstage(
                      child: Icon(
                        Icons.clear,
                        size: 20,
                      ),
                      offstage: widget.value == "",
                    ),
                    onTap: widget.onClear,
                  ),
                ),
                controller: widget.controller,
                onChanged: widget.onChanged,
              ),
            ),
            Opacity(
              opacity: widget.tip == "" ? 0 : 1,
              child: Text(
                widget.tip,
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 右侧操作文本
  Widget _getOperate() {
    return Offstage(
      offstage: widget.operate == "",
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            widget.operate,
            style: TextStyle(
              color: AppColors.amber,
            ),
          ),
        ),
        onTap: widget.onOperatePressed,
      ),
    );
  }

  /// 下划线
  Widget _getDivider() {
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
