import 'package:flutter/material.dart';

/// GetX小工具
class DialogManager {
  DialogManager._internal();

  /// 显示Dialog
  static void show(BuildContext context, Widget dialog) {
    showDialog(
      context: context,
      builder: (_) => dialog,
    );
  }

  static void showBottomSheet(BuildContext context, Widget dialog) {
    showModalBottomSheet(
      context: context,
      builder: (_) => dialog,
    );
  }

}