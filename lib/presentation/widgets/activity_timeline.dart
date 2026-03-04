import 'package:flutter/material.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/alignment_extension.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/extensions/theme_extension.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';
import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';

class ActivityTimeline extends StatelessWidget {
  final int index;
  final bool isLast;
  final ItineraryEntity itinerary;
  const ActivityTimeline({
    super.key,
    required this.index,
    required this.isLast,
    required this.itinerary,
  });

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
              isLast
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
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(itinerary.title, style: AppTextStyles.bodyLarge),
                      Text(
                        ' (${itinerary.date.day}/${itinerary.date.month}/${itinerary.date.year})',
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                  children: [
                    Text(itinerary.note ?? '', style: AppTextStyles.bodyMedium)
                        .withAlignment(Alignment.centerLeft)
                        .paddingTBRL(0, AppSpacing.s, 0, AppSpacing.s),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
