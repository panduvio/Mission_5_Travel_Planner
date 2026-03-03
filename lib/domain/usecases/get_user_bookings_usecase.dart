import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/booking_repository.dart';

class GetUserBookingsUsecase {
  final BookingRepository repository;

  GetUserBookingsUsecase(this.repository);

  Future<List<BookingEntity>> getUserBookings(String uid) async {
    final bookings = await repository.getUserBookings(uid);
    return bookings;
  }
}
