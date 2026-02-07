import 'package:mission_5_wanderly/data/sources/itinerary_hive.dart';
import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:mission_5_wanderly/domain/repositories/itinerary_repository.dart';

class ItineraryRepositoryImpl implements ItineraryRepository {
  final ItineraryHive hive;

  ItineraryRepositoryImpl(this.hive);

  @override
  Future<void> addItineraries(int id, List<ItineraryEntity> itineraries) async {
    await hive.addItineraries(id, itineraries);
  }

  @override
  Future<void> deleteItineraries(int id) async {
    await hive.deleteItineraries(id);
  }

  @override
  Future<List<ItineraryEntity>> getItineraries(int id) async {
    final itineraries = await hive.getItineraries(id);
    return itineraries;
  }
}
