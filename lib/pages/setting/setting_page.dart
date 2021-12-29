import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/routes/app_routes.dart';

/// 设置Tab页面
class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingPageState();
  }
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          RouteButton(
            "Swiper",
            Routes.Swiper,
            backgroundColor: Colors.cyan,
          ),
          RouteButton(
            "Dio",
            Routes.Dio,
            backgroundColor: Colors.cyan,
          ),
          RouteButton(
            "GetX",
            Routes.GetX,
            backgroundColor: Colors.cyan,
          ),
          RouteButton(
            "Native",
            Routes.Native,
            backgroundColor: Colors.cyan,
          ),
        ],
      ),
    );
  }
}
