import 'package:flutter/services.dart';

/// Flutter与原生交互方式
class ChannelHelper {
  // EventChannel
  static const EventChannel _eventChannel = const EventChannel('com.flutter/event');

  // MethodChannel
  static const MethodChannel _methodChannel = const MethodChannel('com.flutter/method');

  // BasicMessageChannel
  static const BasicMessageChannel<String> _basicMessageChannel = BasicMessageChannel<String>("com.flutter/basic", StringCodec());

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
  /// params: 传递的参数
  static Future<T?> invokeMethodWithFuture<T>(String method, [dynamic params]) {
    return _methodChannel.invokeMethod(method, params);
  }

  /// 使用BasicMessageChannel与原生交互
  /// 接受原生端传递过来的消息
  static void handleMessage(Future<String> Function(String? message)? handler) {
    _basicMessageChannel.setMessageHandler(handler);
  }

  /// 使用BasicMessageChannel与原生交互
  /// 发送消息给原生端
  static void sendMessage(String message) {
    _basicMessageChannel.send(message);
  }

}
