import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// Wrap页面
class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Wrap的使用", MyWrap());
  }
}

/// Wrap: 流式布局组件
class MyWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          MyButtonWidget("斗罗大陆"),
          MyButtonWidget("武动乾坤"),
          MyButtonWidget("我师兄也太稳健了吧"),
          MyButtonWidget("万古神帝"),
          MyButtonWidget("圣墟"),
        ],
      ),
    );
  }
}

/// 自定义Button
class MyButtonWidget extends StatelessWidget {
  final String text;

  MyButtonWidget(this.text, {Key? key}) : super(key: key);

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
