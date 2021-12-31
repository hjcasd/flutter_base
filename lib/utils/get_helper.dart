import 'package:get/get.dart';

/// GetX小工具
class GetHelper {
  GetHelper._internal();

  /// 返回上一个路由页面
  static void showSnackBar(String msg) {
    Get.snackbar(
      '提示',
      msg,
      animationDuration: Duration(
        milliseconds: 500,
      ),
    );
  }
}
