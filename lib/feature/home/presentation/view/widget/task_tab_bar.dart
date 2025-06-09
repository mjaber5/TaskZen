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
        TaskBarItemButton(
          isDark: isDark,
          onPressed: () {},
          text: 'To-Do',
          iconColor: ZColors.accent,
          backgroundColor: ZColors.accent.withOpacity(0.5),
        ),
        TaskBarItemButton(
          isDark: isDark,
          onPressed: () {},
          text: 'Progress',
          iconColor: ZColors.buttonOrange,
          backgroundColor: ZColors.buttonOrange.withOpacity(0.4),
        ),
        TaskBarItemButton(
          isDark: isDark,
          onPressed: () {},
          text: 'Done',
          iconColor: ZColors.buttonGreen,
          backgroundColor: ZColors.buttonGreen.withOpacity(0.3),
        ),
      ],
    );
  }
}

class TaskBarItemButton extends StatelessWidget {
  const TaskBarItemButton({
    super.key,
    required this.isDark,
    required this.onPressed,
    required this.text,
    required this.backgroundColor,
    required this.iconColor,
  });
  final Function onPressed;
  final String text;
  final bool isDark;
  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 60,
            height: 60,
            color: backgroundColor,
            child: IconButton(
              onPressed: onPressed(),
              icon: Icon(Iconsax.calendar_1, color: iconColor),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
