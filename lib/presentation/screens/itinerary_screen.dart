import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mission_5_wanderly/core/constants/app_radius.dart';
import 'package:mission_5_wanderly/core/constants/app_spacing.dart';
import 'package:mission_5_wanderly/core/extensions/alignment_extension.dart';
import 'package:mission_5_wanderly/core/extensions/padding_extension.dart';
import 'package:mission_5_wanderly/core/helpers/validator_helper.dart';
import 'package:mission_5_wanderly/core/themes/app_colors.dart';
import 'package:mission_5_wanderly/core/themes/app_text_styles.dart';
import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';
import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:mission_5_wanderly/presentation/providers/booking_notifier.dart';
import 'package:mission_5_wanderly/presentation/providers/itinerary_notifier.dart';
import 'package:mission_5_wanderly/presentation/providers/page_provider.dart';
import 'package:mission_5_wanderly/presentation/providers/user_notifier.dart';
import 'package:mission_5_wanderly/presentation/widgets/app_button.dart';
import 'package:mission_5_wanderly/presentation/widgets/custom_snackbar.dart';
import 'package:mission_5_wanderly/presentation/widgets/custom_text_field.dart';
import 'package:mission_5_wanderly/presentation/widgets/grid_card.dart';

class ItineraryScreen extends ConsumerStatefulWidget {
  // final int tripId;
  final String tripId;
  final bool isView;
  final String bookingId;
  const ItineraryScreen({
    super.key,
    required this.isView,
    required this.tripId,
    required this.bookingId,
  });

  @override
  ConsumerState<ItineraryScreen> createState() =>
      _ItineraryScreenState(isView, tripId, bookingId);
}

class _ItineraryScreenState extends ConsumerState<ItineraryScreen> {
  final bool isView;
  // final int tripId;
  final String tripId;
  final String _bookingId;
  _ItineraryScreenState(this.isView, this.tripId, this._bookingId);
  TextEditingController activityController = TextEditingController();
  DateTimeRange? bookingDateRange;
  DateTime? selectedActivityDate;
  String shownActivityDate = 'Pick a date';
  int? expandedIndex;

  final Map<String, HeroIcons> activitySet = {
    'Sightseeing': HeroIcons.camera,
    'Staycation': HeroIcons.buildingOffice,
    'Party': HeroIcons.cake,
    'Coffee': HeroIcons.buildingStorefront,
    'Movie': HeroIcons.film,
    'Shopping': HeroIcons.shoppingCart,
    'Learning': HeroIcons.bookOpen,
    'Art': HeroIcons.paintBrush,
    'Other': HeroIcons.rectangleGroup,
  };
  Future<void> _selectActivityDate(int index) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: bookingDateRange?.start ?? DateTime.now(),
      firstDate: bookingDateRange?.start ?? DateTime.now(),
      lastDate: bookingDateRange?.end ?? DateTime(2027),
    );

    if (pickedDate != null) {
      ref
          .read(itineraryNotifierProvider.notifier)
          .updateDate(index, pickedDate);
    }
  }

  Future<void> _selectBookingRange() async {
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
      initialDateRange: bookingDateRange,
    );

    if (range != null) {
      setState(() {
        bookingDateRange = range;
      });
    }
  }

  @override
  void dispose() {
    activityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(itineraryNotifierProvider.notifier)
          .initialize(widget.isView, widget.bookingId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final itineraries = ref.watch(itineraryNotifierProvider).itineraries;
    // final _bookingProvider = ref.read(bookingNotifierProvider.notifier);
    // final _itineraryProvider = ref.read(itineraryNotifierProvider.notifier);
    // final hotel = ref.watch(chosenHotelProvider);
    // final trip = ref.watch(tripListProvider)[tripId];
    final tripsAsync = ref.watch(tripsProvider);

    if (isView) {
      final _updateBooking = ref
          .read(bookingNotifierProvider)
          .bookings
          .firstWhere((booking) => booking.bookingId == _bookingId);
      bookingDateRange = DateTimeRange(
        start: _updateBooking.startDate,
        end: _updateBooking.endDate,
      );
    }

    final theme = Theme.of(context);
    final List<Map<String, dynamic>> gridItems = [
      {'icon': HeroIcons.camera, 'label': 'Sightseeing'},
      {'icon': HeroIcons.buildingOffice, 'label': 'Staycation'},
      {'icon': HeroIcons.cake, 'label': 'Party'},
      {'icon': HeroIcons.buildingStorefront, 'label': 'Coffee'},
      {'icon': HeroIcons.film, 'label': 'Movie'},
      {'icon': HeroIcons.shoppingCart, 'label': 'Shopping'},
      {'icon': HeroIcons.bookOpen, 'label': 'Learning'},
      {'icon': HeroIcons.paintBrush, 'label': 'Art'},
      {'icon': HeroIcons.rectangleGroup, 'label': 'Other'},
    ];

    return Scaffold(
      body: tripsAsync.when(
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),

        error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),

        data: (trips) {
          final trip = trips.firstWhere((t) => t.tripId == widget.tripId);

          final itineraries = ref.watch(itineraryNotifierProvider).itineraries;

          final bookingProvider = ref.read(bookingNotifierProvider.notifier);

          final itineraryProvider = ref.read(
            itineraryNotifierProvider.notifier,
          );

          final hotel = ref.watch(chosenHotelProvider);
          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => context.goNamed('home'),
                    child: HeroIcon(
                      HeroIcons.arrowLeftCircle,
                      color: AppColors.white,
                      size: 40,
                    ).paddingAll(AppSpacing.m),
                  ).withAlignment(Alignment.centerLeft),
                  Text('Add to Itinerary!', style: AppTextStyles.h1),
                  SizedBox(height: AppSpacing.m),
                  isView
                      ? SizedBox()
                      : Text('Pick a Date', style: AppTextStyles.labelLarge),
                  SizedBox(height: AppSpacing.xs),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          isView ? null : _selectBookingRange();
                        },
                        child: Row(
                          children: [
                            Text(
                              bookingDateRange != null
                                  ? '${bookingDateRange!.start.day}/${bookingDateRange!.start.month}/${bookingDateRange!.start.year}'
                                        ' - '
                                        '${bookingDateRange!.end.day}/${bookingDateRange!.end.month}/${bookingDateRange!.end.year}'
                                  : 'No date selected',
                              style: AppTextStyles.labelLarge.copyWith(
                                fontSize: 14,
                                color: theme.colorScheme.tertiary,
                              ),
                            ),
                            SizedBox(width: AppSpacing.xs),
                            HeroIcon(
                              HeroIcons.calendarDays,
                              size: 24,
                              color: theme.colorScheme.tertiary,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      AppButton(
                        content: isView ? 'Save' : 'Book Now!',
                        onTap: () {
                          final uid = ref
                              .read(userNotifierProvider)
                              .loginUser!
                              .uid;

                          if (!isView) {
                            final expenditure = trip.price + hotel!.price;

                            final booking = BookingEntity(
                              bookingId: _bookingId == 'new' ? '' : _bookingId,
                              userId: uid,
                              startDate: bookingDateRange!.start,
                              endDate: bookingDateRange!.end,
                              tripName: trip.tripName,
                              hotelName: hotel.hotelName,
                              expenditure: expenditure,
                              itineraries: itineraries,
                            );
                            bookingProvider.bookTrip(booking);
                            ref
                                .read(tripNotifierProvider.notifier)
                                .updateTrip(trip, true);
                            context.goNamed('home');
                          } else {
                            bookingProvider.updateTrip(
                              _bookingId,
                              uid,
                              itineraries,
                            );
                            context.goNamed(
                              'booking_detail',
                              pathParameters: {'id': _bookingId},
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: gridItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: AppSpacing.m,
                      crossAxisSpacing: AppSpacing.m,
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return GridCard(
                        icon: gridItems[index]['icon'],
                        label: gridItems[index]['label'],
                        onTap: () {
                          final validationMessage = ValidatorHelper.bookingDate(
                            bookingDateRange?.start,
                            bookingDateRange?.end,
                          );
                          if (validationMessage == null || isView) {
                            final addedItinerary = ItineraryEntity(
                              title: gridItems[index]['label'],
                              date:
                                  selectedActivityDate ??
                                  bookingDateRange!.start,
                            );
                            itineraryProvider.postItinerary(addedItinerary);
                            print('itinerary: ${itineraries.length}');
                            // itineraryProvider.postItinerary(tripId, itineraries);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              CustomSnackbar.show(
                                message: validationMessage,
                                icon: HeroIcons.exclamationCircle,
                                isError: true,
                              ),
                            );
                            print('test');
                          }
                        },
                      );
                    },
                  ).paddingAll(AppSpacing.s),
                  SizedBox(height: AppSpacing.m),
                  itineraries.isEmpty
                      ? SizedBox()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: itineraries.length,
                          itemBuilder: (context, index) {
                            return _activityTiles(
                              theme,
                              index,
                              itineraries,
                              () {
                                itineraryProvider.removeItinerary(index);
                              },
                            );
                          },
                        ),
                ],
              ).paddingAll(AppSpacing.xl),
            ),
          );
        },
      ),
    );
  }

  Widget _activityTiles(
    ThemeData theme,
    int index,
    List<ItineraryEntity> itineraries,
    Function() onRemove,
  ) {
    return ExpansionTile(
      key: ValueKey('$index-$expandedIndex'),
      onExpansionChanged: (value) => setState(() {
        expandedIndex = value ? index : null;
        activityController.clear();
      }),
      initiallyExpanded: expandedIndex == index,
      backgroundColor: theme.colorScheme.primary,
      collapsedBackgroundColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.colorScheme.tertiary),
        borderRadius: BorderRadiusGeometry.circular(AppRadius.card),
      ),
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide(color: theme.colorScheme.tertiary),
        borderRadius: BorderRadiusGeometry.circular(AppRadius.card),
      ),
      leading: HeroIcon(
        activitySet[itineraries[index].title]!,
        color: theme.colorScheme.tertiary,
      ),
      title: Text(
        '${itineraries[index].title} (${itineraries[index].date.day}/${itineraries[index].date.month}/${itineraries[index].date.year})',
        style: AppTextStyles.bodyLarge,
      ),
      subtitle: Text(itineraries[index].note ?? ''),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              _selectActivityDate(index);
            },
            child: HeroIcon(
              HeroIcons.calendarDays,
              color: theme.colorScheme.tertiary,
            ),
          ),
          SizedBox(width: AppSpacing.m),
          GestureDetector(
            onTap: onRemove,
            child: HeroIcon(HeroIcons.trash, color: theme.colorScheme.tertiary),
          ),
        ],
      ),
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: activityController,
                prefixIcon: HeroIcons.clipboardDocumentList,
                label: 'Note',
                hint: 'Add a note',
              ),
            ),
            SizedBox(width: AppSpacing.s),
            GestureDetector(
              onTap: () {
                setState(() {
                  itineraries[index].note = activityController.text;
                  activityController.clear();
                });
              },
              child: HeroIcon(
                HeroIcons.checkCircle,
                size: 40,
                color: AppColors.secretGarden,
              ),
            ),
          ],
        ).paddingAll(AppSpacing.m),
      ],
    ).paddingAll(AppSpacing.s);
  }
}
