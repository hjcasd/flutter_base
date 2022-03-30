import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/pages/other/login/logic/login_controller.dart';
import 'package:flutter_base/pages/other/login/view/login_body_view.dart';
import 'package:get/get.dart';

/// 登录页面
class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "登录页面",
        ),
        body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return LoginBodyView();
          },
        ),
      ),
    );
  }
}
