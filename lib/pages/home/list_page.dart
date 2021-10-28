import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// ListView页面
class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("ListView的使用", MyDynamicListView());
  }
}

/// ListView: 列表组件
class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.green,
            size: 40,
          ),
          title: Text(
            "我是标题111111",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            "我是副标题22222222222222222",
          ),
        ),
        ListTile(
          trailing: Icon(
            Icons.settings,
            color: Colors.blue,
            size: 40,
          ),
          title: Text(
            "我是标题111111",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            "我是副标题22222222222222222",
          ),
        ),
        ListTile(
          leading: Image.network(
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg",
          ),
          title: Text(
            "我是标题111111",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            "我是副标题22222222222222222",
          ),
        ),
        ListTile(
          trailing: Image.network(
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg",
          ),
          title: Text(
            "我是标题111111",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            "我是副标题22222222222222222",
          ),
        ),
      ],
    );
  }
}

/// 动态列表(ListView.builder实现)
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
          placeholder: "images/test.png",
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
