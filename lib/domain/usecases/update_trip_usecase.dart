import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/booking_repository.dart';

class UpdateTripUsecase {
  final BookingRepository repository;

  UpdateTripUsecase(this.repository);

  Future<void> updateTrip(
    String bookingId,
    List<ItineraryEntity> itineraries,
  ) async {
    await repository.updateTrip(bookingId, itineraries);
  }
}
