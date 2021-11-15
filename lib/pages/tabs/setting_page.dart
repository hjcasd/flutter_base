import 'package:flutter/material.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/utils/layout_utils.dart';

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
          LayoutUtils.generateButton(Routes.Swiper, "Swiper"),
          LayoutUtils.generateButton(Routes.Http, "Http"),
          LayoutUtils.generateButton(Routes.Dio, "Dio"),
          LayoutUtils.generateButton(Routes.GetX, "GetX"),
          LayoutUtils.generateButton(Routes.Native, "Native"),
        ],
      ),
    );
  }
}
