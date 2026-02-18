import 'package:hive/hive.dart';

part 'itinerary_entity.g.dart';

@HiveType(typeId: 1)
// 💎 `ItineraryEntity` yang dianotasi `@HiveType` di layer Domain adalah 
// cara praktis untuk menjaga data persistence tetap terintegrasi! 🛡️📅
class ItineraryEntity {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  String? note;

  ItineraryEntity({required this.title, required this.date, this.note});
}
