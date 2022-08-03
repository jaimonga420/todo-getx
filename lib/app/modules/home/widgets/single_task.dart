import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:todo_get/app/modules/home/controllers/home_controller.dart';

class SingleTask extends StatefulWidget {
  SingleTask(this.isDone, this.task, this.docId, {Key? key}) : super(key: key);

  @override
  State<SingleTask> createState() => _SingleTaskState();
  final String task;
  bool isDone;
  final String docId;
}

class _SingleTaskState extends State<SingleTask> {
  HomeController homeController = Get.put(HomeController());
  TextEditingController taskEditController = TextEditingController();
  openEditDialog() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Edit Task'),
            content: TextFormField(
              controller: taskEditController,
              decoration: InputDecoration(label: Text('Enter Task')),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    taskEditController.clear();
                    Get.back();
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    if (taskEditController.text.isNotEmpty) {
                      homeController.updateTask(
                          widget.docId, taskEditController.text);
                      Get.back();
                      homeController.fetchTodos();
                      taskEditController.clear();
                    } else {
                      Fluttertoast.showToast(msg: 'Please enter a task');
                    }
                  },
                  child: Text('Submit'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    var isChecked = widget.isDone.obs;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.black, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => Checkbox(
                  value: isChecked.value,
                  onChanged: (value) {
                    isChecked.value = !isChecked.value;
                    homeController.updateCheck(widget.docId, value);
                  }),
            ),
            Text(
              widget.task,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            IconButton(
              onPressed: () {
                openEditDialog();
              },
              icon: Icon(Icons.edit),
              color: Colors.blue,
            ),
            IconButton(
              onPressed: () {
                homeController.deleteTodo(widget.docId);
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
