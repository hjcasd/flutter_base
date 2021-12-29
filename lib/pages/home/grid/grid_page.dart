import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/routes/app_routes.dart';

/// GridView页面
class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar("GridView的使用"),
        body: MyGridWidget(),
      ),
    );
  }
}

/// GridView: 网格组件
class MyGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          RouteButton(
            "Count网格",
            Routes.GridCount,
          ),
          RouteButton(
            "Builder网格",
            Routes.GridBuilder,
          ),
        ],
      ),
    );
  }
}
