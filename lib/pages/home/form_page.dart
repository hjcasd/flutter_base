import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// Form的使用
class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

// TextField, Switch, Radio, Checkbox
class _FormPageState extends State<MyForm> {
  var _username = TextEditingController();
  var _flag = true;
  var _sex = 1;

  @override
  void initState() {
    super.initState();
    _username.text = "哈哈哈";
  }

  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp(
        "Form",
        Padding(
          padding: EdgeInsets.all(20.0),
          // child: MyTextFiled()
          child: Column(
            children: <Widget>[
              TextField(
                controller: TextEditingController.fromValue(TextEditingValue(
                    // 设置内容
                    text: _username.text,
                    // 保持光标在最后
                    selection: TextSelection.fromPosition(
                        TextPosition(affinity: TextAffinity.downstream, offset: _username.text.length)))),
                decoration: InputDecoration(hintText: "请输入用户名"),
                onChanged: (value) {
                  print("$value");
                  setState(() {
                    this._username.text = value;
                  });
                },
              ),
              SizedBox(height: 10.0),
              Checkbox(
                  value: this._flag,
                  onChanged: (value) {
                    print("是否选中: $value");
                    setState(() {
                      this._flag = value;
                    });
                  }),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Text("男： "),
                  Radio(
                      value: 1,
                      groupValue: this._sex,
                      onChanged: (value) {
                        print("选中值: $value");
                        setState(() {
                          this._sex = value;
                        });
                      }),
                  Text("女："),
                  Radio(
                      value: 2,
                      groupValue: this._sex,
                      onChanged: (value) {
                        print("选中值: $value");
                        setState(() {
                          this._sex = value;
                        });
                      })
                ],
              ),
              SizedBox(height: 10.0),
              Switch(
                  value: this._flag,
                  onChanged: (value) {
                    print("是否选中: $value");
                    setState(() {
                      this._flag = value;
                    });
                  }),
            ],
          ),
        ));
  }
}

class _MyFormState2 extends State<MyForm> {
  var _username = "";
  var _sex = 1;
  var _desc = "";

  List _hobby = [
    {"title": "游泳", "checked": true},
    {"title": "下棋", "checked": false},
    {"title": "读书", "checked": false}
  ];

  List<Widget> _getHobby() {
    List<Widget> tmpList = [];
    for (var i = 0; i < this._hobby.length; i++) {
      tmpList.add(Row(children: <Widget>[
        Text(this._hobby[i]["title"]),
        Checkbox(
          value: this._hobby[i]["checked"],
          onChanged: (value) {
            setState(() {
              this._hobby[i]["checked"] = value;
            });
          },
        )
      ]));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Demo")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "请输入用户名"),
              onChanged: this._usernameChanged,
            ),
            Row(children: <Widget>[
              Text("男: "),
              Radio(
                value: 1,
                groupValue: this._sex,
                onChanged: this._sexChanged,
              ),
              Text("女: "),
              Radio(
                value: 2,
                groupValue: this._sex,
                onChanged: this._sexChanged,
              ),
            ]),
            Row(children: this._getHobby()),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "请输入描述",
                border: OutlineInputBorder(),
              ),
              onChanged: this._descChanged,
            ),
            SizedBox(height: 10.0),
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
                child: Text("提交"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// TextFiled演示
class MyTextFiled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          // true: 密码显示形式
          obscureText: true,
          decoration: InputDecoration(hintText: "单行输入框", border: OutlineInputBorder()),
        ),
        SizedBox(height: 20.0),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(hintText: "多行文本框", border: OutlineInputBorder()),
        ),
        SizedBox(height: 20.0),
        TextField(
          decoration: InputDecoration(hintText: "带图标按钮", icon: Icon(Icons.settings)),
        )
      ],
    );
  }
}
