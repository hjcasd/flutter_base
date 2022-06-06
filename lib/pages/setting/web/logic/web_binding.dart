import 'package:flutter_base/pages/setting/web/logic/web_controller.dart';
import 'package:get/instance_manager.dart';

/// Web页面Binding
class WebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebController>(() => WebController());
  }
}
