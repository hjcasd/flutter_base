import 'package:flutter/material.dart';
import 'package:flutter_base/native/channel_helper.dart';
import 'package:flutter_base/native/native_method.dart';
import 'package:flutter_base/native/native_path.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:flutter_base/utils/log_helper.dart';

/// flutter与原生交互
class NativePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChannelHelper.handleMessage((message) async{
      LogHelper.e(message);
      return "Flutter收到原生传递过来的数据,同时以BasicMessageChannel方式回传消息给原生";
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Page'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            RouteManager.goBack();
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
                RouteManager.jumpToNativePage(NativePath.DEMO1);
              },
              child: Text(
                '原生跳转',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // flutter端调用native端的方法并传参
                var result = await ChannelHelper.invokeMethodWithFuture(NativeMethod.TOAST, "flutter传递过来的消息");
                LogHelper.e("result: $result");
              },
              child: Text(
                '原生吐司',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ChannelHelper.sendMessage("啊哈哈哈哈哈哈哈啊哈");
              },
              child: Text(
                '发送消息',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
