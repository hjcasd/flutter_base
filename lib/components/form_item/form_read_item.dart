import 'package:flutter/material.dart';

/// 表单条目展示组件
class FormReadItem extends StatelessWidget {
  final String title;
  final String content;
  final String tip;
  final String operate;
  final bool isLarge;
  final bool isHideDivider;
  final VoidCallback? onOperatePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          _getContentWidget(),
          _getDividerWidget(),
        ],
      ),
    );
  }

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

  /// 内容
  Widget _getContentWidget() {
    return Positioned(
      child: Container(
        padding: EdgeInsets.fromLTRB(18, 18, 16, 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              child: Text(
                title,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: isLarge ? 18 : 14,
                      ),
                    ),
                    Opacity(
                      opacity: tip == "" ? 0 : 1,
                      child: Text(
                        tip,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFFFE5500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Offstage(
              offstage: operate == "",
              child: GestureDetector(
                child: Text(
                  operate,
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
                onTap: onOperatePressed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 下划线
  Widget _getDividerWidget() {
    return Visibility(
      visible: !isHideDivider,
      child: Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Divider(
          height: 0.5,
          color: Color(0xFFE5E5E5),
        ),
      ),
    );
  }
}
