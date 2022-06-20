import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// SmartDialog: 自定义Dialog组件
class SmartDialog extends StatefulWidget {
  // 标题
  final String title;

  // 内容
  final String content;

  // 确定按钮文本
  final String confirmText;

  // 取消按钮文本
  final String cancelText;

  // 是否显示关闭图标
  final bool isShowClose;

  // 点击确定按钮回调
  final VoidCallback? onConfirmCallback;

  // 点击取消按钮回调
  final VoidCallback? onCancelCallback;

  SmartDialog({
    this.title = "",
    this.content = "",
    this.confirmText = "确定",
    this.cancelText = "",
    this.isShowClose = true,
    this.onConfirmCallback,
    this.onCancelCallback,
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
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: AppColors.white,
            width: dialogWidth,
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
    return Opacity(
      opacity: widget.isShowClose ? 1 : 0,
      child: Stack(
        children: <Widget>[
          Align(
            child: InkWell(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.close,
                ),
              ),
              onTap: () {
                if (widget.isShowClose) {
                  Navigator.pop(context);
                }
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
      margin: EdgeInsets.only(top: 5),
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
    if (widget.cancelText != "") {
      childrenList.add(_getCancelTextView());
    }
    childrenList.add(_getConfirmTextView());
    return Container(
      color: AppColors.greyF7F7F7,
      padding: EdgeInsets.fromLTRB(28, 15, 28, 15),
      child: Row(
        children: childrenList,
      ),
    );
  }

  /// 取消按钮
  Widget _getCancelTextView() {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 10),
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
            color: AppColors.blue1A3B64,
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
        onTap: _onCancelTap,
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
            color: AppColors.blue1A3B64,
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
        onTap: _onConfirmTap,
      ),
    );
  }

  /// 确定按钮点击事件
  void _onConfirmTap() {
    _dismissDialog();
    if (widget.onConfirmCallback != null) {
      widget.onConfirmCallback!();
    }
  }

  /// 取消按钮点击事件
  void _onCancelTap() {
    _dismissDialog();
    if (widget.onCancelCallback != null) {
      widget.onCancelCallback!();
    }
  }

  /// 关闭弹框点击事件
  void _dismissDialog() {
    Navigator.of(context).pop();
  }
}
