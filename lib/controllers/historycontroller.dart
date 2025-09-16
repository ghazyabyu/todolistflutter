import 'package:get/get.dart';
import '../controllers/todocontroller.dart';
import '../model/todo.dart';

class HistoryController extends GetxController {
  final TodoController todoController = Get.find<TodoController>();

  RxList<Todo> historyList = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    ever(todoController.todos, (_) {
      updateHistory();
    });
    updateHistory();
  }

  void updateHistory() {
    historyList.value =
        todoController.todos.where((t) => t.isDone).toList();
  }


  

}

