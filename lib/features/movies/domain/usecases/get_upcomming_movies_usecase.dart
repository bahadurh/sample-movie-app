import 'package:flutter/cupertino.dart';
import 'package:tentwentyassesment/common/network/dio_wrapper.dart';
import 'package:tentwentyassesment/features/movies/data/models/movie.dart';
import 'package:tentwentyassesment/features/movies/domain/usecases/search_movies_usecase.dart';

import '../../../../common/usecase/usecase.dart';
import '../../data/models/movie_search_result.dart';
import '../repositories/movie_repository.dart';

@immutable
class GetUpcomingMoviesUseCase implements UseCase<MovieSearchResult, MovieSearchParams> {
  final MovieRepository repository;

  const GetUpcomingMoviesUseCase(this.repository);

  @override
  Future<Result<MovieSearchResult>> call(MovieSearchParams params) async {
    return await repository.getUpcomingMovies(params.page);
  }
}
