import 'package:flutter/material.dart';
import 'package:flutter_base/adapter/image_title_item.dart';
import 'package:flutter_base/pages/other/picture/logic/picture_controller.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

/// 图文列表View
class PictureBodyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PictureController>(
      id: "list",
      init: PictureController(),
      builder: (controller) {
        return EasyRefresh(
          firstRefresh: true,
          onRefresh: () async {
            controller.refresh();
          },
          onLoad: () async {
            controller.loadMore();
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              String title = controller.listItems[index]["title"] ?? "";
              String imageUrl = controller.listItems[index]["imageUrl"] ?? "";
              String viewCount = controller.listItems[index]["viewCount"] ?? "";
              return ImageTitleItem(title, imageUrl, viewCount);
            },
            itemCount: controller.listItems.length,
          ),
        );
      },
    );
  }
}
