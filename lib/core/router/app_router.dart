import 'package:go_router/go_router.dart';
import 'package:mission_5_wanderly/presentation/screens/itinerary_screen.dart';
import 'package:mission_5_wanderly/presentation/screens/home_screen.dart';
import 'package:mission_5_wanderly/presentation/screens/login_screen.dart';
import 'package:mission_5_wanderly/presentation/screens/onboarding_screen.dart';
import 'package:mission_5_wanderly/presentation/screens/trip_detail_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (_, __) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: '/trip_detail/:id',
        name: 'trip_detail',
        builder: (context, state) {
          final int id = int.parse(state.pathParameters['id']!);
          return TripDetailScreen(tripId: id);
        },
      ),
      GoRoute(
        path: '/itinerary/:is_view',
        name: 'itinerary',
        builder: (context, state) {
          final bool isView = state.pathParameters['is_view']! == 'true';
          return ItineraryScreen(isView: isView);
        },
      ),
    ],
  );
}
