import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// 找不到路由后的默认页面
class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "未知页面",
      ),
      body: Container(
        child: Center(
          child: Text(
            'NotFound Page',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
        ),
        color: AppColors.blue,
      ),
    );
  }
}
