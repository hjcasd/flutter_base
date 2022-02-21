import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/data/entity/login_entity.dart';
import 'package:flutter_base/network/service/api_service.dart';
import 'dart:convert' as convert;
import 'package:flutter_base/utils/log_helper.dart';

/// Dio页面
class DioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "Dio的使用",
        ),
        body: MyDio(),
      ),
    );
  }
}

class MyDio extends StatefulWidget {
  @override
  _MyDioState createState() => _MyDioState();
}

/// Dio: 网络请求库
class _MyDioState extends State<MyDio> {
  final Map _userMap = {"name": "张三", "age": 24};
  final String _userStr = '{"name":"张三","age":24}';

  // get请求
  void _getData() async {
    Response<Map> response = await Dio().get("http://a.itying.com/api/productlist");
    LogHelper.json("Get", response.data!);
  }

  // post请求
  void _postData() async {
    var data = await ApiService.login("hjcasd", "asd123456789");
    var entity = LoginEntity.fromJson(data);
    LogHelper.e("Post", entity.data?.username);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text(
              "Get请求",
            ),
            onPressed: _getData,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: Text(
              "Post请求",
            ),
            onPressed: _postData,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: Text(
              "Map转换为Json字符串",
            ),
            onPressed: () {
              var jsonStr = convert.jsonEncode(_userMap);
              print(jsonStr);
            },
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: Text(
              "Json字符串转换为Map",
            ),
            onPressed: () {
              var map = convert.jsonDecode(_userStr);
              print(map["name"]);
            },
          ),
        ],
      ),
    );
  }
}
