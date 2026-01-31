import 'package:flutter/material.dart';
import 'package:mission_5_wanderly/core/router/app_router.dart';
import 'package:mission_5_wanderly/core/themes/app_themes.dart';
import 'package:mission_5_wanderly/presentation/providers/trip_provider.dart';
import 'package:mission_5_wanderly/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TripProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
