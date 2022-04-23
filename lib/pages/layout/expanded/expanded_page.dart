import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/icon_container.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// Expanded页面
class ExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartAppBar(
        "Expanded的使用",
      ),
      body: Column(
        children: [
          MyExpanded(),
          SizedBox(
            height: 10,
          ),
          MyMultiExpanded(),
        ],
      ),
    );
  }
}

/// Expanded: 类似于Linearlayout中weight效果的组件
/// Expanded必须是Row、Column、Flex的children
class MyExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      // 主轴的排序方式
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: IconContainer(
            Icons.add,
            backgroundColor: AppColors.amber,
          ),
        ),
        Expanded(
          flex: 2,
          child: IconContainer(
            Icons.ac_unit,
            backgroundColor: AppColors.blue,
          ),
        ),
        Expanded(
          flex: 1,
          child: IconContainer(
            Icons.settings,
            backgroundColor: AppColors.green,
          ),
        ),
      ],
    );
  }
}

/// 多行多列布局演示
class MyMultiExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 180,
                color: AppColors.amber,
                alignment: Alignment.center,
                child: Text(
                  "哈哈哈",
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: 180,
                child: Image.network(
                  "https://t8.baidu.com/it/u=1484500186,1503043093&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603869096&t=155e177e33789449415d5f099db22412",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.network(
                      "https://t9.baidu.com/it/u=1307125826,3433407105&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603869096&t=816eddceba44f40d7c61a2289b13c329",
                      height: 85,
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://t9.baidu.com/it/u=1307125826,3433407105&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603869096&t=816eddceba44f40d7c61a2289b13c329",
                      height: 85,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
