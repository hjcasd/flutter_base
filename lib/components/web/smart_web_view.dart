import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// SmartWebView: WebView封装
class SmartWebView extends StatefulWidget {
  // 标题
  final String title;

  // 链接地址
  final String url;

  SmartWebView({
    required this.title,
    required this.url,
    key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SmartWebViewState();
}

class _SmartWebViewState extends State<SmartWebView> {
  // 控制器
  WebViewController? _webViewController;

  // 当前加载进度
  double currentProgress = 0;

  // 是否可返回
  bool canGoBack = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartAppBar(
        widget.title,
        onPressed: () async {
          if (canGoBack) {
            _webViewController?.goBack();
          } else {
            RouteManager.back();
          }
        },
      ),
      body: Container(
        child: Column(
          children: [
            _getProgressView(),
            _getWebView(),
          ],
        ),
      ),
    );
  }

  /// 进度条
  Widget _getProgressView() {
    return Container(
      child: currentProgress < 1.0
          ? LinearProgressIndicator(
              value: currentProgress,
              color: AppColors.red_CB1E36,
              backgroundColor: AppColors.white,
              minHeight: 2,
            )
          : Container(height: 2),
    );
  }

  /// WebView
  Widget _getWebView() {
    return Expanded(
      child: WebView(
        // 初始化URL
        initialUrl: widget.url,
        // JS执行模式
        javascriptMode: JavascriptMode.unrestricted,
        // WebView创建
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
        // 开始加载页面
        onPageStarted: (String url) {
          LogHelper.e("WebView onPageStarted: $url");
        },
        // 页面加载完成
        onPageFinished: (String url) {
          LogHelper.e("WebView onPageFinished: $url");
          _webViewController?.canGoBack().then((value) {
            setState(() {
              canGoBack = value;
            });
          });
        },
        // 加载进度
        onProgress: (int progress) {
          setState(() {
            currentProgress = progress / 100;
          });
        },
        // 路由委托
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            LogHelper.e("WebView blocking navigation to $request");
            return NavigationDecision.prevent;
          }
          LogHelper.e("WebView allowing navigation to $request");
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
