import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/routes/app_routes.dart';

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
          RouteButton(
            "Dialog演示",
            Routes.Dialog,
            backgroundColor: Colors.amber,
          ),
          RouteButton(
            "图文列表演示",
            Routes.Picture,
            backgroundColor: Colors.amber,
          ),
          RouteButton(
            "登录案例演示",
            Routes.Login,
            backgroundColor: Colors.amber,
          ),
          RouteButton(
            "身份信息演示",
            Routes.Identity,
            backgroundColor: Colors.amber,
          ),
        ],
      ),
    );
  }
}
