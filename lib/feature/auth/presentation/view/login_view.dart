import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_zen/core/utils/app_router.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_theme.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement login logic with Cubit
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logging in with ${_emailController.text}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? ZColors.black : ZColors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: ZSizes.lg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: ZTextTheme.lightTextTheme.displayMedium!.copyWith(
                    color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ZSizes.lg),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: ZSizes.iconMd,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: ZSizes.spaceBtwInputFields),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: ZSizes.iconMd,
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: ZSizes.sm),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // TODO: Implement forgot password logic
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Forgot Password clicked'),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: ZTextTheme.lightTextTheme.bodySmall!
                                .copyWith(color: ZColors.secondary),
                          ),
                        ),
                      ),
                      SizedBox(height: ZSizes.lg),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _login,
                          child: Text(
                            'Login',
                            style: ZTextTheme.lightTextTheme.labelLarge!
                                .copyWith(color: ZColors.buttonText),
                          ),
                        ),
                      ),
                      SizedBox(height: ZSizes.md),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: ZTextTheme.lightTextTheme.bodyMedium!
                                .copyWith(
                                  color:
                                      isDark
                                          ? ZColors.textOnPrimary
                                          : ZColors.textSecondary,
                                ),
                          ),
                          TextButton(
                            onPressed: () {
                              GoRouter.of(context).push(AppRouter.signupView);
                            },
                            child: Text(
                              'Sign Up',
                              style: ZTextTheme.lightTextTheme.bodyMedium!
                                  .copyWith(
                                    color: ZColors.secondary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
