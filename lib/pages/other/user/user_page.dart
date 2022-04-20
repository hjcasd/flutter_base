import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/search_app_bar.dart';
import 'package:flutter_base/components/default_body.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/pages/other/user/logic/user_controller.dart';
import 'package:flutter_base/pages/other/user/view/user_body_view.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 用户信息页面
class UserPage extends GetView<UserController> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return Scaffold(
      appBar: SearchAppBar(
        backgroundColor: AppColors.grey_F7F7F7,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            RouteManager.goBack();
          },
        ),
        hintText: "请输入关键字",
        controller: _searchController,
        onComplete: () {
          LogHelper.e("value: " + _searchController.value.text);
        },
      ),
      body: GetBuilder<UserController>(
        builder: (controller) {
          if (controller.isInitialized) {
            return UserBodyView();
          } else {
            return DefaultBody();
          }
        },
      ),
    );
  }
}
