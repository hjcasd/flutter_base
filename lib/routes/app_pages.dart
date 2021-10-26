import 'package:flutter_base/pages/home/rich_text_page.dart';
import 'package:flutter_base/pages/layout/scaffold_page.dart';
import 'package:flutter_base/pages/main_page.dart';
import 'package:flutter_base/pages/home/button_page.dart';
import 'package:flutter_base/pages/layout/container_page.dart';
import 'package:flutter_base/pages/home/form_page.dart';
import 'package:flutter_base/pages/home/grid_page.dart';
import 'package:flutter_base/pages/home/image_page.dart';
import 'package:flutter_base/pages/home/list_page.dart';
import 'package:flutter_base/pages/home/text_page.dart';
import 'package:flutter_base/pages/home/app_bar_page.dart';
import 'package:flutter_base/pages/layout/card_page.dart';
import 'package:flutter_base/pages/layout/column_page.dart';
import 'package:flutter_base/pages/home/drawer_page.dart';
import 'package:flutter_base/pages/layout/expanded_page.dart';
import 'package:flutter_base/pages/layout/padding_page.dart';
import 'package:flutter_base/pages/layout/row_page.dart';
import 'package:flutter_base/pages/layout/stack_page.dart';
import 'package:flutter_base/pages/home/tab_controller_page.dart';
import 'package:flutter_base/pages/layout/wrap_page.dart';
import 'package:flutter_base/pages/setting/dialog_page.dart';
import 'package:flutter_base/pages/setting/dio_page.dart';
import 'package:flutter_base/pages/setting/getx_page.dart';
import 'package:flutter_base/pages/setting/http_page.dart';
import 'package:flutter_base/pages/setting/native_page.dart';
import 'package:flutter_base/pages/setting/swiper_page.dart';
import 'package:flutter_base/pages/unknown_page.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:get/get.dart';

/// 注册路由表
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
      name: Routes.List,
      page: () => ListViewPage(),
    ),
    GetPage(
      name: Routes.Grid,
      page: () => GridViewPage(),
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
      name: Routes.TabController,
      page: () => TabControllerPage(),
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


    // =========================设置=============================
    GetPage(
      name: Routes.Dialog,
      page: () => DialogPage(),
    ),
    GetPage(
      name: Routes.Swiper,
      page: () => SwiperPage(),
    ),
    GetPage(
      name: Routes.Http,
      page: () => HttpPage(),
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
