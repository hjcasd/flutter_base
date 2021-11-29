import 'package:dio/dio.dart';
import 'package:flutter_base/network/exception/bad_request_exception.dart';
import 'package:flutter_base/network/exception/bad_response_exception.dart';

/// 自定义异常
class HttpException implements Exception {
  final int? _code;
  final String? _message;

  HttpException([this._code, this._message]);

  int get code => _code ?? -1;

  String get message => _message ?? this.runtimeType.toString();

  String toString() {
    return "$_code==$_message";
  }

  factory HttpException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return BadRequestException(-1, "请求取消");
      case DioErrorType.connectTimeout:
        return BadRequestException(-1, "连接超时");
      case DioErrorType.sendTimeout:
        return BadRequestException(-1, "请求超时");
      case DioErrorType.receiveTimeout:
        return BadRequestException(-1, "响应超时");
      case DioErrorType.response:
        return _convertHttpException(error);
      default:
        return HttpException(-1, error.message);
    }
  }

  /// code转换成对应异常
  static HttpException _convertHttpException(DioError error) {
    try {
      int errCode = error.response!.statusCode!;
      switch (errCode) {
        case 400:
          return BadRequestException(errCode, "请求语法错误");
        case 401:
          return BadRequestException(errCode, "没有权限");
        case 403:
          return BadRequestException(errCode, "服务器拒绝执行");
        case 404:
          return BadRequestException(errCode, "无法连接服务器");
        case 405:
          return BadRequestException(errCode, "请求方法被禁止");
        case 500:
          return BadResponseException(errCode, "服务器内部错误");
        case 502:
          return BadResponseException(errCode, "无效的请求");
        case 503:
          return BadResponseException(errCode, "服务器挂了");
        case 505:
          return BadResponseException(errCode, "不支持HTTP协议请求");
        default:
          return HttpException(errCode, error.response!.statusMessage!);
      }
    } on Exception catch (_) {
      return HttpException(-1, "未知错误");
    }
  }
}
