import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// Container的使用
class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Container", MyContainer());
  }
}

// Container: 容器组件
class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 300.0,
      height: 300.0,
      padding: EdgeInsets.all(10.0),
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(
            color: Colors.green,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    ));
  }
}
