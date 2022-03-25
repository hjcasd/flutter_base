import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_base/data/user_entity.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 身份信息页面Controller
class IdentityController extends GetxController {
  /// Model
  var _model = UserEntity();

  /// 是否已初始化
  var isInitialized = false.obs;

  var name = "";
  var phone = "";

  @override
  void onInit() {
    super.onInit();
    LogHelper.e("IdentityController", "onInit()...");
  }

  @override
  void onReady() {
    super.onReady();
    LogHelper.e("IdentityController", "onReady()...");
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
    LogHelper.e("IdentityController", "onClose()...");
  }

  void loadData() async {
    String json = await rootBundle.loadString('assets/json/user_info.json');
    _model = UserEntity.fromJson(jsonDecode(json));
    LogHelper.e("IdentityController", _model.count?.toDouble());
    isInitialized.value = true;
  }
}
