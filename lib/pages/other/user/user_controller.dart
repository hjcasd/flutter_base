import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/components/state/page_state.dart';
import 'package:flutter_base/constants/app_constants.dart';
import 'package:flutter_base/model/user_entity.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:get/get.dart';

/// 用户信息页面Controller
class UserController extends GetxController {
  // 状态
  var state = PageState.LOADING;

  // Model
  var _model = UserEntity();

  // 提示
  var tip = "";

  // 姓名
  var name = "";

  // 手机号
  var phone = "";

  // 按钮是否可用
  var buttonEnable = false;

  @override
  void onReady() {
    super.onReady();
    LogHelper.e("UserController onReady()...");
    _loadData();
  }

  @override
  void onClose() {
    super.onClose();
    LogHelper.e("UserController onClose()...");
  }

  /// 加载数据
  void _loadData() async {
    String json = await rootBundle.loadString("${AppConstants.assertJsonPath}user_info.json");
    Future.delayed(Duration(seconds: 1), () {
      _model = UserEntity.fromJson(jsonDecode(json));
      tip = _model.tip ?? "";
      state = PageState.SUCCESS;
      update();
    });
  }

  /// 改变名字
  void changeName(String value) {
    this.name = value;
    buttonEnable = !TextUtil.isEmpty(name) && !TextUtil.isEmpty(phone);
    update();
  }

  /// 改变手机号
  void changePhone(String value) {
    this.phone = value;
    buttonEnable = !TextUtil.isEmpty(name) && !TextUtil.isEmpty(phone);
    update();
  }

  /// 测试
  void test() {
    tip = "哈哈哈哈哈哈哈";
    update();
  }
}
