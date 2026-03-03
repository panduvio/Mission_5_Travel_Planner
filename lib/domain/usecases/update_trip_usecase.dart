import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/booking_repository.dart';

class UpdateTripUsecase {
  final BookingRepository repository;

  UpdateTripUsecase(this.repository);

  Future<void> updateTrip(BookingEntity booking) async {
    await repository.updateTrip(booking);
  }
}
