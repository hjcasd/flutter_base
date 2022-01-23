import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/routes/app_routes.dart';

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
      child: Column(
        children: [
          RouteButton(
            "Text",
            Routes.Text,
          ),
          RouteButton(
            "RichText",
            Routes.RichText,
          ),
          RouteButton(
            "Button",
            Routes.Button,
          ),
          RouteButton(
            "Image",
            Routes.Image,
          ),
          RouteButton(
            "Form",
            Routes.Form,
          ),
          RouteButton(
            "ListView",
            Routes.ListView,
          ),
          RouteButton(
            "GridView",
            Routes.GridView,
          ),
          RouteButton(
            "AppBar",
            Routes.AppBar,
          ),
          RouteButton(
            "TabBar",
            Routes.TabBar,
          ),
          RouteButton(
            "Drawer",
            Routes.Drawer,
          ),
        ],
      ),
    );
  }
}
