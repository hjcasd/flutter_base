import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// Stack页面
class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp(
      "Stack的使用",
      Column(
        children: [
          MyStackWidget(),
          SizedBox(
            height: 10.0,
          ),
          MyStackAlignWidget(),
          SizedBox(
            height: 10.0,
          ),
          MyStackPositionedWidget(),
        ],
      ),
    );
  }
}

/// Stack: 堆叠组件(类似于FrameLayout)
class MyStackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment(0, 0),
      children: <Widget>[
        Container(
          height: 160.0,
          width: 160.0,
          color: Colors.cyan,
        ),
        Container(
          height: 140.0,
          width: 140.0,
          color: Colors.amber,
        ),
        Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue,
        ),
        Text(
          "哈哈哈哈",
        ),
      ],
    );
  }
}

/// Stack + Align 实现定位布局
class MyStackAlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      width: 160.0,
      color: Colors.green,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "左上",
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "右上",
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "中间",
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "左下",
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "右下",
            ),
          ),
        ],
      ),
    );
  }
}

/// Stack + Positioned 实现定位布局
class MyStackPositionedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      width: 160.0,
      color: Colors.cyan,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 10,
            top: 10,
            child: Text(
              "左上",
            ),
          ),
          Positioned(
            right: 0,
            top: 30,
            child: Text(
              "右上",
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              "左下",
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0,
            child: Text(
              "右下",
            ),
          ),
        ],
      ),
    );
  }
}
