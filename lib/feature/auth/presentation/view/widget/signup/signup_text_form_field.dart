import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_zen/core/utils/app_router.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';
import 'package:task_zen/core/utils/helpers/app_regex.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_theme.dart';
import 'package:task_zen/feature/auth/presentation/view/widget/signup/already_have_an_account.dart';
import 'package:task_zen/feature/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:task_zen/feature/auth/presentation/view_model/cubit/auth_state.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toast_service.dart';

class SignupTextFormField extends StatelessWidget {
  const SignupTextFormField({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController displayNameController,
    required TextEditingController passwordController,
    required this.isDark,
  }) : _formKey = formKey,
       _emailController = emailController,
       _displayNameController = displayNameController,
       _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _displayNameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.homeView);
          ToastService.showSuccessToast(
            context,
            length: ToastLength.medium,
            expandedHeight: 100,
            message: "Account created successfully!",
          );
        } else if (state is AuthError) {
          ToastService.showErrorToast(
            context,
            length: ToastLength.medium,
            expandedHeight: 100,
            message: state.message,
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _displayNameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person_outline, size: ZSizes.iconMd),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                if (!AppRegex.isUserNameValid(value)) {
                  return 'Full name must contain at least 3 words (e.g., First Middle Last)';
                }
                return null;
              },
            ),
            const SizedBox(height: ZSizes.spaceBtwInputFields),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email_outlined, size: ZSizes.iconMd),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: ZSizes.spaceBtwInputFields),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock_outline, size: ZSizes.iconMd),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (!AppRegex.isPasswordValid(value)) {
                  return 'Password must be 8-12 characters, include uppercase, lowercase, number, and special character';
                }
                return null;
              },
            ),

            const SizedBox(height: ZSizes.lg),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        state is AuthLoading
                            ? null
                            : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().signup(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                  _displayNameController.text.trim(),
                                );
                              }
                            },
                    child:
                        state is AuthLoading
                            ? const CircularProgressIndicator(
                              color: ZColors.buttonText,
                              strokeWidth: 2.0,
                            )
                            : Text(
                              'Sign Up',
                              style: ZTextTheme.lightTextTheme.labelLarge!
                                  .copyWith(color: ZColors.buttonText),
                            ),
                  ),
                );
              },
            ),
            const SizedBox(height: ZSizes.md),
            AlreadyHaveAccount(isDark: isDark),
          ],
        ),
      ),
    );
  }
}
