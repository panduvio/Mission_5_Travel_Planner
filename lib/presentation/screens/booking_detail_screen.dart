import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/alignment_extension.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/extensions/theme_extension.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';
import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';
import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';
import 'package:mission_5_wanderly/presentation/providers/booking_notifier.dart';
import 'package:mission_5_wanderly/presentation/providers/page_provider.dart';
import 'package:mission_5_wanderly/presentation/providers/user_notifier.dart';
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

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // final booking = ref
    //     .read(bookingNotifierProvider)
    //     .bookings
    //     .firstWhere((booking) => booking.bookingId == bookingId);
    final tripsAsync = ref.watch(tripsProvider);
    return tripsAsync.when(
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => Text('Error: $e'),
      data: (trips) {
        final booking = ref
            .read(bookingNotifierProvider)
            .bookings
            .firstWhere((b) => b.bookingId == bookingId);

        final trip = trips.firstWhere(
          (t) => t.tripName == booking.tripName,
          orElse: () => throw Exception('Trip not found'),
        );
        return Scaffold(
          floatingActionButton: _buildExpandableFab(booking, trip),
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
                      final isLast = index == booking.itineraries.length - 1;
                      return ActivityTimeline(
                        index: index,
                        isLast: isLast,
                        itinerary: booking.itineraries[index],
                      );
                    },
                  ),
                ],
              ).paddingAll(AppSpacing.xl),
            ),
          ),
        );
      },
    );
  }

  Widget _buildExpandableFab(BookingEntity booking, TripEntity trip) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildFabItem(
          show: _isExpanded,
          icon: HeroIcons.pencilSquare,
          label: "Update Itinerary",
          onTap: () {
            context.goNamed(
              'itinerary',
              pathParameters: {
                'is_view': true.toString(),
                'id': '0',
                'booking_id': bookingId,
              },
            );
          },
          delay: 0.1,
        ),
        SizedBox(height: AppSpacing.s),

        _buildFabItem(
          show: _isExpanded,
          icon: HeroIcons.trash,
          label: "Cancel Trip",
          color: Colors.redAccent,
          onTap: () {
            final uid = ref.read(userNotifierProvider).loginUser!.uid;
            ref
                .read(bookingNotifierProvider.notifier)
                .cancelTrip(bookingId, uid);
            ref.read(tripNotifierProvider.notifier).updateTrip(trip, false);
            context.goNamed('home');
          },
          delay: 0.0,
        ),
        SizedBox(height: AppSpacing.s),

        FloatingActionButton(
          backgroundColor: context.colors.primary,
          onPressed: () => setState(() => _isExpanded = !_isExpanded),
          child: AnimatedRotation(
            duration: const Duration(milliseconds: 300),
            turns: _isExpanded ? 0.125 : 0,
            child: HeroIcon(
              _isExpanded ? HeroIcons.xMark : HeroIcons.plus,
              color: context.colors.tertiary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFabItem({
    required bool show,
    required HeroIcons icon,
    required String label,
    required VoidCallback onTap,
    Color? color,
    required double delay,
  }) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: show ? 1 : 0,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: show ? 1 : 0,
        curve: Curves.easeOutBack,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(label, style: AppTextStyles.bodySmall),
              ),
            ),
            SizedBox(width: AppSpacing.s),
            FloatingActionButton.small(
              heroTag: label, // Unique tag for each FAB
              backgroundColor: color ?? context.colors.primary,
              onPressed: onTap,
              child: HeroIcon(icon, color: context.colors.tertiary),
            ),
          ],
        ),
      ),
    );
  }
}
