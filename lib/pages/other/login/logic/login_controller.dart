import 'package:flutter_base/model/login_entity.dart';
import 'package:flutter_base/network/service/api_service.dart';
import 'package:flutter_base/utils/get_helper.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 登录页面Controller
class LoginController extends GetxController {
  var name = "";
  var password = "";

  @override
  void onInit() {
    super.onInit();
    LogHelper.e("LoginController onInit()...");
  }

  @override
  void onClose() {
    super.onClose();
    LogHelper.e("LoginController onClose()...");
  }

  void changeName(String value) {
    this.name = value;
  }

  void changePassword(String value) {
    this.password = value;
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

    var data = await ApiService.login(name, password);
    var entity = LoginEntity.fromJson(data);
    LogHelper.e("name: ${entity.data?.username}", tag: "LoginController");
  }
}
