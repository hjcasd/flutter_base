import 'package:flutter/material.dart';
import 'package:flutter_base/components/state/simple_state_view.dart';
import 'package:flutter_base/pages/setting/web/view/web_body_view.dart';
import 'package:get/get.dart';

import 'logic/web_controller.dart';

/// Web页面
class WebPage extends GetView<WebController> {
  @override
  Widget build(BuildContext context) {
    Get.put(WebController());
    return GetBuilder<WebController>(
      builder: (controller) {
        return SimpleStateView(
          state: controller.state,
          contentView: WebBodyView(),
        );
      },
    );
  }
}
