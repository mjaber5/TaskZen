import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';

class TaskListPreview extends StatelessWidget {
  const TaskListPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: List.generate(2, (index) {
        return Card(
          color: isDark ? ZColors.greyLight : ZColors.greyMedium,
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: Checkbox(value: false, onChanged: (_) {}),
            title: Text('Task Title #$index'),
            subtitle: Text('Due: Today • Priority: High'),
            trailing: Icon(Icons.chevron_right),
          ),
        );
      }),
    );
  }
}
