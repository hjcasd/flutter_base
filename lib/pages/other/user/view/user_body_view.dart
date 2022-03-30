import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/smart_button.dart';
import 'package:flutter_base/components/form/form_read_item.dart';
import 'package:flutter_base/components/form/form_write_item.dart';
import 'package:flutter_base/native/native_path.dart';
import 'package:flutter_base/pages/other/user/logic/user_controller.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 用户信息页面View
class UserBodyView extends GetView<UserController> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormReadItem(
          "身份证",
          "3101*********244X",
        ),
        GetBuilder<UserController>(
          id: "name",
          builder: (controller) {
            return FormWriteItem(
              "姓名",
              controller.name,
              "请输入姓名",
              controller: _nameController,
              onChanged: (value) {
                controller.changeName(value);
              },
              onClear: () {
                controller.changeName("");
                _nameController.clear();
              },
              operate: "添加",
              onOperatePressed: () {
                LogHelper.e(_nameController.value.text, tag: "name");
              },
            );
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
