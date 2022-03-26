/// 路由堆栈管理
class RouteStack {
  static int _currentIndex = -1;
  static Map<int, String> _pageStack = {};

  RouteStack._internal();

  /// 入栈
  static void pushStack(String currentPage) {
    _currentIndex++;
    _pageStack[_currentIndex] = currentPage;
  }

  /// 出栈
  static void popStack(String currentPage) {
    if (_currentIndex < 0) {
      return;
    }
    _pageStack.remove(_currentIndex);
    _currentIndex--;
  }

  // 是否可返回上一个页面
  static bool canBack() {
    return _pageStack.length > 1 ? true : false;
  }
}
