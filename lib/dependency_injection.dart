import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mission_5_wanderly/data/repositories/itinerary_repository_impl.dart';
import 'package:mission_5_wanderly/data/repositories/user_repository_impl.dart';
import 'package:mission_5_wanderly/data/sources/itinerary_hive.dart';
import 'package:mission_5_wanderly/data/sources/user_hive.dart';
import 'package:mission_5_wanderly/domain/repositories/itinerary_repository.dart';
import 'package:mission_5_wanderly/domain/repositories/user_repository.dart';
import 'package:mission_5_wanderly/domain/usecases/add_itinerary_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/delete_itinerary_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/get_itineraries_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/get_user_by_email_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/login_usecase.dart';
import 'package:mission_5_wanderly/domain/usecases/signup_usecase.dart';

final sl = GetIt.instance;

void setup(Box<List> itineraryBox, Box userBox) {
  // HIVE
  sl.registerLazySingleton<Box<List>>(() => itineraryBox);
  sl.registerLazySingleton<Box>(() => userBox);

  sl.registerLazySingleton<ItineraryHive>(() => ItineraryHive(sl()));
  sl.registerLazySingleton<UserHive>(() => UserHive(sl()));

  // Repositories
  sl.registerLazySingleton<ItineraryRepository>(
    () => ItineraryRepositoryImpl(sl()),
  );
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
  sl.registerLazySingleton<GetUserByEmailUsecase>(
    () => GetUserByEmailUsecase(sl()),
  );
  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(sl()));
  sl.registerLazySingleton<SignupUsecase>(() => SignupUsecase(sl()));
}
