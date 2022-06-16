import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/components/state/simple_state_view.dart';
import 'package:flutter_base/pages/setting/web/logic/web_controller.dart';
import 'package:flutter_base/pages/setting/web/view/web_body_view.dart';
import 'package:get/get.dart';

/// Web页面
class WebPage extends StatelessWidget {
  // Controller
  final WebController _controller = Get.find<WebController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebController>(
      builder: (_) {
        return Scaffold(
          appBar: SimpleAppBar(
            _controller.title,
            onPressed: () async {
              _controller.goBack();
            },
          ),
          body: SimpleStateView(
            state: _controller.state,
            contentView: WebBodyView(),
          ),
        );
      },
    );
  }
}
