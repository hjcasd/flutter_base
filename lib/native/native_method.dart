/// Flutter调用原生的方法
abstract class NativeMethod {
  NativeMethod._();

  // 返回上一个页面
  static const String BACK = 'back';

  // 跳转对应路由页面
  static const String ROUTE = 'route';

  // 吐司
  static const String TOAST = 'toast';
}
