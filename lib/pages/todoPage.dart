import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/components/customcolor.dart';
import '../controllers/todocontroller.dart';
import '../components/customtextfield.dart';
import '../components/custombutton.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final TodoController todoController = Get.find<TodoController>();
  final titleController = TextEditingController();
  final descController = TextEditingController();

  DateTime? selectedDate;
  final categories = ["Sekolah", "Pekerjaan", "Pribadi"];
  var selectedCategory = "".obs;

  String formatDate(DateTime date) {
    return "${date.day} ${_monthName(date.month)} ${date.year}";
  }

  String _monthName(int month) {
    const months = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final isEdit = args != null && args["index"] != null;

    if (isEdit) {
      titleController.text = args["title"];
      descController.text = args["desc"];
      selectedCategory.value = args["category"];
      if (args["duedate"] != null && args["duedate"] is DateTime) {
        selectedDate = args["duedate"];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Todo" : "Tambah Todo"),
        backgroundColor: AppColors.softYellow,
      ),
      backgroundColor: AppColors.softYellow,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(controller: titleController, hintText: "Judul"),
            const SizedBox(height: 12),
            CustomTextField(controller: descController, hintText: "Deskripsi"),
            const SizedBox(height: 12),

            
            Text("Due Date", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  selectedDate = picked;
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Text(
                  //belum bisa nampilin text setelah di pick
                  selectedDate == null
                      ? "Pilih Due Date"
                      : formatDate(selectedDate!),
                  style: TextStyle(
                    color: selectedDate == null ? Colors.grey : Colors.black,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Obx(
              () => DropdownButton<String>(
                value: selectedCategory.value.isEmpty
                    ? null
                    : selectedCategory.value,
                hint: const Text("Pilih Kategori"),
                onChanged: (value) {
                  if (value != null) selectedCategory.value = value;
                },
                items: categories
                    .map(
                      (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                    )
                    .toList(),
              ),
            ),
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
                      selectedDate,
                    );
                  } else {
                    todoController.addTodo(
                      titleController.text,
                      descController.text,
                      selectedCategory.value,
                      selectedDate,
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
