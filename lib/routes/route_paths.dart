/// 配置路由(每个页面对应路由的路径)
abstract class RoutePaths {
  RoutePaths._internal();

  static const Initial = '/';
  static const NotFound = '/not_found';

  // 首页
  static const Text = '/text';
  static const RichText = '/rich_text';
  static const Button = '/button';
  static const Image = '/image';
  static const ListView = '/list_view';
  static const ListStatic = '/list_view/static';
  static const ListDynamic = '/list_view/dynamic';
  static const GridView = '/grid_view';
  static const GridCount = '/grid_view/count';
  static const GridBuilder = '/grid_view/builder';
  static const Form = '/form';
  static const AppBar = '/app_bar';
  static const TabBar = '/tab_bar';
  static const Drawer = '/drawer';

  // 布局
  static const Container = '/container';
  static const Padding = '/padding';
  static const Row = '/row';
  static const Column = '/column';
  static const Expanded = '/expanded';
  static const Stack = '/stack';
  static const StackPositioned = '/stack/positioned';
  static const StackAlign = '/stack/align';
  static const Card = '/card';
  static const Wrap = '/wrap';
  static const Scaffold = '/scaffold';

  // 其他
  static const Dialog = '/dialog';
  static const Picture = '/picture';
  static const Login = '/login';
  static const User = '/user';
  static const Web = '/web';

  // 设置
  static const Swiper = '/swiper';
  static const Dio = '/dio';
  static const GetX = '/getX';
  static const Native = '/native';
}
