import 'package:flutter/material.dart';
import '../components/customcolor.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String category;
  final VoidCallback? onDone;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final DateTime? dueDate;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.dueDate,
    this.onDone,
    this.onEdit,
    this.onDelete,
  });

  String formatDate(DateTime date) {
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
      "Desember",
    ];
    return "${date.day} ${months[date.month - 1]} ${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lighterGreen,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle),
            const SizedBox(height: 4),
            Text(
              "Kategori: $category",
              style: const TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.blueGrey,
              ),
            ),
            if (dueDate != null) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: AppColors.darkgreen,
                  ),
                  const SizedBox(width: 3), 
                  Text(
                    formatDate(dueDate!),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.darkgreen,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
        trailing: Wrap(
          spacing: 4,
          children: [
            IconButton(
              icon: const Icon(Icons.check, color: Colors.green),
              onPressed: onDone,
            ),
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
