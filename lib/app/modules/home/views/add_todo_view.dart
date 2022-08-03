import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:todo_get/app/modules/home/controllers/home_controller.dart';

class AddTodoView extends GetView<HomeController> {
  const AddTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final todoController = TextEditingController();
    FocusScopeNode currentFocus;
    void unfocus() {
      currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: todoController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Enter New Task',
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (todoController.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'Please enter a task',
                          backgroundColor: Colors.grey.shade600,
                        );
                      } else {
                        controller.addTodo(todoController.text);
                        todoController.clear();
                        unfocus();
                        Fluttertoast.showToast(
                            msg: 'Task failed successfully.',
                            backgroundColor: Colors.grey.shade600);
                        Get.back();
                      }
                    },
                    child: Text('Submit'))
              ],
            )),
      ),
    );
  }
}
