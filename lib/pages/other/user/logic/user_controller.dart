import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_base/data/user_entity.dart';
import 'package:flutter_base/utils/loading_helper.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 用户信息页面Controller
class UserController extends GetxController {
  // 是否已初始化
  var isInitialized = false;

  // Model
  var _model = UserEntity();

  // 姓名
  var name = "";

  @override
  void onInit() {
    super.onInit();
    LogHelper.e("onInit()...", tag: "IdentityController");
  }

  @override
  void onReady() {
    super.onReady();
    LogHelper.e("onReady()...", tag: "IdentityController");
    _loadData();
  }

  @override
  void onClose() {
    super.onClose();
    LogHelper.e("onClose()...", tag: "IdentityController");
  }

  /// 加载数据
  void _loadData() async {
    LoadingHelper.show();
    String json = await rootBundle.loadString('assets/json/user_info.json');
    Future.delayed(Duration(seconds: 2), () {
      _model = UserEntity.fromJson(jsonDecode(json));
      LogHelper.e(_model.count?.toDouble(), tag: "IdentityController");
      isInitialized = true;
      update();
      LoadingHelper.dismiss();
    });
  }

  /// 改变名字
  void changeName(String name) {
    this.name = name;
    update(["name"]);
  }
}
