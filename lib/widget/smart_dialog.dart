import 'package:flutter/material.dart';
import 'package:flutter_base/constants/AppColors.dart';

/// 自定义Dialog
class SmartDialog extends StatefulWidget {
  /// 标题
  final String title;

  /// 内容
  final String content;

  /// 确定按钮文本
  final String confirmText;

  /// 取消按钮文本
  final String cancelText;

  /// 是否可点击外部取消
  final bool cancelOutside;

  /// 点击确定按钮回调
  final VoidCallback? confirmCallback;

  /// 点击取消按钮
  final VoidCallback? cancelCallback;

  SmartDialog({
    this.title = "",
    this.content = "",
    this.confirmText = "确定",
    this.cancelText = "",
    this.cancelOutside = true,
    this.confirmCallback,
    this.cancelCallback,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SmartDialogState();
  }
}

/// State
class _SmartDialogState extends State<SmartDialog> {
  @override
  Widget build(BuildContext context) {
    var dialogWidth = MediaQuery.of(context).size.width * 0.85;
    return GestureDetector(
      onTap: _onOutsideTap,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            width: dialogWidth,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(2.5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _getCloseView(),
                _getTitleView(),
                _getContentView(),
                _getButtonGroupView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 关闭按钮
  Widget _getCloseView() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Stack(
        children: <Widget>[
          Align(
            child: InkWell(
              child: Icon(
                Icons.close,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }

  /// 标题
  Widget _getTitleView() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Text(
        widget.title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
      ),
    );
  }

  /// 内容
  Widget _getContentView() {
    return Container(
      margin: EdgeInsets.fromLTRB(28, 15, 28, 36),
      child: Text(
        widget.content,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }

  /// 按钮组
  Widget _getButtonGroupView() {
    List<Widget> childrenList = [];
    childrenList.add(_getConfirmTextView());
    if (widget.cancelText != "") {
      childrenList.add(SizedBox(width: 10));
      childrenList.add(_getCancelTextView());
    }
    return Container(
      width: double.infinity,
      color: AppColors.grey_F7F7F7,
      padding: EdgeInsets.fromLTRB(28, 15, 28, 15),
      child: Row(
        children: childrenList,
      ),
    );
  }

  /// 确定按钮
  Widget _getConfirmTextView() {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            widget.confirmText,
            style: TextStyle(
              fontSize: 15,
              color: AppColors.white,
            ),
          ),
          decoration: BoxDecoration(
            color: AppColors.blue_1A3B64,
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
        onTap: _onConfirmTap,
      ),
    );
  }

  /// 取消按钮
  Widget _getCancelTextView() {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            widget.cancelText,
            style: TextStyle(
              fontSize: 15,
              color: AppColors.white,
            ),
          ),
          decoration: BoxDecoration(
            color: AppColors.blue_1A3B64,
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
        onTap: _onCancelTap,
      ),
    );
  }

  /// 关闭弹框点击事件
  void _dismissDialog() {
    Navigator.of(context).pop();
  }

  /// 外部点击事件
  void _onOutsideTap() {
    if (widget.cancelOutside) {
      _dismissDialog();
    }
  }

  /// 确定按钮点击事件
  void _onConfirmTap() {
    _dismissDialog();
    if (widget.confirmCallback != null) {
      widget.confirmCallback!();
    }
  }

  /// 取消按钮点击事件
  void _onCancelTap() {
    _dismissDialog();
    if (widget.cancelCallback != null) {
      widget.cancelCallback!();
    }
  }
}
