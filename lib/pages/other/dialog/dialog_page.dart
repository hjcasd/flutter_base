import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/utils/dialog_manager.dart';
import 'package:flutter_base/utils/get_helper.dart';
import 'package:flutter_base/widget/smart_dialog.dart';
import 'package:get/get.dart';

/// Dialog页面
class DialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "Dialog的使用",
        ),
        body: MyDialog(),
      ),
    );
  }
}

/// Page
class MyDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDialogState();
}

/// State
class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text("AlertDialog"),
            onPressed: _showAlertDialog,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: Text("SimpleDialog"),
            onPressed: _showSimpleDialog,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: Text("ModalBottomSheet"),
            onPressed: _showBottomSheet,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: Text("Get Dialog"),
            onPressed: _showDefaultDialog,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: Text("自定义Dialog"),
            onPressed: _showCustomDialog,
          ),
        ],
      ),
    );
  }

  // AlertDialog
  void _showAlertDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "提示信息",
          ),
          content: Text(
            "确定删除吗",
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "确定",
              ),
              onPressed: () {
                Navigator.pop(context, "确定...");
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, "取消...");
              },
              child: Text(
                "取消",
              ),
            ),
          ],
        );
      },
    );
    GetHelper.showSnackBar("result: $result");
  }

  // SimpleDialog
  void _showSimpleDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            "选择内容",
          ),
          children: <Widget>[
            SimpleDialogOption(
              child: Text(
                "选项1",
              ),
              onPressed: () {
                Navigator.pop(context, "选项1...");
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text(
                "选项2",
              ),
              onPressed: () {
                Navigator.pop(context, "选项2...");
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text(
                "选项3",
              ),
              onPressed: () {
                Navigator.pop(context, "选项3...");
              },
            ),
          ],
        );
      },
    );
    GetHelper.showSnackBar("result: $result");
  }

  // 显示BottomSheet
  void _showBottomSheet() async {
    var result = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(
                  "条目1",
                ),
                onTap: () {
                  Navigator.pop(context, "条目1...");
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  "条目2",
                ),
                onTap: () {
                  Navigator.pop(context, "条目3...");
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  "条目3",
                ),
                onTap: () {
                  Navigator.pop(context, "条目3...");
                },
              ),
            ],
          ),
        );
      },
    );
    GetHelper.showSnackBar("result: $result");
  }

  // 显示自定义dialog
  void _showDefaultDialog() {
    Get.defaultDialog(
      radius: 10.0,
      onConfirm: () => print("Ok"),
      onCancel: () => print("Cancel"),
      middleText: "Dialog made in 3 lines of code",
    );
  }

  // 显示自定义dialog
  void _showCustomDialog() {
    DialogManager.show(
      SmartDialog(
        title: "温馨提示",
        content: "对非中国大陆籍会员暂不支持开通钱包，如您需进行积分消费，可开通消费密码。",
        confirmText: "开通消费免密",
        onConfirmCallback: () {
          GetHelper.showSnackBar("开通消费免密");
        },
      ),
    );
  }
}
