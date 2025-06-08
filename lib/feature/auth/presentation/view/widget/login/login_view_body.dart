import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_theme.dart';
import 'package:task_zen/feature/auth/presentation/view/widget/login/login_text_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: ZSizes.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lottie/task.json',
                width: ZSizes.iconXl * 3,
                height: ZSizes.iconXl * 3,
                fit: BoxFit.cover,
                repeat: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'T',
                    style: ZTextTheme.lightTextTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.w900,
                      color: ZColors.secondary,
                      fontSize: ZSizes.iconXl,
                    ),
                  ),
                  Text(
                    'askZen',
                    style: ZTextTheme.lightTextTheme.displayLarge!.copyWith(
                      fontSize: ZSizes.iconXl,
                      fontWeight: FontWeight.w900,
                      color:
                          isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Text(
                'Welcome Back',
                style: ZTextTheme.lightTextTheme.displayMedium!.copyWith(
                  color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ZSizes.lg),
              const SizedBox(height: ZSizes.lg),
              const SizedBox(height: ZSizes.lg),
              LoginTextFormFields(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
                isDark: isDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
