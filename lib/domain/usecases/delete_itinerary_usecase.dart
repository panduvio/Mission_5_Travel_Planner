import 'package:mission_5_wanderly/domain/repositories/itinerary_repository.dart';

class DeleteItineraryUsecase {
  final ItineraryRepository repository;

  DeleteItineraryUsecase(this.repository);

  Future<void> deleteItinerary(int id) async {
    await repository.deleteItineraries(id);
  }
}
