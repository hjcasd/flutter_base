import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';
import 'package:flutter_base/components/image/smart_image.dart';
import 'package:flutter_base/theme/AppColors.dart';

/// Image页面
class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar(
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
      ),
    );
  }
}

/// Image: 图片组件
/// 加载本地图片(需要在yaml文件中引入地址后才能使用)
class MyLocalImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SmartImage(
      "icon_test.png",
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
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg",
        // 图片在父容器中的对齐方式
        alignment: Alignment.topLeft,
        // color和colorBlendMode一起使用,对图片进行颜色处理
        color: AppColors.green,
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
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg",
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
          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg",
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
