import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/booking_repository.dart';

class BookTripUsecase {
  final BookingRepository repository;

  BookTripUsecase(this.repository);

  Future<void> bookTrip(BookingEntity booking) async {
    await repository.bookTrip(booking);
  }
}
