import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/feature/home/presentation/view/focus_timer_widget/focus_timer_view_body.dart';

class FocusTimerView extends StatelessWidget {
  const FocusTimerView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? ZColors.black : ZColors.white,
      body: FocusTimerViewBody(),
    );
  }
}
