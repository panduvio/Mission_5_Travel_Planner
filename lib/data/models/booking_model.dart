import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mission_5_wanderly/data/models/itinerary_model.dart';
import 'package:mission_5_wanderly/domain/entities/booking_entity.dart';

part 'booking_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BookingModel {
  final String bookingId;
  final String userId;

  @JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp)
  final DateTime startDate;

  @JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp)
  final DateTime endDate;

  final String tripName;
  final String hotelName;
  final int expenditure;
  final List<ItineraryModel> itineraries;

  BookingModel({
    required this.bookingId,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.tripName,
    required this.hotelName,
    required this.expenditure,
    required this.itineraries,
  });

  static DateTime _fromTimestamp(Timestamp timestamp) => timestamp.toDate();
  static Timestamp _toTimestamp(DateTime datetime) =>
      Timestamp.fromDate(datetime);

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);

  factory BookingModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return BookingModel.fromJson(data).copyWith(bookingId: snapshot.id);
  }

  BookingEntity toEntity() {
    return BookingEntity(
      bookingId: bookingId,
      userId: userId,
      startDate: startDate,
      endDate: endDate,
      tripName: tripName,
      hotelName: hotelName,
      expenditure: expenditure,
      itineraries: itineraries.map((e) => e.toEntity()).toList(),
    );
  }

  factory BookingModel.fromEntity(BookingEntity booking) {
    return BookingModel(
      bookingId: booking.bookingId,
      userId: booking.userId,
      startDate: booking.startDate,
      endDate: booking.endDate,
      tripName: booking.tripName,
      hotelName: booking.hotelName,
      expenditure: booking.expenditure,
      itineraries: booking.itineraries
          .map((e) => ItineraryModel.fromEntity(e))
          .toList(),
    );
  }

  BookingModel copyWith({
    String? bookingId,
    String? userId,
    DateTime? startDate,
    DateTime? endDate,
    String? tripName,
    String? hotelName,
    int? expenditure,
    List<ItineraryModel>? itineraries,
  }) {
    return BookingModel(
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
