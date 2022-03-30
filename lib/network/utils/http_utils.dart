import 'package:dio/dio.dart';
import 'package:flutter_base/network/http.dart';
import 'package:flutter_base/utils/loading_helper.dart';

/// Http工具类
class HttpUtils {
  HttpUtils._internal();

  /// 初始化
  static void init({
    String baseUrl = "",
    int? connectTimeout,
    int? receiveTimeout,
    List<Interceptor>? interceptors,
  }) {
    Http().init(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      interceptors: interceptors,
    );
  }

  /// Get请求
  static Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) {
      LoadingHelper.show();
    }
    var response = await Http().get(
      path,
      params: params,
      options: options,
    );
    LoadingHelper.dismiss();
    return response;
  }

  /// Post请求
  static Future post(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) {
      LoadingHelper.show();
    }
    var response = await Http().post(
      path,
      params: params,
      options: options,
    );
    LoadingHelper.dismiss();
    return response;
  }
}
