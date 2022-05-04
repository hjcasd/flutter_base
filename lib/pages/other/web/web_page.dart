import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/default_body.dart';
import 'package:flutter_base/pages/other/web/logic/web_controller.dart';
import 'package:flutter_base/pages/other/web/view/web_body_view.dart';
import 'package:get/get.dart';

/// Web页面
class WebPage extends GetView<WebController> {

  @override
  Widget build(BuildContext context) {
    Get.put(WebController());
    return Scaffold(
      appBar: SmartAppBar(
        "Web页面",
      ),
      body: GetBuilder<WebController>(
        builder: (controller) {
          if (controller.isInitialized) {
            return WebBodyView();
          } else {
            return DefaultBody();
          }
        },
      ),
    );
  }
}
