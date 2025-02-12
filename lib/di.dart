import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tentwentyassesment/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:tentwentyassesment/features/movies/domain/usecases/search_movies_usecase.dart';

import 'common/network/dio_client.dart';
import 'features/movies/domain/repositories/movie_repository.dart';
import 'features/user/data/datasources/user_remote_data_source.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/domain/repositories/user_repository.dart';
import 'features/user/domain/usecases/create_user_usecase.dart';
import 'features/user/domain/usecases/delete_user_usecase.dart';
import 'features/user/domain/usecases/get_users_usecase.dart';
import 'features/user/domain/usecases/update_user_usecase.dart';
import 'features/user/presentation/controllers/user_controller.dart';

final getIt = GetIt.instance;

Future<void> initDependency() async {
  //UserController
  getIt.registerFactory(
    () => UserController(
      getUsersUseCase: getIt<GetUsersUseCase>(),
      createUserUseCase: getIt<CreateUserUseCase>(),
      updateUserUseCase: getIt<UpdateUserUseCase>(),
      deleteUserUseCase: getIt<DeleteUserUseCase>(),
    ),
  );

  // User Use cases
  getIt.registerLazySingleton(() => GetUsersUseCase(getIt<UserRepository>()));
  getIt.registerLazySingleton(() => CreateUserUseCase(getIt<UserRepository>()));
  getIt.registerLazySingleton(() => UpdateUserUseCase(getIt<UserRepository>()));
  getIt.registerLazySingleton(() => DeleteUserUseCase(getIt<UserRepository>()));

  // movie use cases
  getIt.registerLazySingleton(() => MovieSearchUseCase(getIt<MovieRepository>()));

  // User repository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: getIt()),
  );

  // Movie repository
  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRemoteDataSourceImpl(dio: getIt<DioClient>()),
  );

  // User remote data sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(dioClient: getIt<DioClient>()),
  );

  //Dio
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));
  getIt.registerLazySingleton<Dio>(() => Dio());
}
