import 'package:dio/dio.dart';
import 'package:flutter_base/network/exception/http_exception.dart';
import 'package:flutter_base/utils/log_helper.dart';

/// 错误处理拦截器
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // error统一处理
    HttpException httpException = HttpException.create(err);
    err.error = httpException;
    _handlerHttpException(httpException);
    super.onError(err, handler);
  }

  /// 处理异常
  _handlerHttpException(HttpException httpException) {
    LogHelper.e("ErrorInterceptor", httpException.toString());
  }
}
