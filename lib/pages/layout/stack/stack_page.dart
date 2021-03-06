import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/routes/app_routes.dart';

/// Stack + Align + Positioned页面
class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartAppBar(
        "Stack的使用",
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            RouteButton(
              "Stack + Positioned",
              AppRoutes.StackPositioned,
            ),
            RouteButton(
              "Stack + Align",
              AppRoutes.StackAlign,
            ),
            MyStack(),
          ],
        ),
      ),
    );
  }
}

/// Stack: 堆叠组件(类似于FrameLayout)
class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0, 0),
      children: <Widget>[
        Container(
          height: 160,
          width: 160,
          color: AppColors.green,
        ),
        Container(
          height: 140,
          width: 140,
          color: AppColors.amber,
        ),
        Container(
          height: 120,
          width: 120,
          color: AppColors.blue,
        ),
        Text(
          "哈哈哈哈",
        ),
      ],
    );
  }
}
