import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_theme.dart';
import 'package:task_zen/feature/auth/presentation/view/widget/signup/signup_text_form_field.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
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
              Text(
                'Create Account',
                style: ZTextTheme.lightTextTheme.displayMedium!.copyWith(
                  color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'start your journey with us',
                style: ZTextTheme.lightTextTheme.titleLarge!.copyWith(
                  color: ZColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ZSizes.lg),
              SignupTextFormField(
                formKey: _formKey,
                emailController: _emailController,
                displayNameController: _displayNameController,
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
