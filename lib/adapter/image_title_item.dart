import 'package:flutter/material.dart';
import 'package:flutter_base/components/image/smart_image.dart';
import 'package:flutter_base/constants/AppColors.dart';

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
      height: 100,
      child: SmartImage(
        widget.imageUrl,
        fit: BoxFit.fill,
      ),
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
            color: AppColors.grey_BCBCBC,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            widget.viewCount.toString(),
            style: TextStyle(
              color: AppColors.grey_BCBCBC,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
