import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Dialog管理
class DialogManager {
  DialogManager._internal();

  /// 显示Dialog
  static void show(Widget dialogWidget) {
    Get.dialog(dialogWidget);
  }

  // static Future showBottomSheet(Widget dialogWidget) {
  //   return Get.bottomSheet(dialogWidget);
  // }
}
