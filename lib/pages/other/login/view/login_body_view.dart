import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/smart_button.dart';
import 'package:flutter_base/components/divider_text_field.dart';
import 'package:flutter_base/native/native_path.dart';
import 'package:flutter_base/pages/other/login/logic/login_controller.dart';
import 'package:flutter_base/routes/app_routes.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 登录View
class LoginBodyView extends GetView<LoginController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            _getRoundImage(
              "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg",
              100,
            ),
            SizedBox(
              height: 40,
            ),
            _getNameInput(),
            _getPasswordInput(),
            SizedBox(
              height: 10,
            ),
            _getLoginButton(),
            SmartButton(
              "跳转到原生",
              onPressed: () {
                RouteManager.jumpToNativePage(NativePath.DEMO2);
              },
            ),
            SmartButton(
              "跳转到身份页面",
              onPressed: () {
                RouteManager.offAllNamedPage(AppRoutes.User);
              },
            ),
          ],
        ),
      ),
    );
  }

  // 圆形头像
  Widget _getRoundImage(String imageUrl, double size) {
    return ClipOval(
      child: Image.network(
        imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }

  /// 用户名输入框
  Widget _getNameInput() {
    return DividerTextField(
      keyboardType: TextInputType.text,
      maxLength: 11,
      hintText: "请输入用户名",
      prefixIcon: Icon(
        Icons.account_box,
        size: 20,
      ),
      controller: _nameController,
      onChanged: (value) {
        LogHelper.e("name: $value");
      },
    );
  }

  /// 密码输入框
  Widget _getPasswordInput() {
    return DividerTextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      hintText: "请输入密码",
      prefixIcon: Icon(
        Icons.lock_open,
        size: 20,
      ),
      controller: _passwordController,
      onChanged: (value) {
        LogHelper.e("password: $value");
      },
    );
  }

  /// 登录按钮
  Widget _getLoginButton() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        child: Text(
          "登录",
        ),
        onPressed: () {
          controller.login(_nameController, _passwordController);
        },
      ),
    );
  }
}
