import 'package:mission_5_wanderly/data/models/booking_model.dart';
import 'package:mission_5_wanderly/data/sources/booking_firestore.dart';
import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingFirestore _firestore;

  BookingRepositoryImpl(this._firestore);

  @override
  Future<void> bookTrip(BookingEntity booking) async {
    final bookingModel = BookingModel.fromEntity(booking);
    await _firestore.bookTrip(bookingModel);
  }

  @override
  Future<void> updateTrip(BookingEntity booking) async {
    final bookingModel = BookingModel.fromEntity(booking);
    await _firestore.updateTrip(bookingModel);
  }

  @override
  Future<void> cancelTrip(String bookingId) async {
    await _firestore.cancelTrip(bookingId);
  }

  @override
  Future<List<BookingEntity>> getUserBookings(String uid) async {
    final bookingModelList = await _firestore.getUserBookings(uid);
    final bookings = bookingModelList.map((model) => model.toEntity()).toList();

    return bookings;
  }
}
