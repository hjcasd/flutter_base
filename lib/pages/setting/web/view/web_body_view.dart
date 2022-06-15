import 'package:flutter/material.dart';
import 'package:flutter_base/components/web/simple_web_view.dart';
import 'package:flutter_base/pages/setting/web/logic/web_controller.dart';
import 'package:get/get.dart';

/// Web页面View
class WebBodyView extends GetView<WebController> {
  @override
  Widget build(BuildContext context) {
    return SimpleWebView(
      title: controller.title,
      url: controller.url,
      onBackPressed: (webViewController) {
        controller.initWeb(webViewController);
      },
    );
  }
}
