import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/pages/other/picture/view/picture_body_view.dart';
import 'package:flutter_base/routes/route_paths.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:get/get.dart';

import 'logic/picture_controller.dart';

/// 图文列表页面
class PicturePage extends GetView<PictureController> {
  @override
  Widget build(BuildContext context) {
    Get.put(PictureController());
    return Scaffold(
      appBar: SimpleAppBar(
        "图文列表",
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {
              RouteManager.toNamed(RoutePaths.User);
            },
          )
        ],
      ),
      body: GetBuilder<PictureController>(
        builder: (controller) {
          return PictureBodyView();
        },
      ),
    );
  }
}
