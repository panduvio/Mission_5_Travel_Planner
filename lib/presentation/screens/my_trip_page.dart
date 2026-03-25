import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/extensions/theme_extension.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';
import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';
import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';
import 'package:mission_5_wanderly/presentation/providers/booking_notifier.dart';
import 'package:mission_5_wanderly/presentation/providers/page_provider.dart';
import 'package:mission_5_wanderly/presentation/providers/user_notifier.dart';
import 'package:mission_5_wanderly/presentation/widgets/trip_card.dart';

class MyTripPage extends ConsumerStatefulWidget {
  const MyTripPage({super.key});

  @override
  ConsumerState<MyTripPage> createState() => _MyTripPageState();
}

class _MyTripPageState extends ConsumerState<MyTripPage> {
  int selectedIndex = 0;

  final tabs = const ['Upcoming Trip', 'Ongoing Trip', 'Ended Trip'];

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final uid = ref.read(userNotifierProvider).loginUser!.uid;
      ref.read(bookingNotifierProvider.notifier).getUserBookings(uid);
      ref.read(bookingStatusFilterProvider.notifier).state =
          BookingStatus.upcoming;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredBookings = ref.watch(filteredBookingsProvider);
    final tripsAsync = ref.watch(tripsProvider);
    final status = ref.watch(bookingStatusFilterProvider);
    return tripsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),

      error: (e, _) => Center(child: Text('Error: $e')),

      data: (trips) {
        return Stack(
          children: [
            filteredBookings.isEmpty
                ? _emptyBookingWidget(status)
                : _listViewWidget(filteredBookings, trips).paddingTBRL(
                    100,
                    AppSpacing.xl,
                    AppSpacing.xl,
                    AppSpacing.xl,
                  ),
            _floatingTabWidget(context),
          ],
        );
      },
    );
  }

  Widget _listViewWidget(
    List<BookingEntity> filteredBookings,
    List<TripEntity> trips,
  ) {
    // final trips = ref.read(tripListProvider);
    return ListView.builder(
      itemCount: filteredBookings.length,
      itemBuilder: (context, index) {
        final trip = trips.firstWhere(
          (_trip) => _trip.tripName == filteredBookings[index].tripName,
        );
        return GestureDetector(
          onTap: () => context.goNamed(
            'booking_detail',
            pathParameters: {'id': filteredBookings[index].bookingId},
          ),
          child: TripCard(
            tripName: trip.tripName,
            image: trip.image,
            country: trip.country,
            city: trip.city,
          ).paddingSymmetrical(0, AppSpacing.m),
        );
      },
    );
  }

  Widget _emptyBookingWidget(BookingStatus status) {
    return Center(
      child: Text(
        'You don\'t have any ${status.name} trip',
        style: AppTextStyles.bodyLarge,
      ),
    );
  }

  Widget _floatingTabWidget(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(AppSpacing.xl),
        padding: EdgeInsets.all(AppSpacing.xs),
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.round),
          color: context.colors.primary,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final tabWidth =
                (constraints.maxWidth - (AppSpacing.s * 2)) / tabs.length;

            return Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: selectedIndex * (tabWidth + AppSpacing.s),
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: tabWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.round),
                      color: context.colors.secondary,
                    ),
                  ),
                ),
                Row(
                  children: List.generate(tabs.length, (index) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          switch (selectedIndex) {
                            case 0:
                              ref
                                  .read(bookingStatusFilterProvider.notifier)
                                  .state = BookingStatus
                                  .upcoming;
                            case 1:
                              ref
                                  .read(bookingStatusFilterProvider.notifier)
                                  .state = BookingStatus
                                  .ongoing;
                            case 2:
                              ref
                                  .read(bookingStatusFilterProvider.notifier)
                                  .state = BookingStatus
                                  .ended;
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 250),
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? context.colors.tertiary
                                  : context.colors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                            child: Text(tabs[index]),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
