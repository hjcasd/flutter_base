import 'package:flutter_base/pages/setting/get_x/get_x_controller.dart';
import 'package:get/get.dart';

/// GetX页面Binding
class GetXBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetXController>(() => GetXController());
  }
}
