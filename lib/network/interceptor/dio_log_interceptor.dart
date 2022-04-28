import 'package:dio/dio.dart';
import 'package:flutter_base/utils/extension/map_list_to_string.dart';
import 'package:flutter_base/utils/log_helper.dart';

/// 日志拦截器
class DioLogInterceptor extends Interceptor {
  /// 请求
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String requestStr = "request url: ${options.baseUrl + options.path}\n";
    requestStr += "request method: ${options.method}\n";
    requestStr += "request header:\n${options.headers.mapToJsonString()}\n";
    requestStr += "request params:\n${options.queryParameters.mapToJsonString()}\n";

    final data = options.data;
    if (data != null) {
      if (data is Map) {
        requestStr += "request body:\n${data.mapToJsonString()}\n";
      } else if (data is FormData) {
        final formDataMap = Map()
          ..addEntries(data.fields)
          ..addEntries(data.files);
        requestStr += "request body:\n${formDataMap.mapToJsonString()}\n";
      } else
        requestStr += "request body:\n${data.toString()}\n";
    }

    LogHelper.e(requestStr, tag: "DioLogInterceptor onRequest");

    super.onRequest(options, handler);
  }

  /// 出错
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    String errorStr = "error url: ${err.requestOptions.baseUrl + err.requestOptions.path}\n";
    errorStr += "error method: ${err.requestOptions.method}\n";
    errorStr += "error header:\n${err.response?.headers.map.mapToJsonString()}\n";

    if (err.response != null && err.response?.data != null) {
      errorStr += "error body:\n${_parseResponse(err.response!)}\n";
    }

    LogHelper.e(errorStr, tag: "DioLogInterceptor onError");

    super.onError(err, handler);
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

    LogHelper.e(responseStr, tag: "DioLogInterceptor onResponse");

    super.onResponse(response, handler);
  }

  /// 解析响应
  String _parseResponse(Response response) {
    String responseStr = "";
    var data = response.data;
    if (data is Map) {
      responseStr += data.mapToJsonString();
    } else if (data is List) {
      responseStr += data.listToJsonString();
    } else {
      responseStr += response.data.toString();
    }
    return responseStr;
  }
}
