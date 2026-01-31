import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/themes/app_colors.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';

class CustomSnackbar {
  static SnackBar show({
    required String message,
    required HeroIcons icon,
    bool isError = false,
  }) {
    return SnackBar(
      content: Row(
        children: [
          HeroIcon(
            icon,
            size: 20,
            color: isError
                ? AppColors.glowingBrakeDisc
                : AppColors.secretGarden,
          ),
          SizedBox(width: AppSpacing.s),
          Text(
            message,
            style: AppTextStyles.bodyMedium.copyWith(
              color: isError
                  ? AppColors.glowingBrakeDisc
                  : AppColors.secretGarden,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
      backgroundColor: isError
          ? AppColors.glowingBrakeDisc.withAlpha(50)
          : AppColors.secretGarden.withAlpha(50),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isError ? AppColors.glowingBrakeDisc : AppColors.secretGarden,
        ),
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      margin: EdgeInsets.all(AppSpacing.m),
    );
  }
}
