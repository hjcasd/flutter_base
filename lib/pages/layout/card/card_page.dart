import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/components/form/form_read_item.dart';
import 'package:flutter_html/flutter_html.dart';

/// Card页面
class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "Card的使用",
      ),
      body: MyCard(),
    );
  }
}

// Card: 卡片组件
class MyCard extends StatelessWidget {
  final String _htmlData =
      "<div style='font-size:16px;'> 注销“东航钱包”后，<span style='font-size:16px;font-weight:bold;'>自注销日期2天内当前会员账户将不能再次申请开通“东航钱包”</span><br/>注销“东航钱包”后，钱包内原有的余额及其他附加金融服务将一并关闭，<span style='font-size:16px;font-weight:bold;'>无法再进行积分兑换业务。</span></div>";

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
          Html(data: _htmlData),
        ],
      ),
    );
  }
}
