import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/feature/auth/model/data/repositories/auth_repositiory.dart';
import 'package:task_zen/feature/auth/presentation/view/widget/signup/signup_view_body.dart';
import 'package:task_zen/feature/auth/presentation/view_model/cubit/auth_cubit.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authRepository = RepositoryProvider.of<AuthRepository>(context);
    return BlocProvider(
      create: (context) => AuthCubit(authRepository: authRepository),
      child: Scaffold(
        backgroundColor: isDark ? ZColors.black : ZColors.white,
        body: const SignupViewBody(),
      ),
    );
  }
}
