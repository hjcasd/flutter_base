import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/theme/app_colors.dart';
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
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Padding",
            Routes.Padding,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Row",
            Routes.Row,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Column",
            Routes.Column,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Expanded",
            Routes.Expanded,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Stack",
            Routes.Stack,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Card",
            Routes.Card,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Wrap",
            Routes.Wrap,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Scaffold",
            Routes.Scaffold,
            backgroundColor: AppColors.green,
          ),
        ],
      ),
    );
  }
}
