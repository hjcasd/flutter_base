import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/route_button.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/routes/route_paths.dart';

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
            RoutePaths.container,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Padding",
            RoutePaths.padding,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Row",
            RoutePaths.row,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Column",
            RoutePaths.column,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Expanded",
            RoutePaths.expanded,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Stack",
            RoutePaths.stack,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Card",
            RoutePaths.card,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Wrap",
            RoutePaths.wrap,
            backgroundColor: AppColors.green,
          ),
          RouteButton(
            "Scaffold",
            RoutePaths.scaffold,
            backgroundColor: AppColors.green,
          ),
        ],
      ),
    );
  }
}
