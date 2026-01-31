import 'package:heroicons/heroicons.dart';

class ItineraryEntity {
  final String title;
  final DateTime date;
  final HeroIcons icon;
  String? note;

  ItineraryEntity({
    required this.title,
    required this.date,
    this.note = '',
    required this.icon,
  });
}
