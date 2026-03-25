import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';

abstract class TripRepository {
  Stream<List<TripEntity>> getTrips();
  Future<void> postTrips(List<TripEntity> trips);
  Future<void> updateTrip(TripEntity trip);
}
