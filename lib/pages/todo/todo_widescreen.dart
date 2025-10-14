import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistflutter/components/custombutton.dart';
import 'package:todolistflutter/components/customcolor.dart';
import 'package:todolistflutter/components/customtextfield.dart';
import 'package:todolistflutter/controllers/todocontroller.dart';

class TodoWidescreen extends StatelessWidget {
  TodoWidescreen({super.key});

  final TodoController todoController = Get.find<TodoController>();
  final titleController = TextEditingController();
  final descController = TextEditingController();

  final selectedDate = Rxn<DateTime>();
  final categories = ["Sekolah", "Pekerjaan", "Pribadi"];
  final selectedCategory = "".obs;

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
        selectedDate.value = args["duedate"];
      }
    }

    return Scaffold(
      backgroundColor: AppColors.softYellow,
      appBar: AppBar(
        title: Text(isEdit ? "Edit Todo" : "Tambah Todo"),
        backgroundColor: AppColors.softYellow,
        elevation: 0,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Detail Todo",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 24),

                      CustomTextField(
                        controller: titleController,
                        hintText: "Judul",
                      ),
                      const SizedBox(height: 16),

                      CustomTextField(
                        controller: descController,
                        hintText: "Deskripsi",
                      ),
                      const SizedBox(height: 24),

                      const Text(
                        "Due Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Obx(
                        () => GestureDetector(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate:
                                  selectedDate.value ?? DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              selectedDate.value = picked;
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 12),
                            decoration: BoxDecoration(
                              color: AppColors.lightGreen,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: Text(
                              selectedDate.value == null
                                  ? "Pilih Due Date"
                                  : formatDate(selectedDate.value!),
                              style: TextStyle(
                                color: selectedDate.value == null
                                    ? Colors.grey
                                    : AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      const Text(
                        "Kategori",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Obx(
                        () => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: AppColors.lightGreen,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: selectedCategory.value.isEmpty
                                  ? null
                                  : selectedCategory.value,
                              hint: const Text("Pilih Kategori"),
                              onChanged: (value) {
                                if (value != null) {
                                  selectedCategory.value = value;
                                }
                              },
                              items: categories
                                  .map(
                                    (cat) => DropdownMenuItem(
                                      value: cat,
                                      child: Text(cat),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      Center(
                        child: SizedBox(
                          width: 300,
                          child: CustomButton(
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
                                    selectedDate.value,
                                  );
                                } else {
                                  todoController.addTodo(
                                    titleController.text,
                                    descController.text,
                                    selectedCategory.value,
                                    selectedDate.value,
                                  );
                                }
                                Get.back();
                              } else {
                                Get.snackbar(
                                  "Gagal",
                                  "Judul dan deskripsi tidak boleh kosong",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red.shade100,
                                  colorText: Colors.black,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
