import 'package:dio/dio.dart';

class ApiService {

  /// 登录
  static Future login(String username, String password) async {
    var response = await Dio().post("https://www.wanandroid.com/user/login", queryParameters: {
      "username": username,
      "password": password,
    });
    return response;
  }
}
