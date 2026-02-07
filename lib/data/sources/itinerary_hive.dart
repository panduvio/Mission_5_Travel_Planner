import 'package:hive/hive.dart';
import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';

class ItineraryHive {
  final Box<List> box;

  ItineraryHive(this.box);

  Future<List<ItineraryEntity>> getItineraries(int id) async {
    final itineraries = (box.get(id) ?? []).cast<ItineraryEntity>();
    return itineraries;
  }

  Future<void> addItineraries(int id, List<ItineraryEntity> itineraries) async {
    await box.put(id, itineraries);
  }

  Future<void> deleteItineraries(int id) async {
    await box.delete(id);
  }
}
