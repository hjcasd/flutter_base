import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/constants/app_constants.dart';

/// 动态列表页面
class ListDynamicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "动态列表",
      ),
      body: MyDynamicListView(),
    );
  }
}

class MyDynamicListView extends StatelessWidget {
  final List<String> list = [];

  MyDynamicListView() {
    for (var i = 0; i < 20; i++) {
      list.add("我是标题${i + 1}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // 列表方向
      scrollDirection: Axis.vertical,
      // 列表个数
      itemCount: list.length,
      // 子Item
      itemBuilder: (context, index) {
        return ImageItem(list[index]);
      },
    );
  }
}

/// 列表Item
class ImageItem extends StatelessWidget {
  final String _title;

  ImageItem(this._title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FadeInImage.assetNetwork(
          placeholder: "${AppConstants.assertImagePath}icon_test.png",
          image: AppConstants.netImageUrl1,
          fit: BoxFit.cover,
        ),
        Container(
          child: Text(
            _title,
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
      ],
    );
  }
}
