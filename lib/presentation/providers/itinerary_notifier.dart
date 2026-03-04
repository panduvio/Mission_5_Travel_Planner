import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:mission_5_wanderly/presentation/providers/booking_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mission_5_wanderly/presentation/providers/itinerary_state.dart';

part 'itinerary_notifier.g.dart';

@riverpod
// 💎 `ItineraryNotifier` dengan boilerplate Riverpod Generator ini sangat
// up-to-date dengan Flutter industry standards. Skalabilitasnya mantap! 🔋🏗️
class ItineraryNotifier extends _$ItineraryNotifier {
  @override
  ItineraryState build() => const ItineraryState();

  void initialize(bool isView, String bookingId) {
    if (isView && bookingId.isNotEmpty) {
      final booking = ref
          .read(bookingNotifierProvider)
          .bookings
          .firstWhere((b) => b.bookingId == bookingId);

      state = state.copyWith(
        itineraries: [...booking.itineraries],
        isLoading: false,
      );
    } else {
      state = state.copyWith(itineraries: [], isLoading: false);
    }
  }

  void postItinerary(ItineraryEntity itinerary) {
    final newList = [...state.itineraries, itinerary]
      ..sort((a, b) => a.date.compareTo(b.date));

    state = state.copyWith(itineraries: newList, isLoading: false);
  }

  void removeItinerary(int index) {
    final newList = [...state.itineraries];
    if (index >= 0 && index < newList.length) {
      newList.removeAt(index);
      state = state.copyWith(itineraries: newList);
    }
  }

  void updateDate(int index, DateTime newDate) {
    final newList = [...state.itineraries];
    if (index >= 0 && index < newList.length) {
      newList[index] = newList[index].copyWith(date: newDate);

      newList.sort((a, b) => a.date.compareTo(b.date));

      state = state.copyWith(itineraries: newList);
    }
  }
}
