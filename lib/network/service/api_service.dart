import 'package:flutter_base/network/config/url_path.dart';
import 'package:flutter_base/network/utils/http_utils.dart';

/// 接口管理
abstract class ApiService {
  /// 登录
  static Future login(String username, String password) async {
    var response = await HttpUtils.post(UrlPath.loginPath, params: {
      "username": username,
      "password": password,
    });
    return response;
  }
}
