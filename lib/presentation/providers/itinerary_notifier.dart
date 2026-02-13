import 'package:get_it/get_it.dart';
import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:mission_5_wanderly/domain/usecases/add_itinerary_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/delete_itinerary_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/get_itineraries_usecase.dart';
import 'package:mission_5_wanderly/presentation/providers/itinerary_state.dart';

part 'itinerary_notifier.g.dart';

@riverpod
// 💎 `ItineraryNotifier` dengan boilerplate Riverpod Generator ini sangat 
// up-to-date dengan Flutter industry standards. Skalabilitasnya mantap! 🔋🏗️
class ItineraryNotifier extends _$ItineraryNotifier {
  final _getItineraries = GetIt.I<GetItinerariesUsecase>();
  final _addItinerary = GetIt.I<AddItineraryUsecase>();
  final _deleteItinerary = GetIt.I<DeleteItineraryUsecase>();

  @override
  ItineraryState build() {
    return const ItineraryState();
  }

  Future<void> loadItineraries(int id) async {
    state = state.copyWith(isLoading: true);

    try {
      final itineraries = await _getItineraries.getItineraries(id);
      state = state.copyWith(itineraries: itineraries, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> postItinerary(int id, List<ItineraryEntity> itineraries) async {
    state = state.copyWith(isLoading: true);

    try {
      await _addItinerary.addItineraries(id, itineraries);
      await loadItineraries(id);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> removeItinerary(int id) async {
    state = state.copyWith(isLoading: true);

    try {
      await _deleteItinerary.deleteItinerary(id);
      await loadItineraries(id);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
