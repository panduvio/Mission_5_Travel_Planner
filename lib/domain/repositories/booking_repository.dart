import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';
import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';

abstract class BookingRepository {
  Future<void> bookTrip(BookingEntity booking);
  Future<void> updateBooking(
    String bookingId,
    List<ItineraryEntity> itineraries,
  );
  Future<void> cancelTrip(String bookingId);
  Future<List<BookingEntity>> getUserBookings(String uid);
}
