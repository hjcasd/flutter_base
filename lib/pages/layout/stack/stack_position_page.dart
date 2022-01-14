import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';

/// Stack + Positioned页面
class StackPositionedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "Stack + Positioned",
        ),
        body: MyStackPositioned(),
      ),
    );
  }
}

/// Stack + Positioned 实现定位布局
class MyStackPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              color: Colors.green,
            ),
          ),
          Positioned(
            left: 10,
            right: 20,
            top: 100,
            bottom: 0,
            child: Container(
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
