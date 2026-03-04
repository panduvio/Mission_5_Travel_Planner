// 💎 `ItineraryEntity` yang dianotasi `@HiveType` di layer Domain adalah
// cara praktis untuk menjaga data persistence tetap terintegrasi! 🛡️📅
class ItineraryEntity {
  final String title;
  final DateTime date;
  String? note;

  ItineraryEntity({required this.title, required this.date, this.note});

  ItineraryEntity copyWith({String? title, DateTime? date, String? note}) {
    return ItineraryEntity(
      title: title ?? this.title,
      date: date ?? this.date,
      note: note ?? '',
    );
  }
}
