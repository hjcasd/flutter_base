import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 身份信息页面Controller
class IdentityController extends GetxController {
  var name = "".obs;
  var phone = "".obs;

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

}
