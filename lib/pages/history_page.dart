import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todocontroller.dart';
import '../components/customcard.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History")),
      body: Obx(() {
        final historyList = todoController.todos.where((t) => t.isDone).toList();

        if (historyList.isEmpty) {
          return const Center(child: Text("Belum ada kegiatan selesai"));
        }

        return ListView.builder(
          itemCount: historyList.length,
          itemBuilder: (context, index) {
            final todo = historyList[index];
            return CustomCard(
              title: todo.title,
              subtitle: todo.description,
              category: todo.category,
              onDone: null,
            );
          },
        );
      }),
    );
  }
}
