import 'package:flutter/material.dart';
import 'package:flutter_base/native/ChannelHelper.dart';
import 'package:flutter_base/native/NativeMethod.dart';
import 'package:flutter_base/native/NativePath.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:flutter_base/utils/get_helper.dart';

/// flutter与原生交互
class NativePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Page'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            ChannelHelper.invokeMethod(NativeMethod.BACK);
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
                RouteManager.jumpToNativePage(NativePath.MAIN);
              },
              child: Text(
                '原生跳转',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // flutter端调用native端的方法并传参
                ChannelHelper.invokeMethodWithFuture(NativeMethod.TOAST, "flutter传递过来的消息").then((result) {
                  GetHelper.showSnackBar("result: $result");
                });
              },
              child: Text(
                '原生吐司',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
