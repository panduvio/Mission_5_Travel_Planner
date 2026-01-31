import 'package:flutter/material.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/extensions/alignment_extension.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/themes/app_colors.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final String content;
  final Function() onTap;
  final bool isOutline;
  final bool isLarge;
  final Color? borderColor;
  final Color? buttonColor;
  final Color? contentColor;
  const AppButton({
    required this.content,
    this.isOutline = false,
    this.isLarge = false,
    this.borderColor,
    this.buttonColor,
    this.contentColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: OutlineInputBorder(
        borderSide: isOutline
            ? BorderSide(
                width: 1.5,
                color: borderColor ?? theme.buttonTheme.colorScheme!.primary,
              )
            : BorderSide.none,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      color: isOutline
          ? AppColors.transparent
          : (buttonColor ?? theme.colorScheme.primary),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.card),
        onTap: onTap,
        child: SizedBox(
          height: isLarge ? 50 : null,
          width: isLarge ? 100 : null,
          child: Text(
            content,
            style: isLarge
                ? AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: contentColor ?? theme.textTheme.bodyMedium?.color,
                  )
                : AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: contentColor ?? theme.textTheme.bodyMedium?.color,
                  ),
          ).paddingSymmetrical(12, 8).withAlignment(Alignment.center),
        ),
      ),
    );
  }
}
