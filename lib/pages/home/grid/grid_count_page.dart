import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';

/// GridView.count实现网格页面
class GridCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar("GridView.count实现网格"),
        body: MyCountGridWidget(),
      ),
    );
  }
}

class MyCountGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // 每行个数
      crossAxisCount: 3,
      // 水平间距
      crossAxisSpacing: 5.0,
      // 垂直间距
      mainAxisSpacing: 10.0,
      // 宽高比
      childAspectRatio: 1,
      padding: EdgeInsets.all(10.0),
      children: _getData(),
    );
  }

  List<Widget> _getData() {
    List<Widget> list = [];
    for (var i = 0; i < 30; i++) {
      list.add(
        Card(
          child: Center(
            child: Text(
              "这是第${i + 1}条数据",
            ),
          ),
        ),
      );
    }
    return list;
  }
}
