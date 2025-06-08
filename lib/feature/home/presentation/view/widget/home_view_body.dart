import 'package:flutter/material.dart';

import 'package:task_zen/feature/home/presentation/view/widget/ai_suggestion_card.dart';
import 'package:task_zen/feature/home/presentation/view/widget/app_bar_section.dart';
import 'package:task_zen/feature/home/presentation/view/widget/custom_search_bar.dart';
import 'package:task_zen/feature/home/presentation/view/widget/hello_serction_and_tasks_number.dart';
import 'package:task_zen/feature/home/presentation/view/widget/pomodoro_card.dart';
import 'package:task_zen/feature/home/presentation/view/widget/task_tab_bar.dart';
import 'package:task_zen/feature/home/presentation/view/widget/weekly_summary.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarSection(isDark: isDark),
              const SizedBox(height: 6),

              HelloSectionAndTasksNumber(isDark: isDark),

              const SizedBox(height: 20),

              /// ➕ Quick Add Task
              CustomSearchBar(),

              const SizedBox(height: 24),

              /// 📅 Ta,bs (Today, Upcoming, Completed)
              TaskTabBar(),

              const SizedBox(height: 24),

              /// 📝 Ta,sk List Preview
              //TaskListPreview(),
              const SizedBox(height: 20),

              /// ⏱️ Po,modoro / Focus Mode
              PomodoroCard(),

              const SizedBox(height: 20),

              /// 🤖 AI ,Suggestions
              AiSuggestionCard(),

              const SizedBox(height: 20),

              /// 📈 W,eekly Summary
              WeeklySummary(),
            ],
          ),
        ),
      ),
    );
  }
}
