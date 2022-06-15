import 'package:flutter/material.dart';
import 'package:flutter_base/pages/setting/get_x/get_x_controller.dart';
import 'package:flutter_base/routes/route_manager.dart';
import 'package:flutter_base/routes/route_paths.dart';
import 'package:get/get.dart';

/// GetX使用
class GetXPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetXController>(
      global: false,
      init: GetXController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '计数器-简单式',
            ),
          ),
          body: Center(
            child: Text(
              '点击了 ${controller.count} 次',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              RouteManager.toNamed(RoutePaths.GetX, params: {"value": "222222"});
            },
            child: Icon(
              Icons.add,
            ),
          ),
        );
      },
    );
  }
}
