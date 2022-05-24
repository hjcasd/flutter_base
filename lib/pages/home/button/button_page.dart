import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// Button页面
class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "Button的使用",
      ),
      body: MyButton(),
    );
    // return MyFloatingButton(),
  }
}

/// ElevatedButton: 漂浮按钮，默认带有阴影和灰色背景。按下后，阴影会变大
/// TextButton: 文本按钮，默认背景透明并不带阴影。按下后，会有背景色
/// OutlinedButton: 默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
/// IconButton: 一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
/// 带图标的按钮: ElevatedButton.icon, OutlineButton.icon, TextButton.icon
/// ButtonBar: 按钮组
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
        TextButton(
          onPressed: () {
            print("TextButton");
          },
          child: Text(
            "TextButton",
          ),
        ),
        OutlinedButton(
          onPressed: () {
            print("OutlinedButton");
          },
          child: Text(
            "OutlinedButton",
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
      appBar: SimpleAppBar(
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
        elevation: 10,
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
