import 'package:flutter/material.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/utils/layout_utils.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryPageState();
  }
}

/// 分类页
class _CategoryPageState extends State<CategoryPage> {
  List<Widget> _row1Widgets = [
    LayoutUtils.generateButton(Routes.Container, "Container"),
    LayoutUtils.generateButton(Routes.Padding, "Padding"),
    LayoutUtils.generateButton(Routes.Row, "Row")
  ];

  List<Widget> _row2Widgets = [
    LayoutUtils.generateButton(Routes.Column, "Column"),
    LayoutUtils.generateButton(Routes.Expanded, "Expanded"),
    LayoutUtils.generateButton(Routes.Stack, "Stack"),
  ];

  List<Widget> _row3Widgets = [
    LayoutUtils.generateButton(Routes.Card, "Card"),
    LayoutUtils.generateButton(Routes.Wrap, "Wrap"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [_getRowView(_row1Widgets), _getRowView(_row2Widgets), _getRowView(_row3Widgets)],
      ),
    );
  }

  Widget _getRowView(List<Widget> buttonWidgets) {
    List<Widget> children = [];
    for (var i = 0; i < buttonWidgets.length; i++) {
      children.add(
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: buttonWidgets[i],
          ),
        ),
      );
    }
    return Row(children: children);
  }
}
