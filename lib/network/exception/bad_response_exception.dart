import 'package:flutter_base/network/exception/http_exception.dart';

/// 服务端响应错误
class BadResponseException extends HttpException {
  BadResponseException([int? code, String? message]) : super(code, message);
}
