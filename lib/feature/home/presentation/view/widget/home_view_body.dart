import 'package:flutter/material.dart';

import 'package:task_zen/feature/home/presentation/view/widget/ai_suggestion_card.dart';
import 'package:task_zen/feature/home/presentation/view/widget/app_bar_section.dart';
import 'package:task_zen/feature/home/presentation/view/widget/custom_search_bar.dart';
import 'package:task_zen/feature/home/presentation/view/widget/hello_serction_and_tasks_number.dart';
import 'package:task_zen/feature/home/presentation/view/widget/pomodoro_card.dart';
import 'package:task_zen/feature/home/presentation/view/widget/task_list_preview.dart';
import 'package:task_zen/feature/home/presentation/view/widget/task_tab_bar.dart';
import 'package:task_zen/feature/home/presentation/view/widget/weekly_summary.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          /// 🚫 Not Scrollable: Fixed AppBar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              children: [
                AppBarSection(isDark: isDark),
                HelloSectionAndTasksNumber(isDark: isDark),
                const SizedBox(height: 20),
              ],
            ),
          ),

          /// ✅ Scrollable Body
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchBar(),
                  const SizedBox(height: 24),
                  TaskTabBar(),
                  const SizedBox(height: 24),
                  TaskListPreview(),
                  const SizedBox(height: 20),
                  PomodoroCard(),
                  const SizedBox(height: 20),
                  AiSuggestionCard(),
                  const SizedBox(height: 20),
                  WeeklySummary(),
                  const SizedBox(height: 20),
                  Container(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
