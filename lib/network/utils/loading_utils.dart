import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Loading管理
class LoadingUtils {
  /// 显示Loading
  static show(bool isShowLoading) {
    if (isShowLoading) {
      EasyLoading.show();
    }
  }

  /// 隐藏Loading
  static dismiss(bool isShowLoading) {
    if (isShowLoading) {
      EasyLoading.dismiss();
    }
  }
}
