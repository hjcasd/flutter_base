import 'package:flutter/material.dart';
import 'package:flutter_base/native/native_helper.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 路由管理类
class RouteManager {
  RouteManager._internal();

  /// 返回上一个页面
  static void goBack() {
    bool canPop = Navigator.canPop(Get.context!);
    LogHelper.e("canPop: $canPop");
    if (!canPop) {
      Get.back();
    } else {
      NativeHelper.back();
    }
  }

  /// 导航到下一个页面, 下个页面获取参数使用Get.arguments
  static void jumpToNamedPage(String nextRouteName, {dynamic params}) {
    Get.toNamed(nextRouteName, arguments: params);
  }

  /// 导航到下一个页面, 并删除前一个页面
  /// 先关闭前一个页面再跳转下一个页面
  static void offNamedPage(String nextRouteName, {dynamic params}) {
    Get.offNamed(nextRouteName, arguments: params);
  }

  /// 导航到下一个页面, 并删除前一个页面
  /// 先跳转下一个页面再关闭前一个页面
  static void offAndToNamed(String nextRouteName, {dynamic params}) {
    Get.offAndToNamed(nextRouteName, arguments: params);
  }

  /// 导航到下一个页面, 删除之前的页面直到路由名称是previousRoute
  static void offNamedUntil(String nextRouteName, String previousRouteName, {dynamic params}) {
    Get.offNamedUntil(nextRouteName, ModalRoute.withName(previousRouteName), arguments: params);
  }

  /// 导航到下一个页面, 并删除以前所有的页面
  static void offAllNamedPage(String nextRouteName, {dynamic params}) {
    Get.offAllNamed(nextRouteName, arguments: params);
  }

  /// 关闭指定个数的页面
  static void closePage(int count) {
    Get.close(count);
  }

  /// 跳转到Web页面
  static void jumpToWeb(String title, String url) {
    Get.toNamed(AppRoutes.Web, arguments: {"title": title, "url": url});
  }

  /// 跳转到对应原生路由页面
  static void jumpToNativePage(String path) {
    NativeHelper.route(path);
  }
}
