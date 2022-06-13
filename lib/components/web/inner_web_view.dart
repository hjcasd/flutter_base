import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// InnerWebView: 用于内嵌到页面组件中
class InnerWebView extends StatefulWidget {
  // 链接地址
  final String url;

  InnerWebView({
    required this.url,
    key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InnerWebViewState();
}

class _InnerWebViewState extends State<InnerWebView> {
  // 是否初始化
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          _getWebView(),
          _getLoadingView(),
        ],
      ),
    );
  }

  /// WebView
  Widget _getWebView() {
    return WebView(
      // 初始化URL
      initialUrl: widget.url,
      // JS执行模式
      javascriptMode: JavascriptMode.unrestricted,
      // WebView创建
      onWebViewCreated: (WebViewController webViewController) {
        setState(() {
          _isInit = true;
        });
      },
      // 开始加载页面
      onPageStarted: (String url) {
        LogHelper.e("WebView onPageStarted: $url");
      },
      // 页面加载完成
      onPageFinished: (String url) {
        LogHelper.e("WebView onPageFinished: $url");
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
    );
  }

  /// 进度条
  Widget _getLoadingView() {
    return Offstage(
      offstage: _isInit,
      child: Container(
        color: AppColors.white,
        child: Center(
          child: Text(
            "加载中...",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.black_333333,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _isInit = false;
  }
}
