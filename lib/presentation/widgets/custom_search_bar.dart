import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback onLeadingPressed;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.round),
        color: theme.colorScheme.primary,
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: onLeadingPressed,
            icon: const HeroIcon(HeroIcons.bars3BottomLeft),
          ),
          suffixIcon: const HeroIcon(HeroIcons.magnifyingGlass).paddingAll(12),
          hintText: 'Search for trip',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    ).paddingAll(4);
  }
}
