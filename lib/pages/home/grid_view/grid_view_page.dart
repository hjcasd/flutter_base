import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/routes/route_paths.dart';

/// GridView页面
class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "GridView的使用",
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            RouteButton(
              "Count网格",
              RoutePaths.gridCount,
            ),
            RouteButton(
              "Builder网格",
              RoutePaths.gridBuilder,
            ),
          ],
        ),
      ),
    );
  }
}
