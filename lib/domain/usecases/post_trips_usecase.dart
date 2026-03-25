import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/trip_repository.dart';

class PostTripsUsecase {
  final TripRepository repository;

  PostTripsUsecase(this.repository);

  Future<void> postTrips(List<TripEntity> trips) async {
    await repository.postTrips(trips);
  }
}
