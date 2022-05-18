import 'package:flutter_base/model/mock_data.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 图文列表页面Controller
class PictureController extends GetxController {
  /// 每页大小
  static const PAGE_SIZE = 20;

  /// 数据源
  var listItems = <Map<String, String>>[];

  /// 当前页码
  var _currentPage = 1;

  @override
  void onInit() {
    super.onInit();
    LogHelper.e("PictureController onInit()...");
  }

  @override
  void onClose() {
    super.onClose();
    LogHelper.e("PictureController onClose()...");
  }

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
      listItems += newItems;
    } else {
      listItems = newItems;
    }
    update(["list"]);
  }
}
