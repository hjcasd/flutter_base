import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/list_item/image_title_item.dart';
import 'package:flutter_base/data/mock_data.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

/// 图文列表页面
class PictureListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "图文列表",
        ),
        body: MyPictureList(),
      ),
    );
  }
}

/// Page
class MyPictureList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyListExampleState();
  }
}

/// State
class _MyListExampleState extends State<MyPictureList> {
  static const PAGE_SIZE = 20;
  List<Map<String, Object>> _listItems = [];
  int _currentPage = 1;

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
    List<Map<String, Object>> newItems = await MockData.getList(_currentPage, PAGE_SIZE);
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
            _listItems[index]["title"] as String,
            _listItems[index]["imageUrl"] as String,
            _listItems[index]["viewCount"] as int,
          );
        },
        itemCount: _listItems.length,
      ),
    );
  }
}
