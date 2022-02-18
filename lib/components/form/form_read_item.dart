import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/theme/app_colors.dart';

/// 表单展示Item
class FormReadItem extends StatefulWidget {
  /// 左侧标题
  final String title;

  /// 中间内容
  final String content;

  /// 底部提示文本
  final String tip;

  /// 右侧文本
  final String operate;

  /// 字体是否大号
  final bool isLarge;

  /// 是否隐藏底部下划线
  final bool isHideDivider;

  /// 右侧文本点击事件回调
  final VoidCallback? onOperatePressed;

  FormReadItem(
    this.title,
    this.content, {
    this.tip = "",
    this.operate = "",
    this.isLarge = false,
    this.isHideDivider = false,
    this.onOperatePressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FormReadItemState();
  }
}

class _FormReadItemState extends State<FormReadItem> {
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
            Text(
              widget.content,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.black,
                fontSize: widget.isLarge ? 18 : 14,
              ),
            ),
            Opacity(
              opacity: widget.tip == "" ? 0 : 1,
              child: Text(
                widget.tip,
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.red_CB1E36,
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
        child: Text(
          widget.operate,
          style: TextStyle(
            color: AppColors.amber,
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
