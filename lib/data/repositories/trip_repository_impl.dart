import 'package:mission_5_wanderly/data/models/trip_model.dart';
import 'package:mission_5_wanderly/data/sources/trip_firestore.dart';
import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  final TripFirestore _firestore;

  TripRepositoryImpl(this._firestore);

  @override
  Stream<List<TripEntity>> getTrips() {
    final trips = _firestore.getTrips().map(
      (models) => models.map((e) => e.toEntity()).toList(),
    );
    return trips;
  }

  @override
  Future<void> postTrips(List<TripEntity> trips) async {
    final tripModel = trips.map((e) => TripModel.fromEntity(e)).toList();
    await _firestore.postTrips(tripModel);
  }

  @override
  Future<void> updateTrip(TripEntity trip) async {
    final tripModel = TripModel.fromEntity(trip);
    await _firestore.updateTrip(tripModel);
  }
}
