import 'package:flutter_base/utils/extension/map_list_to_string.dart';
import 'package:logger/logger.dart';

/// 日志管理
class LogHelper {
  // 日志
  static Logger _logger = Logger(
    printer: PrettyPrinter(),
  );

  LogHelper._internal();

  /// error
  static e(String tag, dynamic message) {
    _logger.e(message, tag);
  }

  /// verbose
  static v(String tag, dynamic message) {
    _logger.v(message, tag);
  }

  /// debug
  static d(String tag, dynamic message) {
    _logger.d(message, tag);
  }

  /// json
  static json(String tag, Map<dynamic, dynamic> map) {
    _logger.e(map.mapToJsonString(), tag);
  }
}
