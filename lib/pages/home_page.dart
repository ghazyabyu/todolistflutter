import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todocontroller.dart';
import '../components/customcard.dart';
import '../routes/routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo List")),
      body: Obx(() {
        if (todoController.todos.isEmpty) {
          return const Center(child: Text("Belum ada kegiatan"));
        }

        return ListView.builder(
          itemCount: todoController.todos.length,
          itemBuilder: (context, index) {
            final todo = todoController.todos[index];
            return CustomCard(
              title: todo.title,
              subtitle: todo.description,
              category: todo.category,
              onDone: () {
                todoController.markAsDone(index);
              },
              onEdit: () {
                Get.toNamed(AppRoutes.addtodo, arguments: {
                  "index": index,
                  "title": todo.title,
                  "desc": todo.description,
                  "category": todo.category,
                });
              },
              onDelete: () {
                todoController.deleteTodo(index);
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addtodo);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
