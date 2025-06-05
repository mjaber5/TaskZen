import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_zen/core/utils/constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: isDark ? ZColors.greyDark.withOpacity(0.2) : Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search a task...',
          prefixIcon: Icon(
            Iconsax.search_normal_1,
            color: isDark ? ZColors.textSecondary : ZColors.textPrimary,
          ),
          filled: true,
          fillColor: isDark ? ZColors.greyDark.withOpacity(0.2) : Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
