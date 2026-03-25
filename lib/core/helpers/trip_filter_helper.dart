import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';

class TripFilterHelper {
  static List<TripEntity> filterByQuery({
    required List<TripEntity> trips,
    required String query,
  }) {
    final search = query.toLowerCase();

    return trips.where((trip) {
      final name = trip.tripName.toLowerCase();
      final city = trip.city.toLowerCase();
      return name.contains(search) || city.contains(search);
    }).toList();
  }

  static List<TripEntity> sortByName({
    required List<TripEntity> trips,
    required bool isAscending,
  }) {
    final sorted = List<TripEntity>.from(trips);

    sorted.sort((a, b) {
      return isAscending
          ? a.tripName.compareTo(b.tripName)
          : b.tripName.compareTo(a.tripName);
    });

    return sorted;
  }

  static List<TripEntity> sortByRating({
    required List<TripEntity> trips,
    required bool isAscending,
  }) {
    final sorted = List<TripEntity>.from(trips);

    sorted.sort((a, b) {
      return isAscending
          ? a.rating.compareTo(b.rating)
          : b.rating.compareTo(a.rating);
    });

    return sorted;
  }

  static List<TripEntity> sortByVisitors({
    required List<TripEntity> trips,
    required bool isAscending,
  }) {
    final sorted = List<TripEntity>.from(trips);

    sorted.sort((a, b) {
      return isAscending
          ? a.visitor.compareTo(b.visitor)
          : b.visitor.compareTo(a.visitor);
    });

    return sorted;
  }
}
