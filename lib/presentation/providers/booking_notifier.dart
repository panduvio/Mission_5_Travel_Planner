import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';
import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:mission_5_wanderly/domain/usecases/book_trip_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/cancel_trip_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/get_user_bookings_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/update_trip_usecase.dart';
import 'package:mission_5_wanderly/presentation/providers/booking_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'booking_notifier.g.dart';

@riverpod
class BookingNotifier extends _$BookingNotifier {
  final _getUserBookings = GetIt.I<GetUserBookingsUsecase>();
  final _bookTrip = GetIt.I<BookTripUsecase>();
  final _updateTrip = GetIt.I<UpdateTripUsecase>();
  final _cancelTrip = GetIt.I<CancelTripUsecase>();

  @override
  BookingState build() {
    return const BookingState();
  }

  Future<void> getUserBookings(String uid) async {
    state = state.copyWith(isLoading: true);

    try {
      final bookings = await _getUserBookings.getUserBookings(uid);
      state = state.copyWith(bookings: bookings, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> bookTrip(BookingEntity booking) async {
    state = state.copyWith(isLoading: true);

    try {
      await _bookTrip.bookTrip(booking);
      await getUserBookings(booking.userId);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> updateTrip(
    String bookingId,
    String userId,
    List<ItineraryEntity> itineraries,
  ) async {
    state = state.copyWith(isLoading: true);

    try {
      await _updateTrip.updateTrip(bookingId, itineraries);
      await getUserBookings(userId);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> cancelTrip(String bookingId, String uid) async {
    state = state.copyWith(isLoading: true);

    try {
      await _cancelTrip.cancelTrip(bookingId);
      await getUserBookings(uid);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
