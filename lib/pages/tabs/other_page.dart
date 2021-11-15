import 'package:flutter/material.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// 其他Tab页面
class OtherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OtherPageState();
  }
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          LayoutUtils.generateButton(Routes.DialogExample, "Dialog演示"),
          LayoutUtils.generateButton(Routes.ListExample, "图文列表演示"),
          LayoutUtils.generateButton(Routes.LoginExample, "登录案例演示"),
        ],
      ),
    );
  }
}
