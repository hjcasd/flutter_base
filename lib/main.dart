import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/network/config/http_config.dart';
import 'package:flutter_base/network/interceptor/error_interceptor.dart';
import 'package:flutter_base/network/utils/http_utils.dart';
import 'package:flutter_base/routes/app_pages.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

/// 应用入口
/// void main() => runApp(MyApp());
void main() async {
  initHttp();
  runApp(MyApp());
  // 隐藏状态栏，保留底部按钮栏
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  // 设置Android状态栏沉浸式
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
    ),
  );
}

/// Http初始化
void initHttp() {
  HttpUtils.init(
    baseUrl: HttpConfig.BASE_URL,
    connectTimeout: HttpConfig.CONNECT_TIMEOUT,
    receiveTimeout: HttpConfig.RECEIVE_TIMEOUT,
    interceptors: [
      ErrorInterceptor(),
    ],
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // 是否显示debug图标
      debugShowCheckedModeBanner: true,
      title: "Flutter Base",
      // 初始路由
      initialRoute: AppRoutes.Initial,
      // 跳转动画
      // defaultTransition: Transition.fadeIn,
      // 路由表
      getPages: AppPages.pages,
      // 未知路由
      unknownRoute: AppPages.pages[1],
      // 主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      // Loading
      builder: EasyLoading.init(),
      // 路由跳转监听
      routingCallback: (routing) {
        if (routing == null) {
          LogHelper.d("routing is null");
          return;
        }
        if (routing.route == null) {
          LogHelper.d("route is null");
          return;
        }
      },
    );
  }
}
