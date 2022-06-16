import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/pages/other/picture/view/picture_body_view.dart';

/// 图文列表页面
class PicturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "图文列表",
      ),
      body: PictureBodyView(),
    );
  }
}
