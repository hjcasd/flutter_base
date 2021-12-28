import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// 动态列表页面
class ListDynamicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("动态列表", MyDynamicListWidget());
  }
}

class MyDynamicListWidget extends StatelessWidget {
  final List<String> list = [];

  MyDynamicListWidget() {
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
        return ImageItemWidget(list[index]);
      },
    );
  }
}

/// 列表Item
class ImageItemWidget extends StatelessWidget {
  final String _title;

  ImageItemWidget(this._title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FadeInImage.assetNetwork(
          placeholder: "assets/images/test.png",
          image: "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg",
          fit: BoxFit.cover,
        ),
        Container(
          child: Text(
            _title,
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        ),
      ],
    );
  }
}
