import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/network/config/http_config.dart';
import 'package:flutter_base/network/interceptor/error_interceptor.dart';
import 'package:flutter_base/network/utils/http_utils.dart';
import 'package:flutter_base/routes/route_pages.dart';
import 'package:flutter_base/routes/route_paths.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

/// 应用入口
/// void main() => runApp(MyApp());
void main() async {
  _initHttp();
  runApp(MyApp());
  _initSystemUI();
}

/// Http初始化
void _initHttp() {
  HttpUtils.init(
    baseUrl: HttpConfig.BASE_URL,
    connectTimeout: HttpConfig.CONNECT_TIMEOUT,
    receiveTimeout: HttpConfig.RECEIVE_TIMEOUT,
    interceptors: [
      ErrorInterceptor(),
    ],
  );
}

/// 系统UI初始化
void _initSystemUI() {
  // 设置Android状态栏沉浸式
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // 是否显示debug图标
      debugShowCheckedModeBanner: true,
      title: "Flutter Base",
      // 初始路由
      initialRoute: RoutePaths.Initial,
      // 跳转动画
      // defaultTransition: Transition.leftToRight,
      // 路由表
      getPages: RoutePages.pages,
      // 未知路由
      unknownRoute: RoutePages.pages[1],
      // 主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      // Loading
      builder: EasyLoading.init(),
      // 国际化
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CN'),
        const Locale('en', 'US'),
      ],
      locale: const Locale('zh', 'CN'),
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
        LogHelper.d("current route: ${routing.current}");
      },
    );
  }
}
