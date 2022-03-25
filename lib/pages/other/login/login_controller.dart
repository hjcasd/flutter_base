import 'package:flutter/material.dart';
import 'package:flutter_base/data/login_entity.dart';
import 'package:flutter_base/network/service/api_service.dart';
import 'package:flutter_base/utils/get_helper.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 登录页面Controller
class LoginController extends GetxController {
  var name = "".obs;
  var password = "".obs;

  @override
  void onInit() {
    super.onInit();
    LogHelper.e("LoginController", "onInit()...");
  }

  @override
  void onReady() {
    super.onReady();
    LogHelper.e("LoginController", "onReady()...");
  }

  @override
  void onClose() {
    super.onClose();
    LogHelper.e("LoginController", "onClose()...");
  }

  /// 登录
  void login() async {
    if (name.isEmpty) {
      GetHelper.showSnackBar("请输入用户名");
      return;
    }
    if (password.isEmpty) {
      GetHelper.showSnackBar("请输入密码");
      return;
    }

    var data = await ApiService.login(name.value, password.value);
    var entity = LoginEntity.fromJson(data);
    name.value = "";
    password.value = "";
    LogHelper.e("login info", "name: ${entity.data?.username}");
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }
}
