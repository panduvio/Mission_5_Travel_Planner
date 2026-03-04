import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';

class TripFilterHelper {
  static List<TripEntity> apply({
    required List<TripEntity> trips,
    required String query,
    required bool isAscending,
  }) {
    List<TripEntity> filtered = trips.where((trip) {
      final name = trip.tripName.toLowerCase();
      final city = trip.city.toLowerCase();
      final search = query.toLowerCase();
      return name.contains(search) || city.contains(search);
    }).toList();

    filtered.sort((a, b) {
      return isAscending
          ? a.tripName.compareTo(b.tripName)
          : b.tripName.compareTo(a.tripName);
    });

    return filtered;
  }
}
