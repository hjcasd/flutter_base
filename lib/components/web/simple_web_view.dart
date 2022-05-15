import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// SimpleWebView: InAppWebView封装
class SimpleWebView extends StatefulWidget {
  // 标题
  final String title;

  // 链接地址
  final String url;

  SimpleWebView({
    required this.title,
    required this.url,
    key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SimpleWebViewState();
}

class _SimpleWebViewState extends State<SimpleWebView> {
  // Key
  final GlobalKey webViewKey = GlobalKey();

  // Web配置
  final InAppWebViewGroupOptions webViewOptions = InAppWebViewGroupOptions(
    // 用于配置Android和iOS通用的接口功能
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    // 仅用于配置Android特有的接口功能
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    // 仅用于配置iOS特有的接口功能
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  // WebView控制器
  InAppWebViewController? _webViewController;

  // 当前加载进度
  double currentProgress = 0;

  // 是否可返回
  bool canGoBack = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartAppBar(
        widget.title,
        onPressed: () async {
          if (canGoBack) {
            _webViewController?.goBack();
          } else {
            RouteManager.goBack();
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
      flex: 1,
      child: InAppWebView(
        key: webViewKey,
        initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
        initialOptions: webViewOptions,
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
        },
        onLoadStop: (InAppWebViewController controller, Uri? uri) {
          _webViewController?.canGoBack().then((value) {
            setState(() {
              canGoBack = value;
            });
          });
        },
        onProgressChanged: (InAppWebViewController controller, int progress) {
          setState(() {
            currentProgress = progress / 100;
          });
        },
      ),
    );
  }
}
