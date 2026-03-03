import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/alignment_extension.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';
import 'package:mission_5_wanderly/presentation/providers/booking_notifier.dart';
import 'package:mission_5_wanderly/presentation/widgets/activity_timeline.dart';
import 'package:mission_5_wanderly/presentation/widgets/back_button.dart';

class BookingDetailScreen extends ConsumerStatefulWidget {
  final String bookingId;
  const BookingDetailScreen({super.key, required this.bookingId});

  @override
  ConsumerState<BookingDetailScreen> createState() =>
      _BookingDetailScreen(this.bookingId);
}

class _BookingDetailScreen extends ConsumerState<BookingDetailScreen> {
  final bookingId;
  _BookingDetailScreen(this.bookingId);

  @override
  Widget build(BuildContext context) {
    final booking = ref
        .read(bookingNotifierProvider)
        .bookings
        .firstWhere((booking) => booking.bookingId == bookingId);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomBackButton().withAlignment(Alignment.centerLeft),

                  SizedBox(width: AppSpacing.xs),
                  Text('Trip Detail', style: AppTextStyles.h2),
                ],
              ),
              SizedBox(height: AppSpacing.m),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: booking.itineraries.length,
                itemBuilder: (context, index) {
                  return ActivityTimeline(index: index);
                },
              ),
            ],
          ).paddingAll(AppSpacing.xl),
        ),
      ),
    );
  }
}
