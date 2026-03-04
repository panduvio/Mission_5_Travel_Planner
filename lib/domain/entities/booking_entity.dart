import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';

enum BookingStatus { ended, ongoing, upcoming }

class BookingEntity {
  final String bookingId;
  final String userId;
  final DateTime startDate;
  final DateTime endDate;
  final String tripName;
  final String hotelName;
  final int expenditure;
  final List<ItineraryEntity> itineraries;

  BookingEntity({
    required this.bookingId,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.tripName,
    required this.hotelName,
    required this.expenditure,
    required this.itineraries,
  });

  BookingStatus get status {
    final now = DateTime.now();
    if (endDate.isBefore(now)) return BookingStatus.ended;
    if (startDate.isAfter(now)) return BookingStatus.upcoming;
    return BookingStatus.ongoing;
  }

  BookingEntity copyWith({
    String? bookingId,
    String? userId,
    DateTime? startDate,
    DateTime? endDate,
    String? tripName,
    String? hotelName,
    int? expenditure,
    int? status,
    List<ItineraryEntity>? itineraries,
  }) {
    return BookingEntity(
      bookingId: bookingId ?? this.bookingId,
      userId: userId ?? this.userId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      tripName: tripName ?? this.tripName,
      hotelName: hotelName ?? this.hotelName,
      expenditure: expenditure ?? this.expenditure,
      itineraries: itineraries ?? this.itineraries,
    );
  }
}
