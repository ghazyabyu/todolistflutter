import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/components/customcard.dart';
import 'package:todolistflutter/components/customcolor.dart';
import 'package:todolistflutter/controllers/todocontroller.dart';
import 'package:todolistflutter/routes/routes.dart';

class HomeWidescreen extends StatelessWidget {
  HomeWidescreen({super.key});

  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        backgroundColor: AppColors.softYellow,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: AppColors.softYellow,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 900, 
          ),
          child: Obx(() {
            
            if (todoController.todos.isEmpty) {
              return const Center(
                child: Text(
                  "Belum ada kegiatan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              );
            }

            
            final activeTodos =
                todoController.todos.where((t) => !t.isDone).toList();

          
            return ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: activeTodos.length,
              itemBuilder: (context, index) {
                final todo = activeTodos[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CustomCard(
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            title: const Text(
                              "Konfirmasi",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: const Text(
                              "Apakah kamu yakin ingin menghapus todo ini?",
                              style: TextStyle(fontSize: 15),
                            ),
                            actions: [
                              TextButton(
                                child: const Text(
                                  "Tidak",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text(
                                  "Ya",
                                  style: TextStyle(color: Colors.red),
                                ),
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
                  ),
                );
              },
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addtodo);
        },
        child: const Icon(Icons.add),
        elevation: 4,
        tooltip: "Tambah kegiatan baru",
      ),
    );
  }
}
