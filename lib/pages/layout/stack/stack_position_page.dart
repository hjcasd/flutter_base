import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// Stack + Positioned页面
class StackPositionedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "Stack + Positioned",
      ),
      body: MyStackPositioned(),
    );
  }
}

/// Stack + Positioned 实现定位布局
class MyStackPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blue,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              color: AppColors.green,
            ),
          ),
          Positioned(
            left: 10,
            right: 20,
            top: 100,
            bottom: 0,
            child: Container(
              color: AppColors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
