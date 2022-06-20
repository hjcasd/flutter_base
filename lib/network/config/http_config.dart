/// 网络配置管理
abstract class HttpConfig {
  // 连接超时时间
  static const connectTimeout = 30000;

  // 接收超时时间
  static const receiveTimeout = 30000;

  // 默认域名
  static const String baseUrl = "https://www.wanandroid.com";

  // 第三方域名
  static const String otherUrl = "https://gank.io";

  // 是否启用代理
  static const proxyEnable = false;

  // 代理服务IP
  static const proxyIp = '172.16.43.74';

  // 代理服务端口
  static const proxyPort = 8866;
}
