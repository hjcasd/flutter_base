import 'package:flutter/material.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/utils/layout_utils.dart';

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
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Wrap(
        // 布局方向
        direction: Axis.horizontal,
        // 对齐方式
        alignment: WrapAlignment.spaceEvenly,
        // 水平间距
        spacing: 10,
        children: [
          LayoutUtils.generateButton(Routes.Text, "Text"),
          LayoutUtils.generateButton(Routes.Button, "Button"),
          LayoutUtils.generateButton(Routes.Image, "Image"),
          LayoutUtils.generateButton(Routes.List, "ListView"),
          LayoutUtils.generateButton(Routes.Grid, "GridView"),
          LayoutUtils.generateButton(Routes.Form, "Form"),
          LayoutUtils.generateButton(Routes.AppBar, "AppBar"),
          LayoutUtils.generateButton(Routes.TabController, "TabController"),
          LayoutUtils.generateButton(Routes.Drawer, "Drawer"),
          LayoutUtils.generateButton(Routes.RichText, "RichText"),
        ],
      ),
    );
  }
}
