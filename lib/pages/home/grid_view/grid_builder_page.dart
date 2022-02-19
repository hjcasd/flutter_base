import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// GridView.builder实现网格页面
class GridBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "GridView.builder实现网格列表",
        ),
        body: MyBuilderGridView(),
      ),
    );
  }
}

class MyBuilderGridView extends StatelessWidget {
  final List<String> _listData = [];

  MyBuilderGridView() {
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
          color: AppColors.green,
          child: Text(
            _listData[index],
          ),
        );
      },
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // 每行个数
        crossAxisCount: 3,
        // 水平间距
        crossAxisSpacing: 10,
        // 垂直间距
        mainAxisSpacing: 10,
        // 宽高比
        childAspectRatio: 1,
      ),
    );
  }
}
