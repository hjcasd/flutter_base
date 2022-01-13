import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/components/text/border_text.dart';
import 'package:flutter_base/components/text/icon_text.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/utils/log_helper.dart';

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
          IconText(
            "哈哈哈",
            padding: EdgeInsets.all(5),
            leftIcon: Icon(
              Icons.settings,
              size: 15,
            ),
            drawableMargin: 10,
            onPressed: () {
              LogHelper.e("tag", "1111111");
            },
          ),
          BorderText(
            "哈哈哈",
            fontSize: 20,
            fontColor: Colors.black,
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            backgroundColor: Colors.amber,
            borderWidth: 1,
            borderColor: Colors.green,
            radius: 10,
          ),
        ],
      ),
    );
  }
}
