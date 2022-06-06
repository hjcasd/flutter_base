import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/pages/home/home_page.dart';
import 'package:flutter_base/pages/layout/layout_page.dart';
import 'package:flutter_base/pages/other/other_page.dart';
import 'package:flutter_base/pages/setting/setting_page.dart';
import 'package:flutter_base/utils/dialog_manager.dart';
import 'package:flutter_base/widget/simple_dialog.dart';

/// 主界面
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  // 当前位置索引
  int _currentIndex = 0;

  // 页面集合
  List<Widget> _pageList = [
    HomePage(),
    LayoutPage(),
    OtherPage(),
    SettingPage(),
  ];

  // 底部Bar数据
  Map _bottomMap = {
    "首页": Icon(Icons.home),
    "布局": Icon(Icons.category),
    "其他": Icon(Icons.account_box),
    "设置": Icon(Icons.settings),
  };

  // 标题栏颜色集合
  List<Color> _colorList = [
    AppColors.blue,
    AppColors.green,
    AppColors.amber,
    AppColors.cyan,
  ];

  DateTime? _lastPressedTime; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _bottomMap.keys.toList()[_currentIndex],
          ),
          backgroundColor: _colorList[_currentIndex],
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: _pageList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: _generateBarItems(),
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      onWillPop: () async {
        if (_lastPressedTime == null || DateTime.now().difference(_lastPressedTime!) > Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedTime = DateTime.now();
          _showExitDialog();
          return false;
        }
        return true;
      },
    );
  }

  /// 生成底部NavigationBarItem
  List<BottomNavigationBarItem> _generateBarItems() {
    var items = <BottomNavigationBarItem>[];
    _bottomMap.forEach((key, value) {
      items.add(
        BottomNavigationBarItem(
          icon: value,
          label: key,
        ),
      );
    });
    return items;
  }

  // 显示自定义dialog
  void _showExitDialog() {
    DialogManager.show(
      SmartDialog(
        title: "温馨提示",
        content: "您确认退出当前应用吗",
        cancelText: "等一等",
        confirmText: "退出应用",
        isShowClose: false,
        onConfirmCallback: () {
          SystemNavigator.pop();
        },
      ),
      cancelOutside: false,
    );
  }
}
