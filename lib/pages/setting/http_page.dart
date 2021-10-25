import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';
import 'package:http/http.dart' as http;

/// Http页面
class HttpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Http的使用", MyHttp());
  }
}

class MyHttp extends StatefulWidget {
  @override
  _MyHttpState createState() => _MyHttpState();
}

/// 网络请求演示
class _MyHttpState extends State<MyHttp> {
  Map _userMap = {"name": "张三", "age": 24};
  String _userStr = '{"name":"张三","age":24}';

  var _productList = [];

  // get请求
  _getData() async {
    var url = 'http://a.itying.com/api/productlist';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      _productList = data["result"];
      print(_productList[0]["title"]);
    } else {
      print('请求失败: ${response.statusCode}.');
    }
  }

  // post请求
  _postData() async {
    var url = 'https://example.com/whatsit/create';
    var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
            height: 10.0,
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
          SizedBox(
            height: 10.0,
          ),
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
