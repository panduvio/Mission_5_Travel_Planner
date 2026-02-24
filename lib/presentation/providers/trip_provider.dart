import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';

final tripListProvider = Provider<List<TripEntity>>((ref) {
  //{Inline Review: Data trip masih static list; pertimbangkan repository/provider persistence agar scalable.}
  return tripList;
});
