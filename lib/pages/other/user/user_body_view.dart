import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/components/button/simple_button.dart';
import 'package:flutter_base/components/button/smart_button.dart';
import 'package:flutter_base/components/form/form_read_item.dart';
import 'package:flutter_base/components/form/form_write_item.dart';
import 'package:flutter_base/components/text/simple_text.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/pages/other/user/user_controller.dart';
import 'package:flutter_base/routes/route_paths.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:flutter_base/utils/extension/string_seprate.dart';
import 'package:get/get.dart';

/// 用户信息页面View
class UserBodyView extends StatelessWidget {
  // Controller
  final UserController _controller = Get.find<UserController>();

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
          value: _controller.name,
          placeholder: "请输入姓名",
          onChanged: (value) {
            _controller.changeName(value);
          },
          onClear: () {
            _controller.changeName("");
          },
        ),
        FormWriteItem(
          title: "手机号",
          value: _controller.phone,
          placeholder: "请输入手机号",
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
            _controller.changePhone(value);
          },
          onClear: () {
            _controller.changePhone("");
          },
        ),
        SizedBox(
          height: 10,
        ),
        SimpleText(
          _controller.tip,
          fontSize: 18,
          fontColor: AppColors.blue,
        ),
        SizedBox(
          height: 10,
        ),
        SmartButton(
          "测试",
          isEnable: _controller.buttonEnable,
          onPressed: () {
            _controller.test();
          },
        ),
        SimpleButton(
          "跳转到登录页面",
          onPressed: () {
            RouteManager.toNamed(RoutePaths.login);
          },
        ),
      ],
    );
  }
}
