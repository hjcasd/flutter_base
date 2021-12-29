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
    LogHelper.e("CounterController", "onInit()...");
  }

  @override
  void onReady() {
    super.onReady();
    LogHelper.e("CounterController", "onReady()...");
  }

}
