import 'package:flutter/material.dart';
import 'package:flutter_base/components/button/simple_button.dart';
import 'package:flutter_base/components/text_field/simple_text_field.dart';
import 'package:flutter_base/constants/app_constants.dart';
import 'package:flutter_base/pages/other/login/logic/login_controller.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:flutter_base/routes/route_paths.dart';
import 'package:get/get.dart';

/// 登录View
class LoginBodyView extends StatelessWidget {
  // Controller
  final LoginController _controller = Get.find<LoginController>();

  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            _getRoundImage(
              AppConstants.NET_IMAGE_URL1,
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
            SizedBox(
              height: 10,
            ),
            SimpleButton(
              "跳转到用户页面",
              onPressed: () {
                RouteManager.offAllNamed(RoutePaths.User);
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
    return SimpleTextField(
      value: _controller.name,
      controller: _nameTextController,
      focusNode: _nameFocusNode,
      placeholder: "请输入用户名",
      maxLength: 11,
      prefixIcon: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          Icons.account_box,
          size: 20,
        ),
      ),
      onChanged: (value) {
        _controller.changeName(value);
      },
    );
  }

  /// 密码输入框
  Widget _getPasswordInput() {
    return SimpleTextField(
      value: _controller.password,
      controller: _passwordTextController,
      focusNode: _passwordFocusNode,
      placeholder: "请输入密码",
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      prefixIcon: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          Icons.lock_open,
          size: 20,
        ),
      ),
      onChanged: (value) {
        _controller.changePassword(value);
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
          _controller.login().then((isLogin) {
            _nameFocusNode.unfocus();
            _passwordFocusNode.unfocus();
          });
        },
      ),
    );
  }
}
