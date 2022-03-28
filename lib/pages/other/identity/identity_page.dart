import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/pages/other/identity/identity_controller.dart';
import 'package:flutter_base/pages/other/identity/view/identity_body_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

/// 身份信息页面
class IdentityPage extends GetView<IdentityController> {
  @override
  Widget build(BuildContext context) {
    Get.put(IdentityController());
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar("身份信息"),
        body: GetBuilder<IdentityController>(
          init: IdentityController(),
          builder: (controller) {
            return IdentityBodyView();
          },
        ),
      ),
    );
  }
}
