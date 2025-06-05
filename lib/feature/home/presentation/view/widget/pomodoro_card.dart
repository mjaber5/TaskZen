import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';

class PomodoroCard extends StatelessWidget {
  const PomodoroCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      color: Colors.orange.shade50,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(Icons.timer, color: Colors.orange),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Focus Timer', style: TextStyle(color: Colors.orange)),
                  Text(
                    '25:00 • Ready to start?',
                    style: TextStyle(
                      color: isDark ? ZColors.textPrimary : ZColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
          ],
        ),
      ),
    );
  }
}
