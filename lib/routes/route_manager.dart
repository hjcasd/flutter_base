import 'package:flutter_base/native/native_helper.dart';
import 'package:flutter_base/routes/route_stack.dart';
import 'package:get/get.dart';

/// 路由管理类
class RouteManager {
  RouteManager._internal();

  /// 返回上一个页面
  static void goBack() {
    if (RouteStack.isRootPage()) {
      NativeHelper.back();
    } else {
      Get.back();
    }
  }

  /// 导航到下一个页面,下个页面获取参数使用Get.arguments
  static void jumpToNamedPage(String page, {dynamic params}) {
    Get.toNamed(page, arguments: params);
  }

  /// 导航到下一个页面并删除前一个页面
  static void offNamedPage(String page, {dynamic params}) {
    Get.offNamed(page, arguments: params);
  }

  /// 导航到下一个页面并删除以前所有的页面
  static void offAllNamedPage(String page, {dynamic params}) {
    Get.offAllNamed(page, arguments: params);
  }

  /// 跳转到对应原生路由页面
  static void jumpToNativePage(String path) {
    NativeHelper.route(path);
  }
}
