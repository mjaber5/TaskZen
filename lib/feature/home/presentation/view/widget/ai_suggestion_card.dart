import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:task_zen/core/utils/app_router.dart';

class AiSuggestionCard extends StatelessWidget {
  const AiSuggestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo.shade50,
      child: ListTile(
        leading: Lottie.asset(
          'assets/lottie/siri.json',
          width: 75,
          height: 80,
          fit: BoxFit.contain,
        ),
        title: Text('AI Suggestion'),
        subtitle: Text('Break "Build App UI" into smaller tasks?'),
        trailing: Icon(Icons.flash_on),
        onLongPress: () {},
        onTap: () {
          GoRouter.of(context).push(AppRouter.aiView);
        },
      ),
    );
  }
}
