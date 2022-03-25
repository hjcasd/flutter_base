import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/constants/app_colors.dart';
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
            AppRoutes.Swiper,
            backgroundColor: AppColors.cyan,
          ),
          RouteButton(
            "Dio",
            AppRoutes.Dio,
            backgroundColor: AppColors.cyan,
          ),
          RouteButton(
            "GetX",
            AppRoutes.GetX,
            backgroundColor: AppColors.cyan,
          ),
          RouteButton(
            "Native",
            AppRoutes.Native,
            backgroundColor: AppColors.cyan,
          ),
        ],
      ),
    );
  }
}
