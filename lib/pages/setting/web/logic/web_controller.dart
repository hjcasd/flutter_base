import 'package:flutter_base/components/state/page_state.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Web页面Controller
class WebController extends GetxController {
  // 状态
  var state = PageState.LOADING;

  // 标题
  var title = "测试";

  // 链接地址
  var url = "";

  // WebView控制器
  WebViewController? _webViewController;

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

  /// 初始化Web
  void initWeb(WebViewController? webViewController) {
    _webViewController = webViewController;
  }

  /// 页面返回
  void goBack() async {
    if (await _webViewController?.canGoBack() == true) {
      await _webViewController?.goBack();
    } else {
      RouteManager.back();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
