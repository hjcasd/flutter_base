import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';

/// Stack + Align页面
class StackAlignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "Stack + Align",
        ),
        body: MyStackAlign(),
      ),
    );
  }
}

/// Stack + Align 实现定位布局
class MyStackAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.green,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(-0.5, -1),
            child: Text(
              "111",
            ),
          ),
          Align(
            alignment: Alignment(0.5, -1),
            child: Text(
              "222",
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "333",
            ),
          ),
          Align(
            alignment: Alignment(-0.5, 1),
            child: Text(
              "444",
            ),
          ),
          Align(
            alignment: Alignment(0.5, 1),
            child: Text(
              "555",
            ),
          ),
        ],
      ),
    );
  }
}
