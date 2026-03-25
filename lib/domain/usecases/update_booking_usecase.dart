import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/booking_repository.dart';

class UpdateBookingUsecase {
  final BookingRepository repository;

  UpdateBookingUsecase(this.repository);

  Future<void> updateBooking(
    String bookingId,
    List<ItineraryEntity> itineraries,
  ) async {
    await repository.updateBooking(bookingId, itineraries);
  }
}
