import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/routes/route_paths.dart';

/// 首页Tab页面
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            RouteButton(
              "Text",
              RoutePaths.text,
            ),
            RouteButton(
              "RichText",
              RoutePaths.richText,
            ),
            RouteButton(
              "Button",
              RoutePaths.button,
            ),
            RouteButton(
              "Image",
              RoutePaths.image,
            ),
            RouteButton(
              "Form",
              RoutePaths.form,
            ),
            RouteButton(
              "ListView",
              RoutePaths.listView,
            ),
            RouteButton(
              "GridView",
              RoutePaths.gridView,
            ),
            RouteButton(
              "AppBar",
              RoutePaths.appBar,
            ),
            RouteButton(
              "TabBar",
              RoutePaths.tabBar,
            ),
            RouteButton(
              "Drawer",
              RoutePaths.drawer,
            ),
            RouteButton(
              "ProgressIndicator",
              RoutePaths.progress,
            ),
          ],
        ),
      ),
    );
  }
}
