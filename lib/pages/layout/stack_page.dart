import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// Stack的使用
class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Stack,Align,Positioned", MyStackPositioned());
  }
}

// Stack组件(堆叠,类似于FrameLayout)
class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment(0, 0),
      children: <Widget>[
        Container(
          height: 200.0,
          width: 200.0,
          color: Colors.cyan,
        ),
        Container(
          height: 180.0,
          width: 180.0,
          color: Colors.amber,
        ),
        Container(
          height: 160.0,
          width: 160.0,
          color: Colors.blue,
        ),
        Text(
          "哈哈哈哈",
        )
      ],
    );
  }
}

// Stack + Align 实现定位布局
class MyStackAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: 300.0,
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

// Stack + Positioned 实现定位布局
class MyStackPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: 300.0,
      color: Colors.green,
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
