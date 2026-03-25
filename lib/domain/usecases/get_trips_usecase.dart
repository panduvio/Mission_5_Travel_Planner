import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/trip_repository.dart';

class GetTripsUsecase {
  final TripRepository repository;

  GetTripsUsecase(this.repository);

  Stream<List<TripEntity>> getTrips() {
    final trips = repository.getTrips();
    return trips;
  }
}
