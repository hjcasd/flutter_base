import 'package:flutter_base/data/mock_data.dart';
import 'package:get/get.dart';

/// 图文列表页面Controller
class PictureController extends GetxController {
  /// 每页大小
  static const PAGE_SIZE = 20;

  /// 数据源
  var listItems = <Map<String, Object>>[].obs;

  /// 当前页码
  var _currentPage = 1;

  /// 刷新
  void refresh() async {
    _currentPage = 1;
    _requestNewItems();
  }

  /// 加载更多
  void loadMore() async {
    _currentPage += 1;
    _requestNewItems();
  }

  void _requestNewItems() async {
    var newItems = await MockData.getList(_currentPage, PAGE_SIZE);
    if (_currentPage > 1) {
      listItems.value += newItems;
    } else {
      listItems.value = newItems;
    }
  }
}
