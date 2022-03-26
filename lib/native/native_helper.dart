import 'package:flutter_base/native/channel_helper.dart';
import 'package:flutter_base/native/native_method.dart';

/// Flutter调用原生方法工具类
class NativeHelper {
  NativeHelper._();

  static void back() {
    ChannelHelper.invokeMethod(NativeMethod.BACK);
  }

  static void route(String path) {
    ChannelHelper.invokeMethod(NativeMethod.ROUTE, path);
  }

  static void toast() {
    ChannelHelper.invokeMethod(NativeMethod.TOAST);
  }
}
