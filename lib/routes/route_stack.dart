import 'package:flutter_base/utils/log_helper.dart';

/// 路由堆栈管理
class RouteStack {
  static int _currentIndex = -1;
  static Map<int, String> _pageStack = {};

  RouteStack._internal();

  /// 页面入栈
  static void push(String currentPage) {
    _currentIndex++;
    _pageStack[_currentIndex] = currentPage;
  }

  /// 页面出栈
  static void pop() {
    if (_currentIndex < 0) {
      return;
    }
    _pageStack.remove(_currentIndex);
    _currentIndex--;
  }

  // 是否为根页面
  static bool isRootPage() {
    LogHelper.e("页面个数: ${_pageStack.length}");
    return _pageStack.length > 1 ? false : true;
  }
}
