import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';

abstract class BookingRepository {
  Future<void> bookTrip(BookingEntity booking);
  Future<void> updateTrip(BookingEntity booking);
  Future<void> cancelTrip(String bookingId);
  Future<List<BookingEntity>> getUserBookings(String uid);
}
