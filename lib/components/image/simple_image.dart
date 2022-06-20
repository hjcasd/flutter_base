import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_constants.dart';

/// SimpleImage: 基础Image封装的组件
class SimpleImage extends StatefulWidget {
  // 图片路径: 本地图片写图片名称,网络图片写图片链接地址
  final String imageUrl;

  // 宽度
  final double? width;

  // 高度
  final double? height;

  // 图片适应方式
  final BoxFit fit;

  // 网络图片占位图
  final String placeholderPath;

  // 网络图片加载错误图
  final String errorPath;

  // 是否加载本地图片
  final bool isLocal;

  // 点击事件回调
  final VoidCallback? onPressed;

  SimpleImage(
    this.imageUrl, {
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholderPath = "img_default.png",
    this.errorPath = "img_default.png",
    this.isLocal = false,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SimpleImageState();
  }
}

class _SimpleImageState extends State<SimpleImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _getImageView(),
      onTap: widget.onPressed,
    );
  }

  /// 图片
  Widget _getImageView() {
    if (widget.isLocal) {
      return Image.asset(
        "${AppConstants.assertImagePath + widget.imageUrl}",
        fit: widget.fit,
        width: widget.width,
        height: widget.height,
      );
    }
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      placeholder: (context, url) => Image.asset(
        "${AppConstants.assertImagePath + widget.placeholderPath}",
      ),
      errorWidget: (context, url, error) => Image.asset(
        "${AppConstants.assertImagePath + widget.errorPath}",
      ),
      fit: widget.fit,
      width: widget.width,
      height: widget.height,
    );
  }
}
