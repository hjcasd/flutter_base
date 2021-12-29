import 'package:flutter/material.dart';

/// 表单条目编辑组件
class FormWriteItem extends StatelessWidget {
  final String title;
  final String value;
  final String placeholder;
  final TextInputType? keyboardType;
  final String tip;
  final String operate;
  final bool isHideDivider;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
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
                    Container(
                      child: TextField(
                        keyboardType: keyboardType,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          border: InputBorder.none,
                          hintText: placeholder,
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF999999),
                          ),
                          suffixIconConstraints: BoxConstraints(maxHeight: 20),
                          suffixIcon: GestureDetector(
                            child: Offstage(
                              child: Icon(
                                Icons.clear,
                                size: 20,
                              ),
                              offstage: value == "",
                            ),
                            onTap: onClear,
                          ),
                        ),
                        controller: controller,
                        onChanged: onChanged,
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
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    operate,
                    style: TextStyle(
                      color: Colors.amber,
                    ),
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
