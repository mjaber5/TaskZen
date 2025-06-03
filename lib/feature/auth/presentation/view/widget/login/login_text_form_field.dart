import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';
import 'package:task_zen/feature/auth/presentation/view/widget/login/forgot_password.dart';
import 'package:task_zen/feature/auth/presentation/view/widget/login/login_button.dart';
import 'package:task_zen/feature/auth/presentation/view/widget/login/login_dont_have_account.dart';

class LoginTextFormFields extends StatelessWidget {
  const LoginTextFormFields({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.isDark,
  }) : _formKey = formKey,
       _emailController = emailController,
       _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email_outlined, size: ZSizes.iconMd),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: ZSizes.spaceBtwInputFields),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.lock_outline, size: ZSizes.iconMd),
            ),
          ),
          SizedBox(height: ZSizes.sm),
          ForgotPassword(),
          SizedBox(height: ZSizes.lg),
          LoginButton(),
          SizedBox(height: ZSizes.md),
          DontHaveAccount(isDark: isDark),
        ],
      ),
    );
  }
}
