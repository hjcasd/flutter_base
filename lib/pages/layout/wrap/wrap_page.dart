import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';

/// Wrap页面
class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "Wrap的使用",
        ),
        body: MyWrap(),
      ),
    );
  }
}

/// Wrap: 流式布局组件
class MyWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      color: Colors.green,
      child: Wrap(
        // 布局方向
        direction: Axis.horizontal,
        // X轴对齐方式
        alignment: WrapAlignment.spaceBetween,
        // X轴子组件之间距离
        spacing: 10.0,
        children: <Widget>[
          MyButton("斗罗大陆"),
          MyButton("武动乾坤"),
          MyButton("我师兄也太稳健了吧"),
          MyButton("万古神帝"),
          MyButton("圣墟"),
        ],
      ),
    );
  }
}

/// 自定义Button
class MyButton extends StatelessWidget {
  final String text;

  MyButton(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
      ),
      onPressed: () {},
    );
  }
}
