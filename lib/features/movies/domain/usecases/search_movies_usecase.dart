import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:tentwentyassesment/common/new_network/dio_wrapper.dart';

import '../../../../common/usecase/usecase.dart';
import '../../data/models/movie_search_result.dart';
import '../repositories/movie_repository.dart';

@immutable
class SearchMoviesUseCase implements UseCase<MovieSearchResult, MovieSearchParams> {
  final MovieRepository repository;

  const SearchMoviesUseCase(this.repository);

  @override
  Future<Result<MovieSearchResult>> call(MovieSearchParams params) async {
    return await repository.searchMovies(params.query, params.page);
  }
}

@immutable
class MovieSearchParams {
  final String query;
  final int page;

  const MovieSearchParams({required this.query, required this.page});
}
