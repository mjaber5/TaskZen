import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_zen/core/utils/constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color: isDark ? ZColors.greyDark.withOpacity(0.2) : Colors.white,
            ),
          ),
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
