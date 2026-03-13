import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mission_5_wanderly/core/helpers/trip_filter_helper.dart';
import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';
import 'package:mission_5_wanderly/domain/entities/hotel_entity.dart';
import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';
import 'package:mission_5_wanderly/presentation/providers/booking_notifier.dart';

enum TripSortType { name, rating, visitors }

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

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

final tripSortTypeProvider = StateProvider<TripSortType>((ref) {
  return TripSortType.name;
});

final tripSortAscendingProvider = StateProvider<bool>((ref) => true);

final filteredTripsProvider = Provider<List<TripEntity>>((ref) {
  final trips = ref.watch(tripListProvider);
  final query = ref.watch(tripSearchProvider);
  final sortType = ref.watch(tripSortTypeProvider);
  final isAscending = ref.watch(tripSortAscendingProvider);

  var result = TripFilterHelper.filterByQuery(trips: trips, query: query);

  switch (sortType) {
    case TripSortType.name:
      result = TripFilterHelper.sortByName(
        trips: result,
        isAscending: isAscending,
      );
      break;

    case TripSortType.rating:
      result = TripFilterHelper.sortByRating(
        trips: result,
        isAscending: isAscending,
      );
      break;

    case TripSortType.visitors:
      result = TripFilterHelper.sortByVisitors(
        trips: result,
        isAscending: isAscending,
      );
      break;
  }

  return result;
});

final themeToggleProvider = StateProvider<int>((ref) => 0);

final themeModeProvider = Provider<ThemeMode>((ref) {
  final toggle = ref.watch(themeToggleProvider);

  if (toggle == 0) {
    return ThemeMode.dark;
  } else {
    return ThemeMode.light;
  }
});
