import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';

class AnimatedMotivationalQuote extends StatelessWidget {
  const AnimatedMotivationalQuote({
    super.key,
    required this.motivationalQuotes,
    required this.currentSession,
    required this.isDark,
  });

  final Map<String, String> motivationalQuotes;
  final String currentSession;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder:
          (child, animation) =>
              FadeTransition(opacity: animation, child: child),
      child: Text(
        motivationalQuotes[currentSession]!,
        key: ValueKey(currentSession),
        style: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.italic,
          color:
              isDark
                  ? ZColors.textOnPrimary.withOpacity(0.8)
                  : ZColors.textSecondary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
