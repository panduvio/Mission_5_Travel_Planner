import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mission_5_wanderly/data/models/trip_model.dart';

abstract class TripFirestore {
  Future<void> postTrips(List<TripModel> trips);
  Future<void> updateTrip(TripModel trip);
  Stream<List<TripModel>> getTrips();
}

class TripFirestoreImpl implements TripFirestore {
  final FirebaseFirestore _db;

  TripFirestoreImpl(this._db);

  final String _collection = 'trips';
  @override
  Future<void> postTrips(List<TripModel> trips) async {
    try {
      for (TripModel trip in trips) {
        final docRef = _db.collection(_collection).doc();
        await docRef.set(trip.toJson());
      }
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> updateTrip(TripModel trip) async {
    try {
      final docRef = _db.collection(_collection).doc(trip.tripId);
      await docRef.set(trip.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Stream<List<TripModel>> getTrips() {
    return _db.collection(_collection).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return TripModel.fromSnapshot(doc);
      }).toList();
    });
  }
}
