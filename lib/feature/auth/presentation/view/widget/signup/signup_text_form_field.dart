import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';
import 'package:task_zen/feature/auth/presentation/view/widget/signup/already_have_an_account.dart';
import 'package:task_zen/feature/auth/presentation/view/widget/signup/signup_button.dart';

class SignupTextFormField extends StatelessWidget {
  const SignupTextFormField({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required this.isDark,
  }) : _formKey = formKey,
       _emailController = emailController,
       _passwordController = passwordController,
       _confirmPasswordController = confirmPasswordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
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
            obscureText: true,
          ),
          SizedBox(height: ZSizes.spaceBtwInputFields),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              hintText: 'Re-enter your password',
              prefixIcon: Icon(Icons.lock_outline, size: ZSizes.iconMd),
            ),
            obscureText: true,
          ),
          SizedBox(height: ZSizes.lg),
          SignupButton(),
          SizedBox(height: ZSizes.md),
          AlreadyHaveAccount(isDark: isDark),
        ],
      ),
    );
  }
}
