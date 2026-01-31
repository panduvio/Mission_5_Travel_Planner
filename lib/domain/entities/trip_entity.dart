class TripEntity {
  final String tripName;
  final String image;
  final String detail;
  final String country;
  final String city;
  final int visitor;
  final bool isBooked;
  final double rating;
  final double price;

  TripEntity({
    required this.tripName,
    required this.image,
    required this.detail,
    required this.country,
    required this.city,
    required this.visitor,
    required this.rating,
    required this.price,
    this.isBooked = false,
  });
}

List<TripEntity> tripList = [
  TripEntity(
    tripName: 'Vintage Town n Folks',
    image: 'assets/jogja.jpg',
    detail:
        'Experience the charm of Yogyakarta (Jogja) on a journey where culture, history, and natural beauty blend effortlessly. This trip invites travelers to explore iconic landmarks such as Borobudur and Prambanan Temples, stroll through the vibrant atmosphere of Malioboro Street, and witness the timeless traditions of the Yogyakarta Palace (Keraton). Each destination offers a glimpse into Jogja’s deep cultural roots and warm local hospitality.\n Beyond its cultural heart, Jogja also captivates with scenic adventures—from the dramatic landscapes of Mount Merapi to the tranquil beaches along the southern coast. Combined with authentic local cuisine and thoughtfully arranged accommodations and transport, this trip is designed to provide a comfortable, enriching, and unforgettable travel experience, making Yogyakarta a perfect destination for leisure, education, or cultural exploration.',
    country: 'Indonesia',
    city: 'Yogyakarta',
    visitor: 23013,
    rating: 4.3,
    price: 370000,
  ),
  TripEntity(
    tripName: 'Heaven of Crane and Serenity',
    image: 'assets/explore_card.jpg',

    detail:
        'Discover the timeless grandeur of Beijing, a city where ancient heritage meets modern dynamism. This journey takes travelers through world-renowned landmarks such as the Great Wall of China, the majestic Forbidden City, and the historic Temple of Heaven, offering deep insight into China’s imperial past. Stroll along traditional hutong neighborhoods, experience the lively atmosphere of local markets, and witness the city’s unique blend of tradition and innovation.\n Complementing its rich history, Beijing also offers a vibrant culinary scene and impressive modern architecture, from authentic Peking duck dining experiences to the striking skyline around Olympic Park. With carefully curated itineraries, comfortable accommodations, and seamless transportation, this trip ensures a well-balanced, memorable experience for travelers seeking culture, history, and a true taste of China’s capital.',
    country: 'China',
    city: 'Beijing',
    visitor: 79901,
    rating: 4.8,
    price: 5989000,
  ),
];
