import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todocontroller.dart';
import '../components/customtextfield.dart';
import '../components/custombutton.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  final titleController = TextEditingController();
  final descController = TextEditingController();
  final categories = ["Sekolah", "Pekerjaan", "Pribadi"];
  var selectedCategory = "".obs;

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final isEdit = args != null && args["index"] != null;

    if (isEdit) {
      titleController.text = args["title"];
      descController.text = args["desc"];
      selectedCategory.value = args["category"];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Todo" : "Tambah Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(controller: titleController, hintText: "Judul"),
            const SizedBox(height: 12),
            CustomTextField(controller: descController, hintText: "Deskripsi"),
            const SizedBox(height: 12),
            Obx(() => DropdownButton<String>(
                  value: selectedCategory.value.isEmpty
                      ? null
                      : selectedCategory.value,
                  hint: const Text("Pilih Kategori"),
                  onChanged: (value) {
                    if (value != null) selectedCategory.value = value;
                  },
                  items: categories
                      .map((cat) =>
                          DropdownMenuItem(value: cat, child: Text(cat)))
                      .toList(),
                )),
            const SizedBox(height: 20),
            CustomButton(
              text: isEdit ? "Update" : "Simpan",
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descController.text.isNotEmpty) {
                  if (isEdit) {
                    todoController.editTodo(
                      args["index"],
                      titleController.text,
                      descController.text,
                      selectedCategory.value,
                    );
                  } else {
                    todoController.addTodo(
                      titleController.text,
                      descController.text,
                      selectedCategory.value,
                    );
                  }
                  Get.back();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
