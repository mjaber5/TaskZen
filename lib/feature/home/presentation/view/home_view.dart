import 'package:flutter/material.dart';

import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/feature/home/presentation/view/widget/custom_drawer.dart';
import 'package:task_zen/feature/home/presentation/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? ZColors.black : ZColors.white,
      drawer: CustomDrawer(),
      body: HomeViewBody(),
    );
  }
}
