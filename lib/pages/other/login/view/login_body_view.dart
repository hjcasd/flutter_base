import 'package:flutter/material.dart';
import 'package:flutter_base/components/text_field/simple_text_field.dart';
import 'package:flutter_base/pages/other/login/logic/login_controller.dart';
import 'package:get/get.dart';

/// 登录View
class LoginBodyView extends GetView<LoginController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
      value: controller.name,
      controller: _nameController,
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
        controller.changeName(value);
      },
    );
  }

  /// 密码输入框
  Widget _getPasswordInput() {
    return SimpleTextField(
      value: controller.password,
      controller: _passwordController,
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
        controller.changePassword(value);
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
          controller.login().then((isLogin) {
            _nameFocusNode.unfocus();
            _passwordFocusNode.unfocus();
          });
        },
      ),
    );
  }
}
