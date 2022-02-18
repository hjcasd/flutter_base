import 'package:flutter/services.dart';

/// Flutter与原生交互方式
class ChannelHelper {
  /// EventChannel
  static const EventChannel _eventChannel = const EventChannel('com.flutter/event');

  /// MethodChannel
  static const MethodChannel _methodChannel = const MethodChannel('com.flutter/method');

  // static EventChannel get eventChannel => _eventChannel;
  //
  // static MethodChannel get methodChannel => _methodChannel;

  ChannelHelper._();

  /// 使用EventChannel与原生交互
  static void receiveStream(void onEvent(object)) {
    _eventChannel.receiveBroadcastStream('event').listen(onEvent);
  }

  /// 使用MethodChannel与原生交互
  /// method: 调用原生的方法名
  /// params: 传递的参数
  static void invokeMethod(String method, [dynamic params]) {
    _methodChannel.invokeMethod(method, params);
  }

  /// 使用MethodChannel与原生交互(带返回值)
  /// method: 调用原生的方法名
  ///  params: 传递的参数
  static Future<T?> invokeMethodWithFuture<T>(String method, [dynamic params]) {
    return _methodChannel.invokeMethod(method, params);
  }
}
