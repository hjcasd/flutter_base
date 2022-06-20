/// Flutter调用原生的方法
abstract class NativeMethod {
  NativeMethod._();

  // 返回上一个页面
  static const String back = 'back';

  // 跳转对应路由页面
  static const String route = 'route';

  // 吐司
  static const String toast = 'toast';
}
