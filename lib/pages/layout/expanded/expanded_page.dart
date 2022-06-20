import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/components/icon_container.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/constants/app_constants.dart';

/// Expanded页面
class ExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
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
                  AppConstants.netImageUrl1,
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
                      AppConstants.netImageUrl2,
                      height: 85,
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      AppConstants.netImageUrl3,
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
