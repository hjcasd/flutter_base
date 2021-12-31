import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/utils/get_helper.dart';

/// flutter与原生交互
class NativePage extends StatelessWidget {
  // 注册对应的MethodChannel 注：要保证channel name、codec与原生层一致
  final MethodChannel _methodChannel = MethodChannel("com.flutter/method");
  final EventChannel _eventChannel = EventChannel("com.flutter/event");

  @override
  Widget build(BuildContext context) {
    _eventChannel.receiveBroadcastStream("event").listen(_onData, onError: _onError, onDone: _onDone);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Page'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            _methodChannel.invokeMethod("back").then((result) {
              GetHelper.showSnackBar("result: $result");
            });
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // flutter端调用native端的方法并传参
                _methodChannel.invokeMethod("jumpToNative", "/module_frame/loadSir").then((result) {
                  GetHelper.showSnackBar("result: $result");
                });
              },
              child: Text(
                'Flutter使用MethodChannel调用原生方法',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onDone() {
    print("onDone()....");
  }

  void _onError(error) {
    print("onDone()....===$error");
  }

  void _onData(message) {
    print("onDone()....===$message");
  }
}
