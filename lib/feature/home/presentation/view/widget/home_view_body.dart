import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Welcome to TaskZen',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Your tasks, your way.',
            style: TextStyle(
              fontSize: 18,
              color: isDark ? ZColors.textSecondary : ZColors.textOnPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
