import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final HeroIcons prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscure;
  final String? Function(String?)? validator;
  const CustomTextField({
    required this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.obscure = false,
    required this.label,
    required this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscure,
      decoration: InputDecoration(
        label: Text(label, style: AppTextStyles.labelMedium),
        hint: Text(hint, style: AppTextStyles.labelMedium),
        prefixIcon: HeroIcon(prefixIcon),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(AppRadius.utility),
        ),
      ),
    ).paddingSymmetrical(0, AppSpacing.m);
  }
}
