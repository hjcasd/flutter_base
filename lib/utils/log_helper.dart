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
  static e(dynamic message, {String tag = "tag"}) {
    _logger.e(message, tag);
  }

  /// verbose
  static v(dynamic message, {String tag = "tag"}) {
    _logger.v(message, tag);
  }

  /// debug
  static d(dynamic message, {String tag = "tag"}) {
    _logger.d(message, tag);
  }

  /// json
  static json(Map<dynamic, dynamic> map, {String tag = "tag"}) {
    _logger.e(map.mapToJsonString(), tag);
  }
}
