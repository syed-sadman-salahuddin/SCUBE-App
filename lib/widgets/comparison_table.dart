import 'package:flutter/material.dart';
import 'package:scube_app/utils/colors.dart';

class DataComparisonTable extends StatelessWidget {
  final List<ComparisonRowData> rows;

  const DataComparisonTable({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
            child: Row(
              children: const [
                Expanded(flex: 3, child: SizedBox()), // Label text
                Expanded(flex: 2, child: Text("Yesterday's Data", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.grey))),
                Expanded(flex: 2, child: Text("Today's Data", textAlign: TextAlign.right, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.grey))),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey[200]),
          // Rows
          ...rows.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return Container(
              color: index % 2 == 0 ? Colors.white : const Color(0xFFF9FAFB),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(item.label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(item.yesterday, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: kTextColor)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(item.today, textAlign: TextAlign.right, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: kTextColor)),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class ComparisonRowData {
  final String label;
  final String yesterday;
  final String today;

  ComparisonRowData(this.label, this.yesterday, this.today);
}
