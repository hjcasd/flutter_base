import 'package:flutter_base/pages/home/grid_view/grid_builder_page.dart';
import 'package:flutter_base/pages/home/grid_view/grid_count_page.dart';
import 'package:flutter_base/pages/home/grid_view/grid_view_page.dart';
import 'package:flutter_base/pages/home/list_view/list_dynamic_page.dart';
import 'package:flutter_base/pages/home/list_view/list_static_page.dart';
import 'package:flutter_base/pages/home/list_view/list_view_page.dart';
import 'package:flutter_base/pages/home/progress/progress_page.dart';
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
import 'package:flutter_base/pages/other/login/login_binding.dart';
import 'package:flutter_base/pages/other/login/login_page.dart';
import 'package:flutter_base/pages/other/picture/picture_binding.dart';
import 'package:flutter_base/pages/other/picture/picture_page.dart';
import 'package:flutter_base/pages/other/user/user_binding.dart';
import 'package:flutter_base/pages/other/user/user_page.dart';
import 'package:flutter_base/pages/setting/dio/dio_page.dart';
import 'package:flutter_base/pages/setting/get_x/get_x_binding.dart';
import 'package:flutter_base/pages/setting/get_x/get_x_page.dart';
import 'package:flutter_base/pages/setting/native/native_page.dart';
import 'package:flutter_base/pages/setting/picker/picker_page.dart';
import 'package:flutter_base/pages/setting/swiper/swiper_page.dart';
import 'package:flutter_base/pages/not_found_page.dart';
import 'package:flutter_base/pages/setting/web/web_binding.dart';
import 'package:flutter_base/pages/setting/web/web_page.dart';
import 'package:flutter_base/routes/route_paths.dart';
import 'package:get/get.dart';

/// 注册路由表(每个新建的页面都要在这注册对应路由)
abstract class RoutePages {
  RoutePages._internal();

  static final pages = [
    GetPage(
      name: RoutePaths.initial,
      page: () => MainPage(),
    ),
    GetPage(
      name: RoutePaths.notFound,
      page: () => NotFoundPage(),
    ),

    // =========================首页=============================
    GetPage(
      name: RoutePaths.text,
      page: () => TextPage(),
    ),
    GetPage(
      name: RoutePaths.richText,
      page: () => RichTextPage(),
    ),

    GetPage(
      name: RoutePaths.button,
      page: () => ButtonPage(),
    ),
    GetPage(
      name: RoutePaths.image,
      page: () => ImagePage(),
    ),

    GetPage(
      name: RoutePaths.listView,
      page: () => ListViewPage(),
    ),
    GetPage(
      name: RoutePaths.listStatic,
      page: () => ListStaticPage(),
    ),
    GetPage(
      name: RoutePaths.listDynamic,
      page: () => ListDynamicPage(),
    ),

    GetPage(
      name: RoutePaths.gridView,
      page: () => GridViewPage(),
    ),
    GetPage(
      name: RoutePaths.gridCount,
      page: () => GridCountPage(),
    ),
    GetPage(
      name: RoutePaths.gridBuilder,
      page: () => GridBuilderPage(),
    ),

    GetPage(
      name: RoutePaths.form,
      page: () => FormPage(),
    ),
    GetPage(
      name: RoutePaths.appBar,
      page: () => AppBarPage(),
    ),
    GetPage(
      name: RoutePaths.tabBar,
      page: () => TabBarPage(),
    ),
    GetPage(
      name: RoutePaths.drawer,
      page: () => DrawerPage(),
    ),
    GetPage(
      name: RoutePaths.progress,
      page: () => ProgressPage(),
    ),

    // =========================布局=============================
    GetPage(
      name: RoutePaths.container,
      page: () => ContainerPage(),
    ),
    GetPage(
      name: RoutePaths.padding,
      page: () => PaddingPage(),
    ),
    GetPage(
      name: RoutePaths.row,
      page: () => RowPage(),
    ),
    GetPage(
      name: RoutePaths.column,
      page: () => ColumnPage(),
    ),
    GetPage(
      name: RoutePaths.expanded,
      page: () => ExpandedPage(),
    ),
    GetPage(
      name: RoutePaths.stack,
      page: () => StackPage(),
    ),
    GetPage(
      name: RoutePaths.stackPositioned,
      page: () => StackPositionedPage(),
    ),
    GetPage(
      name: RoutePaths.stackAlign,
      page: () => StackAlignPage(),
    ),
    GetPage(
      name: RoutePaths.card,
      page: () => CardPage(),
    ),
    GetPage(
      name: RoutePaths.wrap,
      page: () => WrapPage(),
    ),
    GetPage(
      name: RoutePaths.scaffold,
      page: () => ScaffoldPage(),
    ),

    // =========================其他=============================
    GetPage(
      name: RoutePaths.dialog,
      page: () => DialogPage(),
    ),
    GetPage(
      name: RoutePaths.picture,
      page: () => PicturePage(),
      binding: PictureBinding(),
    ),
    GetPage(
      name: RoutePaths.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutePaths.user,
      page: () => UserPage(),
      binding: UserBinding(),
    ),

    // =========================设置=============================
    GetPage(
      name: RoutePaths.swiper,
      page: () => SwiperPage(),
    ),
    GetPage(
      name: RoutePaths.dio,
      page: () => DioPage(),
    ),
    GetPage(
      name: RoutePaths.getX,
      page: () => GetXPage(),
      binding: GetXBinding(),
    ),
    GetPage(
      name: RoutePaths.native,
      page: () => NativePage(),
    ),
    GetPage(
      name: RoutePaths.picker,
      page: () => PickerPage(),
    ),
    GetPage(
      name: RoutePaths.web,
      page: () => WebPage(),
      binding: WebBinding(),
    ),
  ];
}
