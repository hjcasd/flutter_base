import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// GridView.builder实现网格页面
class GridBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("GridView.builder实现网格", MyBuilderGridWidget());
  }
}

class MyBuilderGridWidget extends StatelessWidget {
  final List<String> _listData = [];

  MyBuilderGridWidget() {
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
