import 'package:flutter/material.dart';
import 'package:flutter_base/components/divider_text_field.dart';
import 'package:flutter_base/pages/other/login/controller/login_controller.dart';
import 'package:get/get.dart';

/// 登录View
class LoginBodyView extends GetView<LoginController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          _getRoundImage("https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg", 100.0),
          SizedBox(
            height: 40.0,
          ),
          _getNameInput(),
          _getPasswordInput(),
          SizedBox(
            height: 10.0,
          ),
          _getLoginButton(),
        ],
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
    return GetBuilder<LoginController>(
      id: "name",
      builder: (controller) => DividerTextField(
        controller.name,
        keyboardType: TextInputType.text,
        maxLength: 11,
        hintText: "请输入用户名",
        prefixIcon: Icons.account_box,
        controller: _nameController,
        onChanged: (value) {
          controller.changeName(value);
        },
        onClear: () {
          controller.changeName("");
          _nameController.clear();
        },
      ),
    );
  }

  /// 密码输入框
  Widget _getPasswordInput() {
    return GetBuilder<LoginController>(
      id: "password",
      builder: (controller) => DividerTextField(
        controller.password,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        hintText: "请输入密码",
        prefixIcon: Icons.lock_open,
        controller: _passwordController,
        onChanged: (value) {
          controller.changePassword(value);
        },
        onClear: () {
          controller.changePassword("");
          _passwordController.clear();
        },
      ),
    );
  }

  /// 登录按钮
  Widget _getLoginButton() {
    return Container(
      height: 50.0,
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: Text(
          "登录",
        ),
        onPressed: () {
          if (controller.name.isEmpty) {
            _showToast("请输入用户名");
            return;
          }
          if (controller.password.isEmpty) {
            _showToast("请输入密码");
            return;
          }
          controller.login();
        },
      ),
    );
  }

  /// Toast
  _showToast(String msg) {
    Get.snackbar('提示', msg);
  }
}
