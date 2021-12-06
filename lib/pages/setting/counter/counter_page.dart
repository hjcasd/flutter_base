import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

/// GetX使用
class CounterPage extends StatelessWidget {
  final controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '计数器-简单式',
        ),
      ),
      body: Center(
        child: GetBuilder<CounterController>(
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
