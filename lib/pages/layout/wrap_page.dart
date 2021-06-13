import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// Wrap的使用
class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Wrap", MyWrap());
  }
}

// Wrap组件
class MyWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.green,
      child: Wrap(
        // 布局方向
        direction: Axis.horizontal,
        // 水平间距
        spacing: 10.0,
        // 垂直间距
        runSpacing: 20.0,
        children: <Widget>[MyButton("斗罗大陆"), MyButton("武动乾坤"), MyButton("我师兄也太稳健了吧"), MyButton("万古神帝"), MyButton("圣墟")],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;

  MyButton(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(this.text),
      onPressed: () {},
    );
  }
}
