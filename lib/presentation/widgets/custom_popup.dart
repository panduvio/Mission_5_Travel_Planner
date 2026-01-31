import 'package:flutter/material.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/themes/app_colors.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';

class CustomPopup extends StatelessWidget {
  final Widget content;
  final String message;
  final bool isError;
  const CustomPopup({
    required this.content,
    required this.message,
    this.isError = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          content,
          SizedBox(height: AppSpacing.m),
          Text(
            message,
            style: isError
                ? AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.glowingBrakeDisc,
                  )
                : AppTextStyles.bodyLarge,
          ),
        ],
      ),
    );
  }
}
