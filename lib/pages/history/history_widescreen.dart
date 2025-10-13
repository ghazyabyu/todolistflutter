import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/components/customcolor.dart';
import 'package:todolistflutter/components/customhistorycard.dart';
import 'package:todolistflutter/controllers/todocontroller.dart';



class HistoryWidescreen extends StatelessWidget {
  HistoryWidescreen({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History"),
      backgroundColor: AppColors.softYellow,),
      backgroundColor:AppColors.softYellow ,
      body: Obx(() {
        final historyList = todoController.todos.where((t) => t.isDone).toList();

        if (historyList.isEmpty) {
          return const Center(child: Text("Belum ada kegiatan selesai"));
        }

        return ListView.builder(
          itemCount: historyList.length,
          itemBuilder: (context, index) 
          {
            final todo = historyList[index];
            return Customhistorycard(
              title: todo.title,
              subtitle: todo.description,
              category: todo.category,
              dueDate: todo.dueDate,
              onDelete: (){
                 todoController.deleteTodo(index);
              },
              onDone: null,
            );
          },
        );
      }),
    );
  }
}
