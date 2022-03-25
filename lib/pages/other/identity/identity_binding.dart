import 'package:flutter_base/pages/other/identity/identity_controller.dart';
import 'package:get/instance_manager.dart';

/// 身份信息页面Binding
class IdentityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IdentityController>(() => IdentityController());
  }
}
