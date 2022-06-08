import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          _getWebView(),
          _getProgressView(),
        ],
      ),
    );
  }

  /// WebView
  Widget _getWebView() {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
      initialOptions: InAppWebViewGroupOptions(
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
      ),
      onWebViewCreated: (InAppWebViewController controller) {
        setState(() {
          _isInit = true;
        });
      },
    );
  }

  /// 进度条
  Widget _getProgressView() {
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
