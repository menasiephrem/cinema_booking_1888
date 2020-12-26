import 'package:cinema_booking_1888/services/movie_services.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupFinder() {
  locator.registerLazySingleton(() => MovieServices());
}