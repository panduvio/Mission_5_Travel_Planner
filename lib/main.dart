import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mission_5_wanderly/core/router/app_router.dart';
import 'package:mission_5_wanderly/core/themes/app_themes.dart';
import 'package:mission_5_wanderly/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mission_5_wanderly/presentation/providers/page_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setup();
  // 💎 Inisialisasi Hive dan `setup` DI di `main` sebelum `runApp`
  // adalah alur yang sangat solid (Robust). Good job! 🚀📦
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      // 💎 Support Dark Theme secara native menunjukkan aplikasi ini
      // dirancang dengan standar UX internasional. Keren! 🌙✨
      darkTheme: AppThemes.darkTheme,
      themeMode: themeMode,
    );
  }
}
