import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/pages/other/picture/picture_controller.dart';
import 'package:flutter_base/pages/other/picture/view/picture_body_view.dart';
import 'package:get/get.dart';

/// 图文列表页面
class PicturePage extends GetView<PictureController> {
  @override
  Widget build(BuildContext context) {
    Get.put(PictureController());
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "图文列表",
        ),
        body: GetBuilder<PictureController>(
          init: PictureController(),
          builder: (controller) {
            return PictureBodyView();
          },
        ),
      ),
    );
  }
}
