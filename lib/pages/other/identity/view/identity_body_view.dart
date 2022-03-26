import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/smart_button.dart';
import 'package:flutter_base/components/form/form_read_item.dart';
import 'package:flutter_base/components/form/form_write_item.dart';
import 'package:flutter_base/native/native_path.dart';
import 'package:flutter_base/pages/other/identity/identity_controller.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

class IdentityBodyView extends GetView<IdentityController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormReadItem(
          "姓名",
          "胡**",
        ),
        FormReadItem(
          "身份证",
          "3101*********244X",
          isLarge: true,
        ),
        FormReadItem(
          "手机号",
          "138****0000",
          tip: "手机号不正确",
          operate: "修改",
          onOperatePressed: () {
            LogHelper.e("1111111111", tag: "phone");
          },
        ),
        GetBuilder<IdentityController>(
          builder: (controller) {
            return FormWriteItem(
              "姓名",
              controller.name,
              "请输入姓名",
              controller: _nameController,
              onChanged: (value) {
                controller.name = value;
              },
              onClear: () {
                controller.name = "";
                _nameController.clear();
              },
              operate: "添加",
              onOperatePressed: () {
                LogHelper.e(_nameController.value.text, tag: "name");
              },
            );
          },
        ),
        GetBuilder<IdentityController>(
          builder: (controller) {
            return FormWriteItem(
              "手机号",
              controller.phone,
              "请输入手机号",
              keyboardType: TextInputType.number,
              controller: _phoneController,
              onChanged: (value) {
                controller.phone = value;
              },
              onClear: () {
                controller.phone = "";
                _phoneController.clear();
              },
              tip: "手机号不正确",
              operate: "添加",
              onOperatePressed: () {
                LogHelper.e(_phoneController.value.text, tag: "phone");
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
      ],
    );
  }
}
