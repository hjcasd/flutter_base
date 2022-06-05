import 'package:flutter_base/components/state/page_state.dart';
import 'package:get/get.dart';

/// Web页面Controller
class WebController extends GetxController {
  // 状态
  var state = PageState.LOADING;

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
      state = PageState.SUCCESS;
      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
