import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';

/// Stack + Align + Positioned页面
class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "Stack的使用",
        ),
        body: Column(
          children: [
            MyStack(),
            SizedBox(
              height: 10.0,
            ),
            MyStackAlign(),
            SizedBox(
              height: 10.0,
            ),
            MyStackPositioned(),
          ],
        ),
      ),
    );
  }
}

/// Stack: 堆叠组件(类似于FrameLayout)
class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0, 0),
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
class MyStackAlign extends StatelessWidget {
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
class MyStackPositioned extends StatelessWidget {
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
