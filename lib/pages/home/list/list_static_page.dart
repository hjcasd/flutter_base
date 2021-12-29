import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';

/// 静态列表页面
class ListStaticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar("静态列表"),
        body: MyStaticListWidget(),
      ),
    );
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
            "http://pic1.win4000.com/wallpaper/b/58ca58d35d719.jpg",
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
            "http://pic1.win4000.com/wallpaper/5/58d1e4522374c.jpg",
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
