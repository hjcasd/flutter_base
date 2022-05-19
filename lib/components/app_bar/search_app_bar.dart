import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// SearchAppBar: 自定义带搜索框的AppBar
class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  // 高度
  final double height;

  final Color backgroundColor;

  // 左侧返回组件
  final Widget leading;

  // 输入框提示文本
  final String hintText;

  // 输入框左侧组件
  final Widget? prefixIcon;

  // 输入框右侧组件
  final Widget? suffixIcon;

  // 输入框控制器
  final TextEditingController controller;

  // 输入完成回调
  final VoidCallback? onComplete;

  // 清除回调
  final VoidCallback? onClear;

  const SearchAppBar({
    required this.leading,
    required this.controller,
    this.height: 54.0,
    this.backgroundColor = AppColors.red,
    this.hintText: "",
    this.prefixIcon = const Icon(
      Icons.search,
      color: AppColors.black,
      size: 20,
    ),
    this.suffixIcon = const Icon(
      Icons.clear,
      size: 20,
      color: Colors.black,
    ),
    this.onComplete,
    this.onClear,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchAppBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _showDeleteIcon = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: SafeArea(
        child: Row(
          children: [
            widget.leading,
            _getTextFieldView(),
          ],
        ),
      ),
    );
  }

  /// 输入框
  Widget _getTextFieldView() {
    return Expanded(
      child: Container(
        height: 35,
        margin: EdgeInsets.fromLTRB(10, 0, 30, 0),
        child: TextField(
          maxLines: 1,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: AppColors.grey_BCBCBC,
              fontSize: 14,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: _showDeleteIcon ? _getDeleteView() : null,
            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            fillColor: AppColors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColors.white,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColors.white,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _showDeleteIcon = value.isNotEmpty;
            });
          },
          onEditingComplete: widget.onComplete,
        ),
      ),
    );
  }

  /// 删除图标
  Widget _getDeleteView() {
    return InkWell(
      onTap: () {
        setState(() {
          widget.controller.text = '';
          _showDeleteIcon = false;
        });
        if (widget.onClear != null) {
          widget.onClear!();
        }
      },
      child: widget.suffixIcon,
    );
  }
}
