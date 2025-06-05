import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_zen/core/utils/constants/colors.dart';

class TaskTabBar extends StatelessWidget {
  const TaskTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 60,
                height: 60,
                color:
                    isDark
                        ? ZColors.accent.withOpacity(0.7)
                        : ZColors.accent.withOpacity(0.2),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.calendar_1, color: ZColors.accent),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Today',
              style: TextStyle(
                color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
              ),
            ),
          ],
        ),
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 60,
                height: 60,
                color:
                    isDark
                        ? ZColors.warning.withOpacity(0.6)
                        : ZColors.warning.withOpacity(0.2),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.calendar_1, color: ZColors.warning),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Today',
              style: TextStyle(
                color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
              ),
            ),
          ],
        ),
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 60,
                height: 60,
                color: Colors.green.withOpacity(0.4),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.calendar_1, color: Colors.green),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Today',
              style: TextStyle(
                color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
