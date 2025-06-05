import 'package:flutter/material.dart';

class AiSuggestionCard extends StatelessWidget {
  const AiSuggestionCard({super.key});

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
