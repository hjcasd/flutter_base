import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// 找不到路由后的默认页面
class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("UnknownPage", MyUnknown());
  }
}

class MyUnknown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Unknown',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
      ),
      color: Colors.blue,
    );
  }
}
