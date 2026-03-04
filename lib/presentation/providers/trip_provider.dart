import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mission_5_wanderly/core/helpers/trip_filter_helper.dart';
import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';
import 'package:mission_5_wanderly/domain/entities/hotel_entity.dart';
import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';
import 'package:mission_5_wanderly/presentation/providers/booking_notifier.dart';

final tripListProvider = Provider<List<TripEntity>>((ref) {
  return tripList;
});
final itineraryProvider = StateProvider<List<ItineraryEntity>>((ref) {
  return [];
});

final bookingStatusFilterProvider = StateProvider<BookingStatus>((ref) {
  return BookingStatus.upcoming;
});

final filteredBookingsProvider = Provider<List<BookingEntity>>((ref) {
  final bookingState = ref.watch(bookingNotifierProvider);
  final selectedStatus = ref.watch(bookingStatusFilterProvider);

  final bookings = bookingState.bookings;

  return bookings.where((booking) => booking.status == selectedStatus).toList();
});

final hotelListProvider = Provider<List<HotelEntity>>((ref) {
  return hotelList;
});

final filteredHotelProvider = Provider.family<List<HotelEntity>, String>((
  ref,
  city,
) {
  final hotels = ref.watch(hotelListProvider);
  return hotels.where((hotel) => hotel.city == city).toList();
});

final chosenHotelProvider = StateProvider<HotelEntity?>((ref) => null);

final tripSearchProvider = StateProvider<String>((ref) => "");

final tripSortAscendingProvider = StateProvider<bool>((ref) => true);

final filteredTripsProvider = Provider<List<TripEntity>>((ref) {
  final allTrips = ref.watch(tripListProvider);
  final query = ref.watch(tripSearchProvider);
  final isAscending = ref.watch(tripSortAscendingProvider);

  return TripFilterHelper.apply(
    trips: allTrips,
    query: query,
    isAscending: isAscending,
  );
});
