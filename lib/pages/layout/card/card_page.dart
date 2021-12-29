import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';

/// Card页面
class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar("Card的使用"),
        body: MyCardWidget(),
      ),
    );
  }
}

// Card: 卡片组件
class MyCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      child: Card(
        // 阴影
        elevation: 15.0,
        // 圆角
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            "哈哈哈哈哈",
          ),
        ),
      ),
    );
  }
}
