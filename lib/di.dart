import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tentwentyassesment/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:tentwentyassesment/features/movies/domain/usecases/search_genre_movies_usecase.dart';
import 'package:tentwentyassesment/features/movies/domain/usecases/search_movies_usecase.dart';

import 'common/controllers/app_controller.dart';
import 'common/network/dio_client.dart';
import 'features/movies/domain/repositories/movie_repository.dart';
import 'features/movies/domain/usecases/get_genres_usecase.dart';
import 'features/movies/domain/usecases/get_movie_details_use_case.dart';
import 'features/movies/domain/usecases/get_trailer_usercase.dart';
import 'features/movies/domain/usecases/get_upcomming_movies_usecase.dart';
import 'features/movies/presentation/controllers/upcomming_movies_controller.dart';

final getIt = GetIt.instance;

Future<void> initDependency() async {
  // Global controller
  Get.lazyPut(() => AppController());
  Get.lazyPut(()=>UpcomingMoviesController(getIt<GetUpcomingMoviesUseCase>()));

  // movie use cases
  getIt.registerLazySingleton(() => SearchMoviesUseCase(getIt<MovieRepository>()));
  getIt.registerLazySingleton(() => SearchGenreMoviesUseCase(getIt<MovieRepository>()));
  getIt.registerLazySingleton(() => GetGenresUseCase(getIt<MovieRepository>()));
  getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt<MovieRepository>()));
  getIt.registerLazySingleton(() => GetUpcomingMoviesUseCase(getIt<MovieRepository>()));
  getIt.registerLazySingleton(() => GetTrailerUserCase(getIt<MovieRepository>()));


  // Movie repository
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(client: getIt<DioClient>()));

  //Dio
  getIt.registerLazySingleton<DioClient>(() => DioClient());
}
