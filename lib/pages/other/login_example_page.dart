import 'package:flutter/material.dart';
import 'package:flutter_base/components/divider_text_field.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// 登录页面
class LoginExamplePage extends StatelessWidget {
  LoginExamplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp(
      "登录页面",
      MyLoginWidget(),
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
  var _phoneController = TextEditingController();
  var _passwordController = TextEditingController();
  var _phone = "", _password = "";

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

  // 圆形图片
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
      TextInputType.number,
      inputDecoration: InputDecoration(
        hintText: "请输入手机号",
        icon: Icon(
          Icons.phone,
          size: 20.0,
        ),
        border: InputBorder.none,
        suffixIcon: GestureDetector(
          child: Offstage(
            child: Icon(
              Icons.clear,
            ),
            offstage: _phone == "",
          ),
          onTap: () {
            setState(() {
              _phone = "";
              _phoneController.clear();
            });
          },
        ),
      ),
      controller: _phoneController,
      onChanged: (value) {
        setState(() {
          _phone = value;
        });
      },
    );
  }

  /// 密码输入框
  Widget _getPasswordInput() {
    return DividerTextField(
      TextInputType.text,
      obscureText: true,
      inputDecoration: InputDecoration(
        hintText: "请输入密码",
        icon: Icon(
          Icons.lock_open,
          size: 20.0,
        ),
        border: InputBorder.none,
        suffixIcon: GestureDetector(
          child: Offstage(
            child: Icon(
              Icons.clear,
            ),
            offstage: _password == "",
          ),
          onTap: () {
            setState(() {
              _password = "";
              _passwordController.clear();
            });
          },
        ),
      ),
      controller: _passwordController,
      onChanged: (value) {
        setState(() {
          _password = value;
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
      child: TextButton(
        child: Text(
          "登录",
        ),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        onPressed: () {
          print("phone: $_phone, password: $_password");
        },
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
