import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/smart_app_bar.dart';

/// Image页面
class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: SmartAppBar("Image的使用"),
        body: ImageContainer(),
      ),
    );
  }
}

/// Image: 图片组件
class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          MyLocalImageWidget(),
          MyNetImageWidget(),
          CircleImageWidget1(),
          CircleImageWidget2(),
        ],
      ),
    );
  }
}

/// 加载本地图片(需要在yaml文件中引入地址后才能使用)
class MyLocalImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/test.png",
      fit: BoxFit.cover,
    );
  }
}

/// 加载网络图片
class MyNetImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      child: Image.network(
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg",
        // 图片在父容器中的对齐方式
        alignment: Alignment.topLeft,
        // color和colorBlendMode一起使用,对图片进行颜色处理
        color: Colors.green,
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
class CircleImageWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
class CircleImageWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipOval(
        child: Image.network(
          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg",
          width: 100.0,
          height: 100.0,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
