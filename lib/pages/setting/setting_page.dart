import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/routes/route_manager.dart';
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
            RoutePaths.swiper,
            backgroundColor: AppColors.cyan,
          ),
          RouteButton(
            "Dio",
            RoutePaths.dio,
            backgroundColor: AppColors.cyan,
          ),
          RouteButton(
            "GetX",
            RoutePaths.getX,
            backgroundColor: AppColors.cyan,
            onPressed: () {
              RouteManager.toNamed(RoutePaths.getX, params: {"value": "111111"});
            },
          ),
          RouteButton(
            "Native",
            RoutePaths.native,
            backgroundColor: AppColors.cyan,
          ),
          RouteButton(
            "Picker",
            RoutePaths.picker,
            backgroundColor: AppColors.cyan,
          ),
          RouteButton(
            "Web",
            RoutePaths.web,
            backgroundColor: AppColors.cyan,
            onPressed: () {
              RouteManager.jumpToWeb("百度一下", "https://www.baidu.com");
            },
          ),
        ],
      ),
    );
  }
}
