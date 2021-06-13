import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// ListView的使用
class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("ListView", MyListView());
  }
}

// ListView: 列表组件
class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
            leading: Icon(Icons.settings, color: Colors.green, size: 40),
            title: Text(
              "我是标题111111",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            ),
            subtitle: Text("我是副标题22222222222222222")),
        ListTile(
            trailing: Icon(Icons.settings, color: Colors.blue, size: 40),
            title: Text(
              "我是标题111111",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            ),
            subtitle: Text("我是副标题22222222222222222")),
        ListTile(
            leading: Image.network(
                "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg"),
            title: Text(
              "我是标题111111",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            ),
            subtitle: Text("我是副标题22222222222222222")),
        ListTile(
            trailing: Image.network(
                "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg"),
            title: Text(
              "我是标题111111",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            ),
            subtitle: Text("我是副标题22222222222222222")),
        ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "我是标题111111",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            ),
            subtitle: Text("我是副标题22222222222222222")),
      ],
    );
  }
}

// 图片列表演示
class MyListView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        Image.network(
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg"),
        Container(
          child: Text("我是标题", textAlign: TextAlign.center),
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        ),
        Image.network(
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg"),
        Container(
          child: Text("我是标题", textAlign: TextAlign.center),
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        ),
        Image.network(
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg"),
        Container(
          child: Text("我是标题", textAlign: TextAlign.center),
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        ),
        Image.network(
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg"),
        Container(
          child: Text("我是标题", textAlign: TextAlign.center),
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        ),
        Image.network(
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg"),
        Container(
          child: Text("我是标题", textAlign: TextAlign.center),
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        ),
      ],
    );
  }
}

// 水平列表演示(高度自适应)
class MyListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child:  ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 180.0,
            color: Colors.yellow,
            padding: EdgeInsets.all(10.0),
          ),
          Container(
            width: 180.0,
            color: Colors.blue,
            padding: EdgeInsets.all(10.0),
          ),
          Container(
            width: 180.0,
            color: Colors.yellow,
            padding: EdgeInsets.all(10.0),
          ),
          Container(
            width: 180.0,
            color: Colors.blue,
            padding: EdgeInsets.all(10.0),
          ),
          Container(
            width: 180.0,
            color: Colors.yellow,
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }
}


// 动态列表(for循环实现)
class MyListView4 extends StatelessWidget {
  List<Widget> _getData() {
    List<Widget> list = [];
    for (var i = 0; i < 20; i++) {
      list.add(ListTile(
        title: Text(
          "我是标题${i + 1}",
          textAlign: TextAlign.center,
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: this._getData(),
    );
  }
}

// 动态列表(ListView.builder实现)
class MyListView5 extends StatelessWidget {
  final List<String> list = [];

  HomePage5() {
    for (var i = 0; i < 20; i++) {
      list.add("我是标题${i + 1}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(this.list[index], textAlign: TextAlign.center),
          );
        });
  }
}
