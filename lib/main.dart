import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/network/config/http_config.dart';
import 'package:flutter_base/network/interceptor/error_interceptor.dart';
import 'package:flutter_base/network/utils/http_utils.dart';
import 'package:flutter_base/routes/app_pages.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

/// 应用入口
/// void main() => runApp(MyApp());
void main() async {
  HttpUtils.init(
    baseUrl: HttpConfig.BASE_URL,
    connectTimeout: HttpConfig.CONNECT_TIMEOUT,
    receiveTimeout: HttpConfig.RECEIVE_TIMEOUT,
    interceptors: [
      ErrorInterceptor(),
    ],
  );
  runApp(MyApp());
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);//隐藏状态栏，保留底部按钮栏
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Base",
      initialRoute: Routes.Initial,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      unknownRoute: AppPages.pages[1],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      builder: EasyLoading.init(),
    );
  }
}
