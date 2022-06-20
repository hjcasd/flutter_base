import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/constants/app_colors.dart';

/// Progress页面
class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "进度指示器的使用",
      ),
      body: MyProgress(),
    );
  }
}

/// 表单组件
class MyProgress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyProgressState();
}

/// 进度指示器: LinearProgressIndicator, CircularProgressIndicator
class _MyProgressState extends State<MyProgress> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      // 注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      vsync: this,
      // 动画执行时间3秒
      duration: Duration(seconds: 3),
    );
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          LinearProgressIndicator(
            // 背景色
            backgroundColor: AppColors.greyE5E5E5,
            // 进度条颜色
            valueColor: AlwaysStoppedAnimation(AppColors.blue),
            // value表示当前的进度，取值范围为[0,1]；如果value为null时则指示器会执行一个循环动画（模糊进度）；当value不为null时，指示器为一个具体进度的进度条
            value: 0.5,
            // 进度条粗细
            minHeight: 2,
          ),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(
            backgroundColor: AppColors.greyE5E5E5,
            valueColor: ColorTween(begin: AppColors.greyBCBCBC, end: AppColors.blue).animate(_animationController),
            value: _animationController.value,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
