import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Dialog管理
class DialogManager {
  DialogManager._internal();

  /// 显示Dialog
  static void show(
    Widget dialogWidget, {
    bool cancelOutside = true,
  }) {
    Get.dialog(
      dialogWidget,
      barrierDismissible: cancelOutside,
    );
  }

  /// 显示BottomSheet
  static void showBottomSheet(Widget dialogWidget) {
    Get.bottomSheet(dialogWidget);
  }

  /// 关闭Dialog
  static void dismiss() {
    Get.back();
  }
}
