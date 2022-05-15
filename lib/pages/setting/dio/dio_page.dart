import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/data/login_entity.dart';
import 'package:flutter_base/network/service/api_service.dart';
import 'dart:convert' as convert;
import 'package:flutter_base/utils/log_helper.dart';

/// Dio页面
class DioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartAppBar(
        "Dio的使用",
      ),
      body: MyDio(),
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
    LogHelper.json(response.data!, tag: "Get");
  }

  // post请求
  void _postData() async {
    var data = await ApiService.login("hjcasd", "asd123456789");
    var entity = LoginEntity.fromJson(data);
    LogHelper.e(entity.data?.username, tag: "Post");
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
              _test();
              var map = convert.jsonDecode(_userStr);
              print(map["name"]);
            },
          ),
        ],
      ),
    );
  }

  void _test() {
    String url =
        "ceair://bankCardDetail?body={\"cardName\":\"中国银行储蓄卡\",\"masterTag\":\"主卡\",\"cardNo\":\"**** **** **** ***5577\",\"bankIcon\":\"https://wallet.ceair.com/ceph-emas/ceair-emas-cdn/material/ceair_old/logo_bc.png\",\"backgroundColor\":\"#B5494C\",\"subPayType\":\"cmbc\",\"bankLimit\":\"银行支付限额\",\"singleLimitLabel\":\"单笔限额\",\"dayLimitLabel\":\"每日限额\",\"singleLimit\":\"5000元\",\"dayLimit\":\"5000元\",\"buttons\":[{\"id\":\"changeBindMasterCard\",\"btnName\":\"换绑主卡\"},{\"id\":\"openQuickPay\",\"btnName\":\"开通快捷支付\",\"param\":\"{\\\"orgCode\\\":\\\"cmbc\\\",\\\"userType\\\":\\\"mufly\\\",\\\"source\\\":\\\"walletBankService.refreshCoupon\\\",\\\"param\\\":\\\"[{\\\\\\\"pageCode\\\\\\\":null,\\\\\\\"transactionId\\\\\\\":\\\\\\\"0020220513162741427517832383063\\\\\\\",\\\\\\\"ceairToken\\\\\\\":null,\\\\\\\"tokenKey\\\\\\\":null,\\\\\\\"passportId\\\\\\\":32383063,\\\\\\\"passportIdToken\\\\\\\":null,\\\\\\\"ffpNo\\\\\\\":null,\\\\\\\"language\\\\\\\":\\\\\\\"zh\\\\\\\",\\\\\\\"region\\\\\\\":\\\\\\\"CN\\\\\\\",\\\\\\\"os\\\\\\\":\\\\\\\"AD\\\\\\\",\\\\\\\"supportPay\\\\\\\":null,\\\\\\\"osPayMethod\\\\\\\":null,\\\\\\\"appVersion\\\\\\\":\\\\\\\"9.2.14\\\\\\\",\\\\\\\"channelNo\\\\\\\":null,\\\\\\\"secondChannelNo\\\\\\\":null,\\\\\\\"thirdChannelNo\\\\\\\":null,\\\\\\\"platForm\\\\\\\":null,\\\\\\\"imei\\\\\\\":null,\\\\\\\"imei1\\\\\\\":null,\\\\\\\"registrationID\\\\\\\":null,\\\\\\\"equipToken\\\\\\\":null,\\\\\\\"deviceMac\\\\\\\":null,\\\\\\\"wifiMac\\\\\\\":null,\\\\\\\"wifiSsid\\\\\\\":null,\\\\\\\"ip\\\\\\\":null,\\\\\\\"deviceModel\\\\\\\":null,\\\\\\\"osVersion\\\\\\\":null,\\\\\\\"apdidToken\\\\\\\":null,\\\\\\\"extraInfo\\\\\\\":null,\\\\\\\"webSite\\\\\\\":null,\\\\\\\"salesChannel\\\\\\\":\\\\\\\"7860\\\\\\\",\\\\\\\"older\\\\\\\":null,\\\\\\\"client\\\\\\\":null,\\\\\\\"couponType\\\\\\\":[\\\\\\\"3\\\\\\\"],\\\\\\\"optionType\\\\\\\":\\\\\\\"00\\\\\\\",\\\\\\\"ios\\\\\\\":false,\\\\\\\"andriod\\\\\\\":true}]\\\",\\\"cardNo\\\":\\\"221050013000090363\\\",\\\"isAgreeProtocol\\\":\\\"0\\\",\\\"masterCardBind\\\":\\\"01\\\",\\\"signFlag\\\":\\\"2\\\",\\\"ios\\\":false,\\\"andriod\\\":true}\"}]}";
    if (url.contains("#")) {
      url = url.replaceAll(RegExp("#"), "%23");
      LogHelper.e(url);
    }

    Uri parseUri = Uri.parse(url);
    String query = parseUri.query;
    LogHelper.e(query);

    String replaceS = Uri.decodeComponent(query).replaceFirst(RegExp('body='), '');
    Map params = json.decode(replaceS);
    LogHelper.json(params);
  }
}
