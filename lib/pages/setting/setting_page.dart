import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/routes/route_paths.dart';

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
            RoutePaths.Swiper,
            backgroundColor: AppColors.cyan,
          ),
          RouteButton(
            "Dio",
            RoutePaths.Dio,
            backgroundColor: AppColors.cyan,
          ),
          RouteButton(
            "GetX",
            RoutePaths.GetX,
            backgroundColor: AppColors.cyan,
          ),
          RouteButton(
            "Native",
            RoutePaths.Native,
            backgroundColor: AppColors.cyan,
          ),
        ],
      ),
    );
  }
}
