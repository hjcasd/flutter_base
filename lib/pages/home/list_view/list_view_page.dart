import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/routes/app_routes.dart';

/// ListView页面
class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "ListView的使用",
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              RouteButton(
                "静态列表",
                AppRoutes.ListStatic,
              ),
              RouteButton(
                "动态列表",
                AppRoutes.ListDynamic,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
