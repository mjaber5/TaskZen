import 'package:flutter/material.dart';

class WeeklySummary extends StatelessWidget {
  const WeeklySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade50,
      child: ListTile(
        leading: Icon(Icons.bar_chart, color: Colors.green),
        title: Text('Weekly Summary'),
        subtitle: Text('7 tasks done • 5 hours focused'),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
