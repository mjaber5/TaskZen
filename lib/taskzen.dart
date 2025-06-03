import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/app_router.dart';
import 'package:task_zen/core/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ZAppTheme.lightTheme,
      darkTheme: ZAppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
