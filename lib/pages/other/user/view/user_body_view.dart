import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/components/button/smart_button.dart';
import 'package:flutter_base/components/form/form_read_item.dart';
import 'package:flutter_base/components/form/form_write_item.dart';
import 'package:flutter_base/native/native_path.dart';
import 'package:flutter_base/pages/other/user/logic/user_controller.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:flutter_base/utils/extension/string_seprate.dart';
import 'package:get/get.dart';

/// 用户信息页面View
class UserBodyView extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormReadItem(
          title: '身份证',
          content: '3101*********244X',
        ),
        FormWriteItem(
          title: "姓名",
          value: controller.name,
          placeholder: "请输入姓名",
          inputFormatters: [
            TextInputFormatter.withFunction(
              (oldValue, newValue) => TextEditingValue(
                text: newValue.text.stringSeparate(
                  separator: " ",
                  count: 4,
                  fromRightToLeft: false,
                ),
              ),
            )
          ],
          onChanged: (value) {
            controller.changeName(value);
          },
          onClear: () {
            controller.changeName("");
          },
        ),
        SmartButton(
          "跳转到原生",
          onPressed: () {
            RouteManager.jumpToNativePage(NativePath.MAIN);
          },
        ),
        SmartButton(
          "跳转到登录页面",
          onPressed: () {
            RouteManager.jumpToNamedPage(AppRoutes.Login);
          },
        ),
      ],
    );
  }
}
