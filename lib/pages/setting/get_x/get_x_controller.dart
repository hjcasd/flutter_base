import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// Controller
class GetXController extends GetxController {
  var count = 0;

  @override
  void onInit() {
    super.onInit();
    LogHelper.e("onInit()...", tag: "GetXController");
    var arguments = Get.arguments;
    LogHelper.e("value: ${arguments["value"]}");
  }

  void increase() {
    ++count;
    update();
  }
}
