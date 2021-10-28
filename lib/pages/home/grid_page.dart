import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// GridView页面
class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("GridView的使用", MyGridView());
  }
}

/// GridView: 网格组件(GridView.count实现)
class MyGridView extends StatelessWidget {
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

/// 动态网格组件(GridView.builder实现)
class MyGridView2 extends StatelessWidget {
  final List<String> _listData = [];

  MyGridView2() {
    for (var i = 0; i < 30; i++) {
      _listData.add("这是第${i + 1}条数据");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _listData.length,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          color: Colors.green,
          child: Text(
            _listData[index],
          ),
        );
      },
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // 每行个数
        crossAxisCount: 3,
        // 水平间距
        crossAxisSpacing: 10.0,
        // 垂直间距
        mainAxisSpacing: 10.0,
        // 宽高比
        childAspectRatio: 1,
      ),
    );
  }
}
