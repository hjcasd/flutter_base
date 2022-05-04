import 'package:get/get.dart';

/// Web页面Controller
class WebController extends GetxController {
  // 是否已初始化
  var isInitialized = false;

  // 标题
  var title = "";

  // 链接地址
  var url = "";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    var arguments = Get.arguments;
    if (arguments != null && arguments is Map) {
      title = arguments["title"];
      url = arguments["url"];
      isInitialized = true;
      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
