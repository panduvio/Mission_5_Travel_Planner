import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';

final tripListProvider = Provider<List<TripEntity>>((ref) {
  return tripList;
});
