import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// Dio页面
class DioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Dio的使用", MyDio());
  }
}

class MyDio extends StatefulWidget {
  @override
  _MyDioState createState() => _MyDioState();
}

/// Dio: 网络请求库
class _MyDioState extends State<MyDio> {
  // get请求
  _getData() async {
    Response<Map> response = await Dio().get("http://a.itying.com/api/productlist");
    LogUtil.e(response, tag: "get");
  }

  // post请求
  _postData() async {
    Dio dio = Dio();
    var response = await dio.post("https://www.xx.com/api/test", data: {"id": 12, "name": "wendu"});
    LogUtil.e(response, tag: "post");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text(
              "Get请求获取数据",
            ),
            onPressed: _getData,
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            child: Text(
              "Post请求获取数据",
            ),
            onPressed: _postData,
          ),
        ],
      ),
    );
  }
}
