import 'package:flutter_base/pages/other/login/logic/login_controller.dart';
import 'package:get/instance_manager.dart';

/// 登录页面Binding
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
