import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// 静态列表页面
class ListStaticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("静态列表", MyStaticListWidget());
  }
}

class MyStaticListWidget extends StatelessWidget {
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