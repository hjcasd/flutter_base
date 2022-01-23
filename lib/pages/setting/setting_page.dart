import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/constants/AppColors.dart';
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
            backgroundColor: AppColors.cyan,
          ),
          RouteButton(
            "Dio",
            Routes.Dio,
            backgroundColor: AppColors.cyan,
          ),
          RouteButton(
            "GetX",
            Routes.GetX,
            backgroundColor: AppColors.cyan,
          ),
          RouteButton(
            "Native",
            Routes.Native,
            backgroundColor: AppColors.cyan,
          ),
        ],
      ),
    );
  }
}
