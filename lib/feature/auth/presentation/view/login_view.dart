import 'package:flutter/material.dart';

import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/feature/auth/presentation/view/widget/login/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? ZColors.black : ZColors.white,
      body: LoginViewBody(),
    );
  }
}
