import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';

/// 动态列表页面
class ListDynamicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "动态列表",
        ),
        body: MyDynamicListView(),
      ),
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
          placeholder: "assets/images/icon_test.png",
          image: "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg",
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
