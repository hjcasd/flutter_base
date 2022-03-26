import 'package:flutter_base/native/native_helper.dart';
import 'package:flutter_base/routes/route_stack.dart';
import 'package:get/get.dart';

/// 路由管理
class RouteManager {
  RouteManager._internal();

  /// 返回上一个路由页面
  static void goBack() {
    if (!RouteStack.canBack()) {
      NativeHelper.back();
    } else {
      Get.back();
    }
  }

  /// 跳转到对应路由页面
  static void jumpToNamedPage(String page) {
    Get.toNamed(page);
  }

  /// 跳转到对应原生路由页面
  static void jumpToNativePage(String path) {
    NativeHelper.route(path);
  }
}
