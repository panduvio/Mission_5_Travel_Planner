import 'package:flutter/material.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/media_query_extension.dart';
import 'package:mission_5_wanderly/core/extensions/theme_extension.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';

class ActivityTimeline extends StatelessWidget {
  final int index;
  const ActivityTimeline({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.tertiary,
                ),
              ),
              index == 2
                  ? SizedBox()
                  : Expanded(
                      child: Container(
                        width: 1,
                        color: context.colors.tertiary,
                      ),
                    ),
            ],
          ),
          SizedBox(width: AppSpacing.m),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: AppSpacing.s),
              padding: EdgeInsets.only(left: AppSpacing.xs),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.card),
                color: context.colors.tertiary,
              ),
              child: Container(
                margin: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  color: context.colors.secondary,
                ),
                child: ExpansionTile(
                  shape: OutlineInputBorder(borderSide: BorderSide.none),
                  title: Text('title', style: AppTextStyles.bodyLarge),
                  children: [Text('notes', style: AppTextStyles.bodyMedium)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
