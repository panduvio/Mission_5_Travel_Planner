class HotelEntity {
  final String city;
  final String image;
  final String hotelName;
  final double rating;
  final int price;

  HotelEntity({
    required this.city,
    required this.image,
    required this.hotelName,
    required this.rating,
    required this.price,
  });
}

List<HotelEntity> hotelList = [
  HotelEntity(
    city: 'Yogyakarta',
    image: 'assets/hotels/phoenix_hotel.jpg',
    hotelName: 'The Phoenix Hotel Yogyakarta',
    rating: 4.8,
    price: 1450000,
  ),
  HotelEntity(
    city: 'Yogyakarta',
    image: 'assets/hotels/adhistana_hotel.jpg',
    hotelName: 'Adhisthana Hotel Yogyakarta',
    rating: 4.3,
    price: 520000,
  ),
  HotelEntity(
    city: 'Beijing',
    image: 'assets/hotels/rosewood_hotel.jpg',
    hotelName: 'Rosewood Beijing',
    rating: 4.7,
    price: 4800000,
  ),
  HotelEntity(
    city: 'Beijing',
    image: 'assets/hotels/waldorf_hotel.jpg',
    hotelName: 'Waldorf Astoria Beijing',
    rating: 4.8,
    price: 5600000,
  ),
  HotelEntity(
    city: 'Tromsø',
    image: 'assets/hotels/clarion_hotel.jpg',
    hotelName: 'Clarion Hotel The Edge',
    rating: 4.3,
    price: 2600000,
  ),
  HotelEntity(
    city: 'Tromsø',
    image: 'assets/hotels/radisson_blu_hotel.jpg',
    hotelName: 'Radisson Blu Hotel Tromsø',
    rating: 4.4,
    price: 2350000,
  ),
  HotelEntity(
    city: 'Tromsø',
    image: 'assets/hotels/scandic_ishavshotel.jpg',
    hotelName: 'Scandic Ishavshotel',
    rating: 4.8,
    price: 2800000,
  ),
  HotelEntity(
    city: 'Tromsø',
    image: 'assets/hotels/smarthotel.jpg',
    hotelName: 'Smarthotel Tromsø',
    rating: 4.1,
    price: 1450000,
  ),
  HotelEntity(
    city: 'Kyoto',
    image: 'assets/hotels/granvia_hotel.jpg',
    hotelName: 'Hotel Granvia Kyoto',
    rating: 4.5,
    price: 2900000,
  ),
  HotelEntity(
    city: 'Kyoto',
    image: 'assets/hotels/royal_park_hotel.jpg',
    hotelName: 'The Royal Park Hotel Sanjo',
    rating: 4.3,
    price: 1850000,
  ),
  HotelEntity(
    city: 'Santorini',
    image: 'assets/hotels/katikies_santorini.jpg',
    hotelName: 'The Royal Park Hotel Sanjo',
    rating: 4.7,
    price: 4500000,
  ),
  HotelEntity(
    city: 'Santorini',
    image: 'assets/hotels/aressana_hotel.jpg',
    hotelName: 'Aressana Spa Hotel & Suites',
    rating: 4.6,
    price: 3100000,
  ),
  HotelEntity(
    city: 'Serengiti',
    image: 'assets/hotels/four_seasons_safari_lodge.jpg',
    hotelName: 'Four Seasons Safari Lodge Serengeti',
    rating: 4.8,
    price: 12500000,
  ),
  HotelEntity(
    city: 'Serengiti',
    image: 'assets/hotels/melia_serengiti_lodge.jpg',
    hotelName: 'Meliá Serengeti Lodge',
    rating: 4.6,
    price: 9200000,
  ),
  HotelEntity(
    city: 'El Calafate',
    image: 'assets/hotels/xelena_hotel.jpg',
    hotelName: 'Xelena Hotel & Suites',
    rating: 4.4,
    price: 3900000,
  ),
  HotelEntity(
    city: 'El Calafate',
    image: 'assets/hotels/esplendor_hotel.jpg',
    hotelName: 'Esplendor by Wyndham El Calafate',
    rating: 4.3,
    price: 2700000,
  ),
];
