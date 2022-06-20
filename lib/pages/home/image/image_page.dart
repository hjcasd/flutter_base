import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/components/image/simple_image.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/constants/app_constants.dart';

/// Image页面
class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "Image的使用",
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            MyLocalImage(),
            MyNetImage(),
            MyCircleBoxImage(),
            MyCircleClipImage(),
          ],
        ),
      ),
    );
  }
}

/// Image: 图片组件
/// 加载本地图片(需要在yaml文件中引入地址后才能使用)
class MyLocalImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleImage(
      "icon_test.png",
      isLocal: true,
    );
  }
}

/// 加载网络图片
class MyNetImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.blue,
        border: Border.all(
          color: AppColors.black,
          width: 1,
        ),
      ),
      child: Image.network(
        AppConstants.netImageUrl1,
        // 图片在父容器中的对齐方式
        alignment: Alignment.topLeft,
        // color和colorBlendMode一起使用,对图片进行颜色处理
        color: AppColors.green,
        // 混合模式
        colorBlendMode: BlendMode.darken,
        // 图片显示方式
        fit: BoxFit.contain,
        // 图片铺满方式
        // repeat: ImageRepeat.repeat,
      ),
    );
  }
}

/// 圆形图片实现方式1
class MyCircleBoxImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.green,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        image: DecorationImage(
          image: NetworkImage(
            AppConstants.netImageUrl1,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// 圆形图片实现方式2
class MyCircleClipImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipOval(
        child: Image.network(
          AppConstants.netImageUrl2,
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
