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

  // 姓名
  var name = "";

  @override
  void onInit() {
    super.onInit();
    LogHelper.e("UserController onInit()...");
    _loadData();
  }

  @override
  void onClose() {
    super.onClose();
    LogHelper.e("UserController onClose()...");
  }

  /// 加载数据
  void _loadData() async {
    String json = await rootBundle.loadString("${AppConstants.ASSERT_JSON_PATH}user_info.json");
    Future.delayed(Duration(seconds: 1), () {
      _model = UserEntity.fromJson(json);
      LogHelper.e(_model.count?.toDouble(), tag: "IdentityController");
      state = PageState.SUCCESS;
      update();
    });
  }

  /// 改变名字
  void changeName(String value) {
    this.name = value;
    LogHelper.e("name: " + value, tag: "IdentityController");
  }
}
