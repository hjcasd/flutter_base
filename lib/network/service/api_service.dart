import '../config/url_path.dart';
import '../http_manager.dart';

/// 接口管理
class ApiService {
  /// 登录
  static Future login(String username, String password) async {
    var response = HttpManager.getInstance().post(UrlPath.LOGIN_PATH, params: {
      username,
      password,
    });
    return response;
  }
}
