import 'package:mission_5_wanderly/presentation/providers/booking_notifier.dart';
import 'package:mission_5_wanderly/presentation/providers/page_provider.dart';
import 'package:mission_5_wanderly/presentation/providers/user_notifier.dart';
import 'package:mission_5_wanderly/presentation/screens/home_page.dart';
import 'package:mission_5_wanderly/presentation/screens/explore_page.dart';
import 'package:mission_5_wanderly/presentation/screens/my_trip_page.dart';
import 'package:mission_5_wanderly/presentation/screens/profile_page.dart';
import 'package:mission_5_wanderly/presentation/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<CurvedNavigationBarState> bottomNavKey = GlobalKey();

  final List<Widget> _pages = [
    HomePage(),
    ExplorePage(),
    MyTripPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final uid = ref.read(userNotifierProvider).loginUser!.uid;
      ref.read(bookingNotifierProvider.notifier).getUserBookings(uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomNavbar(
        bottomNavKey: bottomNavKey,
        bottomNavIndex: bottomNavIndex,
        onTap: (value) {
          ref.read(bottomNavIndexProvider.notifier).state = value;
        },
      ),
      body: _pages[bottomNavIndex],
    );
  }
}
