import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_get/app/models/todo_model.dart';

class HomeController extends GetxController {
  var todosList = <TodoModel>[].obs;
  void addTodo(String task) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc()
        .set({'task': task, 'isDone': false, 'date': DateTime.now()});
    fetchTodos();
  }

  void fetchTodos() async {
    List<TodoModel> localTodosList = [];
    var fetechedTodosList = await FirebaseFirestore.instance
        .collection('todos')
        .orderBy('date')
        .get();
    for (var item in fetechedTodosList.docs) {
      var docId = item.id;
      TodoModel todoModel = TodoModel(
          isDone: item.get('isDone'), task: item.get('task'), docId: docId);
      localTodosList.add(todoModel);
    }
    if (todosList.isEmpty) {
      todosList.addAll(localTodosList);
    } else {
      todosList.clear();
      todosList.addAll(localTodosList);
    }
  }

  void updateCheck(String docId, bool? value) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(docId)
        .update({'isDone': value});
  }

  void updateTask(String docId, String task) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(docId)
        .update({'task': task});
  }

  void deleteTodo(String docId) async {
    await FirebaseFirestore.instance.collection('todos').doc(docId).delete();
    fetchTodos();
  }

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
