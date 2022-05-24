import 'package:flutter/material.dart';
import 'package:flutter_base/native/native_helper.dart';
import 'package:flutter_base/routes/route_paths.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 路由管理类
class RouteManager {
  RouteManager._internal();

  /// 导航到下一个页面, 下个页面获取参数使用Get.arguments
  ///
  /// RouteManager.toNamed(AppRoutes.Dialog);
  static Future? toNamed(String nextRouteName, {dynamic params}) {
    return Get.toNamed(nextRouteName, arguments: params);
  }

  /// 导航到下一个页面, 并删除前一个页面
  /// 先关闭前一个页面再跳转下一个页面
  ///
  /// RouteManager.offNamed(AppRoutes.Dialog);
  static void offNamed(String nextRouteName, {dynamic params}) {
    Get.offNamed(nextRouteName, arguments: params);
  }

  /// 导航到下一个页面, 并删除前一个页面
  /// 先跳转下一个页面再关闭前一个页面
  ///
  ///  RouteManager.offAndToNamed(AppRoutes.Dialog);
  static Future? offAndToNamed(String nextRouteName, {dynamic params}) {
    return Get.offAndToNamed(nextRouteName, arguments: params);
  }

  /// 导航到下一个页面, 删除之前的页面直到路由名称是previousRouteName
  ///
  /// RouteManager.offNamedUntil(AppRoutes.Dialog, AppRoutes.Picture);
  static Future? offNamedUntil(String nextRouteName, String previousRouteName, {dynamic params}) {
    return Get.offNamedUntil(nextRouteName, ModalRoute.withName(previousRouteName), arguments: params);
  }

  /// 导航到下一个页面, 保留当前跳转页面, 删除之前所有页面
  ///
  /// RouteManager.offAllNamedWithSave(AppRoutes.Dialog);
  static Future? offAllNamedWithSave(String nextRouteName, {dynamic params}) {
    return Get.offNamedUntil(nextRouteName, (route) => false, arguments: params);
  }

  /// 导航到下一个页面, 并删除以前所有的页面
  ///
  /// RouteManager.offAllNamed(AppRoutes.Dialog);
  static Future? offAllNamed(String nextRouteName, {dynamic params}) {
    return Get.offAllNamed(nextRouteName, arguments: params);
  }

  /// 关闭当前路由栈中指定个数的页面
  ///
  /// RouteManager.close(2)
  static void close(int count) {
    Get.close(count);
  }

  /// 返回到上一个页面
  static void back({dynamic params}) {
    bool canPop = Navigator.canPop(Get.context!);
    LogHelper.e("canPop: $canPop");
    if (canPop) {
      Get.back(result: params);
    } else {
      NativeHelper.back();
    }
  }

  /// 返回到之前的页面, 直到路由名称是previousRouteName
  ///
  /// RouteManager.backUntil(AppRoutes.Picture);
  static void backUntil(String previousRouteName) {
    Get.until(ModalRoute.withName(previousRouteName));
  }

  /// 跳转到Web页面
  static void jumpToWeb(String title, String url) {
    Get.toNamed(RoutePaths.Web, arguments: {"title": title, "url": url});
  }

  /// 跳转到对应原生路由页面
  static void jumpToNative(String path) {
    NativeHelper.route(path);
  }
}
