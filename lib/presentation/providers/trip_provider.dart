import 'package:flutter/material.dart';
import 'package:mission_5_wanderly/domain/entities/itinerary_entity.dart';
import 'package:mission_5_wanderly/domain/entities/trip_entity.dart';

class TripProvider extends ChangeNotifier {
  final List<TripEntity> _trips = tripList;
  List<ItineraryEntity> _itineraries = [];

  List<TripEntity> get trips => _trips;
  List<ItineraryEntity> get itineraries => _itineraries;

  void setItineraries(List<ItineraryEntity> itineraries) {
    _itineraries = itineraries;
    notifyListeners();
  }
}
