import 'package:flutter/material.dart';
import 'package:flutter_base/utils/layout_utils.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

/// swiper
class SwiperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutUtils.getApp("Swiper", MySwiper());
  }
}

class MySwiper extends StatefulWidget {
  @override
  _MySwiperState createState() => _MySwiperState();
}

/// 轮播图组件Swiper演示
class _MySwiperState extends State<MySwiper> {
  List<Map> _imgList = [
    {
      "url": "http://pic1.win4000.com/wallpaper/b/58ca58d35d719.jpg",
    },
    {
      "url": "http://pic1.win4000.com/wallpaper/5/58d1e4522374c.jpg",
    },
    {
      "url": "http://pic1.win4000.com/wallpaper/5/58d21cc8f12c9.jpg",
    },
    {
      "url": "http://pic1.win4000.com/wallpaper/3/58d0c78e390e5.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Swiper(
          itemCount: _imgList.length,
          itemBuilder: (BuildContext context, int index) {
            return FadeInImage.assetNetwork(
              image: _imgList[index]["url"],
              placeholder: "assets/images/test.png",
              fit: BoxFit.fill,
            );
          },
          pagination: SwiperPagination(),
          controller: SwiperController(),
          autoplay: true,
        ),
      ),
    );
  }
}
