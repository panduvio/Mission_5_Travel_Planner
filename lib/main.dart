import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mission_5_wanderly/core/router/app_router.dart';
import 'package:mission_5_wanderly/core/themes/app_themes.dart';
import 'package:mission_5_wanderly/dependency_injection.dart';
import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:mission_5_wanderly/domain/entities/user_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ItineraryEntityAdapter());
  Hive.registerAdapter(UserEntityAdapter());

  final itineraryBox = await Hive.openBox<List>('itineraries');
  final userBox = await Hive.openBox<UserEntity>('users');

  setup(itineraryBox, userBox);
  // 💎 Inisialisasi Hive dan `setup` DI di `main` sebelum `runApp` 
  // adalah alur yang sangat solid (Robust). Good job! 🚀📦
  runApp(ProviderScope(child: const MyApp()));
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
      // 💎 Support Dark Theme secara native menunjukkan aplikasi ini 
      // dirancang dengan standar UX internasional. Keren! 🌙✨
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
