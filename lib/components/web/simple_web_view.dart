import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// SmartWebView: WebView封装
class SimpleWebView extends StatefulWidget {
  // 标题
  final String title;

  // 链接地址
  final String url;

  // 返回回调处理
  final void Function(WebViewController? webViewController) onBackPressed;

  SimpleWebView({
    required this.title,
    required this.url,
    required this.onBackPressed,
    key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SimpleWebViewState();
}

class _SimpleWebViewState extends State<SimpleWebView> {
  // 当前加载进度
  double currentProgress = 0;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getProgressView(),
        _getWebView(),
      ],
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
          widget.onBackPressed(webViewController);
        },
        // 开始加载页面
        onPageStarted: (String url) {
          LogHelper.e("WebView onPageStarted: $url");
        },
        // 页面加载完成
        onPageFinished: (String url) {
          LogHelper.e("WebView onPageFinished: $url");
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
