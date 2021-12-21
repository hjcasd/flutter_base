import 'package:flutter/material.dart';
import 'package:flutter_base/ui/home_page.dart';
import 'package:flutter_base/ui/layout_page.dart';
import 'package:flutter_base/ui/other_page.dart';
import 'package:flutter_base/ui/setting_page.dart';

/// 主界面
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  /// 当前位置索引
  int _currentIndex = 0;

  /// 页面集合
  List<Widget> _pageList = [
    HomePage(),
    LayoutPage(),
    SettingPage(),
    OtherPage(),
  ];

  /// 底部Bar数据
  final Map _bottomMap = {
    "首页": Icon(Icons.home),
    "布局": Icon(Icons.category),
    "设置": Icon(Icons.settings),
    "其他": Icon(Icons.account_box),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _bottomMap.keys.toList()[_currentIndex],
        ),
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
}
