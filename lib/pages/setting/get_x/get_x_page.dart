import 'package:flutter/material.dart';
import 'package:flutter_base/pages/setting/get_x/get_x_controller.dart';
import 'package:get/get.dart';

/// GetX使用
class GetXPage extends StatelessWidget {
  final controller = Get.put(GetXController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '计数器-简单式',
        ),
      ),
      body: Center(
        child: GetBuilder<GetXController>(
          builder: (controller) {
            return Text(
              '点击了 ${controller.count} 次',
              style: TextStyle(
                fontSize: 30.0,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increase(),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
