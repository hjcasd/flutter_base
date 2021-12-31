import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 图文列表Item
class ImageTitleItem extends StatefulWidget {
  /// 标题
  final String title;

  /// 图片地址
  final String imageUrl;

  /// 评论数
  final int viewCount;

  ImageTitleItem(
    this.title,
    this.imageUrl,
    this.viewCount, {
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ImageTitleItem();
  }
}

class _ImageTitleItem extends State<ImageTitleItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          _imageWrapper(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleWrapper(),
                _viewCountWrapper(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 左边图片
  Widget _imageWrapper() {
    return SizedBox(
      width: 150,
      child: CachedNetworkImage(
        imageUrl: widget.imageUrl,
        placeholder: (context, url) => Image.asset('assets/images/test.png'),
        errorWidget: (context, url, error) => Image.asset('assets/images/test.png'),
      ),
      height: 100,
    );
  }

  /// 右边标题
  Widget _titleWrapper() {
    return Container(
      height: 80,
      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text(
        widget.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// 评论数
  Widget _viewCountWrapper() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
        children: [
          Icon(
            Icons.remove_red_eye_outlined,
            size: 14,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            widget.viewCount.toString(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
