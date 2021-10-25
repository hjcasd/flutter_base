import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 布局生成工具类
class LayoutUtils {
  LayoutUtils._();

  static Widget getApp(String text, Widget body) {
    return MaterialApp(
      title: "Flutter Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            text,
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
        body: body,
      ),
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  static Widget generateButton(String url, String text) {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(url);
      },
      child: Text(
        text,
      ),
    );
  }
}
