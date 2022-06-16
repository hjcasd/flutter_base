import 'package:flutter/material.dart';
import 'package:flutter_base/components/web/simple_web_view.dart';
import 'package:flutter_base/pages/setting/web/web_controller.dart';
import 'package:get/get.dart';

/// Web页面View
class WebBodyView extends StatelessWidget {
  // Controller
  final WebController _controller = Get.find<WebController>();

  @override
  Widget build(BuildContext context) {
    return SimpleWebView(
      title: _controller.title,
      url: _controller.url,
      onBackPressed: (webViewController) {
        _controller.initWeb(webViewController);
      },
    );
  }
}
