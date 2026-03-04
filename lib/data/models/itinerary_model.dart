import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';

part 'itinerary_model.g.dart';

@JsonSerializable()
class ItineraryModel {
  final String title;
  @JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp)
  final DateTime date;
  String? note;

  ItineraryModel({required this.title, required this.date, this.note});

  static DateTime _fromTimestamp(Timestamp timestamp) => timestamp.toDate();

  static Timestamp _toTimestamp(DateTime date) => Timestamp.fromDate(date);

  factory ItineraryModel.fromJson(Map<String, dynamic> json) =>
      _$ItineraryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItineraryModelToJson(this);

  ItineraryEntity toEntity() {
    return ItineraryEntity(title: title, date: date, note: note);
  }

  factory ItineraryModel.fromEntity(ItineraryEntity itinerary) {
    return ItineraryModel(
      title: itinerary.title,
      date: itinerary.date,
      note: itinerary.note,
    );
  }
}
