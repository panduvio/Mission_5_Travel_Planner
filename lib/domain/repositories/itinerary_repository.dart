import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';

abstract class ItineraryRepository {
  Future<void> addItineraries(int id, List<ItineraryEntity> itineraries);
  Future<void> deleteItineraries(int id);
  Future<List<ItineraryEntity>> getItineraries(int id);
}
