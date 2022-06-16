import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/pages/other/login/view/login_body_view.dart';

/// 登录页面
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "登录页面",
      ),
      body: LoginBodyView(),
    );
  }
}
