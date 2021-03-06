import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// Padding页面
class PaddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartAppBar(
        "Padding的使用",
      ),
      body: MyPadding(),
    );
  }
}

/// Padding: 内边距组件
class MyPadding extends StatelessWidget {
  List<Widget> _getData() {
    List<Widget> list = [];
    for (var i = 0; i < 30; i++) {
      list.add(
        Container(
          alignment: Alignment.center,
          color: AppColors.green,
          child: Text(
            "这是第${i + 1}条数据",
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 内边距
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: GridView.count(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        // 每行个数
        crossAxisCount: 3,
        // 水平间距
        crossAxisSpacing: 10,
        // 垂直间距
        mainAxisSpacing: 10,
        // 宽高比
        childAspectRatio: 1,
        children: _getData(),
      ),
    );
  }
}
