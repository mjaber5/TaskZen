import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';
import 'package:task_zen/feature/home/presentation/view/ai_widgets_view/ai_view_body.dart';

class AiView extends StatelessWidget {
  const AiView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? ZColors.black : ZColors.white,
      appBar: AppBar(
        backgroundColor: isDark ? ZColors.black : ZColors.white,
        title: Text(
          'AI Task Breakdown',
          style: TextStyle(
            color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
            fontSize: ZSizes.fontSizeLg,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
          ),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: const AiViewBody(),
    );
  }
}
