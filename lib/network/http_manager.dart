import 'package:dio/dio.dart';
import 'interceptor/log_interceptor.dart';
import 'utils/loading_utils.dart';
import 'config/http_config.dart';

/// Http管理
class HttpManager {

  static HttpManager _instance = HttpManager._internal();
  static const CONNECT_TIMEOUT = 15000;

  Dio _dio = Dio();

  /// 通用全局单例，第一次使用时初始化
  HttpManager._internal() {
    _dio.options = BaseOptions(baseUrl: HttpConfig.BASE_URL, connectTimeout: HttpConfig.CONNECT_TIMEOUT);
    _dio.interceptors.add(DioLogInterceptor());
  }

  factory HttpManager() => _instance;

  static HttpManager getInstance({String? baseUrl}) {
    if (baseUrl == null) {
      return _instance._defaultUrl();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  /// 使用指定域名
  HttpManager _baseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
    return this;
  }

  /// 实用默认域名默认域名
  HttpManager _defaultUrl() {
    if (_dio.options.baseUrl != HttpConfig.BASE_URL) {
      _dio.options.baseUrl = HttpConfig.BASE_URL;
    }
    return this;
  }

  /// Get请求
  get(api, {params, isShowLoading = true}) async {
    LoadingUtils.show(isShowLoading);
    var response = await _dio.get(api, queryParameters: params);
    LoadingUtils.dismiss(isShowLoading);
    return response.data;
  }

  /// Post请求
  post(api, {params, isShowLoading = true}) async {
    LoadingUtils.show(isShowLoading);
    var response = await _dio.post(api, queryParameters: params);
    LoadingUtils.dismiss(isShowLoading);
    return response.data;
  }
}
