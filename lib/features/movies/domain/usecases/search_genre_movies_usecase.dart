import 'package:flutter/cupertino.dart';
import 'package:tentwentyassesment/common/new_network/dio_wrapper.dart';

import '../../../../common/usecase/usecase.dart';
import '../../data/models/movie_search_result.dart';
import '../repositories/movie_repository.dart';

@immutable
class SearchGenreMoviesUseCase implements UseCase<MovieSearchResult, GenreSearchParam> {
  final MovieRepository repository;

  const SearchGenreMoviesUseCase(this.repository);

  @override
  Future<Result<MovieSearchResult>> call(GenreSearchParam params) async {
    return await repository.searchByGenre(params.genre, params.page);
  }
}

@immutable
class GenreSearchParam {
  final String genre;
  final int page;

  const GenreSearchParam({required this.genre, required this.page});
}
