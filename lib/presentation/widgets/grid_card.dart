import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/themes/app_colors.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';

class GridCard extends StatelessWidget {
  final HeroIcons icon;
  final String? label;
  final Function() onTap;
  GridCard({required this.icon, required this.onTap, this.label, super.key});

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: isSelected ? AppColors.secretGarden : theme.colorScheme.primary,
      borderRadius: BorderRadius.circular(AppRadius.card),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        onLongPress: () => isSelected = true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeroIcon(icon, size: 40, color: theme.colorScheme.tertiary),
            SizedBox(height: AppSpacing.xs),
            Text(
              label ?? '',
              style: AppTextStyles.labelMedium.copyWith(
                color: theme.colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
