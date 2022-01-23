import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/constants/AppColors.dart';

/// Button页面
class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "Button的使用",
        ),
        body: MyButton(),
      ),
      // home: MyFloatingButton(),
    );
  }
}

/// ElevatedButton, ButtonBar
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            print("ElevatedButton");
          },
          child: Text(
            "ElevatedButton",
          ),
        ),
        IconButton(
          onPressed: () {
            print("IconButton");
          },
          icon: Icon(
            Icons.settings,
          ),
          color: AppColors.blue,
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                print("登录");
              },
              child: Text(
                "登录",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("注册");
              },
              child: Text(
                "注册",
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// FloatingActionButton
class MyFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartAppBar(
        "FloatingActionButton的使用",
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("浮动按钮");
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: AppColors.green,
        elevation: 10.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Text(
          "11111",
        ),
      ),
    );
  }
}
