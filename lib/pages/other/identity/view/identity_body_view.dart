import 'package:flutter/material.dart';
import 'package:flutter_base/components/form_item/form_read_item.dart';
import 'package:flutter_base/components/form_item/form_write_item.dart';
import 'package:flutter_base/pages/other/identity/controller/identity_controller.dart';
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
            LogHelper.e("tag", "1111111111");
          },
        ),
        GetBuilder<IdentityController>(
          id: 'name',
          builder: (controller) => FormWriteItem(
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
              LogHelper.e("name", _nameController.value.text);
            },
          ),
        ),
        GetBuilder<IdentityController>(
          id: "phone",
          builder: (controller) => FormWriteItem(
            "手机号",
            controller.phone,
            "请输入手机号",
            keyboardType: TextInputType.number,
            controller: _phoneController,
            onChanged: (value) {
              controller.changePhone(value);
            },
            onClear: () {
              controller.changePhone("");
              _phoneController.clear();
            },
            tip: "手机号不正确",
            operate: "添加",
            onOperatePressed: () {
              LogHelper.e("phone", _phoneController.value.text);
            },
          ),
        ),
      ],
    );
  }
}
