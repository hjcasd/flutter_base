import 'package:get/get.dart';

/// GetX小工具
class GetHelper {
  GetHelper._internal();

  /// 返回上一个路由页面
  static void showSnackBar(String msg, {String title = "提示"}) {
    Get.snackbar(
      title,
      msg,
      animationDuration: Duration(
        milliseconds: 500,
      ),
      duration: Duration(
        milliseconds: 1000,
      ),
    );
  }
}
