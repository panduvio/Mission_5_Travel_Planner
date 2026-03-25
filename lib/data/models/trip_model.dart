import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';

part 'trip_model.g.dart';

@JsonSerializable()
class TripModel {
  @JsonKey(includeFromJson: false)
  final String tripId;

  final String tripName;
  final String image;
  final String detail;
  final String country;
  final String city;
  final int visitor;
  final int price;
  final double rating;
  final double lat;
  final double long;
  final bool isBooked;

  TripModel({
    this.tripId = '',
    required this.tripName,
    required this.image,
    required this.detail,
    required this.country,
    required this.city,
    required this.visitor,
    required this.price,
    required this.rating,
    required this.lat,
    required this.long,
    this.isBooked = false,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);

  Map<String, dynamic> toJson() => _$TripModelToJson(this);

  factory TripModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    print('from snapshot:  ${snapshot.id}');

    return TripModel(
      tripId: snapshot.id,
      tripName: data['tripName'],
      image: data['image'],
      detail: data['detail'],
      country: data['country'],
      city: data['city'],
      visitor: data['visitor'],
      price: data['price'],
      rating: (data['rating'] as num).toDouble(),
      lat: (data['lat'] as num).toDouble(),
      long: (data['long'] as num).toDouble(),
      isBooked: data['isBooked'] ?? false,
    );
  }

  TripEntity toEntity() {
    return TripEntity(
      tripId: tripId,
      tripName: tripName,
      image: image,
      detail: detail,
      country: country,
      city: city,
      visitor: visitor,
      price: price,
      rating: rating,
      lat: lat,
      long: long,
    );
  }

  factory TripModel.fromEntity(TripEntity trip) {
    return TripModel(
      tripName: trip.tripName,
      image: trip.image,
      detail: trip.detail,
      country: trip.country,
      city: trip.city,
      visitor: trip.visitor,
      price: trip.price,
      rating: trip.rating,
      lat: trip.lat,
      long: trip.long,
      tripId: trip.tripId,
    );
  }

  TripModel copyWith({
    String? tripId,
    String? tripName,
    String? image,
    String? detail,
    String? country,
    String? city,
    int? visitor,
    int? price,
    double? rating,
    double? lat,
    double? long,
    bool? isBooked,
  }) {
    return TripModel(
      tripName: tripName ?? this.tripName,
      image: image ?? this.image,
      detail: detail ?? this.detail,
      country: country ?? this.country,
      city: city ?? this.city,
      visitor: visitor ?? this.visitor,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      tripId: tripId ?? this.tripId,
    );
  }
}
