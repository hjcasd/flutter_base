import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Loading管理
class LoadingHelper {
  LoadingHelper._internal();

  /// 显示Loading
  static show() {
    EasyLoading.show();
  }

  /// 隐藏Loading
  static dismiss() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }
}
