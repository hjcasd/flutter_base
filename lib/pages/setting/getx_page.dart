import 'package:flutter/material.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// GetX的使用
class GetXPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("GetX", MyGetX());
  }
}

class MyGetX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [LayoutUtils.generateButton(Routes.GetX, "打开新页面")],
    );
  }
}
