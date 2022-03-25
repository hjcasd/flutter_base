import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/components/checkbox/smart_checkbox.dart';
import 'package:flutter_base/routes/app_routes.dart';

/// 首页Tab页面
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        children: [
          RouteButton(
            "Text",
            AppRoutes.Text,
          ),
          RouteButton(
            "RichText",
            AppRoutes.RichText,
          ),
          RouteButton(
            "Button",
            AppRoutes.Button,
          ),
          RouteButton(
            "Image",
            AppRoutes.Image,
          ),
          RouteButton(
            "Form",
            AppRoutes.Form,
          ),
          RouteButton(
            "ListView",
            AppRoutes.ListView,
          ),
          RouteButton(
            "GridView",
            AppRoutes.GridView,
          ),
          RouteButton(
            "AppBar",
            AppRoutes.AppBar,
          ),
          RouteButton(
            "TabBar",
            AppRoutes.TabBar,
          ),
          RouteButton(
            "Drawer",
            AppRoutes.Drawer,
          ),
          SmartCheckbox(isSelected, onChanged: (value) {
            setState(() {
              isSelected = value;
            });
          })
        ],
      ),
    );
  }
}
