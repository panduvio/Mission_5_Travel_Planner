import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  List<Widget> onboardingContent(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return [
      Spacer(),
      SizedBox(
        height: screen.width >= 600 ? screen.width * 0.2 : screen.height * 0.2,
        child: Image.asset('assets/wanderly_icon.png'),
      ),
      Spacer(),
      Container(
        height: screen.width >= 600 ? screen.height : screen.height * 0.4,
        width: screen.width >= 600 ? screen.width * 0.5 : screen.width,
        decoration: BoxDecoration(
          borderRadius: screen.width >= 600
              ? BorderRadius.horizontal(left: Radius.circular(AppRadius.round))
              : BorderRadius.vertical(top: Radius.circular(AppRadius.round)),
          color: theme.colorScheme.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Explore The World Effortlessly', style: AppTextStyles.h2),
            SizedBox(height: AppSpacing.xl),
            GestureDetector(
              onTap: () => context.goNamed('login'),
              child: HeroIcon(HeroIcons.arrowRightCircle, size: 70),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.landscape
                ? Row(children: onboardingContent(context))
                : Column(children: onboardingContent(context));
          },
        ),
      ),
    );
  }
}
