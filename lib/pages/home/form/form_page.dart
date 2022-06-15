import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/utils/log_helper.dart';

/// Form页面
class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "Form的使用",
      ),
      body: MyForm(),
      resizeToAvoidBottomInset: false,
    );
  }
}

/// 表单组件
class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyFormState();
}

/// TextField, Switch, Radio, Checkbox
class _MyFormState extends State<MyForm> {
  var _username = "";
  var _phoneController = TextEditingController(text: "123456");
  var _sex = 1;
  var _openState = false;
  var _desc = "";

  final List _hobby = [
    {"title": "游泳", "checked": true},
    {"title": "下棋", "checked": false},
    {"title": "读书", "checked": false}
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "请输入用户名",
              icon: Icon(
                Icons.account_box,
              ),
            ),
            onChanged: (value) {
              setState(() {
                _username = value;
              });
            },
          ),
          TextField(
            controller: TextEditingController.fromValue(
              TextEditingValue(
                // 设置内容
                text: _phoneController.text,
                // 保持光标在最后
                selection: TextSelection.fromPosition(
                  TextPosition(
                    affinity: TextAffinity.downstream,
                    offset: _phoneController.text.length,
                  ),
                ),
              ),
            ),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "请输入手机号",
              icon: Icon(
                Icons.phone,
              ),
            ),
            onChanged: (value) {
              LogHelper.e("$value");
              setState(() {
                _phoneController.text = value;
              });
            },
          ),
          Row(
            children: <Widget>[
              Text(
                "男: ",
              ),
              Radio(
                value: 1,
                groupValue: _sex,
                onChanged: _sexChanged,
              ),
              Text(
                "女: ",
              ),
              Radio(
                value: 2,
                groupValue: _sex,
                onChanged: _sexChanged,
              ),
            ],
          ),
          Row(
            children: _getHobby(),
          ),
          Switch(
            value: _openState,
            onChanged: (value) {
              setState(() {
                _openState = value;
              });
            },
          ),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "请输入描述",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                _desc = value;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                LogHelper.e("用户名: $_username");
                LogHelper.e("性别: $_sex");
                LogHelper.e("爱好: $_hobby");
                LogHelper.e("描述: $_desc");
              },
              child: Text(
                "提交",
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sexChanged(value) {
    setState(() {
      _sex = value;
    });
  }

  /// 获取Hobby
  List<Widget> _getHobby() {
    List<Widget> tmpList = [];
    for (var i = 0; i < _hobby.length; i++) {
      tmpList.add(
        Row(
          children: <Widget>[
            Text(
              _hobby[i]["title"],
            ),
            Checkbox(
              value: _hobby[i]["checked"],
              onChanged: (value) {
                setState(() {
                  _hobby[i]["checked"] = value;
                });
              },
            ),
          ],
        ),
      );
    }
    return tmpList;
  }
}
