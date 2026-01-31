import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';

class TripCard extends StatelessWidget {
  final String tripName;
  final String image;
  final String country;
  final String city;
  const TripCard({
    required this.tripName,
    required this.image,
    required this.country,
    required this.city,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(AppSpacing.s),
      height: 100,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.card),
        color: theme.colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(image, fit: BoxFit.fitWidth),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screen.width * 0.3,
                child: Text(
                  tripName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyMedium,
                ),
              ),
              SizedBox(height: AppSpacing.xs),
              Text(city + ', ' + country, style: AppTextStyles.bodySmall),
            ],
          ),
          HeroIcon(HeroIcons.arrowRightCircle),
        ],
      ),
    );
  }
}
