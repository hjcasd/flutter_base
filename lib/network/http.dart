import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base/network/interceptor/dio_log_interceptor.dart';
import 'config/http_config.dart';

/// Http管理
class Http {
  static Http _instance = Http._internal();

  // Dio实例
  var _dio = Dio();

  // Token
  var _cancelToken = new CancelToken();

  factory Http() => _instance;

  /// 通用全局单例，第一次使用时初始化
  Http._internal() {
    _dio.options = BaseOptions(
      connectTimeout: HttpConfig.CONNECT_TIMEOUT,
      receiveTimeout: HttpConfig.RECEIVE_TIMEOUT,
    );
    _dio.interceptors.add(DioLogInterceptor());

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (HttpConfig.PROXY_ENABLE) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.findProxy = (uri) {
          return "PROXY ${HttpConfig.PROXY_IP}:${HttpConfig.PROXY_PORT}";
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  ///初始化公共属性
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [interceptors] 基础拦截器
  void init({
    String baseUrl = "",
    int? connectTimeout,
    int? receiveTimeout,
    List<Interceptor>? interceptors,
  }) {
    _dio.options = _dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    // 添加拦截器
    if (interceptors != null && interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  /// Get请求
  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    var response = await _dio.get(
      path,
      queryParameters: params,
      options: options,
    );
    return response.data;
  }

  /// Post请求
  Future post(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    var response = await _dio.post(
      path,
      queryParameters: params,
      options: options,
    );
    return response.data;
  }

  /// 取消请求
  ///
  /// 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
  void cancelRequests({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }
}
