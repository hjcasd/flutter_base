import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/routes/route_paths.dart';

/// ListView页面
class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "ListView的使用",
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            RouteButton(
              "静态列表",
              RoutePaths.listStatic,
            ),
            RouteButton(
              "动态列表",
              RoutePaths.listDynamic,
            ),
          ],
        ),
      ),
    );
  }
}
