import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:flutter_html/flutter_html.dart';

/// Card页面
class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
          "Card的使用",
        ),
        body: MyCard(),
      ),
    );
  }
}

// Card: 卡片组件
class MyCard extends StatelessWidget {
  final String htmlData =
      r"""<font style='font-size:30'>请绑定持卡人为<a href='https://www.baidu.com' style='text-decoration:none;color:#BFA253'>会员本人</a>的<strong>储蓄卡</strong></font>""";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        // 阴影
        elevation: 15.0,
        // 圆角
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        margin: EdgeInsets.all(10.0),
        child: Html(
          // HTML自带padding 左右为7 上下为5
          data: htmlData,
          style: {
            "font": Style(
              fontSize: FontSize(13),
              fontWeight: FontWeight.w300,
            ),
          },
          onLinkTap: (url, _, __, ___) {
            LogHelper.e("tag", url);
          },
        ),
      ),
    );
  }
}
