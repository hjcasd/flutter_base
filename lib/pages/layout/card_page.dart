import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// Card页面
class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Card的使用", MyCard());
  }
}

// Card: 卡片组件
class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      child: Card(
          elevation: 10.0,
          margin: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "哈哈哈哈哈",
            ),
          )),
    );
  }
}
