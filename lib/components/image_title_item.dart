import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 图文列表Item
class ImageTitleItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int viewCount;

  static const double ITEM_HEIGHT = 100;
  static const double IMAGE_WIDTH = 150;
  static const double TITLE_HEIGHT = 80;

  ImageTitleItem(
    this.title,
    this.imageUrl,
    this.viewCount, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          _imageWrapper(imageUrl),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleWrapper(title),
                _viewCountWrapper(viewCount),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 左边图片
  Widget _imageWrapper(String imageUrl) {
    return SizedBox(
      width: IMAGE_WIDTH,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Image.asset('assets/images/test.png'),
        errorWidget: (context, url, error) => Image.asset('assets/images/test.png'),
      ),
      height: ITEM_HEIGHT,
    );
  }

  /// 右边标题
  Widget _titleWrapper(String title) {
    return Container(
      height: TITLE_HEIGHT,
      margin: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _viewCountWrapper(int viewCount) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
      child: Row(
        children: [
          Icon(
            Icons.remove_red_eye_outlined,
            size: 14.0,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            viewCount.toString(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
