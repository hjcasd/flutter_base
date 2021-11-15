import 'package:flutter/material.dart';
import 'package:flutter_base/components/image_title_item.dart';
import 'package:flutter_base/data/dynamic_mock_data.dart';
import 'package:flutter_base/utils/layout_utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

/// 图文列表页面
class ListExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp(
      "图文列表",
      MyListExampleWidget(),
    );
  }
}

/// Page
class MyListExampleWidget extends StatefulWidget {
  @override
  _MyListExampleState createState() {
    return _MyListExampleState();
  }
}

/// State
class _MyListExampleState extends State<MyListExampleWidget> {
  List<Map<String, Object>> _listItems = [];
  int _currentPage = 1;
  static const PAGE_SIZE = 20;

  /// 刷新数据
  void _refresh() async {
    _currentPage = 1;
    _requestNewItems();
  }

  /// 加载数据
  void _load() async {
    _currentPage += 1;
    _requestNewItems();
  }

  void _requestNewItems() async {
    List<Map<String, Object>> newItems = await DynamicMockData.getList(_currentPage, PAGE_SIZE);
    setState(() {
      if (_currentPage > 1) {
        _listItems += newItems;
      } else {
        _listItems = newItems;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      firstRefresh: true,
      onRefresh: () async {
        _refresh();
      },
      onLoad: () async {
        _load();
      },
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ImageTitleItem(
            _listItems[index]["title"],
            _listItems[index]["imageUrl"],
            _listItems[index]["viewCount"],
          );
        },
        itemCount: _listItems.length,
      ),
    );
  }
}
