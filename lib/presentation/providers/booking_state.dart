import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';

class BookingState {
  final List<BookingEntity> bookings;
  final bool isLoading;
  final String? error;

  const BookingState({
    this.bookings = const [],
    this.isLoading = false,
    this.error,
  });

  BookingState copyWith({
    List<BookingEntity>? bookings,
    bool? isLoading,
    String? error,
  }) {
    return BookingState(
      bookings: bookings ?? this.bookings,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
