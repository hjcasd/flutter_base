import 'package:flutter/material.dart';
import 'package:flutter_base/adapter/image_title_item.dart';
import 'package:flutter_base/pages/other/picture/picture_controller.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

/// 图文列表View
class PictureBodyView extends GetView<PictureController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => EasyRefresh(
        firstRefresh: true,
        onRefresh: () async {
          controller.refresh();
        },
        onLoad: () async {
          controller.loadMore();
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ImageTitleItem(
              controller.listItems[index]["title"] as String,
              controller.listItems[index]["imageUrl"] as String,
              controller.listItems[index]["viewCount"] as int,
            );
          },
          itemCount: controller.listItems.length,
        ),
      ),
    );
  }
}
