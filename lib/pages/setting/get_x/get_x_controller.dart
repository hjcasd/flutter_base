import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// Controller
class GetXController extends GetxController {
  var count = 0;

  @override
  void onReady() {
    super.onReady();
    LogHelper.e("GetxController onReady()...");

    var arguments = Get.arguments;
    LogHelper.e("value: ${arguments["value"]}");
  }

  @override
  void onClose() {
    super.onClose();
    LogHelper.e("GetxController onClose()...");
  }

  void increase() {
    ++count;
    update();
  }
}
