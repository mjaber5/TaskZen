import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';

class HelloSectionAndTasksNumber extends StatelessWidget {
  const HelloSectionAndTasksNumber({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 👋 Greeting
        Text(
          'Good Morning, Mohammed!',
          style: TextStyle(
            fontSize: 18,
            color: isDark ? ZColors.textSecondary : ZColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              'Your have ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
              ),
            ),
            Text(
              '49 tasks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: ZColors.accent,
              ),
            ),
          ],
        ),
        Text(
          'this month 👍',
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontWeight: FontWeight.bold,

            fontSize: 24,
            color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
