import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// SmartCheckbox: 自定义Checkbox组件
// ignore: must_be_immutable
class SmartCheckbox extends StatefulWidget {
  // 是否选中
  var isSelected = false;

  // 未选中图标路径
  final String normalPath;

  // 选中图标路径
  final String selectedPath;

  // 图标大小
  final double size;

  // 是否选中回调
  final Function(bool value)? onChanged;

  SmartCheckbox(
    this.isSelected, {
    this.normalPath = "assets/images/icon_normal.png",
    this.selectedPath = "assets/images/icon_selected.png",
    this.size = 25,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SmartCheckboxState();
  }
}

class _SmartCheckboxState extends State<SmartCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: widget.isSelected ? _getImageView(widget.selectedPath) : _getImageView(widget.normalPath),
        ),
        onTap: () {
          widget.isSelected = !widget.isSelected;
          widget.onChanged!(widget.isSelected);
        },
      ),
    );
  }

  Widget _getImageView(String path) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Image.asset(
        path,
        fit: BoxFit.fill,
      ),
    );
  }
}
