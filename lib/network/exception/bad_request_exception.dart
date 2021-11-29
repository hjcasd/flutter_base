import 'package:flutter_base/network/exception/http_exception.dart';

/// 客户端请求错误
class BadRequestException extends HttpException {
  BadRequestException([int? code, String? message]) : super(code, message);
}
