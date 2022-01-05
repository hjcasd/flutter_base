import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_base/data/entity/identity_entity.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 身份信息页面Controller
class IdentityController extends GetxController {
  /// Model
  var model = IdentityEntity();

  /// 是否已初始化
  var isInitialized = false.obs;

  var name = "".obs;
  var phone = "".obs;

  @override
  void onInit() {
    super.onInit();
    LogHelper.e("IdentityController", "onInit()...");
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
    LogHelper.e("IdentityController", "onReady()...");
  }

  void loadData() async {
    String json = await rootBundle.loadString('assets/json/identity.json');
    Map map = jsonDecode(json);
    model = IdentityEntity.fromJson(map);
    isInitialized.value = true;
    LogHelper.e("IdentityController", model.tip);
  }
}
