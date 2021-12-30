import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 身份信息页面Controller
class IdentityController extends GetxController {
  var _name = "";
  var _phone = "";

  String get name => _name;

  String get phone => _phone;

  @override
  void onInit() {
    super.onInit();
    LogHelper.e("IdentityController", "onInit()...");
  }

  @override
  void onReady() {
    super.onReady();
    LogHelper.e("IdentityController", "onReady()...");
  }

  /// 改变名字
  void changeName(String name) {
    _name = name;
    update(["name"]);
  }

  /// 改变手机号
  void changePhone(String phone) {
    _phone = phone;
    update(["phone"]);
  }

}
