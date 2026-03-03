import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mission_5_wanderly/data/repositories/auth_repository_impl.dart';
import 'package:mission_5_wanderly/data/repositories/booking_repository_impl.dart';
import 'package:mission_5_wanderly/data/repositories/itinerary_repository_impl.dart';
import 'package:mission_5_wanderly/data/repositories/user_repository_impl.dart';
import 'package:mission_5_wanderly/data/sources/auth_firebase.dart';
import 'package:mission_5_wanderly/data/sources/booking_firestore.dart';
import 'package:mission_5_wanderly/data/sources/itinerary_hive.dart';
import 'package:mission_5_wanderly/data/sources/user_firestore.dart';
import 'package:mission_5_wanderly/domain/repositories/auth_repository.dart';
import 'package:mission_5_wanderly/domain/repositories/booking_repository.dart';
import 'package:mission_5_wanderly/domain/repositories/itinerary_repository.dart';
import 'package:mission_5_wanderly/domain/repositories/user_repository.dart';
import 'package:mission_5_wanderly/domain/usecases/add_itinerary_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/book_trip_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/cancel_trip_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/delete_itinerary_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/get_itineraries_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/get_user_bookings_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/get_user_by_id_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/update_trip_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/user_login_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/user_register_usecase.dart';

// 💎 Penggunaan `sl` (Service Locator) via `GetIt` adalah standar industri
// untuk Clean Architecture. Memisahkan dependency dari UI sangat pro! 🏗️✨
final sl = GetIt.instance;

void setup(Box<List> itineraryBox) {
  // HIVE
  sl.registerLazySingleton<Box<List>>(() => itineraryBox);

  sl.registerLazySingleton<ItineraryHive>(() => ItineraryHive(sl()));

  // Firebase
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<AuthFirebase>(() => AuthFirebaseImpl(sl()));
  sl.registerLazySingleton<UserFirestore>(() => UserFirestoreImpl(sl()));
  sl.registerLazySingleton<BookingFirestore>(() => BookingFirestoreImpl(sl()));

  // Repositories
  sl.registerLazySingleton<ItineraryRepository>(
    () => ItineraryRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<BookingRepository>(
    () => BookingRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // Usecases
  sl.registerLazySingleton<AddItineraryUsecase>(
    () => AddItineraryUsecase(sl()),
  );
  sl.registerLazySingleton<GetItinerariesUsecase>(
    () => GetItinerariesUsecase(sl()),
  );
  sl.registerLazySingleton<DeleteItineraryUsecase>(
    () => DeleteItineraryUsecase(sl()),
  );
  // 💎 Pendaftaran Use Cases sebagai LazySingleton memastikan efisiensi memori
  // di dalam aplikasi. Mantap! 🛡️🎯
  sl.registerLazySingleton<UserLoginUsecase>(
    () => UserLoginUsecase(sl(), sl()),
  );
  sl.registerLazySingleton<UserRegisterUsecase>(
    () => UserRegisterUsecase(sl(), sl()),
  );
  sl.registerLazySingleton<GetUserByIdUsecase>(() => GetUserByIdUsecase(sl()));
  sl.registerLazySingleton<BookTripUsecase>(() => BookTripUsecase(sl()));
  sl.registerLazySingleton<UpdateTripUsecase>(() => UpdateTripUsecase(sl()));
  sl.registerLazySingleton<CancelTripUsecase>(() => CancelTripUsecase(sl()));
  sl.registerLazySingleton<GetUserBookingsUsecase>(
    () => GetUserBookingsUsecase(sl()),
  );
}
