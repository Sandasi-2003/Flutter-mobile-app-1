import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/constants.dart';
import 'core/services/navigation_service.dart';
import 'core/theme/theme.dart';
import 'providers/providers.dart';
import 'routes/app_router.dart';
import 'routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      navigatorKey: NavigationService.instance.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeProvider.themeMode,

      initialRoute: AppRoutes.initial,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
