import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/pages/other/identity_example/controller/identity_controller.dart';
import 'package:flutter_base/pages/other/identity_example/view/identity_body_view.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

/// 身份信息页面
class IdentityPage extends StatelessWidget {
  IdentityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
