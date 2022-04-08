import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_constants.dart';

/// SmartCheckbox: 自定义Checkbox组件
class SmartCheckbox extends StatefulWidget {
  // 是否选中
  final value;

  // 是否选中回调
  final ValueChanged<bool> onChanged;

  // 未选中图标路径
  final String normalPath;

  // 选中图标路径
  final String selectedPath;

  // 图标大小
  final double size;

  SmartCheckbox({
    required this.value,
    required this.onChanged,
    this.normalPath = "icon_normal.png",
    this.selectedPath = "icon_selected.png",
    this.size = 25,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SmartCheckboxState();
  }
}

class _SmartCheckboxState extends State<SmartCheckbox> {
  // 选中状态
  bool _isSelected = false;

  @override
  void didUpdateWidget(covariant SmartCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isSelected = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: _isSelected ? _getImageView(widget.selectedPath) : _getImageView(widget.normalPath),
        ),
        onTap: () {
          _isSelected = !_isSelected;
          widget.onChanged(_isSelected);
        },
      ),
    );
  }

  Widget _getImageView(String path) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Image.asset(
        "${AppConstants.ASSERT_IMAGE_PATH + path}",
        fit: BoxFit.fill,
      ),
    );
  }
}
