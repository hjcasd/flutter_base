import 'package:get/get.dart';

/// 数据管理
class MockData {
  /// 生成列表数据
  static Future<RxList<Map<String, Object>>> getList(int page, int size) async {
    return RxList<Map<String, Object>>.generate(size, (index) {
      return {
        'title': '标题${index + (page - 1) * size + 1}：这是一个列表标题，最多两行，多处部分将会被截取',
        'imageUrl': 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3331308357,177638268&fm=26&gp=0.jpg',
        'viewCount': 180,
      };
    });
  }
}
