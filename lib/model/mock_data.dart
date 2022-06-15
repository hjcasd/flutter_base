import 'package:flutter_base/constants/app_constants.dart';

/// 随机数据
class MockData {
  /// 生成列表数据
  static Future<List<Map<String, String>>> getList(int page, int size) async {
    return List<Map<String, String>>.generate(size, (index) {
      return {
        'title': '标题${index + (page - 1) * size + 1}：这是一个列表标题，最多两行，多处部分将会被截取',
        'imageUrl': AppConstants.NET_IMAGE_URL1,
        'viewCount': "1800",
      };
    });
  }
}
