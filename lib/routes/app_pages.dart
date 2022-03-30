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
import 'package:flutter_base/pages/setting/dio/dio_page.dart';
import 'package:flutter_base/pages/setting/get_x/get_x_page.dart';
import 'package:flutter_base/pages/setting/native/native_page.dart';
import 'package:flutter_base/pages/setting/swiper/swiper_page.dart';
import 'package:flutter_base/pages/unknown_page.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:get/get.dart';

/// 注册路由表(每个新建的页面都要在这注册对应路由)
abstract class AppPages {
  AppPages._internal();

  static final pages = [
    GetPage(
      name: AppRoutes.Initial,
      page: () => MainPage(),
    ),
    GetPage(
      name: AppRoutes.UnKnown,
      page: () => UnknownPage(),
    ),

    // =========================首页=============================
    GetPage(
      name: AppRoutes.Text,
      page: () => TextPage(),
    ),
    GetPage(
      name: AppRoutes.Button,
      page: () => ButtonPage(),
    ),
    GetPage(
      name: AppRoutes.Image,
      page: () => ImagePage(),
    ),

    GetPage(
      name: AppRoutes.ListView,
      page: () => ListViewPage(),
    ),
    GetPage(
      name: AppRoutes.ListStatic,
      page: () => ListStaticPage(),
    ),
    GetPage(
      name: AppRoutes.ListDynamic,
      page: () => ListDynamicPage(),
    ),

    GetPage(
      name: AppRoutes.GridView,
      page: () => GridViewPage(),
    ),
    GetPage(
      name: AppRoutes.GridCount,
      page: () => GridCountPage(),
    ),
    GetPage(
      name: AppRoutes.GridBuilder,
      page: () => GridBuilderPage(),
    ),

    GetPage(
      name: AppRoutes.Form,
      page: () => FormPage(),
    ),
    GetPage(
      name: AppRoutes.AppBar,
      page: () => AppBarPage(),
    ),
    GetPage(
      name: AppRoutes.TabBar,
      page: () => TabBarPage(),
    ),
    GetPage(
      name: AppRoutes.Drawer,
      page: () => DrawerPage(),
    ),
    GetPage(
      name: AppRoutes.RichText,
      page: () => RichTextPage(),
    ),

    // =========================布局=============================
    GetPage(
      name: AppRoutes.Container,
      page: () => ContainerPage(),
    ),
    GetPage(
      name: AppRoutes.Padding,
      page: () => PaddingPage(),
    ),
    GetPage(
      name: AppRoutes.Row,
      page: () => RowPage(),
    ),
    GetPage(
      name: AppRoutes.Column,
      page: () => ColumnPage(),
    ),
    GetPage(
      name: AppRoutes.Expanded,
      page: () => ExpandedPage(),
    ),
    GetPage(
      name: AppRoutes.Stack,
      page: () => StackPage(),
    ),
    GetPage(
      name: AppRoutes.StackPositioned,
      page: () => StackPositionedPage(),
    ),
    GetPage(
      name: AppRoutes.StackAlign,
      page: () => StackAlignPage(),
    ),
    GetPage(
      name: AppRoutes.Card,
      page: () => CardPage(),
    ),
    GetPage(
      name: AppRoutes.Wrap,
      page: () => WrapPage(),
    ),
    GetPage(
      name: AppRoutes.Scaffold,
      page: () => ScaffoldPage(),
    ),

    // =========================其他=============================
    GetPage(
      name: AppRoutes.Dialog,
      page: () => DialogPage(),
    ),
    GetPage(
      name: AppRoutes.Picture,
      page: () => PicturePage(),
      binding: PictureBinding(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.User,
      page: () => UserPage(),
      binding: UserBinding(),
    ),

    // =========================设置=============================
    GetPage(
      name: AppRoutes.Swiper,
      page: () => SwiperPage(),
    ),
    GetPage(
      name: AppRoutes.Dio,
      page: () => DioPage(),
    ),
    GetPage(
      name: AppRoutes.GetX,
      page: () => GetXPage(),
    ),
    GetPage(
      name: AppRoutes.Native,
      page: () => NativePage(),
    ),
  ];
}
