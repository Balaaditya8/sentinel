import 'package:flutter/material.dart';

class PregnancyProgressBar extends StatelessWidget {
  final int gestationalAge; // in weeks
  final DateTime dueDate;

  PregnancyProgressBar({required this.gestationalAge, required this.dueDate});

  @override
  Widget build(BuildContext context) {
    final totalWeeks = 40; // Assuming a full-term pregnancy is 40 weeks
    final progress = gestationalAge / totalWeeks;
    final remainingDays = dueDate.difference(DateTime.now()).inDays;

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pregnancy Progress',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              minHeight: 20,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Week ${gestationalAge}'),
                Text('Week 40'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Time until due date: $remainingDays days',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Expected delivery date: ${_formatDate(dueDate)}',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}