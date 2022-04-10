import 'package:flutter/material.dart';
import 'package:flutter_base/data/login_entity.dart';
import 'package:flutter_base/network/service/api_service.dart';
import 'package:flutter_base/utils/get_helper.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 登录页面Controller
class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    LogHelper.e("onInit()...", tag: "LoginController");
  }

  @override
  void onReady() {
    super.onReady();
    LogHelper.e("onReady()...", tag: "LoginController");
  }

  @override
  void onClose() {
    super.onClose();
    LogHelper.e("onClose()...", tag: "LoginController");
  }

  /// 登录
  void login(TextEditingController nameController, TextEditingController passwordController) async {
    String name = nameController.value.text;
    String password = passwordController.value.text;

    if (name.isEmpty) {
      GetHelper.showSnackBar("请输入用户名");
      return;
    }
    if (password.isEmpty) {
      GetHelper.showSnackBar("请输入密码");
      return;
    }

    var data = await ApiService.login(name, password);
    var entity = LoginEntity.fromJson(data);
    LogHelper.e("name: ${entity.data?.username}", tag: "LoginController");

    nameController.clear();
    passwordController.clear();
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }
}
