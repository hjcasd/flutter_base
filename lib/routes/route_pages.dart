import 'package:flutter_base/pages/home/grid_view/grid_builder_page.dart';
import 'package:flutter_base/pages/home/grid_view/grid_count_page.dart';
import 'package:flutter_base/pages/home/grid_view/grid_view_page.dart';
import 'package:flutter_base/pages/home/list_view/list_dynamic_page.dart';
import 'package:flutter_base/pages/home/list_view/list_static_page.dart';
import 'package:flutter_base/pages/home/list_view/list_view_page.dart';
import 'package:flutter_base/pages/layout/stack/stack_align_page.dart';
import 'package:flutter_base/pages/layout/stack/stack_position_page.dart';
import 'package:flutter_base/pages/other/dialog/dialog_page.dart';
import 'package:flutter_base/pages/home/rich_text/rich_text_page.dart';
import 'package:flutter_base/pages/layout/scaffold/scaffold_page.dart';
import 'package:flutter_base/pages/main_page.dart';
import 'package:flutter_base/pages/home/button/button_page.dart';
import 'package:flutter_base/pages/layout/container/container_page.dart';
import 'package:flutter_base/pages/home/form/form_page.dart';
import 'package:flutter_base/pages/home/image/image_page.dart';
import 'package:flutter_base/pages/home/text/text_page.dart';
import 'package:flutter_base/pages/home/app_bar/app_bar_page.dart';
import 'package:flutter_base/pages/layout/card/card_page.dart';
import 'package:flutter_base/pages/layout/column/column_page.dart';
import 'package:flutter_base/pages/home/drawer/drawer_page.dart';
import 'package:flutter_base/pages/layout/expanded/expanded_page.dart';
import 'package:flutter_base/pages/layout/padding/padding_page.dart';
import 'package:flutter_base/pages/layout/row/row_page.dart';
import 'package:flutter_base/pages/layout/stack/stack_page.dart';
import 'package:flutter_base/pages/home/tab_bar/tab_bar_page.dart';
import 'package:flutter_base/pages/layout/wrap/wrap_page.dart';
import 'package:flutter_base/pages/other/login/logic/login_binding.dart';
import 'package:flutter_base/pages/other/login/login_page.dart';
import 'package:flutter_base/pages/other/picture/logic/picture_binding.dart';
import 'package:flutter_base/pages/other/picture/picture_page.dart';
import 'package:flutter_base/pages/other/user/logic/user_binding.dart';
import 'package:flutter_base/pages/other/user/user_page.dart';
import 'package:flutter_base/pages/other/web/logic/web_binding.dart';
import 'package:flutter_base/pages/other/web/web_page.dart';
import 'package:flutter_base/pages/setting/dio/dio_page.dart';
import 'package:flutter_base/pages/setting/get_x/get_x_page.dart';
import 'package:flutter_base/pages/setting/native/native_page.dart';
import 'package:flutter_base/pages/setting/swiper/swiper_page.dart';
import 'package:flutter_base/pages/not_found_page.dart';
import 'package:flutter_base/routes/route_paths.dart';
import 'package:get/get.dart';

/// 注册路由表(每个新建的页面都要在这注册对应路由)
abstract class RoutePages {
  RoutePages._internal();

  static final pages = [
    GetPage(
      name: RoutePaths.Initial,
      page: () => MainPage(),
    ),
    GetPage(
      name: RoutePaths.NotFound,
      page: () => NotFoundPage(),
    ),

    // =========================首页=============================
    GetPage(
      name: RoutePaths.Text,
      page: () => TextPage(),
    ),
    GetPage(
      name: RoutePaths.RichText,
      page: () => RichTextPage(),
    ),

    GetPage(
      name: RoutePaths.Button,
      page: () => ButtonPage(),
    ),
    GetPage(
      name: RoutePaths.Image,
      page: () => ImagePage(),
    ),

    GetPage(
      name: RoutePaths.ListView,
      page: () => ListViewPage(),
    ),
    GetPage(
      name: RoutePaths.ListStatic,
      page: () => ListStaticPage(),
    ),
    GetPage(
      name: RoutePaths.ListDynamic,
      page: () => ListDynamicPage(),
    ),

    GetPage(
      name: RoutePaths.GridView,
      page: () => GridViewPage(),
    ),
    GetPage(
      name: RoutePaths.GridCount,
      page: () => GridCountPage(),
    ),
    GetPage(
      name: RoutePaths.GridBuilder,
      page: () => GridBuilderPage(),
    ),

    GetPage(
      name: RoutePaths.Form,
      page: () => FormPage(),
    ),
    GetPage(
      name: RoutePaths.AppBar,
      page: () => AppBarPage(),
    ),
    GetPage(
      name: RoutePaths.TabBar,
      page: () => TabBarPage(),
    ),
    GetPage(
      name: RoutePaths.Drawer,
      page: () => DrawerPage(),
    ),

    // =========================布局=============================
    GetPage(
      name: RoutePaths.Container,
      page: () => ContainerPage(),
    ),
    GetPage(
      name: RoutePaths.Padding,
      page: () => PaddingPage(),
    ),
    GetPage(
      name: RoutePaths.Row,
      page: () => RowPage(),
    ),
    GetPage(
      name: RoutePaths.Column,
      page: () => ColumnPage(),
    ),
    GetPage(
      name: RoutePaths.Expanded,
      page: () => ExpandedPage(),
    ),
    GetPage(
      name: RoutePaths.Stack,
      page: () => StackPage(),
    ),
    GetPage(
      name: RoutePaths.StackPositioned,
      page: () => StackPositionedPage(),
    ),
    GetPage(
      name: RoutePaths.StackAlign,
      page: () => StackAlignPage(),
    ),
    GetPage(
      name: RoutePaths.Card,
      page: () => CardPage(),
    ),
    GetPage(
      name: RoutePaths.Wrap,
      page: () => WrapPage(),
    ),
    GetPage(
      name: RoutePaths.Scaffold,
      page: () => ScaffoldPage(),
    ),

    // =========================其他=============================
    GetPage(
      name: RoutePaths.Dialog,
      page: () => DialogPage(),
    ),
    GetPage(
      name: RoutePaths.Picture,
      page: () => PicturePage(),
      binding: PictureBinding(),
    ),
    GetPage(
      name: RoutePaths.Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutePaths.User,
      page: () => UserPage(),
      binding: UserBinding(),
    ),

    // =========================设置=============================
    GetPage(
      name: RoutePaths.Swiper,
      page: () => SwiperPage(),
    ),
    GetPage(
      name: RoutePaths.Dio,
      page: () => DioPage(),
    ),
    GetPage(
      name: RoutePaths.GetX,
      page: () => GetXPage(),
    ),
    GetPage(
      name: RoutePaths.Native,
      page: () => NativePage(),
    ),
    GetPage(
      name: RoutePaths.Web,
      page: () => WebPage(),
      binding: WebBinding(),
    ),
  ];
}
