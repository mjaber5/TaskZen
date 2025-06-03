import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/theme/custom_themes/text_theme.dart';
import 'package:task_zen/feature/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:task_zen/feature/auth/presentation/view_model/cubit/auth_state.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: state is AuthLoading ? null : () {},
            child:
                state is AuthLoading
                    ? const CircularProgressIndicator(
                      color: ZColors.buttonText,
                      strokeWidth: 2.0,
                    )
                    : Text(
                      'Login',
                      style: ZTextTheme.lightTextTheme.labelLarge!.copyWith(
                        color: ZColors.buttonText,
                      ),
                    ),
          ),
        );
      },
    );
  }
}
