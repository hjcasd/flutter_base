import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// Controller
class GetXController extends GetxController {
  var count = 0;

  void increase() {
    ++count;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    LogHelper.e("onInit()...", tag: "GetXController");
  }

  @override
  void onReady() {
    super.onReady();
    LogHelper.e("onReady()...", tag: "GetXController");
  }
}
