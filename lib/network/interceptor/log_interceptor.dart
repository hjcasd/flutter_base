import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// 日志拦截器
class DioLogInterceptor extends Interceptor {
  var _logger = Logger(
    printer: PrettyPrinter(),
  );

  /// 请求
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String requestStr = "request url: ${options.baseUrl + options.path}\n";
    requestStr += "request method: ${options.method}\n";
    requestStr += "request header:\n${options.headers.mapToStructureString()}\n";
    requestStr += "request params:\n${options.queryParameters.mapToStructureString()}\n";

    final data = options.data;
    if (data != null) {
      if (data is Map) {
        requestStr += "request body:\n${data.mapToStructureString()}\n";
      } else if (data is FormData) {
        final formDataMap = Map()
          ..addEntries(data.fields)
          ..addEntries(data.files);
        requestStr += "request body:\n${formDataMap.mapToStructureString()}\n";
      } else
        requestStr += "request body:\n${data.toString()}\n";
    }

    _logger.e(requestStr, "onRequest");

    handler.next(options);
  }

  /// 出错
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    String errorStr = "error url: ${err.requestOptions.baseUrl + err.requestOptions.path}\n";
    errorStr += "error method: ${err.requestOptions.method}\n";
    errorStr += "error header:\n${err.response?.headers.map.mapToStructureString()}\n";

    if (err.response != null && err.response?.data != null) {
      errorStr += "error body:\n${_parseResponse(err.response!)}\n";
    }
    _logger.e(errorStr, "onError");

    handler.next(err);
  }

  /// 响应
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String responseStr = "response url: ${response.requestOptions.uri}\n";
    responseStr += "response status: ${response.statusCode}\n";

    responseStr += "response header:\n{";
    response.headers.forEach((key, list) => responseStr += "\n  " + "\"$key\" : \"$list\",");
    responseStr += "\n}\n";

    if (response.data != null) {
      responseStr += "response body:\n ${_parseResponse(response)}";
    }
    _logger.e(responseStr, "onResponse");

    handler.next(response);
  }

  /// 解析响应
  String _parseResponse(Response response) {
    String responseStr = "";
    var data = response.data;
    if (data is Map) {
      responseStr += data.mapToStructureString();
    } else if (data is List) {
      responseStr += data.listToStructureString();
    } else {
      responseStr += response.data.toString();
    }
    return responseStr;
  }
}

/// Map拓展，MAp转字符串输出
extension Map2StringEx on Map {
  String mapToStructureString({int indentation = 2}) {
    String result = "";
    String indentationStr = " " * indentation;
    if (true) {
      result += "{";
      this.forEach((key, value) {
        if (value is Map) {
          var temp = value.mapToStructureString(indentation: indentation + 2);
          result += "\n$indentationStr" + "\"$key\" : $temp,";
        } else if (value is List) {
          result += "\n$indentationStr" + "\"$key\" : ${value.listToStructureString(indentation: indentation + 2)},";
        } else {
          result += "\n$indentationStr" + "\"$key\" : \"$value\",";
        }
      });
      result = result.substring(0, result.length - 1);
      result += indentation == 2 ? "\n}" : "\n${" " * (indentation - 1)}}";
    }

    return result;
  }
}

/// List拓展，List转字符串输出
extension List2StringEx on List {
  String listToStructureString({int indentation = 2}) {
    String result = "";
    String indentationStr = " " * indentation;
    if (true) {
      result += "$indentationStr[";
      this.forEach((value) {
        if (value is Map) {
          var temp = value.mapToStructureString(indentation: indentation + 2);
          result += "\n$indentationStr" + "\"$temp\",";
        } else if (value is List) {
          result += value.listToStructureString(indentation: indentation + 2);
        } else {
          result += "\n$indentationStr" + "\"$value\",";
        }
      });
      result = result.substring(0, result.length - 1);
      result += "\n$indentationStr]";
    }

    return result;
  }
}
