import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';

class CustomView extends StatelessWidget {
  const CustomView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: size.width * 0.7,
      width: size.width * 0.6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDark ? ZColors.secondary : ZColors.secondary,
        boxShadow: [
          BoxShadow(
            color:
                isDark
                    ? ZColors.primary.withOpacity(0.5)
                    : ZColors.primary.withOpacity(0.4),
            blurRadius: 15,
            spreadRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(Icons.task_alt, size: ZSizes.iconXl, color: ZColors.white),
    );
  }
}
