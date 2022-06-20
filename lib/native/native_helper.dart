import 'package:flutter_base/native/channel_helper.dart';
import 'package:flutter_base/native/native_method.dart';

/// Flutter调用原生方法工具类
class NativeHelper {
  NativeHelper._();

  /// 原生返回
  static void back() {
    ChannelHelper.invokeMethod(NativeMethod.back);
  }

  /// 原生路由跳转
  static void route(String path) {
    ChannelHelper.invokeMethod(NativeMethod.route, path);
  }

  /// 原生吐司
  static void toast(String msg) {
    ChannelHelper.invokeMethod(NativeMethod.toast, msg);
  }
}
