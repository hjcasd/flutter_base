import 'package:flutter_base/native/ChannelHelper.dart';
import 'package:flutter_base/native/NativeMethod.dart';
import 'package:get/get.dart';

/// 路由管理
class RouteManager {
  RouteManager._internal();

  /// 返回上一个路由页面
  static void goBack() {
    Get.back();
  }

  /// 跳转到对应路由页面
  static void jumpToNamedPage(String url) {
    Get.toNamed(url);
  }

  /// 跳转到对应原生路由页面
  static void jumpToNativePage(String path) {
    ChannelHelper.invokeMethod(NativeMethod.ROUTE, path);
  }
}
