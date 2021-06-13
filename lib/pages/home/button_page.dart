import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// Button的使用
class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Button", MyButton());
  }
}

// RaisedButton, FlatButton, OutlineButton, ButtonBar
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          RaisedButton(
              onPressed: () {
                print("RaisedButton");
              },
              color: Colors.green,
              textColor: Colors.white,
              // 按钮阴影
              elevation: 10.0,
              child: Text("RaisedButton")),
          SizedBox(width: 10.0),
          RaisedButton.icon(
              onPressed: () {
                print("图标按钮");
              },
              icon: Icon(Icons.settings),
              label: Text("图标按钮"))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          FlatButton(
              onPressed: () {
                print("FlatButton");
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("FlatButton")),
          SizedBox(width: 10.0),
          OutlineButton(
              onPressed: () {
                print("OutlineButton");
              },
              textColor: Colors.blue,
              child: Text("OutlineButton")),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          IconButton(
              onPressed: () {
                print("IconButton");
              },
              icon: Icon(Icons.settings),
              color: Colors.blue),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ButtonBar(children: <Widget>[
            RaisedButton(
                onPressed: () {
                  print("登录");
                },
                color: Colors.green,
                textColor: Colors.white,
                // 按钮阴影
                elevation: 10.0,
                child: Text("登录")),
            RaisedButton(
                onPressed: () {
                  print("注册");
                },
                color: Colors.green,
                textColor: Colors.white,
                // 按钮阴影
                elevation: 10.0,
                child: Text("注册")),
          ])
        ])
      ],
    );
  }
}

// FloatingActionButton
class MyButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Button"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("浮动按钮");
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          elevation: 10.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Center(child: Text("11111")));
  }
}
