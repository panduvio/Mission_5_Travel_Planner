import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';

class TripState {
  final List<TripEntity>? trips;
  final bool isLoading;

  TripState({this.trips, this.isLoading = false});

  TripState copyWith(List<TripEntity>? trips, bool? isLoading) {
    return TripState(
      trips: trips ?? this.trips,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
