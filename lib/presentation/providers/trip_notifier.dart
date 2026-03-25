import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mission_5_wanderly/data/models/trip_model.dart';
import 'package:mission_5_wanderly/dependency_injection.dart';
import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';
import 'package:mission_5_wanderly/domain/usecases/post_trips_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/update_trip_usecase.dart';
import 'package:mission_5_wanderly/presentation/providers/trip_state.dart';

class TripNotifier extends StateNotifier<TripState> {
  TripNotifier() : super(TripState());

  Future<void> postTrips(List<TripEntity> trips) async {
    await sl<PostTripsUsecase>().postTrips(trips);
  }

  Future<void> updateTrip(TripEntity trip, bool isBooked) async {
    final _trip = TripModel.fromEntity(trip)
        .copyWith(visitor: isBooked ? trip.visitor + 1 : trip.visitor - 1)
        .toEntity();
    await sl<UpdateTripUsecase>().updateTrip(_trip);
  }
}
