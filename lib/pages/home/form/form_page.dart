import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';

/// Form页面
class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "Form的使用",
        ),
        body: MyForm(),
      ),
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
  var _phoneController = TextEditingController();
  var _sex = 1;
  var _desc = "";

  List _hobby = [
    {"title": "游泳", "checked": true},
    {"title": "下棋", "checked": false},
    {"title": "读书", "checked": false}
  ];

  void _usernameChanged(value) {
    setState(() {
      _username = value;
    });
  }

  void _sexChanged(value) {
    setState(() {
      _sex = value;
    });
  }

  void _descChanged(value) {
    setState(() {
      _desc = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _phoneController.text = "123";
  }

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
            onChanged: _usernameChanged,
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
            decoration: InputDecoration(
              hintText: "请输入手机号",
              icon: Icon(
                Icons.phone,
              ),
            ),
            onChanged: (value) {
              print("$value");
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
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "请输入描述",
              border: OutlineInputBorder(),
            ),
            onChanged: _descChanged,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                print("用户名: $_username");
                print("性别: $_sex");
                print("爱好: $_hobby");
                print("描述: $_desc");
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
