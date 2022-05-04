import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// SimpleWebView: InAppWebView封装
class SimpleWebView extends StatefulWidget {
  final String url;

  SimpleWebView({
    required this.url,
    key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SimpleWebViewState();
}

class _SimpleWebViewState extends State<SimpleWebView> {
  final GlobalKey webViewKey = GlobalKey();

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

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      key: webViewKey,
      initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
      initialOptions: webViewOptions,
    );
  }
}
