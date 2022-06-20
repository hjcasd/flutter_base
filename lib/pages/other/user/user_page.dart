import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/components/app_bar/search_app_bar.dart';
import 'package:flutter_base/components/state/simple_state_view.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/pages/other/user/user_body_view.dart';
import 'package:flutter_base/pages/other/user/user_controller.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 用户信息页面
class UserPage extends StatelessWidget {
  // Controller
  final UserController _controller = Get.find<UserController>();

  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: SearchAppBar(
          backgroundColor: AppColors.greyF7F7F7,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
            onPressed: () {
              RouteManager.back();
            },
          ),
          hintText: "请输入关键字",
          controller: _searchTextController,
          onComplete: () {
            LogHelper.e("value: " + _searchTextController.value.text);
          },
        ),
        body: GetBuilder<UserController>(
          builder: (_) {
            return SimpleStateView(
              state: _controller.state,
              contentView: UserBodyView(),
            );
          },
        ),
      ),
    );
  }
}
