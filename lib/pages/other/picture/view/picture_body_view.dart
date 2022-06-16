import 'package:flutter/material.dart';
import 'package:flutter_base/adapter/image_title_item.dart';
import 'package:flutter_base/pages/other/picture/logic/picture_controller.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

/// 图文列表View
class PictureBodyView extends StatelessWidget {
  // Controller
  final PictureController _controller = Get.find<PictureController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PictureController>(
      id: "list",
      builder: (_) {
        return EasyRefresh(
          firstRefresh: true,
          onRefresh: () async {
            _controller.refresh();
          },
          onLoad: () async {
            _controller.loadMore();
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              String title = _controller.listItems[index]["title"] ?? "";
              String imageUrl = _controller.listItems[index]["imageUrl"] ?? "";
              String viewCount = _controller.listItems[index]["viewCount"] ?? "";
              return ImageTitleItem(title, imageUrl, viewCount);
            },
            itemCount: _controller.listItems.length,
          ),
        );
      },
    );
  }
}
