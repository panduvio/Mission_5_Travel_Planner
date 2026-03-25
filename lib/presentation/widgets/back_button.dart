import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/extensions/theme_extension.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed('home'),
      child: HeroIcon(
        HeroIcons.arrowLeftCircle,
        color: context.colors.tertiary,
        size: 40,
      ),
    );
  }
}
