import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// Button页面
class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Button的使用", MyButtonWidget());
  }
}

/// ElevatedButton, ButtonBar
class MyButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
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
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {
                print("IconButton");
              },
              icon: Icon(
                Icons.settings,
              ),
              color: Colors.blue,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonBar(
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
            )
          ],
        )
      ],
    );
  }
}

/// FloatingActionButton
class MyFloatingButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Button",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("浮动按钮");
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.green,
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
