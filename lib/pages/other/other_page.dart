import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/routes/route_paths.dart';

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
            "弹框演示",
            RoutePaths.dialog,
            backgroundColor: AppColors.amber,
          ),
          RouteButton(
            "图文列表演示",
            RoutePaths.picture,
            backgroundColor: AppColors.amber,
          ),
          RouteButton(
            "登录案例演示",
            RoutePaths.login,
            backgroundColor: AppColors.amber,
          ),
          RouteButton(
            "用户信息演示",
            RoutePaths.user,
            backgroundColor: AppColors.amber,
          ),
        ],
      ),
    );
  }
}
