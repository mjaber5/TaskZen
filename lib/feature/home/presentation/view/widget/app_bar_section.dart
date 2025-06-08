import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/feature/home/presentation/view/widget/custom_drawer.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// ☰ Drawer Button,
        IconButton(
          icon: Image.asset(
            'assets/icons/menu-button.png',
            width: 28,
            height: 28,
            color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
          ),
          onPressed: () {
            CustomDrawer.openDrawer(context);
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
            child: Image.asset('assets/images/9720007.jpg', fit: BoxFit.fill),
          ),
        ),
      ],
    );
  }
}
