import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_zen/core/utils/app_router.dart';
import 'package:task_zen/core/utils/theme/theme.dart';
import 'package:task_zen/feature/auth/model/data/repositories/auth_repositiory.dart';
import 'package:task_zen/feature/auth/presentation/view_model/cubit/auth_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(authRepository: AuthRepository()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ZAppTheme.lightTheme,
        darkTheme: ZAppTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
