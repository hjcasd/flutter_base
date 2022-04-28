/// 网络配置管理
abstract class HttpConfig {
  // 连接超时时间
  static const CONNECT_TIMEOUT = 30000;

  // 接收超时时间
  static const RECEIVE_TIMEOUT = 30000;

  // 默认域名
  static const String BASE_URL = "https://www.wanandroid.com";

  // 第三方域名
  static const String OTHER_URL = "https://gank.io";

  // 是否启用代理
  static const PROXY_ENABLE = false;

  // 代理服务IP
  static const PROXY_IP = '172.16.43.74';

  // 代理服务端口
  static const PROXY_PORT = 8866;
}
