import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/constants/AppColors.dart';

/// 找不到路由后的默认页面
class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "未知页面",
        ),
        body: Container(
          child: Center(
            child: Text(
              'Unknown',
              style: TextStyle(
                fontSize: 20.0,
                color: AppColors.black,
              ),
            ),
          ),
          color: AppColors.blue,
        ),
      ),
    );
  }
}
