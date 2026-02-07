import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/itinerary_repository.dart';

class AddItineraryUsecase {
  final ItineraryRepository repository;

  AddItineraryUsecase(this.repository);

  Future<void> addItineraries(int id, List<ItineraryEntity> itineraries) async {
    await repository.addItineraries(id, itineraries);
  }
}
