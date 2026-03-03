import 'package:mission_5_wanderly/domain/repositories/booking_repository.dart';

class CancelTripUsecase {
  final BookingRepository repository;

  CancelTripUsecase(this.repository);

  Future<void> cancelTrip(String bookingId) async {
    await repository.cancelTrip(bookingId);
  }
}
