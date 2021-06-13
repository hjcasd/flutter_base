import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/routes/app_pages.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void main() async {
  runApp(MyApp());
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);//隐藏状态栏，保留底部按钮栏
}

/// 入口
class MyApp extends StatelessWidget {
  final String initParams;
  final EventChannel _eventChannel = EventChannel("com.flutter/event");

  MyApp({Key key, this.initParams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _eventChannel.receiveBroadcastStream("event").listen( _onData, onError: _onError, onDone: _onDone);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Base",
      initialRoute: Routes.Initial,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      unknownRoute: AppPages.pages[1],
      theme: ThemeData(primarySwatch: Colors.blue),
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
