import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/pages/other/user/logic/user_controller.dart';
import 'package:flutter_base/pages/other/user/view/user_body_view.dart';
import 'package:get/get.dart';

/// 用户信息页面
class UserPage extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar("用户信息"),
        body: GetBuilder<UserController>(
          builder: (controller) {
            if (controller.isInitialized) {
              return UserBodyView();
            } else {
              return Container(
                color: AppColors.grey_E5E5E5,
              );
            }
          },
        ),
      ),
    );
  }
}
