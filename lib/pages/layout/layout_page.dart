import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/routes/app_routes.dart';

/// 布局Tab页面
class LayoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LayoutPageState();
  }
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          RouteButton(
            "Container",
            Routes.Container,
            backgroundColor: Colors.green,
          ),
          RouteButton(
            "Padding",
            Routes.Padding,
            backgroundColor: Colors.green,
          ),
          RouteButton(
            "Row",
            Routes.Row,
            backgroundColor: Colors.green,
          ),
          RouteButton(
            "Column",
            Routes.Column,
            backgroundColor: Colors.green,
          ),
          RouteButton(
            "Expanded",
            Routes.Expanded,
            backgroundColor: Colors.green,
          ),
          RouteButton(
            "Stack",
            Routes.Stack,
            backgroundColor: Colors.green,
          ),
          RouteButton(
            "Card",
            Routes.Card,
            backgroundColor: Colors.green,
          ),
          RouteButton(
            "Wrap",
            Routes.Wrap,
            backgroundColor: Colors.green,
          ),
          RouteButton(
            "Scaffold",
            Routes.Scaffold,
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
