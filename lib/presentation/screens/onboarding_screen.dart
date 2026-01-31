import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            SizedBox(
              height: screen.height * 0.2,
              child: Image.asset('assets/wanderly_icon.png'),
            ),
            Spacer(),
            Container(
              height: screen.height * 0.4,
              width: screen.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppRadius.round),
                ),
                color: theme.colorScheme.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Explore The World Effortlessly',
                    style: AppTextStyles.h2,
                  ),
                  SizedBox(height: AppSpacing.xl),
                  GestureDetector(
                    onTap: () => context.goNamed('login'),
                    child: HeroIcon(HeroIcons.arrowRightCircle, size: 70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
