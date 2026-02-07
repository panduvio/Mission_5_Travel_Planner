import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/itinerary_repository.dart';

class GetItinerariesUsecase {
  final ItineraryRepository repository;

  GetItinerariesUsecase(this.repository);

  Future<List<ItineraryEntity>> getItineraries(int id) async {
    final itineraries = await repository.getItineraries(id);
    return itineraries;
  }
}
