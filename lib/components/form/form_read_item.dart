import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// FormReadItem: 表单展示Item组件
class FormReadItem extends StatefulWidget {
  // 左侧标题
  final String title;

  // 中间内容
  final String content;

  // 左侧标题宽度
  final double titleWidth;

  // 字体粗细
  final FontWeight fontWeight;

  // 底部提示文本
  final String bottomTip;

  // 是否显示底部提示文本
  final bool isShowBottomTip;

  // 是否隐藏底部下划线
  final bool isHideDivider;

  FormReadItem({
    required this.title,
    required this.content,
    this.titleWidth = 60,
    this.fontWeight = FontWeight.w400,
    this.bottomTip = "",
    this.isShowBottomTip = false,
    this.isHideDivider = false,
    key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FormReadItemState();
  }
}

/// State
class _FormReadItemState extends State<FormReadItem> {
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
        padding: EdgeInsets.fromLTRB(20, 20, 20, widget.isShowBottomTip ? 5 : 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getTitleView(),
            _getContentView(),
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
            Text(
              widget.content,
              style: TextStyle(
                fontWeight: widget.fontWeight,
                color: AppColors.black333333,
              ),
            ),
            Visibility(
              visible: widget.isShowBottomTip,
              child: Text(
                widget.bottomTip,
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.goldA89769,
                ),
              ),
            ),
          ],
        ),
      ),
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
          color: AppColors.greyE5E5E5,
        ),
      ),
    );
  }
}
