import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mission_5_wanderly/data/models/booking_model.dart';
import 'package:mission_5_wanderly/data/models/itinerary_model.dart';

abstract class BookingFirestore {
  Future<void> bookTrip(BookingModel booking);
  Future<void> updateTrip(String bookingId, List<ItineraryModel> itineraries);
  Future<void> cancelTrip(String bookingId);
  Future<List<BookingModel>> getUserBookings(String uid);
}

class BookingFirestoreImpl implements BookingFirestore {
  final FirebaseFirestore _db;

  BookingFirestoreImpl(this._db);

  final String _collection = 'bookings';

  @override
  Future<void> bookTrip(BookingModel booking) async {
    try {
      final docRef = _db.collection(_collection).doc();
      await docRef.set(booking.copyWith(bookingId: docRef.id).toJson());
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> updateTrip(
    String bookingId,
    List<ItineraryModel> itineraries,
  ) async {
    try {
      await _db.collection(_collection).doc(bookingId)
        ..update({
          'itineraries': itineraries.map((item) => item.toJson()).toList(),
        });
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> cancelTrip(String bookingId) async {
    try {
      await _db.collection(_collection).doc(bookingId).delete();
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<List<BookingModel>> getUserBookings(String uid) async {
    try {
      final snapshot = await _db
          .collection('bookings')
          .where('userId', isEqualTo: uid)
          .get();

      final bookings = snapshot.docs.map((doc) {
        return BookingModel.fromSnapshot(doc);
      }).toList();

      return bookings;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
