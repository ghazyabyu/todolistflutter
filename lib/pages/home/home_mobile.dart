import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/components/customcard.dart';
import 'package:todolistflutter/components/customcolor.dart';
import 'package:todolistflutter/controllers/todocontroller.dart';
import 'package:todolistflutter/routes/routes.dart';


class HomeMobile extends StatelessWidget {
  HomeMobile({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        backgroundColor: AppColors.softYellow,
      ),
      backgroundColor: AppColors.softYellow,
      body: Obx(() {
        if (todoController.todos.isEmpty) {
          return const Center(child: Text("Belum ada kegiatan"));
        }

        final activeTodos = todoController.todos.where((t) => !t.isDone).toList();

        return ListView.builder(
          itemCount: activeTodos.length,
          itemBuilder: (context, index) {
            final todo = activeTodos[index];
            return CustomCard(
              title: todo.title,
              subtitle: todo.description,
              category: todo.category,
              dueDate: todo.dueDate,
              onDone: () {
                final realIndex = todoController.todos.indexOf(todo);
                todoController.markAsDone(realIndex);
              },
              onEdit: () {
                Get.toNamed(
                  AppRoutes.addtodo,
                  arguments: {
                    "index": index,
                    "title": todo.title,
                    "desc": todo.description,
                    "category": todo.category,
                    "duedate": todo.dueDate,
                  },
                );
              },
              onDelete: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Konfirmasi"),
                      content: const Text(
                          "Apakah kamu yakin ingin menghapus todo ini?"),
                      actions: [
                        TextButton(
                          child: const Text("Tidak"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text("Ya"),
                          onPressed: () {
                            final realIndex =
                                todoController.todos.indexOf(todo);
                            todoController.deleteTodo(realIndex);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
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
