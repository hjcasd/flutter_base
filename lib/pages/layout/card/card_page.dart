import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/form/form_read_item.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

/// Card页面
class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartAppBar(
        "Card的使用",
      ),
      body: MyCard(),
    );
  }
}

// Card: 卡片组件
class MyCard extends StatelessWidget {
  final String _htmlData =
      r"""<font style='font-size:30'>请绑定持卡人为<a href='https://www.baidu.com' style='text-decoration:none;color:#BFA253'>会员本人</a>的<strong>储蓄卡</strong></font>""";

  @override
  Widget build(BuildContext context) {
    return Card(
      // 阴影
      elevation: 15,
      // 裁剪模式,默认Clip.none
      clipBehavior: Clip.antiAlias,
      // 圆角
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormReadItem(
            title: '身份证',
            content: '3101*********244X',
          ),
          FormReadItem(
            title: '身份证',
            content: '3101*********244X',
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: HtmlWidget(
              _htmlData,
            ),
          ),
        ],
      ),
    );
  }
}
