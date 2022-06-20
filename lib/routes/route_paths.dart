/// 配置路由(每个页面对应路由的路径)
abstract class RoutePaths {
  RoutePaths._internal();

  static const initial = '/';
  static const notFound = '/not_found';

  // 首页
  static const text = '/text';
  static const richText = '/rich_text';
  static const button = '/button';
  static const image = '/image';
  static const listView = '/list_view';
  static const listStatic = '/list_view/static';
  static const listDynamic = '/list_view/dynamic';
  static const gridView = '/grid_view';
  static const gridCount = '/grid_view/count';
  static const gridBuilder = '/grid_view/builder';
  static const form = '/form';
  static const appBar = '/app_bar';
  static const tabBar = '/tab_bar';
  static const drawer = '/drawer';
  static const progress = '/progress';

  // 布局
  static const container = '/container';
  static const padding = '/padding';
  static const row = '/row';
  static const column = '/column';
  static const expanded = '/expanded';
  static const stack = '/stack';
  static const stackPositioned = '/stack/positioned';
  static const stackAlign = '/stack/align';
  static const card = '/card';
  static const wrap = '/wrap';
  static const scaffold = '/scaffold';

  // 其他
  static const dialog = '/dialog';
  static const picture = '/picture';
  static const login = '/login';
  static const user = '/user';

  // 设置
  static const swiper = '/swiper';
  static const dio = '/dio';
  static const getX = '/getX';
  static const native = '/native';
  static const web = '/web';
}
