import 'package:flutter/material.dart';

/// Drawer的使用
class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDrawer(),
    );
  }
}

// Drawer DrawerHeader演示
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      body: Center(
        child: Text("哈哈哈"),
      ),
      // 左边侧滑菜单
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: DrawerHeader(
                    child: Text("呵呵呵"),
                    decoration: BoxDecoration(
                      // color: Colors.green,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg"),
                            fit: BoxFit.cover))),
              )
            ]),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.home)),
              title: Text("项目主页"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.category)),
              title: Text("我的收藏"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.settings)),
              title: Text("扫码下载"),
            ),
            Divider(),
          ],
        ),
      ),
      // 右边侧滑菜单
      endDrawer: Drawer(
        child: Text("嘿嘿嘿"),
      ),
    );
  }
}

// Drawer UserAccountsDrawerHeader演示
class MyDrawer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      body: Center(
        child: Text("哈哈哈"),
      ),
      // 左边侧滑菜单
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: UserAccountsDrawerHeader(
                    accountName: Text("flutter"),
                    accountEmail: Text("2959383735@qq.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3950359295,879559074&fm=11&gp=0.jpg"),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603875996600&di=91a1e8f32747c9b9ba69c90874548eae&imgtype=0&src=http%3A%2F%2Fc.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F72f082025aafa40f2982756baa64034f78f0193b.jpg"),
                            fit: BoxFit.cover))),
              )
            ]),

            ListTile(
              leading: CircleAvatar(child: Icon(Icons.home)),
              title: Text("项目主页"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.category)),
              title: Text("我的收藏"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.settings)),
              title: Text("扫码下载"),
            ),
            Divider(),
          ],
        ),
      ),
      // 右边侧滑菜单
      endDrawer: Drawer(
        child: Text("嘿嘿嘿"),
      ),
    );
  }
}

