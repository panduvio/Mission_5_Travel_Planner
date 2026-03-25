class TripEntity {
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

  TripEntity({
    required this.tripId,
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
}

// List<TripEntity> tripList = [
//   TripEntity(
//     tripName: 'Vintage Town n Folks',
//     image: 'assets/trips/jogja.jpg',
//     detail:
//         'Experience the charm of Yogyakarta (Jogja) on a journey where culture, history, and natural beauty blend effortlessly. This trip invites travelers to explore iconic landmarks such as Borobudur and Prambanan Temples, stroll through the vibrant atmosphere of Malioboro Street, and witness the timeless traditions of the Yogyakarta Palace (Keraton). Each destination offers a glimpse into Jogja’s deep cultural roots and warm local hospitality.\n Beyond its cultural heart, Jogja also captivates with scenic adventures—from the dramatic landscapes of Mount Merapi to the tranquil beaches along the southern coast. Combined with authentic local cuisine and thoughtfully arranged accommodations and transport, this trip is designed to provide a comfortable, enriching, and unforgettable travel experience, making Yogyakarta a perfect destination for leisure, education, or cultural exploration.',
//     country: 'Indonesia',
//     city: 'Yogyakarta',
//     visitor: 23013,
//     rating: 9.3,
//     price: 370000,
//     lat: -7.80139,
//     long: 110.36472,
//   ),
//   TripEntity(
//     tripName: 'Heaven of Crane and Serenity',
//     image: 'assets/trips/beijing.jpg',

//     detail:
//         'Discover the timeless grandeur of Beijing, a city where ancient heritage meets modern dynamism. This journey takes travelers through world-renowned landmarks such as the Great Wall of China, the majestic Forbidden City, and the historic Temple of Heaven, offering deep insight into China’s imperial past. Stroll along traditional hutong neighborhoods, experience the lively atmosphere of local markets, and witness the city’s unique blend of tradition and innovation.\n Complementing its rich history, Beijing also offers a vibrant culinary scene and impressive modern architecture, from authentic Peking duck dining experiences to the striking skyline around Olympic Park. With carefully curated itineraries, comfortable accommodations, and seamless transportation, this trip ensures a well-balanced, memorable experience for travelers seeking culture, history, and a true taste of China’s capital.',
//     country: 'China',
//     city: 'Beijing',
//     visitor: 79901,
//     rating: 4.8,
//     price: 5989000,
//     lat: 39.9042,
//     long: 116.4074,
//   ),
//   TripEntity(
//     tripName: 'Aurora Dreams in the Arctic Sky',
//     image: 'assets/trips/tromso.jpg',
//     detail:
//         'Experience the breathtaking beauty of Northern Europe with an unforgettable journey to Tromsø. Known as one of the best places on Earth to witness the Northern Lights, this trip offers guided aurora hunting tours, Arctic fjord cruises, and thrilling dog sledding adventures. Explore the Arctic Cathedral, learn about Sami culture, and enjoy the peaceful charm of snow-covered landscapes. \nPerfect for winter lovers and adventure seekers, this package combines natural wonder with cozy Scandinavian hospitality for a magical polar escape.',
//     country: 'Norway',
//     city: 'Tromsø',
//     visitor: 454210,
//     rating: 9.2,
//     price: 18750000,
//     lat: 69.6492,
//     long: 18.9553,
//   ),
//   TripEntity(
//     tripName: 'Sakura Harmony Escape',
//     image: 'assets/trips/kyoto.jpg',
//     detail:
//         'Immerse yourself in the delicate beauty of cherry blossom season in Kyoto. Visit historic temples such as Kiyomizu-dera, stroll through the iconic Arashiyama Bamboo Grove, and participate in a traditional tea ceremony. The city’s preserved wooden machiya houses and serene Zen gardens offer a glimpse into Japan’s refined cultural heritage.\n This journey balances historical exploration with culinary delights—from authentic kaiseki dining to vibrant Nishiki Market street food experiences.',
//     country: 'Japan',
//     city: 'Kyoto',
//     visitor: 120340,
//     rating: 9.5,
//     price: 14200000,
//     lat: 35.0116,
//     long: 135.7681,
//   ),
//   TripEntity(
//     tripName: 'Mediterranean Soul of Santorini',
//     image: 'assets/trips/santorini.jpg',
//     detail:
//         'Unwind in the romantic landscapes of Santorini, where whitewashed buildings meet the deep blue Aegean Sea. Watch legendary sunsets in Oia, relax on volcanic black sand beaches, and explore ancient ruins like Akrotiri.\n This trip offers a mix of luxury relaxation and cultural immersion, complete with wine tasting tours, cliffside dining, and island hopping adventures. Ideal for honeymooners and leisure travelers seeking picturesque beauty.',
//     country: 'Greece',
//     city: 'Santorini',
//     visitor: 98560,
//     rating: 9.3,
//     price: 16890000,
//     lat: 36.3932,
//     long: 25.4615,
//   ),
//   TripEntity(
//     tripName: 'Safari Majesty of the Serengeti',
//     image: 'assets/trips/serengeti.jpg',
//     detail:
//         'Embark on a once-in-a-lifetime African safari adventure across the vast plains of the Serengeti. Witness the Great Migration, observe lions, elephants, and giraffes in their natural habitat, and enjoy guided game drives led by experienced rangers.\n Luxury tented camps allow you to stay close to nature while enjoying modern comforts. This immersive wildlife experience offers stunning sunsets, star-filled skies, and authentic cultural encounters with local Maasai communities.',
//     country: 'Tanzania',
//     city: 'Serengiti',
//     visitor: 67340,
//     rating: 9.7,
//     price: 32500000,
//     lat: -2.3333,
//     long: 34.8333,
//   ),
//   TripEntity(
//     tripName: 'Patagonian Peaks and Glaciers Expedition',
//     image: 'assets/trips/calafate.jpg',
//     detail:
//         'Discover the raw beauty of Patagonia in southern Argentina. Explore the dramatic peaks of Mount Fitz Roy, trek across Los Glaciares National Park, and marvel at the stunning Perito Moreno Glacier.\n Adventure enthusiasts can enjoy hiking, glacier trekking, and boat excursions across turquoise lakes. This journey blends rugged outdoor exploration with charming small-town hospitality in El Calafate.',
//     country: 'Argentina',
//     city: 'El Calafate',
//     visitor: 38950,
//     rating: 9.4,
//     price: 21400000,
//     lat: -50.3379,
//     long: -72.2648,
//   ),
// ];
