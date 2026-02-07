import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';

class ItineraryState {
  final List<ItineraryEntity> itineraries;
  final bool isLoading;
  final String? error;

  const ItineraryState({
    this.itineraries = const [],
    this.isLoading = false,
    this.error,
  });

  ItineraryState copyWith({
    List<ItineraryEntity>? itineraries,
    bool? isLoading,
    String? error,
  }) {
    return ItineraryState(
      itineraries: itineraries ?? this.itineraries,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
