import 'package:flutter/material.dart';
import 'package:flutter_base/components/state/page_state.dart';
import 'package:flutter_base/constants/app_colors.dart';
import 'package:flutter_base/constants/app_constants.dart';
import 'package:flutter_base/utils/loading_helper.dart';

/// 页面状态View
class SimpleStateView extends StatefulWidget {
  // 状态
  final PageState state;

  // ContentView
  final Widget contentView;

  // LoadingView
  final Widget? loadingView;

  // EmptyView
  final Widget? emptyView;

  // ErrorView
  final Widget? failedView;

  const SimpleStateView({
    required this.state,
    required this.contentView,
    this.loadingView,
    this.emptyView,
    this.failedView,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SimpleStateViewState();
  }
}

class _SimpleStateViewState extends State<SimpleStateView> {
  var currentState = PageState.LOADING;
  var msg = "";

  @override
  void initState() {
    super.initState();
    currentState = widget.state;
    _initMessage();
  }

  @override
  void didUpdateWidget(covariant SimpleStateView oldWidget) {
    super.didUpdateWidget(oldWidget);
    currentState = widget.state;
    _initMessage();
  }

  void _initMessage() {
    switch (currentState) {
      case PageState.SUCCESS:
        msg = "";
        break;

      case PageState.EMPTY:
        msg = "暂无数据,请重试...";
        break;

      case PageState.FAILED:
        msg = "系统异常,请稍后再试...";
        break;

      default:
        msg = "加载中,请稍后...";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    switch (currentState) {
      case PageState.SUCCESS:
        LoadingHelper.dismiss();
        body = widget.contentView;
        break;

      case PageState.EMPTY:
        LoadingHelper.dismiss();
        body = _getEmptyView();
        break;

      case PageState.FAILED:
        LoadingHelper.dismiss();
        body = _getFailedView();
        break;

      default:
        LoadingHelper.show();
        body = _getLoadingView();
        break;
    }
    return body;
  }

  @override
  void dispose() {
    super.dispose();
    LoadingHelper.dismiss();
  }

  /// 加载布局
  Widget _getLoadingView() {
    if (widget.loadingView != null) {
      return widget.loadingView!;
    } else {
      return Container(
        child: Center(
          child: Text(
            msg,
            style: TextStyle(fontSize: 14),
          ),
        ),
        color: AppColors.grey_F7F7F7,
      );
    }
  }

  /// 空布局
  Widget _getEmptyView() {
    if (widget.emptyView != null) {
      return widget.emptyView!;
    } else {
      return _getDefaultView();
    }
  }

  /// 失败布局
  Widget _getFailedView() {
    if (widget.failedView != null) {
      return widget.failedView!;
    } else {
      return _getDefaultView();
    }
  }

  /// 默认视图
  Widget _getDefaultView() {
    return Container(
      color: AppColors.grey_F7F7F7,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "${AppConstants.ASSERT_IMAGE_PATH}img_default.png",
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              msg,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
