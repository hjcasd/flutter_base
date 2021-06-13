import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';

/// Image的使用
class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Image", ImageContainer());
  }
}

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          color: Colors.green,
          padding: EdgeInsets.all(10.0),
          child: MyImage(),
        ));
  }
}


// Image(): 图片组件
class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 加载网络图片
    return Image.network(
      "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg",
      // alignment: Alignment.topLeft,
      // color: Colors.green,
      // colorBlendMode: BlendMode.darken,
      fit: BoxFit.cover,
      // repeat: ImageRepeat.repeatX,
    );

    // 加载本地图片(需要在yaml文件中引入地址后才能使用)
    // return Image.asset("images/test.png", fit: BoxFit.cover);
  }
}

// 圆形图片实现方式1
class ImageContainer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(150.0)),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg"),
                    fit: BoxFit.cover))));
  }
}

// 圆形图片实现方式2
class ImageContainer3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: ClipOval(
            child: Image.network(
              "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2447126270,3019349612&fm=26&gp=0.jpg",
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
