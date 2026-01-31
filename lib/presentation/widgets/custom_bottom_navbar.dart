import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/themes/app_colors.dart';

class CustomBottomNavbar extends StatelessWidget {
  final GlobalKey<CurvedNavigationBarState> bottomNavKey;
  final int bottomNavIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavbar({
    super.key,
    required this.bottomNavKey,
    required this.bottomNavIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Widget> itemList = [
      HeroIcon(
        HeroIcons.home,
        color: bottomNavIndex == 0
            ? theme.buttonTheme.colorScheme?.onSecondary
            : AppColors.white,
        style: bottomNavIndex == 0
            ? HeroIconStyle.solid
            : HeroIconStyle.outline,
      ),
      HeroIcon(
        HeroIcons.magnifyingGlass,
        color: bottomNavIndex == 1
            ? theme.buttonTheme.colorScheme?.onSecondary
            : AppColors.white,
        style: bottomNavIndex == 1
            ? HeroIconStyle.solid
            : HeroIconStyle.outline,
      ),
      HeroIcon(
        HeroIcons.paperAirplane,
        color: bottomNavIndex == 2
            ? theme.buttonTheme.colorScheme?.onSecondary
            : AppColors.white,
        style: bottomNavIndex == 2
            ? HeroIconStyle.solid
            : HeroIconStyle.outline,
      ),
      HeroIcon(
        HeroIcons.user,
        color: bottomNavIndex == 3
            ? theme.buttonTheme.colorScheme?.onSecondary
            : AppColors.white,
        style: bottomNavIndex == 3
            ? HeroIconStyle.solid
            : HeroIconStyle.outline,
      ),
    ];

    return CurvedNavigationBar(
      key: bottomNavKey,
      index: bottomNavIndex,
      items: itemList,
      color: theme.colorScheme.primary,
      buttonBackgroundColor: theme.colorScheme.tertiary,
      backgroundColor: AppColors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: onTap,
      letIndexChange: (index) => true,
    );
  }
}
