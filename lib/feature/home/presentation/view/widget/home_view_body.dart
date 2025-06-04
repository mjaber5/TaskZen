import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// ☰ Drawer Button,
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/menu-button.png',
                      width: 24,
                      height: 24,
                      color:
                          isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                    ),
                    onPressed: () {
                      CustomDrawer();
                    },
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isDark ? ZColors.greyDark : ZColors.greyLight,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/11475205.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),

              /// ,👋 Greeting
              Text(
                'Hello, Mohammed 👋',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Your tasks, your way.',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? ZColors.textSecondary : ZColors.textPrimary,
                ),
              ),
              const SizedBox(height: 20),

              /// ➕ Quick Add Task
              _QuickAddTask(),

              const SizedBox(height: 20),

              /// 📅 Tabs (Today, Upcoming, Completed)
              _TaskTabBar(),

              const SizedBox(height: 16),

              /// 📝 Task List Preview
              _TaskListPreview(),

              const SizedBox(height: 20),

              /// ⏱️ Pomodoro / Focus Mode
              _PomodoroCard(),

              const SizedBox(height: 20),

              /// 🤖 AI Suggestions
              _AiSuggestionCard(),

              const SizedBox(height: 20),

              /// 📈 Weekly Summary
              _WeeklySummary(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? ZColors.greyDark
                      : ZColors.greyLight,
            ),
            child: Text(
              'Task Zen',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class _QuickAddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextField(
      decoration: InputDecoration(
        hintText: 'Quickly add a task...',
        prefixIcon: Icon(Icons.add),
        filled: true,
        fillColor: isDark ? ZColors.greyDark.withOpacity(0.2) : Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _TaskTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children:
          ['Today', 'Upcoming', 'Completed'].map((label) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Chip(
                label: Text(label),
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                elevation: 0,
                backgroundColor:
                    isDark
                        ? ZColors.greyDark.withOpacity(0.2)
                        : Colors.blue.shade50,
                //labelStyle: TextStyle(color: Colors.blue),
              ),
            );
          }).toList(),
    );
  }
}

class _TaskListPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: List.generate(2, (index) {
        return Card(
          color: isDark ? ZColors.greyLight : ZColors.greyMedium,
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: Checkbox(value: false, onChanged: (_) {}),
            title: Text('Task Title #$index'),
            subtitle: Text('Due: Today • Priority: High'),
            trailing: Icon(Icons.chevron_right),
          ),
        );
      }),
    );
  }
}

class _PomodoroCard extends StatelessWidget {
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

class _AiSuggestionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo.shade50,
      child: ListTile(
        leading: Icon(Icons.smart_toy, color: Colors.indigo),
        title: Text('AI Suggestion'),
        subtitle: Text('Break "Build App UI" into smaller tasks?'),
        trailing: Icon(Icons.flash_on),
      ),
    );
  }
}

class _WeeklySummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade50,
      child: ListTile(
        leading: Icon(Icons.bar_chart, color: Colors.green),
        title: Text('Weekly Summary'),
        subtitle: Text('7 tasks done • 5 hours focused'),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
