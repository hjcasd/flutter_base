import 'package:flutter/material.dart';
import 'package:flutter_base/data/entity/login_entity.dart';
import 'package:flutter_base/network/service/api_service.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 登录页面Controller
class LoginController extends GetxController {
  var _name = "";
  var _password = "";

  String get name => _name;

  String get password => _password;

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
    var data = await ApiService.login(_name, _password);
    var entity = LoginEntity.fromJson(data);
    LogHelper.e("login info", "name: ${entity.data?.username}");
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  /// 改变名字
  void changeName(String name) {
    _name = name;
    // 局部更新
    update(["name"]);
  }

  /// 改变密码
  void changePassword(String password) {
    _password = password;
    update(["password"]);
  }
}
