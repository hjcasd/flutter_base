import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Scaffold页面
class ScaffoldPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp的使用',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyScaffoldWidget(),
    );
  }
}

/// Scaffold: 页面titleBar和body组件
class MyScaffoldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scaffold的使用",
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Text(
          "哈哈哈",
        ),
      ),
    );
  }
}
