import 'package:flutter_base/pages/home/grid_view/grid_builder_page.dart';
import 'package:flutter_base/pages/home/grid_view/grid_count_page.dart';
import 'package:flutter_base/pages/home/grid_view/grid_view_page.dart';
import 'package:flutter_base/pages/home/list_view/list_dynamic_page.dart';
import 'package:flutter_base/pages/home/list_view/list_static_page.dart';
import 'package:flutter_base/pages/home/list_view/list_view_page.dart';
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
import 'package:flutter_base/pages/other/identity/identity_page.dart';
import 'package:flutter_base/pages/other/login/login_page.dart';
import 'package:flutter_base/pages/other/picture/picture_list_page.dart';
import 'package:flutter_base/pages/setting/dio/dio_page.dart';
import 'package:flutter_base/pages/setting/get_x/get_x_page.dart';
import 'package:flutter_base/pages/setting/native/native_page.dart';
import 'package:flutter_base/pages/setting/swiper/swiper_page.dart';
import 'package:flutter_base/pages/unknown_page.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:get/get.dart';

/// 注册路由表(每个新建的页面都要在这进行注册对应路由)
abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.Initial,
      page: () => MainPage(),
    ),
    GetPage(
      name: Routes.UnKnown,
      page: () => UnknownPage(),
    ),

    // =========================首页=============================
    GetPage(
      name: Routes.Text,
      page: () => TextPage(),
    ),
    GetPage(
      name: Routes.Button,
      page: () => ButtonPage(),
    ),
    GetPage(
      name: Routes.Image,
      page: () => ImagePage(),
    ),

    GetPage(
      name: Routes.ListView,
      page: () => ListViewPage(),
    ),
    GetPage(
      name: Routes.ListStatic,
      page: () => ListStaticPage(),
    ),
    GetPage(
      name: Routes.ListDynamic,
      page: () => ListDynamicPage(),
    ),


    GetPage(
      name: Routes.GridView,
      page: () => GridViewPage(),
    ),
    GetPage(
      name: Routes.GridCount,
      page: () => GridCountPage(),
    ),
    GetPage(
      name: Routes.GridBuilder,
      page: () => GridBuilderPage(),
    ),

    GetPage(
      name: Routes.Form,
      page: () => FormPage(),
    ),
    GetPage(
      name: Routes.AppBar,
      page: () => AppBarPage(),
    ),
    GetPage(
      name: Routes.TabBar,
      page: () => TabBarPage(),
    ),
    GetPage(
      name: Routes.Drawer,
      page: () => DrawerPage(),
    ),
    GetPage(
      name: Routes.RichText,
      page: () => RichTextPage(),
    ),

    // =========================布局=============================
    GetPage(
      name: Routes.Container,
      page: () => ContainerPage(),
    ),
    GetPage(
      name: Routes.Padding,
      page: () => PaddingPage(),
    ),
    GetPage(
      name: Routes.Row,
      page: () => RowPage(),
    ),
    GetPage(
      name: Routes.Column,
      page: () => ColumnPage(),
    ),
    GetPage(
      name: Routes.Expanded,
      page: () => ExpandedPage(),
    ),
    GetPage(
      name: Routes.Stack,
      page: () => StackPage(),
    ),
    GetPage(
      name: Routes.Card,
      page: () => CardPage(),
    ),
    GetPage(
      name: Routes.Wrap,
      page: () => WrapPage(),
    ),
    GetPage(
      name: Routes.Scaffold,
      page: () => ScaffoldPage(),
    ),

    // =========================其他=============================
    GetPage(
      name: Routes.Dialog,
      page: () => DialogPage(),
    ),
    GetPage(
      name: Routes.PictureList,
      page: () => PictureListPage(),
    ),
    GetPage(
      name: Routes.Login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.Identity,
      page: () => IdentityPage(),
    ),

    // =========================设置=============================
    GetPage(
      name: Routes.Swiper,
      page: () => SwiperPage(),
    ),
    GetPage(
      name: Routes.Dio,
      page: () => DioPage(),
    ),
    GetPage(
      name: Routes.GetX,
      page: () => GetXPage(),
    ),
    GetPage(
      name: Routes.Native,
      page: () => NativePage(),
    ),
  ];
}
