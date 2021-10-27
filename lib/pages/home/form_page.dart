import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// Form页面
class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFormWidget(),
    );
  }
}

class MyFormWidget extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

/// TextField, Switch, Radio, Checkbox
class _FormPageState extends State<MyFormWidget> {
  var _username = "";
  var _phoneController = TextEditingController();
  var _sex = 1;
  var _desc = "";

  List _hobby = [
    {"title": "游泳", "checked": true},
    {"title": "下棋", "checked": false},
    {"title": "读书", "checked": false}
  ];

  @override
  void initState() {
    super.initState();
    _phoneController.text = "123";
  }

  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp(
      "Form的使用",
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "请输入用户名",
                icon: Icon(
                  Icons.account_box,
                ),
              ),
              onChanged: this._usernameChanged,
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
                  this._phoneController.text = value;
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
                  groupValue: this._sex,
                  onChanged: this._sexChanged,
                ),
                Text(
                  "女: ",
                ),
                Radio(
                  value: 2,
                  groupValue: this._sex,
                  onChanged: this._sexChanged,
                ),
              ],
            ),
            Row(
              children: this._getHobby(),
            ),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "请输入描述",
                border: OutlineInputBorder(),
              ),
              onChanged: this._descChanged,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: double.infinity,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  print("用户名: ${this._username}");
                  print("性别: ${this._sex}");
                  print("爱好: ${this._hobby}");
                  print("描述: ${this._desc}");
                },
                child: Text(
                  "提交",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 获取Hobby
  List<Widget> _getHobby() {
    List<Widget> tmpList = [];
    for (var i = 0; i < this._hobby.length; i++) {
      tmpList.add(
        Row(
          children: <Widget>[
            Text(
              this._hobby[i]["title"],
            ),
            Checkbox(
              value: this._hobby[i]["checked"],
              onChanged: (value) {
                setState(() {
                  this._hobby[i]["checked"] = value;
                });
              },
            ),
          ],
        ),
      );
    }
    return tmpList;
  }

  void _usernameChanged(value) {
    setState(() {
      this._username = value;
    });
  }

  void _sexChanged(value) {
    setState(() {
      this._sex = value;
    });
  }

  void _descChanged(value) {
    setState(() {
      this._desc = value;
    });
  }
}