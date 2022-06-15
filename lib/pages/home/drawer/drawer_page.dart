import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_constants.dart';

/// Drawer页面
class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyDrawerHeader();
    // return MyDrawerAccount(),
  }
}

/// DrawerHeader演示
class MyDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DrawerHeader",
        ),
      ),
      body: Center(
        child: Text(
          "哈哈哈",
        ),
      ),
      // 左边侧滑菜单
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: DrawerHeader(
                    child: Text(
                      "呵呵呵",
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          AppConstants.NET_IMAGE_URL1,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.home,
                ),
              ),
              title: Text(
                "项目主页",
              ),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.category,
                ),
              ),
              title: Text(
                "我的收藏",
              ),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.settings,
                ),
              ),
              title: Text(
                "扫码下载",
              ),
            ),
            Divider(),
          ],
        ),
      ),
      // 右边侧滑菜单
      endDrawer: Drawer(
        child: Text(
          "嘿嘿嘿",
        ),
      ),
    );
  }
}

/// UserAccountsDrawerHeader演示
class MyDrawerAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "UserAccountsDrawerHeader",
        ),
      ),
      body: Center(
        child: Text(
          "哈哈哈",
        ),
      ),
      // 左边侧滑菜单
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: UserAccountsDrawerHeader(
                  accountName: Text(
                    "flutter",
                  ),
                  accountEmail: Text(
                    "2959383735@qq.com",
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                      AppConstants.NET_IMAGE_URL1,
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        AppConstants.NET_IMAGE_URL2,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ]),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.home,
                ),
              ),
              title: Text(
                "项目主页",
              ),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.category,
                ),
              ),
              title: Text(
                "我的收藏",
              ),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.settings,
                ),
              ),
              title: Text(
                "扫码下载",
              ),
            ),
            Divider(),
          ],
        ),
      ),
      // 右边侧滑菜单
      endDrawer: Drawer(
        child: Text(
          "嘿嘿嘿",
        ),
      ),
    );
  }
}
