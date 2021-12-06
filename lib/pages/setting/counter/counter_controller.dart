import 'package:get/get.dart';

/// 处理页面逻辑
class CounterController extends GetxController {
  var count = 0;

  void increase() {
    ++count;
    update();
  }
}
