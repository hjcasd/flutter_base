import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/constants/app_colors.dart';
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
            AppRoutes.Container,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Padding",
            AppRoutes.Padding,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Row",
            AppRoutes.Row,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Column",
            AppRoutes.Column,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Expanded",
            AppRoutes.Expanded,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Stack",
            AppRoutes.Stack,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Card",
            AppRoutes.Card,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Wrap",
            AppRoutes.Wrap,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Scaffold",
            AppRoutes.Scaffold,
            backgroundColor: AppColors.green,
          ),
        ],
      ),
    );
  }
}
