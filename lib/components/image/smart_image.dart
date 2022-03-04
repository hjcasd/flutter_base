import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// SmartImage: 基础Image封装的组件
class SmartImage extends StatefulWidget {
  // 图片路径: 本地图片写图片名称,网络图片写图片链接地址
  final String imageUrl;

  // 图片适应方式
  final BoxFit fit;

  // 网络图片占位图
  final String placeholderPath;

  // 网络图片加载错误图
  final String errorPath;

  final bool isLocal;

  // 点击事件回调
  final VoidCallback? onPressed;

  SmartImage(
    this.imageUrl, {
    this.fit = BoxFit.cover,
    this.placeholderPath = "img_default.png",
    this.errorPath = "img_default.png",
    this.isLocal = false,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SmartImageState();
  }
}

class _SmartImageState extends State<SmartImage> {
  // 图片目录
  final String _imageDir = "assets/images/";

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
        "${_imageDir + widget.imageUrl}",
        fit: widget.fit,
      );
    }
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      placeholder: (context, url) => Image.asset(
        "${_imageDir + widget.placeholderPath}",
      ),
      errorWidget: (context, url, error) => Image.asset(
        "${_imageDir + widget.errorPath}",
      ),
      fit: widget.fit,
    );
  }
}
