import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/divider_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 登录页面
class LoginExamplePage extends StatelessWidget {
  LoginExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar("登录页面"),
        body: MyLoginWidget(),
      ),
    );
  }
}

/// Page
class MyLoginWidget extends StatefulWidget {
  @override
  _MyLoginState createState() {
    return _MyLoginState();
  }
}

/// State
class _MyLoginState extends State<MyLoginWidget> {
  var _phone = "";
  var _password = "";
  var _phoneController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getRoundImage("https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg", 100.0),
          SizedBox(
            height: 40.0,
          ),
          _getPhoneInput(),
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
  Widget _getPhoneInput() {
    return DividerTextField(
      _phone,
      keyboardType: TextInputType.number,
      maxLength: 11,
      hintText: "请输入手机号",
      prefixIcon: Icons.phone,
      controller: _phoneController,
      onChanged: (value) {
        setState(() {
          _phone = value;
        });
      },
      onClear: () {
        setState(() {
          _phone = "";
          _phoneController.clear();
        });
      },
    );
  }

  /// 密码输入框
  Widget _getPasswordInput() {
    return DividerTextField(
      _password,
      keyboardType: TextInputType.text,
      obscureText: true,
      hintText: "请输入密码",
      prefixIcon: Icons.lock_open,
      controller: _passwordController,
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
      onClear: () {
        setState(() {
          _password = "";
          _passwordController.clear();
        });
      },
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
          if (_phone.isEmpty) {
            _showToast("请输入手机号");
            return;
          }
          if (_password.isEmpty) {
            _showToast("请输入密码");
            return;
          }
          print("phone: $_phone, password: $_password");
        },
      ),
    );
  }

  /// Toast
  _showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
