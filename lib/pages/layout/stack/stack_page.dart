import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/routes/app_routes.dart';

/// Stack + Align + Positioned页面
class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "Stack的使用",
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              RouteButton(
                "Stack + Positioned",
                Routes.StackPositioned,
              ),
              RouteButton(
                "Stack + Align",
                Routes.StackAlign,
              ),
              MyStack(),
            ],
          ),
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
