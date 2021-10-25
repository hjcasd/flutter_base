import 'package:flutter/material.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// GetX页面
class GetXPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("GetX的使用", MyGetXWidget());
  }
}

class MyGetXWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutUtils.generateButton(Routes.Http, "打开新页面"),
      ],
    );
  }
}
