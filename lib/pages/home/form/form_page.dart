import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/components/button/simple_button.dart';
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
    );
  }
}

/// 表单组件
class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyFormState();
}

/// Form组件
class _MyFormState extends State<MyForm> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  GlobalKey _formKey = GlobalKey<FormState>();

  String _username = "";
  String _phone = "123456";
  int _sex = 1;
  bool _openState = false;

  List _hobby = [
    {"title": "游泳", "checked": true},
    {"title": "下棋", "checked": false},
    {"title": "读书", "checked": false}
  ];

  @override
  void initState() {
    super.initState();

    _phoneController.value = TextEditingValue(
      // 设置内容
      text: _phone,
      // 保持光标在最后
      selection: TextSelection.fromPosition(
        TextPosition(
          affinity: TextAffinity.downstream,
          offset: _phone.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        // 表单验证模式
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              _getUsernameView(),
              _getPhoneView(),
              _getRadioView(),
              _getCheckboxView(),
              _getSwitchView(),
              _getButtonView(),
            ],
          ),
        ),
        onChanged: () {
          LogHelper.e("监听子组件FormField发生变化了");
        },
      ),
    );
  }

  Widget _getUsernameView() {
    return TextFormField(
      controller: _userController,
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
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "用户名不能为空";
        }
        return null;
      },
    );
  }

  Widget _getPhoneView() {
    return TextFormField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: "请输入手机号",
        icon: Icon(
          Icons.phone,
        ),
      ),
      onChanged: (value) {
        setState(() {
          _phone = value;
        });
      },
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "手机号不能为空";
        } else if (value.trim().length != 11) {
          return "手机号必须是11位";
        } else {
          return null;
        }
      },
    );
  }

  Widget _getRadioView() {
    return Row(
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
    );
  }

  Widget _getCheckboxView() {
    List<Widget> list = [];
    for (var i = 0; i < _hobby.length; i++) {
      list.add(
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
    return Row(
      children: list,
    );
  }

  Widget _getSwitchView() {
    return Switch(
      value: _openState,
      onChanged: (value) {
        setState(() {
          _openState = value;
        });
      },
    );
  }

  Widget _getButtonView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SimpleButton(
          "提交",
          onPressed: () {
            var currentState = _formKey.currentState as FormState;
            if (currentState.validate()) {
              LogHelper.e("用户名: $_username, 手机号: $_phone, 性别: $_sex, 爱好: $_hobby, 开关状态: $_openState");
            } else {
              LogHelper.e("验证失败...");
            }
          },
        ),
        SizedBox(
          width: 20,
        ),
        SimpleButton(
          "重置",
          onPressed: () {
            var currentState = _formKey.currentState as FormState;
            currentState.reset();
          },
        )
      ],
    );
  }

  void _sexChanged(value) {
    setState(() {
      _sex = value;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    _phoneController.dispose();
  }
}
