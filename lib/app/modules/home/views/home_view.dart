import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_get/app/modules/home/widgets/single_task.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.fetchTodos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADDTODO);
        },
        child: Icon(Icons.add),
      ),
      body: Obx(() {
        return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: controller.todosList.length,
            itemBuilder: (context, index) {
              return SingleTask(
                controller.todosList[index].isDone,
                controller.todosList[index].task,
                controller.todosList[index].docId,
              );
            });
      }),
    );
  }
}
